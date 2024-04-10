; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21246 () Bool)

(assert start!21246)

(declare-fun b!214081 () Bool)

(declare-fun b_free!5657 () Bool)

(declare-fun b_next!5657 () Bool)

(assert (=> b!214081 (= b_free!5657 (not b_next!5657))))

(declare-fun tp!20048 () Bool)

(declare-fun b_and!12547 () Bool)

(assert (=> b!214081 (= tp!20048 b_and!12547)))

(declare-fun b!214077 () Bool)

(declare-fun res!104805 () Bool)

(declare-fun e!139210 () Bool)

(assert (=> b!214077 (=> (not res!104805) (not e!139210))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!214077 (= res!104805 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!214078 () Bool)

(declare-fun e!139209 () Bool)

(declare-fun tp_is_empty!5519 () Bool)

(assert (=> b!214078 (= e!139209 tp_is_empty!5519)))

(declare-fun b!214079 () Bool)

(declare-fun e!139206 () Bool)

(declare-fun mapRes!9383 () Bool)

(assert (=> b!214079 (= e!139206 (and e!139209 mapRes!9383))))

(declare-fun condMapEmpty!9383 () Bool)

(declare-datatypes ((V!7005 0))(
  ( (V!7006 (val!2804 Int)) )
))
(declare-datatypes ((ValueCell!2416 0))(
  ( (ValueCellFull!2416 (v!4822 V!7005)) (EmptyCell!2416) )
))
(declare-datatypes ((array!10243 0))(
  ( (array!10244 (arr!4860 (Array (_ BitVec 32) ValueCell!2416)) (size!5185 (_ BitVec 32))) )
))
(declare-datatypes ((array!10245 0))(
  ( (array!10246 (arr!4861 (Array (_ BitVec 32) (_ BitVec 64))) (size!5186 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2732 0))(
  ( (LongMapFixedSize!2733 (defaultEntry!4016 Int) (mask!9664 (_ BitVec 32)) (extraKeys!3753 (_ BitVec 32)) (zeroValue!3857 V!7005) (minValue!3857 V!7005) (_size!1415 (_ BitVec 32)) (_keys!6032 array!10245) (_values!3999 array!10243) (_vacant!1415 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2732)

(declare-fun mapDefault!9383 () ValueCell!2416)

