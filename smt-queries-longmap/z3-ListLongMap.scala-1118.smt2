; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22958 () Bool)

(assert start!22958)

(declare-fun b!239966 () Bool)

(declare-fun b_free!6457 () Bool)

(declare-fun b_next!6457 () Bool)

(assert (=> b!239966 (= b_free!6457 (not b_next!6457))))

(declare-fun tp!22574 () Bool)

(declare-fun b_and!13397 () Bool)

(assert (=> b!239966 (= tp!22574 b_and!13397)))

(declare-fun mapNonEmpty!10710 () Bool)

(declare-fun mapRes!10710 () Bool)

(declare-fun tp!22575 () Bool)

(declare-fun e!155778 () Bool)

(assert (=> mapNonEmpty!10710 (= mapRes!10710 (and tp!22575 e!155778))))

(declare-datatypes ((V!8073 0))(
  ( (V!8074 (val!3204 Int)) )
))
(declare-datatypes ((ValueCell!2816 0))(
  ( (ValueCellFull!2816 (v!5236 V!8073)) (EmptyCell!2816) )
))
(declare-datatypes ((array!11909 0))(
  ( (array!11910 (arr!5655 (Array (_ BitVec 32) ValueCell!2816)) (size!5997 (_ BitVec 32))) )
))
(declare-datatypes ((array!11911 0))(
  ( (array!11912 (arr!5656 (Array (_ BitVec 32) (_ BitVec 64))) (size!5998 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3532 0))(
  ( (LongMapFixedSize!3533 (defaultEntry!4451 Int) (mask!10504 (_ BitVec 32)) (extraKeys!4188 (_ BitVec 32)) (zeroValue!4292 V!8073) (minValue!4292 V!8073) (_size!1815 (_ BitVec 32)) (_keys!6552 array!11911) (_values!4434 array!11909) (_vacant!1815 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3532)

(declare-fun mapValue!10710 () ValueCell!2816)

(declare-fun mapKey!10710 () (_ BitVec 32))

(declare-fun mapRest!10710 () (Array (_ BitVec 32) ValueCell!2816))

(assert (=> mapNonEmpty!10710 (= (arr!5655 (_values!4434 thiss!1504)) (store mapRest!10710 mapKey!10710 mapValue!10710))))

(declare-fun tp_is_empty!6319 () Bool)

(declare-fun e!155787 () Bool)

(declare-fun e!155784 () Bool)

(declare-fun array_inv!3727 (array!11911) Bool)

(declare-fun array_inv!3728 (array!11909) Bool)

(assert (=> b!239966 (= e!155787 (and tp!22574 tp_is_empty!6319 (array_inv!3727 (_keys!6552 thiss!1504)) (array_inv!3728 (_values!4434 thiss!1504)) e!155784))))

(declare-fun c!39983 () Bool)

(declare-fun bm!22304 () Bool)

(declare-fun call!22308 () Bool)

(declare-datatypes ((SeekEntryResult!1040 0))(
  ( (MissingZero!1040 (index!6330 (_ BitVec 32))) (Found!1040 (index!6331 (_ BitVec 32))) (Intermediate!1040 (undefined!1852 Bool) (index!6332 (_ BitVec 32)) (x!24143 (_ BitVec 32))) (Undefined!1040) (MissingVacant!1040 (index!6333 (_ BitVec 32))) )
))
(declare-fun lt!120738 () SeekEntryResult!1040)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22304 (= call!22308 (inRange!0 (ite c!39983 (index!6330 lt!120738) (index!6333 lt!120738)) (mask!10504 thiss!1504)))))

(declare-fun mapIsEmpty!10710 () Bool)

(assert (=> mapIsEmpty!10710 mapRes!10710))

(declare-fun b!239968 () Bool)

(declare-datatypes ((Unit!7368 0))(
  ( (Unit!7369) )
))
(declare-fun e!155776 () Unit!7368)

(declare-fun Unit!7370 () Unit!7368)

(assert (=> b!239968 (= e!155776 Unit!7370)))

(declare-fun lt!120740 () Unit!7368)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!340 (array!11911 array!11909 (_ BitVec 32) (_ BitVec 32) V!8073 V!8073 (_ BitVec 64) Int) Unit!7368)

(assert (=> b!239968 (= lt!120740 (lemmaInListMapThenSeekEntryOrOpenFindsIt!340 (_keys!6552 thiss!1504) (_values!4434 thiss!1504) (mask!10504 thiss!1504) (extraKeys!4188 thiss!1504) (zeroValue!4292 thiss!1504) (minValue!4292 thiss!1504) key!932 (defaultEntry!4451 thiss!1504)))))

(assert (=> b!239968 false))

(declare-fun b!239969 () Bool)

(declare-fun res!117612 () Bool)

(declare-fun e!155777 () Bool)

(assert (=> b!239969 (=> (not res!117612) (not e!155777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239969 (= res!117612 (validMask!0 (mask!10504 thiss!1504)))))

(declare-fun b!239970 () Bool)

(declare-fun e!155781 () Bool)

(assert (=> b!239970 (= e!155781 e!155777)))

(declare-fun res!117610 () Bool)

(assert (=> b!239970 (=> (not res!117610) (not e!155777))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239970 (= res!117610 (inRange!0 index!297 (mask!10504 thiss!1504)))))

(declare-fun lt!120739 () Unit!7368)

(assert (=> b!239970 (= lt!120739 e!155776)))

(declare-fun c!39984 () Bool)

(declare-datatypes ((tuple2!4690 0))(
  ( (tuple2!4691 (_1!2356 (_ BitVec 64)) (_2!2356 V!8073)) )
))
(declare-datatypes ((List!3590 0))(
  ( (Nil!3587) (Cons!3586 (h!4242 tuple2!4690) (t!8576 List!3590)) )
))
(declare-datatypes ((ListLongMap!3593 0))(
  ( (ListLongMap!3594 (toList!1812 List!3590)) )
))
(declare-fun contains!1703 (ListLongMap!3593 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1321 (array!11911 array!11909 (_ BitVec 32) (_ BitVec 32) V!8073 V!8073 (_ BitVec 32) Int) ListLongMap!3593)

(assert (=> b!239970 (= c!39984 (contains!1703 (getCurrentListMap!1321 (_keys!6552 thiss!1504) (_values!4434 thiss!1504) (mask!10504 thiss!1504) (extraKeys!4188 thiss!1504) (zeroValue!4292 thiss!1504) (minValue!4292 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4451 thiss!1504)) key!932))))

(declare-fun b!239971 () Bool)

(declare-fun e!155783 () Bool)

(declare-fun call!22307 () Bool)

(assert (=> b!239971 (= e!155783 (not call!22307))))

(declare-fun b!239972 () Bool)

(declare-fun res!117608 () Bool)

(declare-fun e!155780 () Bool)

(assert (=> b!239972 (=> (not res!117608) (not e!155780))))

(assert (=> b!239972 (= res!117608 (= (select (arr!5656 (_keys!6552 thiss!1504)) (index!6330 lt!120738)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239973 () Bool)

(declare-fun res!117617 () Bool)

(assert (=> b!239973 (=> (not res!117617) (not e!155777))))

(assert (=> b!239973 (= res!117617 (and (= (size!5997 (_values!4434 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10504 thiss!1504))) (= (size!5998 (_keys!6552 thiss!1504)) (size!5997 (_values!4434 thiss!1504))) (bvsge (mask!10504 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4188 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4188 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!239974 () Bool)

(declare-fun res!117618 () Bool)

(declare-fun e!155779 () Bool)

(assert (=> b!239974 (=> (not res!117618) (not e!155779))))

(assert (=> b!239974 (= res!117618 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239975 () Bool)

(assert (=> b!239975 (= e!155780 (not call!22307))))

(declare-fun b!239976 () Bool)

(declare-fun e!155786 () Bool)

(assert (=> b!239976 (= e!155784 (and e!155786 mapRes!10710))))

(declare-fun condMapEmpty!10710 () Bool)

(declare-fun mapDefault!10710 () ValueCell!2816)

(assert (=> b!239976 (= condMapEmpty!10710 (= (arr!5655 (_values!4434 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2816)) mapDefault!10710)))))

(declare-fun res!117609 () Bool)

(assert (=> start!22958 (=> (not res!117609) (not e!155779))))

(declare-fun valid!1394 (LongMapFixedSize!3532) Bool)

(assert (=> start!22958 (= res!117609 (valid!1394 thiss!1504))))

(assert (=> start!22958 e!155779))

(assert (=> start!22958 e!155787))

(assert (=> start!22958 true))

(declare-fun b!239967 () Bool)

(declare-fun lt!120737 () Unit!7368)

(assert (=> b!239967 (= e!155776 lt!120737)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!340 (array!11911 array!11909 (_ BitVec 32) (_ BitVec 32) V!8073 V!8073 (_ BitVec 64) Int) Unit!7368)

(assert (=> b!239967 (= lt!120737 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!340 (_keys!6552 thiss!1504) (_values!4434 thiss!1504) (mask!10504 thiss!1504) (extraKeys!4188 thiss!1504) (zeroValue!4292 thiss!1504) (minValue!4292 thiss!1504) key!932 (defaultEntry!4451 thiss!1504)))))

(get-info :version)

(assert (=> b!239967 (= c!39983 ((_ is MissingZero!1040) lt!120738))))

(declare-fun e!155785 () Bool)

(assert (=> b!239967 e!155785))

(declare-fun b!239977 () Bool)

(assert (=> b!239977 (= e!155778 tp_is_empty!6319)))

(declare-fun b!239978 () Bool)

(declare-fun c!39982 () Bool)

(assert (=> b!239978 (= c!39982 ((_ is MissingVacant!1040) lt!120738))))

(declare-fun e!155788 () Bool)

(assert (=> b!239978 (= e!155785 e!155788)))

(declare-fun b!239979 () Bool)

(declare-fun res!117615 () Bool)

(assert (=> b!239979 (= res!117615 (= (select (arr!5656 (_keys!6552 thiss!1504)) (index!6333 lt!120738)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239979 (=> (not res!117615) (not e!155783))))

(declare-fun b!239980 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!239980 (= e!155777 (not (validKeyInArray!0 key!932)))))

(declare-fun b!239981 () Bool)

(assert (=> b!239981 (= e!155779 e!155781)))

(declare-fun res!117607 () Bool)

(assert (=> b!239981 (=> (not res!117607) (not e!155781))))

(assert (=> b!239981 (= res!117607 (or (= lt!120738 (MissingZero!1040 index!297)) (= lt!120738 (MissingVacant!1040 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11911 (_ BitVec 32)) SeekEntryResult!1040)

(assert (=> b!239981 (= lt!120738 (seekEntryOrOpen!0 key!932 (_keys!6552 thiss!1504) (mask!10504 thiss!1504)))))

(declare-fun b!239982 () Bool)

(assert (=> b!239982 (= e!155788 e!155783)))

(declare-fun res!117616 () Bool)

(assert (=> b!239982 (= res!117616 call!22308)))

(assert (=> b!239982 (=> (not res!117616) (not e!155783))))

(declare-fun b!239983 () Bool)

(declare-fun res!117611 () Bool)

(assert (=> b!239983 (=> (not res!117611) (not e!155777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11911 (_ BitVec 32)) Bool)

(assert (=> b!239983 (= res!117611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6552 thiss!1504) (mask!10504 thiss!1504)))))

(declare-fun b!239984 () Bool)

(assert (=> b!239984 (= e!155788 ((_ is Undefined!1040) lt!120738))))

(declare-fun b!239985 () Bool)

(assert (=> b!239985 (= e!155786 tp_is_empty!6319)))

(declare-fun b!239986 () Bool)

(declare-fun res!117613 () Bool)

(assert (=> b!239986 (=> (not res!117613) (not e!155777))))

(declare-fun arrayContainsKey!0 (array!11911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!239986 (= res!117613 (arrayContainsKey!0 (_keys!6552 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239987 () Bool)

(declare-fun res!117606 () Bool)

(assert (=> b!239987 (=> (not res!117606) (not e!155777))))

(declare-datatypes ((List!3591 0))(
  ( (Nil!3588) (Cons!3587 (h!4243 (_ BitVec 64)) (t!8577 List!3591)) )
))
(declare-fun arrayNoDuplicates!0 (array!11911 (_ BitVec 32) List!3591) Bool)

(assert (=> b!239987 (= res!117606 (arrayNoDuplicates!0 (_keys!6552 thiss!1504) #b00000000000000000000000000000000 Nil!3588))))

(declare-fun bm!22305 () Bool)

(assert (=> bm!22305 (= call!22307 (arrayContainsKey!0 (_keys!6552 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239988 () Bool)

(declare-fun res!117614 () Bool)

(assert (=> b!239988 (=> (not res!117614) (not e!155780))))

(assert (=> b!239988 (= res!117614 call!22308)))

(assert (=> b!239988 (= e!155785 e!155780)))

(assert (= (and start!22958 res!117609) b!239974))

(assert (= (and b!239974 res!117618) b!239981))

(assert (= (and b!239981 res!117607) b!239970))

(assert (= (and b!239970 c!39984) b!239968))

(assert (= (and b!239970 (not c!39984)) b!239967))

(assert (= (and b!239967 c!39983) b!239988))

(assert (= (and b!239967 (not c!39983)) b!239978))

(assert (= (and b!239988 res!117614) b!239972))

(assert (= (and b!239972 res!117608) b!239975))

(assert (= (and b!239978 c!39982) b!239982))

(assert (= (and b!239978 (not c!39982)) b!239984))

(assert (= (and b!239982 res!117616) b!239979))

(assert (= (and b!239979 res!117615) b!239971))

(assert (= (or b!239988 b!239982) bm!22304))

(assert (= (or b!239975 b!239971) bm!22305))

(assert (= (and b!239970 res!117610) b!239986))

(assert (= (and b!239986 res!117613) b!239969))

(assert (= (and b!239969 res!117612) b!239973))

(assert (= (and b!239973 res!117617) b!239983))

(assert (= (and b!239983 res!117611) b!239987))

(assert (= (and b!239987 res!117606) b!239980))

(assert (= (and b!239976 condMapEmpty!10710) mapIsEmpty!10710))

(assert (= (and b!239976 (not condMapEmpty!10710)) mapNonEmpty!10710))

(assert (= (and mapNonEmpty!10710 ((_ is ValueCellFull!2816) mapValue!10710)) b!239977))

(assert (= (and b!239976 ((_ is ValueCellFull!2816) mapDefault!10710)) b!239985))

(assert (= b!239966 b!239976))

(assert (= start!22958 b!239966))

(declare-fun m!259231 () Bool)

(assert (=> bm!22305 m!259231))

(declare-fun m!259233 () Bool)

(assert (=> b!239966 m!259233))

(declare-fun m!259235 () Bool)

(assert (=> b!239966 m!259235))

(declare-fun m!259237 () Bool)

(assert (=> start!22958 m!259237))

(declare-fun m!259239 () Bool)

(assert (=> b!239980 m!259239))

(declare-fun m!259241 () Bool)

(assert (=> b!239970 m!259241))

(declare-fun m!259243 () Bool)

(assert (=> b!239970 m!259243))

(assert (=> b!239970 m!259243))

(declare-fun m!259245 () Bool)

(assert (=> b!239970 m!259245))

(declare-fun m!259247 () Bool)

(assert (=> b!239968 m!259247))

(assert (=> b!239986 m!259231))

(declare-fun m!259249 () Bool)

(assert (=> b!239972 m!259249))

(declare-fun m!259251 () Bool)

(assert (=> mapNonEmpty!10710 m!259251))

(declare-fun m!259253 () Bool)

(assert (=> b!239983 m!259253))

(declare-fun m!259255 () Bool)

(assert (=> b!239987 m!259255))

(declare-fun m!259257 () Bool)

(assert (=> b!239981 m!259257))

(declare-fun m!259259 () Bool)

(assert (=> b!239967 m!259259))

(declare-fun m!259261 () Bool)

(assert (=> b!239969 m!259261))

(declare-fun m!259263 () Bool)

(assert (=> b!239979 m!259263))

(declare-fun m!259265 () Bool)

(assert (=> bm!22304 m!259265))

(check-sat tp_is_empty!6319 (not b!239966) (not b!239986) (not bm!22304) (not b!239969) (not b!239983) (not b!239968) (not b!239980) (not mapNonEmpty!10710) (not b!239987) (not b_next!6457) b_and!13397 (not b!239967) (not bm!22305) (not b!239970) (not b!239981) (not start!22958))
(check-sat b_and!13397 (not b_next!6457))
