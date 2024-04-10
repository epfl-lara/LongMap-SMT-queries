; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22942 () Bool)

(assert start!22942)

(declare-fun b!239733 () Bool)

(declare-fun b_free!6445 () Bool)

(declare-fun b_next!6445 () Bool)

(assert (=> b!239733 (= b_free!6445 (not b_next!6445))))

(declare-fun tp!22539 () Bool)

(declare-fun b_and!13411 () Bool)

(assert (=> b!239733 (= tp!22539 b_and!13411)))

(declare-fun b!239722 () Bool)

(declare-fun res!117491 () Bool)

(declare-fun e!155644 () Bool)

(assert (=> b!239722 (=> (not res!117491) (not e!155644))))

(declare-datatypes ((V!8057 0))(
  ( (V!8058 (val!3198 Int)) )
))
(declare-datatypes ((ValueCell!2810 0))(
  ( (ValueCellFull!2810 (v!5236 V!8057)) (EmptyCell!2810) )
))
(declare-datatypes ((array!11893 0))(
  ( (array!11894 (arr!5648 (Array (_ BitVec 32) ValueCell!2810)) (size!5989 (_ BitVec 32))) )
))
(declare-datatypes ((array!11895 0))(
  ( (array!11896 (arr!5649 (Array (_ BitVec 32) (_ BitVec 64))) (size!5990 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3520 0))(
  ( (LongMapFixedSize!3521 (defaultEntry!4445 Int) (mask!10495 (_ BitVec 32)) (extraKeys!4182 (_ BitVec 32)) (zeroValue!4286 V!8057) (minValue!4286 V!8057) (_size!1809 (_ BitVec 32)) (_keys!6547 array!11895) (_values!4428 array!11893) (_vacant!1809 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3520)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239722 (= res!117491 (validMask!0 (mask!10495 thiss!1504)))))

(declare-fun bm!22292 () Bool)

(declare-fun call!22295 () Bool)

(declare-datatypes ((SeekEntryResult!1036 0))(
  ( (MissingZero!1036 (index!6314 (_ BitVec 32))) (Found!1036 (index!6315 (_ BitVec 32))) (Intermediate!1036 (undefined!1848 Bool) (index!6316 (_ BitVec 32)) (x!24124 (_ BitVec 32))) (Undefined!1036) (MissingVacant!1036 (index!6317 (_ BitVec 32))) )
))
(declare-fun lt!120847 () SeekEntryResult!1036)

(declare-fun c!39955 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22292 (= call!22295 (inRange!0 (ite c!39955 (index!6314 lt!120847) (index!6317 lt!120847)) (mask!10495 thiss!1504)))))

(declare-fun b!239723 () Bool)

(declare-fun res!117499 () Bool)

(assert (=> b!239723 (=> (not res!117499) (not e!155644))))

(assert (=> b!239723 (= res!117499 (and (= (size!5989 (_values!4428 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10495 thiss!1504))) (= (size!5990 (_keys!6547 thiss!1504)) (size!5989 (_values!4428 thiss!1504))) (bvsge (mask!10495 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4182 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4182 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!10692 () Bool)

(declare-fun mapRes!10692 () Bool)

(declare-fun tp!22538 () Bool)

(declare-fun e!155654 () Bool)

(assert (=> mapNonEmpty!10692 (= mapRes!10692 (and tp!22538 e!155654))))

(declare-fun mapRest!10692 () (Array (_ BitVec 32) ValueCell!2810))

(declare-fun mapValue!10692 () ValueCell!2810)

(declare-fun mapKey!10692 () (_ BitVec 32))

(assert (=> mapNonEmpty!10692 (= (arr!5648 (_values!4428 thiss!1504)) (store mapRest!10692 mapKey!10692 mapValue!10692))))

(declare-fun b!239725 () Bool)

(declare-fun res!117494 () Bool)

(declare-fun e!155648 () Bool)

(assert (=> b!239725 (=> (not res!117494) (not e!155648))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!239725 (= res!117494 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239726 () Bool)

(declare-fun e!155652 () Bool)

(assert (=> b!239726 (= e!155652 (is-Undefined!1036 lt!120847))))

(declare-fun b!239727 () Bool)

(declare-fun res!117498 () Bool)

(assert (=> b!239727 (= res!117498 (= (select (arr!5649 (_keys!6547 thiss!1504)) (index!6317 lt!120847)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155651 () Bool)

(assert (=> b!239727 (=> (not res!117498) (not e!155651))))

(declare-fun b!239728 () Bool)

(declare-datatypes ((Unit!7365 0))(
  ( (Unit!7366) )
))
(declare-fun e!155643 () Unit!7365)

(declare-fun Unit!7367 () Unit!7365)

(assert (=> b!239728 (= e!155643 Unit!7367)))

(declare-fun lt!120848 () Unit!7365)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!331 (array!11895 array!11893 (_ BitVec 32) (_ BitVec 32) V!8057 V!8057 (_ BitVec 64) Int) Unit!7365)

(assert (=> b!239728 (= lt!120848 (lemmaInListMapThenSeekEntryOrOpenFindsIt!331 (_keys!6547 thiss!1504) (_values!4428 thiss!1504) (mask!10495 thiss!1504) (extraKeys!4182 thiss!1504) (zeroValue!4286 thiss!1504) (minValue!4286 thiss!1504) key!932 (defaultEntry!4445 thiss!1504)))))

(assert (=> b!239728 false))

(declare-fun b!239729 () Bool)

(declare-fun res!117495 () Bool)

(assert (=> b!239729 (=> (not res!117495) (not e!155644))))

(declare-fun arrayContainsKey!0 (array!11895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!239729 (= res!117495 (arrayContainsKey!0 (_keys!6547 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239730 () Bool)

(declare-fun res!117500 () Bool)

(declare-fun e!155653 () Bool)

(assert (=> b!239730 (=> (not res!117500) (not e!155653))))

(assert (=> b!239730 (= res!117500 (= (select (arr!5649 (_keys!6547 thiss!1504)) (index!6314 lt!120847)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239731 () Bool)

(declare-fun e!155647 () Bool)

(declare-fun tp_is_empty!6307 () Bool)

(assert (=> b!239731 (= e!155647 tp_is_empty!6307)))

(declare-fun b!239732 () Bool)

(declare-fun e!155649 () Bool)

(assert (=> b!239732 (= e!155649 e!155644)))

(declare-fun res!117497 () Bool)

(assert (=> b!239732 (=> (not res!117497) (not e!155644))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239732 (= res!117497 (inRange!0 index!297 (mask!10495 thiss!1504)))))

(declare-fun lt!120846 () Unit!7365)

(assert (=> b!239732 (= lt!120846 e!155643)))

(declare-fun c!39954 () Bool)

(declare-datatypes ((tuple2!4712 0))(
  ( (tuple2!4713 (_1!2367 (_ BitVec 64)) (_2!2367 V!8057)) )
))
(declare-datatypes ((List!3598 0))(
  ( (Nil!3595) (Cons!3594 (h!4250 tuple2!4712) (t!8593 List!3598)) )
))
(declare-datatypes ((ListLongMap!3625 0))(
  ( (ListLongMap!3626 (toList!1828 List!3598)) )
))
(declare-fun contains!1716 (ListLongMap!3625 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1356 (array!11895 array!11893 (_ BitVec 32) (_ BitVec 32) V!8057 V!8057 (_ BitVec 32) Int) ListLongMap!3625)

(assert (=> b!239732 (= c!39954 (contains!1716 (getCurrentListMap!1356 (_keys!6547 thiss!1504) (_values!4428 thiss!1504) (mask!10495 thiss!1504) (extraKeys!4182 thiss!1504) (zeroValue!4286 thiss!1504) (minValue!4286 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4445 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10692 () Bool)

(assert (=> mapIsEmpty!10692 mapRes!10692))

(declare-fun b!239724 () Bool)

(declare-fun e!155646 () Bool)

(assert (=> b!239724 (= e!155646 (and e!155647 mapRes!10692))))

(declare-fun condMapEmpty!10692 () Bool)

(declare-fun mapDefault!10692 () ValueCell!2810)

