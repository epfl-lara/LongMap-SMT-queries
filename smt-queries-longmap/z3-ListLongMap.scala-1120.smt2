; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22970 () Bool)

(assert start!22970)

(declare-fun b!240591 () Bool)

(declare-fun b_free!6469 () Bool)

(declare-fun b_next!6469 () Bool)

(assert (=> b!240591 (= b_free!6469 (not b_next!6469))))

(declare-fun tp!22611 () Bool)

(declare-fun b_and!13449 () Bool)

(assert (=> b!240591 (= tp!22611 b_and!13449)))

(declare-fun res!117967 () Bool)

(declare-fun e!156146 () Bool)

(assert (=> start!22970 (=> (not res!117967) (not e!156146))))

(declare-datatypes ((V!8089 0))(
  ( (V!8090 (val!3210 Int)) )
))
(declare-datatypes ((ValueCell!2822 0))(
  ( (ValueCellFull!2822 (v!5249 V!8089)) (EmptyCell!2822) )
))
(declare-datatypes ((array!11939 0))(
  ( (array!11940 (arr!5671 (Array (_ BitVec 32) ValueCell!2822)) (size!6012 (_ BitVec 32))) )
))
(declare-datatypes ((array!11941 0))(
  ( (array!11942 (arr!5672 (Array (_ BitVec 32) (_ BitVec 64))) (size!6013 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3544 0))(
  ( (LongMapFixedSize!3545 (defaultEntry!4457 Int) (mask!10515 (_ BitVec 32)) (extraKeys!4194 (_ BitVec 32)) (zeroValue!4298 V!8089) (minValue!4298 V!8089) (_size!1821 (_ BitVec 32)) (_keys!6559 array!11941) (_values!4440 array!11939) (_vacant!1821 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3544)

(declare-fun valid!1406 (LongMapFixedSize!3544) Bool)

(assert (=> start!22970 (= res!117967 (valid!1406 thiss!1504))))

(assert (=> start!22970 e!156146))

(declare-fun e!156140 () Bool)

(assert (=> start!22970 e!156140))

(assert (=> start!22970 true))

(declare-fun b!240581 () Bool)

(declare-fun res!117969 () Bool)

(declare-fun e!156139 () Bool)

(assert (=> b!240581 (=> (not res!117969) (not e!156139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!240581 (= res!117969 (validMask!0 (mask!10515 thiss!1504)))))

(declare-fun b!240582 () Bool)

(declare-datatypes ((Unit!7376 0))(
  ( (Unit!7377) )
))
(declare-fun e!156143 () Unit!7376)

(declare-fun lt!121052 () Unit!7376)

(assert (=> b!240582 (= e!156143 lt!121052)))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!336 (array!11941 array!11939 (_ BitVec 32) (_ BitVec 32) V!8089 V!8089 (_ BitVec 64) Int) Unit!7376)

(assert (=> b!240582 (= lt!121052 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!336 (_keys!6559 thiss!1504) (_values!4440 thiss!1504) (mask!10515 thiss!1504) (extraKeys!4194 thiss!1504) (zeroValue!4298 thiss!1504) (minValue!4298 thiss!1504) key!932 (defaultEntry!4457 thiss!1504)))))

(declare-fun c!40075 () Bool)

(declare-datatypes ((SeekEntryResult!1014 0))(
  ( (MissingZero!1014 (index!6226 (_ BitVec 32))) (Found!1014 (index!6227 (_ BitVec 32))) (Intermediate!1014 (undefined!1826 Bool) (index!6228 (_ BitVec 32)) (x!24134 (_ BitVec 32))) (Undefined!1014) (MissingVacant!1014 (index!6229 (_ BitVec 32))) )
))
(declare-fun lt!121051 () SeekEntryResult!1014)

(get-info :version)

(assert (=> b!240582 (= c!40075 ((_ is MissingZero!1014) lt!121051))))

(declare-fun e!156147 () Bool)

(assert (=> b!240582 e!156147))

(declare-fun b!240583 () Bool)

(declare-fun Unit!7378 () Unit!7376)

(assert (=> b!240583 (= e!156143 Unit!7378)))

(declare-fun lt!121053 () Unit!7376)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!342 (array!11941 array!11939 (_ BitVec 32) (_ BitVec 32) V!8089 V!8089 (_ BitVec 64) Int) Unit!7376)

(assert (=> b!240583 (= lt!121053 (lemmaInListMapThenSeekEntryOrOpenFindsIt!342 (_keys!6559 thiss!1504) (_values!4440 thiss!1504) (mask!10515 thiss!1504) (extraKeys!4194 thiss!1504) (zeroValue!4298 thiss!1504) (minValue!4298 thiss!1504) key!932 (defaultEntry!4457 thiss!1504)))))

(assert (=> b!240583 false))

(declare-fun b!240584 () Bool)

(declare-fun res!117963 () Bool)

(declare-fun e!156145 () Bool)

(assert (=> b!240584 (=> (not res!117963) (not e!156145))))

(assert (=> b!240584 (= res!117963 (= (select (arr!5672 (_keys!6559 thiss!1504)) (index!6226 lt!121051)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240585 () Bool)

(declare-fun res!117964 () Bool)

(assert (=> b!240585 (= res!117964 (= (select (arr!5672 (_keys!6559 thiss!1504)) (index!6229 lt!121051)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156144 () Bool)

(assert (=> b!240585 (=> (not res!117964) (not e!156144))))

(declare-fun b!240586 () Bool)

(declare-fun e!156137 () Bool)

(assert (=> b!240586 (= e!156137 e!156144)))

(declare-fun res!117968 () Bool)

(declare-fun call!22355 () Bool)

(assert (=> b!240586 (= res!117968 call!22355)))

(assert (=> b!240586 (=> (not res!117968) (not e!156144))))

(declare-fun b!240587 () Bool)

(declare-fun call!22356 () Bool)

(assert (=> b!240587 (= e!156144 (not call!22356))))

(declare-fun b!240588 () Bool)

(declare-fun e!156138 () Bool)

(declare-fun e!156135 () Bool)

(declare-fun mapRes!10728 () Bool)

(assert (=> b!240588 (= e!156138 (and e!156135 mapRes!10728))))

(declare-fun condMapEmpty!10728 () Bool)

(declare-fun mapDefault!10728 () ValueCell!2822)

(assert (=> b!240588 (= condMapEmpty!10728 (= (arr!5671 (_values!4440 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2822)) mapDefault!10728)))))

(declare-fun b!240589 () Bool)

(declare-fun res!117972 () Bool)

(assert (=> b!240589 (=> (not res!117972) (not e!156139))))

(assert (=> b!240589 (= res!117972 (and (= (size!6012 (_values!4440 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10515 thiss!1504))) (= (size!6013 (_keys!6559 thiss!1504)) (size!6012 (_values!4440 thiss!1504))) (bvsge (mask!10515 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4194 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4194 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!240590 () Bool)

(declare-fun tp_is_empty!6331 () Bool)

(assert (=> b!240590 (= e!156135 tp_is_empty!6331)))

(declare-fun array_inv!3725 (array!11941) Bool)

(declare-fun array_inv!3726 (array!11939) Bool)

(assert (=> b!240591 (= e!156140 (and tp!22611 tp_is_empty!6331 (array_inv!3725 (_keys!6559 thiss!1504)) (array_inv!3726 (_values!4440 thiss!1504)) e!156138))))

(declare-fun b!240592 () Bool)

(declare-fun e!156142 () Bool)

(assert (=> b!240592 (= e!156146 e!156142)))

(declare-fun res!117974 () Bool)

(assert (=> b!240592 (=> (not res!117974) (not e!156142))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!240592 (= res!117974 (or (= lt!121051 (MissingZero!1014 index!297)) (= lt!121051 (MissingVacant!1014 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11941 (_ BitVec 32)) SeekEntryResult!1014)

(assert (=> b!240592 (= lt!121051 (seekEntryOrOpen!0 key!932 (_keys!6559 thiss!1504) (mask!10515 thiss!1504)))))

(declare-fun bm!22352 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22352 (= call!22355 (inRange!0 (ite c!40075 (index!6226 lt!121051) (index!6229 lt!121051)) (mask!10515 thiss!1504)))))

(declare-fun mapIsEmpty!10728 () Bool)

(assert (=> mapIsEmpty!10728 mapRes!10728))

(declare-fun b!240593 () Bool)

(assert (=> b!240593 (= e!156145 (not call!22356))))

(declare-fun b!240594 () Bool)

(declare-fun c!40076 () Bool)

(assert (=> b!240594 (= c!40076 ((_ is MissingVacant!1014) lt!121051))))

(assert (=> b!240594 (= e!156147 e!156137)))

(declare-fun b!240595 () Bool)

(declare-fun e!156136 () Bool)

(assert (=> b!240595 (= e!156136 tp_is_empty!6331)))

(declare-fun b!240596 () Bool)

(assert (=> b!240596 (= e!156137 ((_ is Undefined!1014) lt!121051))))

(declare-fun b!240597 () Bool)

(assert (=> b!240597 (= e!156142 e!156139)))

(declare-fun res!117966 () Bool)

(assert (=> b!240597 (=> (not res!117966) (not e!156139))))

(assert (=> b!240597 (= res!117966 (inRange!0 index!297 (mask!10515 thiss!1504)))))

(declare-fun lt!121054 () Unit!7376)

(assert (=> b!240597 (= lt!121054 e!156143)))

(declare-fun c!40077 () Bool)

(declare-datatypes ((tuple2!4658 0))(
  ( (tuple2!4659 (_1!2340 (_ BitVec 64)) (_2!2340 V!8089)) )
))
(declare-datatypes ((List!3534 0))(
  ( (Nil!3531) (Cons!3530 (h!4186 tuple2!4658) (t!8521 List!3534)) )
))
(declare-datatypes ((ListLongMap!3573 0))(
  ( (ListLongMap!3574 (toList!1802 List!3534)) )
))
(declare-fun contains!1704 (ListLongMap!3573 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1334 (array!11941 array!11939 (_ BitVec 32) (_ BitVec 32) V!8089 V!8089 (_ BitVec 32) Int) ListLongMap!3573)

(assert (=> b!240597 (= c!40077 (contains!1704 (getCurrentListMap!1334 (_keys!6559 thiss!1504) (_values!4440 thiss!1504) (mask!10515 thiss!1504) (extraKeys!4194 thiss!1504) (zeroValue!4298 thiss!1504) (minValue!4298 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4457 thiss!1504)) key!932))))

(declare-fun b!240598 () Bool)

(declare-fun res!117973 () Bool)

(assert (=> b!240598 (=> (not res!117973) (not e!156139))))

(declare-fun arrayContainsKey!0 (array!11941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!240598 (= res!117973 (arrayContainsKey!0 (_keys!6559 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!10728 () Bool)

(declare-fun tp!22610 () Bool)

(assert (=> mapNonEmpty!10728 (= mapRes!10728 (and tp!22610 e!156136))))

(declare-fun mapKey!10728 () (_ BitVec 32))

(declare-fun mapRest!10728 () (Array (_ BitVec 32) ValueCell!2822))

(declare-fun mapValue!10728 () ValueCell!2822)

(assert (=> mapNonEmpty!10728 (= (arr!5671 (_values!4440 thiss!1504)) (store mapRest!10728 mapKey!10728 mapValue!10728))))

(declare-fun b!240599 () Bool)

(declare-fun res!117971 () Bool)

(assert (=> b!240599 (=> (not res!117971) (not e!156145))))

(assert (=> b!240599 (= res!117971 call!22355)))

(assert (=> b!240599 (= e!156147 e!156145)))

(declare-fun bm!22353 () Bool)

(assert (=> bm!22353 (= call!22356 (arrayContainsKey!0 (_keys!6559 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!240600 () Bool)

(declare-fun res!117970 () Bool)

(assert (=> b!240600 (=> (not res!117970) (not e!156139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11941 (_ BitVec 32)) Bool)

(assert (=> b!240600 (= res!117970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6559 thiss!1504) (mask!10515 thiss!1504)))))

(declare-fun b!240601 () Bool)

(assert (=> b!240601 (= e!156139 false)))

(declare-fun lt!121055 () Bool)

(declare-datatypes ((List!3535 0))(
  ( (Nil!3532) (Cons!3531 (h!4187 (_ BitVec 64)) (t!8522 List!3535)) )
))
(declare-fun arrayNoDuplicates!0 (array!11941 (_ BitVec 32) List!3535) Bool)

(assert (=> b!240601 (= lt!121055 (arrayNoDuplicates!0 (_keys!6559 thiss!1504) #b00000000000000000000000000000000 Nil!3532))))

(declare-fun b!240602 () Bool)

(declare-fun res!117965 () Bool)

(assert (=> b!240602 (=> (not res!117965) (not e!156146))))

(assert (=> b!240602 (= res!117965 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22970 res!117967) b!240602))

(assert (= (and b!240602 res!117965) b!240592))

(assert (= (and b!240592 res!117974) b!240597))

(assert (= (and b!240597 c!40077) b!240583))

(assert (= (and b!240597 (not c!40077)) b!240582))

(assert (= (and b!240582 c!40075) b!240599))

(assert (= (and b!240582 (not c!40075)) b!240594))

(assert (= (and b!240599 res!117971) b!240584))

(assert (= (and b!240584 res!117963) b!240593))

(assert (= (and b!240594 c!40076) b!240586))

(assert (= (and b!240594 (not c!40076)) b!240596))

(assert (= (and b!240586 res!117968) b!240585))

(assert (= (and b!240585 res!117964) b!240587))

(assert (= (or b!240599 b!240586) bm!22352))

(assert (= (or b!240593 b!240587) bm!22353))

(assert (= (and b!240597 res!117966) b!240598))

(assert (= (and b!240598 res!117973) b!240581))

(assert (= (and b!240581 res!117969) b!240589))

(assert (= (and b!240589 res!117972) b!240600))

(assert (= (and b!240600 res!117970) b!240601))

(assert (= (and b!240588 condMapEmpty!10728) mapIsEmpty!10728))

(assert (= (and b!240588 (not condMapEmpty!10728)) mapNonEmpty!10728))

(assert (= (and mapNonEmpty!10728 ((_ is ValueCellFull!2822) mapValue!10728)) b!240595))

(assert (= (and b!240588 ((_ is ValueCellFull!2822) mapDefault!10728)) b!240590))

(assert (= b!240591 b!240588))

(assert (= start!22970 b!240591))

(declare-fun m!260245 () Bool)

(assert (=> b!240600 m!260245))

(declare-fun m!260247 () Bool)

(assert (=> mapNonEmpty!10728 m!260247))

(declare-fun m!260249 () Bool)

(assert (=> b!240592 m!260249))

(declare-fun m!260251 () Bool)

(assert (=> b!240584 m!260251))

(declare-fun m!260253 () Bool)

(assert (=> b!240597 m!260253))

(declare-fun m!260255 () Bool)

(assert (=> b!240597 m!260255))

(assert (=> b!240597 m!260255))

(declare-fun m!260257 () Bool)

(assert (=> b!240597 m!260257))

(declare-fun m!260259 () Bool)

(assert (=> b!240583 m!260259))

(declare-fun m!260261 () Bool)

(assert (=> b!240585 m!260261))

(declare-fun m!260263 () Bool)

(assert (=> bm!22353 m!260263))

(declare-fun m!260265 () Bool)

(assert (=> start!22970 m!260265))

(declare-fun m!260267 () Bool)

(assert (=> bm!22352 m!260267))

(declare-fun m!260269 () Bool)

(assert (=> b!240582 m!260269))

(declare-fun m!260271 () Bool)

(assert (=> b!240601 m!260271))

(declare-fun m!260273 () Bool)

(assert (=> b!240591 m!260273))

(declare-fun m!260275 () Bool)

(assert (=> b!240591 m!260275))

(assert (=> b!240598 m!260263))

(declare-fun m!260277 () Bool)

(assert (=> b!240581 m!260277))

(check-sat (not b!240583) (not bm!22352) (not b!240600) (not b!240598) (not b!240597) (not b!240582) (not start!22970) (not b!240591) (not b!240601) b_and!13449 tp_is_empty!6331 (not b_next!6469) (not bm!22353) (not b!240581) (not mapNonEmpty!10728) (not b!240592))
(check-sat b_and!13449 (not b_next!6469))
