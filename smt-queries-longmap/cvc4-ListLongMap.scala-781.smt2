; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18486 () Bool)

(assert start!18486)

(declare-fun b!183367 () Bool)

(declare-fun b_free!4529 () Bool)

(declare-fun b_next!4529 () Bool)

(assert (=> b!183367 (= b_free!4529 (not b_next!4529))))

(declare-fun tp!16357 () Bool)

(declare-fun b_and!11099 () Bool)

(assert (=> b!183367 (= tp!16357 b_and!11099)))

(declare-fun b!183364 () Bool)

(declare-fun res!86802 () Bool)

(declare-fun e!120733 () Bool)

(assert (=> b!183364 (=> (not res!86802) (not e!120733))))

(declare-datatypes ((V!5381 0))(
  ( (V!5382 (val!2195 Int)) )
))
(declare-datatypes ((ValueCell!1807 0))(
  ( (ValueCellFull!1807 (v!4098 V!5381)) (EmptyCell!1807) )
))
(declare-datatypes ((array!7795 0))(
  ( (array!7796 (arr!3685 (Array (_ BitVec 32) (_ BitVec 64))) (size!3997 (_ BitVec 32))) )
))
(declare-datatypes ((array!7797 0))(
  ( (array!7798 (arr!3686 (Array (_ BitVec 32) ValueCell!1807)) (size!3998 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2522 0))(
  ( (LongMapFixedSize!2523 (defaultEntry!3751 Int) (mask!8813 (_ BitVec 32)) (extraKeys!3488 (_ BitVec 32)) (zeroValue!3592 V!5381) (minValue!3592 V!5381) (_size!1310 (_ BitVec 32)) (_keys!5669 array!7795) (_values!3734 array!7797) (_vacant!1310 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2522)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3422 0))(
  ( (tuple2!3423 (_1!1722 (_ BitVec 64)) (_2!1722 V!5381)) )
))
(declare-datatypes ((List!2338 0))(
  ( (Nil!2335) (Cons!2334 (h!2963 tuple2!3422) (t!7206 List!2338)) )
))
(declare-datatypes ((ListLongMap!2339 0))(
  ( (ListLongMap!2340 (toList!1185 List!2338)) )
))
(declare-fun contains!1271 (ListLongMap!2339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!833 (array!7795 array!7797 (_ BitVec 32) (_ BitVec 32) V!5381 V!5381 (_ BitVec 32) Int) ListLongMap!2339)

(assert (=> b!183364 (= res!86802 (not (contains!1271 (getCurrentListMap!833 (_keys!5669 thiss!1248) (_values!3734 thiss!1248) (mask!8813 thiss!1248) (extraKeys!3488 thiss!1248) (zeroValue!3592 thiss!1248) (minValue!3592 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3751 thiss!1248)) key!828)))))

(declare-fun b!183365 () Bool)

(declare-fun e!120732 () Bool)

(declare-fun tp_is_empty!4301 () Bool)

(assert (=> b!183365 (= e!120732 tp_is_empty!4301)))

(declare-fun res!86799 () Bool)

(declare-fun e!120730 () Bool)

(assert (=> start!18486 (=> (not res!86799) (not e!120730))))

(declare-fun valid!1043 (LongMapFixedSize!2522) Bool)

(assert (=> start!18486 (= res!86799 (valid!1043 thiss!1248))))

(assert (=> start!18486 e!120730))

(declare-fun e!120734 () Bool)

(assert (=> start!18486 e!120734))

(assert (=> start!18486 true))

(declare-fun b!183366 () Bool)

(assert (=> b!183366 (= e!120730 e!120733)))

(declare-fun res!86801 () Bool)

(assert (=> b!183366 (=> (not res!86801) (not e!120733))))

(declare-datatypes ((SeekEntryResult!621 0))(
  ( (MissingZero!621 (index!4654 (_ BitVec 32))) (Found!621 (index!4655 (_ BitVec 32))) (Intermediate!621 (undefined!1433 Bool) (index!4656 (_ BitVec 32)) (x!19975 (_ BitVec 32))) (Undefined!621) (MissingVacant!621 (index!4657 (_ BitVec 32))) )
))
(declare-fun lt!90625 () SeekEntryResult!621)

(assert (=> b!183366 (= res!86801 (and (not (is-Undefined!621 lt!90625)) (not (is-MissingVacant!621 lt!90625)) (not (is-MissingZero!621 lt!90625)) (is-Found!621 lt!90625)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7795 (_ BitVec 32)) SeekEntryResult!621)

(assert (=> b!183366 (= lt!90625 (seekEntryOrOpen!0 key!828 (_keys!5669 thiss!1248) (mask!8813 thiss!1248)))))

(declare-fun e!120729 () Bool)

(declare-fun array_inv!2383 (array!7795) Bool)

(declare-fun array_inv!2384 (array!7797) Bool)

(assert (=> b!183367 (= e!120734 (and tp!16357 tp_is_empty!4301 (array_inv!2383 (_keys!5669 thiss!1248)) (array_inv!2384 (_values!3734 thiss!1248)) e!120729))))

(declare-fun b!183368 () Bool)

(declare-fun e!120728 () Bool)

(assert (=> b!183368 (= e!120728 tp_is_empty!4301)))

(declare-fun mapNonEmpty!7385 () Bool)

(declare-fun mapRes!7385 () Bool)

(declare-fun tp!16358 () Bool)

(assert (=> mapNonEmpty!7385 (= mapRes!7385 (and tp!16358 e!120728))))

(declare-fun mapValue!7385 () ValueCell!1807)

(declare-fun mapKey!7385 () (_ BitVec 32))

(declare-fun mapRest!7385 () (Array (_ BitVec 32) ValueCell!1807))

(assert (=> mapNonEmpty!7385 (= (arr!3686 (_values!3734 thiss!1248)) (store mapRest!7385 mapKey!7385 mapValue!7385))))

(declare-fun b!183369 () Bool)

(assert (=> b!183369 (= e!120729 (and e!120732 mapRes!7385))))

(declare-fun condMapEmpty!7385 () Bool)

(declare-fun mapDefault!7385 () ValueCell!1807)

