; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22910 () Bool)

(assert start!22910)

(declare-fun b!238778 () Bool)

(declare-fun b_free!6413 () Bool)

(declare-fun b_next!6413 () Bool)

(assert (=> b!238778 (= b_free!6413 (not b_next!6413))))

(declare-fun tp!22442 () Bool)

(declare-fun b_and!13379 () Bool)

(assert (=> b!238778 (= tp!22442 b_and!13379)))

(declare-fun b!238761 () Bool)

(declare-datatypes ((Unit!7325 0))(
  ( (Unit!7326) )
))
(declare-fun e!155019 () Unit!7325)

(declare-fun Unit!7327 () Unit!7325)

(assert (=> b!238761 (= e!155019 Unit!7327)))

(declare-fun lt!120654 () Unit!7325)

(declare-datatypes ((V!8013 0))(
  ( (V!8014 (val!3182 Int)) )
))
(declare-datatypes ((ValueCell!2794 0))(
  ( (ValueCellFull!2794 (v!5220 V!8013)) (EmptyCell!2794) )
))
(declare-datatypes ((array!11829 0))(
  ( (array!11830 (arr!5616 (Array (_ BitVec 32) ValueCell!2794)) (size!5957 (_ BitVec 32))) )
))
(declare-datatypes ((array!11831 0))(
  ( (array!11832 (arr!5617 (Array (_ BitVec 32) (_ BitVec 64))) (size!5958 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3488 0))(
  ( (LongMapFixedSize!3489 (defaultEntry!4429 Int) (mask!10467 (_ BitVec 32)) (extraKeys!4166 (_ BitVec 32)) (zeroValue!4270 V!8013) (minValue!4270 V!8013) (_size!1793 (_ BitVec 32)) (_keys!6531 array!11831) (_values!4412 array!11829) (_vacant!1793 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3488)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!319 (array!11831 array!11829 (_ BitVec 32) (_ BitVec 32) V!8013 V!8013 (_ BitVec 64) Int) Unit!7325)

(assert (=> b!238761 (= lt!120654 (lemmaInListMapThenSeekEntryOrOpenFindsIt!319 (_keys!6531 thiss!1504) (_values!4412 thiss!1504) (mask!10467 thiss!1504) (extraKeys!4166 thiss!1504) (zeroValue!4270 thiss!1504) (minValue!4270 thiss!1504) key!932 (defaultEntry!4429 thiss!1504)))))

(assert (=> b!238761 false))

(declare-fun b!238762 () Bool)

(declare-fun e!155027 () Bool)

(declare-datatypes ((SeekEntryResult!1022 0))(
  ( (MissingZero!1022 (index!6258 (_ BitVec 32))) (Found!1022 (index!6259 (_ BitVec 32))) (Intermediate!1022 (undefined!1834 Bool) (index!6260 (_ BitVec 32)) (x!24062 (_ BitVec 32))) (Undefined!1022) (MissingVacant!1022 (index!6261 (_ BitVec 32))) )
))
(declare-fun lt!120656 () SeekEntryResult!1022)

(assert (=> b!238762 (= e!155027 (is-Undefined!1022 lt!120656))))

(declare-fun b!238763 () Bool)

(declare-fun e!155031 () Bool)

(declare-fun e!155028 () Bool)

(assert (=> b!238763 (= e!155031 e!155028)))

(declare-fun res!117014 () Bool)

(assert (=> b!238763 (=> (not res!117014) (not e!155028))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!238763 (= res!117014 (inRange!0 index!297 (mask!10467 thiss!1504)))))

(declare-fun lt!120657 () Unit!7325)

(assert (=> b!238763 (= lt!120657 e!155019)))

(declare-fun c!39810 () Bool)

(declare-datatypes ((tuple2!4690 0))(
  ( (tuple2!4691 (_1!2356 (_ BitVec 64)) (_2!2356 V!8013)) )
))
(declare-datatypes ((List!3587 0))(
  ( (Nil!3584) (Cons!3583 (h!4239 tuple2!4690) (t!8582 List!3587)) )
))
(declare-datatypes ((ListLongMap!3603 0))(
  ( (ListLongMap!3604 (toList!1817 List!3587)) )
))
(declare-fun contains!1705 (ListLongMap!3603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1345 (array!11831 array!11829 (_ BitVec 32) (_ BitVec 32) V!8013 V!8013 (_ BitVec 32) Int) ListLongMap!3603)

(assert (=> b!238763 (= c!39810 (contains!1705 (getCurrentListMap!1345 (_keys!6531 thiss!1504) (_values!4412 thiss!1504) (mask!10467 thiss!1504) (extraKeys!4166 thiss!1504) (zeroValue!4270 thiss!1504) (minValue!4270 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4429 thiss!1504)) key!932))))

(declare-fun b!238764 () Bool)

(declare-fun e!155024 () Bool)

(declare-fun call!22199 () Bool)

(assert (=> b!238764 (= e!155024 (not call!22199))))

(declare-fun b!238765 () Bool)

(declare-fun res!117009 () Bool)

(assert (=> b!238765 (= res!117009 (= (select (arr!5617 (_keys!6531 thiss!1504)) (index!6261 lt!120656)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155023 () Bool)

(assert (=> b!238765 (=> (not res!117009) (not e!155023))))

(declare-fun b!238766 () Bool)

(declare-fun res!117017 () Bool)

(assert (=> b!238766 (=> (not res!117017) (not e!155028))))

(declare-fun arrayContainsKey!0 (array!11831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!238766 (= res!117017 (arrayContainsKey!0 (_keys!6531 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!238767 () Bool)

(declare-fun res!117010 () Bool)

(assert (=> b!238767 (=> (not res!117010) (not e!155024))))

(assert (=> b!238767 (= res!117010 (= (select (arr!5617 (_keys!6531 thiss!1504)) (index!6258 lt!120656)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238768 () Bool)

(declare-fun c!39812 () Bool)

(assert (=> b!238768 (= c!39812 (is-MissingVacant!1022 lt!120656))))

(declare-fun e!155025 () Bool)

(assert (=> b!238768 (= e!155025 e!155027)))

(declare-fun b!238769 () Bool)

(declare-fun e!155026 () Bool)

(declare-fun tp_is_empty!6275 () Bool)

(assert (=> b!238769 (= e!155026 tp_is_empty!6275)))

(declare-fun call!22200 () Bool)

(declare-fun bm!22196 () Bool)

(declare-fun c!39811 () Bool)

(assert (=> bm!22196 (= call!22200 (inRange!0 (ite c!39811 (index!6258 lt!120656) (index!6261 lt!120656)) (mask!10467 thiss!1504)))))

(declare-fun res!117015 () Bool)

(declare-fun e!155020 () Bool)

(assert (=> start!22910 (=> (not res!117015) (not e!155020))))

(declare-fun valid!1376 (LongMapFixedSize!3488) Bool)

(assert (=> start!22910 (= res!117015 (valid!1376 thiss!1504))))

(assert (=> start!22910 e!155020))

(declare-fun e!155022 () Bool)

(assert (=> start!22910 e!155022))

(assert (=> start!22910 true))

(declare-fun mapIsEmpty!10644 () Bool)

(declare-fun mapRes!10644 () Bool)

(assert (=> mapIsEmpty!10644 mapRes!10644))

(declare-fun b!238770 () Bool)

(declare-fun res!117013 () Bool)

(assert (=> b!238770 (=> (not res!117013) (not e!155024))))

(assert (=> b!238770 (= res!117013 call!22200)))

(assert (=> b!238770 (= e!155025 e!155024)))

(declare-fun b!238771 () Bool)

(declare-fun res!117011 () Bool)

(assert (=> b!238771 (=> (not res!117011) (not e!155020))))

(assert (=> b!238771 (= res!117011 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!238772 () Bool)

(assert (=> b!238772 (= e!155027 e!155023)))

(declare-fun res!117012 () Bool)

(assert (=> b!238772 (= res!117012 call!22200)))

(assert (=> b!238772 (=> (not res!117012) (not e!155023))))

(declare-fun mapNonEmpty!10644 () Bool)

(declare-fun tp!22443 () Bool)

(declare-fun e!155021 () Bool)

(assert (=> mapNonEmpty!10644 (= mapRes!10644 (and tp!22443 e!155021))))

(declare-fun mapKey!10644 () (_ BitVec 32))

(declare-fun mapValue!10644 () ValueCell!2794)

(declare-fun mapRest!10644 () (Array (_ BitVec 32) ValueCell!2794))

(assert (=> mapNonEmpty!10644 (= (arr!5616 (_values!4412 thiss!1504)) (store mapRest!10644 mapKey!10644 mapValue!10644))))

(declare-fun b!238773 () Bool)

(assert (=> b!238773 (= e!155023 (not call!22199))))

(declare-fun b!238774 () Bool)

(declare-fun e!155029 () Bool)

(assert (=> b!238774 (= e!155029 (and e!155026 mapRes!10644))))

(declare-fun condMapEmpty!10644 () Bool)

(declare-fun mapDefault!10644 () ValueCell!2794)

