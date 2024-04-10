; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25132 () Bool)

(assert start!25132)

(declare-fun b!261904 () Bool)

(declare-fun b_free!6779 () Bool)

(declare-fun b_next!6779 () Bool)

(assert (=> b!261904 (= b_free!6779 (not b_next!6779))))

(declare-fun tp!23667 () Bool)

(declare-fun b_and!13913 () Bool)

(assert (=> b!261904 (= tp!23667 b_and!13913)))

(declare-fun e!169729 () Bool)

(declare-fun tp_is_empty!6641 () Bool)

(declare-fun e!169719 () Bool)

(declare-datatypes ((V!8501 0))(
  ( (V!8502 (val!3365 Int)) )
))
(declare-datatypes ((ValueCell!2977 0))(
  ( (ValueCellFull!2977 (v!5490 V!8501)) (EmptyCell!2977) )
))
(declare-datatypes ((array!12639 0))(
  ( (array!12640 (arr!5982 (Array (_ BitVec 32) ValueCell!2977)) (size!6333 (_ BitVec 32))) )
))
(declare-datatypes ((array!12641 0))(
  ( (array!12642 (arr!5983 (Array (_ BitVec 32) (_ BitVec 64))) (size!6334 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3854 0))(
  ( (LongMapFixedSize!3855 (defaultEntry!4825 Int) (mask!11175 (_ BitVec 32)) (extraKeys!4562 (_ BitVec 32)) (zeroValue!4666 V!8501) (minValue!4666 V!8501) (_size!1976 (_ BitVec 32)) (_keys!7013 array!12641) (_values!4808 array!12639) (_vacant!1976 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3854)

(declare-fun array_inv!3953 (array!12641) Bool)

(declare-fun array_inv!3954 (array!12639) Bool)

(assert (=> b!261904 (= e!169719 (and tp!23667 tp_is_empty!6641 (array_inv!3953 (_keys!7013 thiss!1504)) (array_inv!3954 (_values!4808 thiss!1504)) e!169729))))

(declare-fun bm!25006 () Bool)

(declare-fun call!25010 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!25006 (= call!25010 (arrayContainsKey!0 (_keys!7013 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!261905 () Bool)

(declare-datatypes ((Unit!8152 0))(
  ( (Unit!8153) )
))
(declare-fun e!169720 () Unit!8152)

(declare-fun Unit!8154 () Unit!8152)

(assert (=> b!261905 (= e!169720 Unit!8154)))

(declare-fun lt!132312 () Unit!8152)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!449 (array!12641 array!12639 (_ BitVec 32) (_ BitVec 32) V!8501 V!8501 (_ BitVec 64) Int) Unit!8152)

(assert (=> b!261905 (= lt!132312 (lemmaInListMapThenSeekEntryOrOpenFindsIt!449 (_keys!7013 thiss!1504) (_values!4808 thiss!1504) (mask!11175 thiss!1504) (extraKeys!4562 thiss!1504) (zeroValue!4666 thiss!1504) (minValue!4666 thiss!1504) key!932 (defaultEntry!4825 thiss!1504)))))

(assert (=> b!261905 false))

(declare-fun mapNonEmpty!11320 () Bool)

(declare-fun mapRes!11320 () Bool)

(declare-fun tp!23668 () Bool)

(declare-fun e!169718 () Bool)

(assert (=> mapNonEmpty!11320 (= mapRes!11320 (and tp!23668 e!169718))))

(declare-fun mapRest!11320 () (Array (_ BitVec 32) ValueCell!2977))

(declare-fun mapValue!11320 () ValueCell!2977)

(declare-fun mapKey!11320 () (_ BitVec 32))

(assert (=> mapNonEmpty!11320 (= (arr!5982 (_values!4808 thiss!1504)) (store mapRest!11320 mapKey!11320 mapValue!11320))))

(declare-fun b!261906 () Bool)

(declare-fun c!44612 () Bool)

(declare-datatypes ((SeekEntryResult!1192 0))(
  ( (MissingZero!1192 (index!6938 (_ BitVec 32))) (Found!1192 (index!6939 (_ BitVec 32))) (Intermediate!1192 (undefined!2004 Bool) (index!6940 (_ BitVec 32)) (x!25190 (_ BitVec 32))) (Undefined!1192) (MissingVacant!1192 (index!6941 (_ BitVec 32))) )
))
(declare-fun lt!132304 () SeekEntryResult!1192)

(assert (=> b!261906 (= c!44612 (is-MissingVacant!1192 lt!132304))))

(declare-fun e!169725 () Bool)

(declare-fun e!169731 () Bool)

(assert (=> b!261906 (= e!169725 e!169731)))

(declare-fun b!261907 () Bool)

(declare-fun e!169730 () Bool)

(declare-fun e!169721 () Bool)

(assert (=> b!261907 (= e!169730 e!169721)))

(declare-fun res!127945 () Bool)

(assert (=> b!261907 (=> (not res!127945) (not e!169721))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!261907 (= res!127945 (or (= lt!132304 (MissingZero!1192 index!297)) (= lt!132304 (MissingVacant!1192 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12641 (_ BitVec 32)) SeekEntryResult!1192)

(assert (=> b!261907 (= lt!132304 (seekEntryOrOpen!0 key!932 (_keys!7013 thiss!1504) (mask!11175 thiss!1504)))))

(declare-fun b!261908 () Bool)

(declare-fun res!127942 () Bool)

(assert (=> b!261908 (= res!127942 (= (select (arr!5983 (_keys!7013 thiss!1504)) (index!6941 lt!132304)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!169726 () Bool)

(assert (=> b!261908 (=> (not res!127942) (not e!169726))))

(declare-fun b!261909 () Bool)

(declare-fun e!169722 () Bool)

(assert (=> b!261909 (= e!169729 (and e!169722 mapRes!11320))))

(declare-fun condMapEmpty!11320 () Bool)

(declare-fun mapDefault!11320 () ValueCell!2977)

