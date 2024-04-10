; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22210 () Bool)

(assert start!22210)

(declare-fun b!232995 () Bool)

(declare-fun b_free!6277 () Bool)

(declare-fun b_next!6277 () Bool)

(assert (=> b!232995 (= b_free!6277 (not b_next!6277))))

(declare-fun tp!21972 () Bool)

(declare-fun b_and!13175 () Bool)

(assert (=> b!232995 (= tp!21972 b_and!13175)))

(declare-fun bm!21662 () Bool)

(declare-fun call!21665 () Bool)

(declare-datatypes ((V!7833 0))(
  ( (V!7834 (val!3114 Int)) )
))
(declare-datatypes ((ValueCell!2726 0))(
  ( (ValueCellFull!2726 (v!5134 V!7833)) (EmptyCell!2726) )
))
(declare-datatypes ((array!11521 0))(
  ( (array!11522 (arr!5480 (Array (_ BitVec 32) ValueCell!2726)) (size!5813 (_ BitVec 32))) )
))
(declare-datatypes ((array!11523 0))(
  ( (array!11524 (arr!5481 (Array (_ BitVec 32) (_ BitVec 64))) (size!5814 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3352 0))(
  ( (LongMapFixedSize!3353 (defaultEntry!4335 Int) (mask!10255 (_ BitVec 32)) (extraKeys!4072 (_ BitVec 32)) (zeroValue!4176 V!7833) (minValue!4176 V!7833) (_size!1725 (_ BitVec 32)) (_keys!6389 array!11523) (_values!4318 array!11521) (_vacant!1725 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3352)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!11523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!21662 (= call!21665 (arrayContainsKey!0 (_keys!6389 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!232992 () Bool)

(declare-fun res!114371 () Bool)

(declare-fun e!151346 () Bool)

(assert (=> b!232992 (=> (not res!114371) (not e!151346))))

(declare-fun call!21666 () Bool)

(assert (=> b!232992 (= res!114371 call!21666)))

(declare-fun e!151343 () Bool)

(assert (=> b!232992 (= e!151343 e!151346)))

(declare-fun b!232993 () Bool)

(declare-fun e!151338 () Bool)

(declare-fun e!151339 () Bool)

(declare-fun mapRes!10378 () Bool)

(assert (=> b!232993 (= e!151338 (and e!151339 mapRes!10378))))

(declare-fun condMapEmpty!10378 () Bool)

(declare-fun mapDefault!10378 () ValueCell!2726)

