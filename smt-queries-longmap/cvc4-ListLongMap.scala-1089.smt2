; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22220 () Bool)

(assert start!22220)

(declare-fun b!233180 () Bool)

(declare-fun b_free!6287 () Bool)

(declare-fun b_next!6287 () Bool)

(assert (=> b!233180 (= b_free!6287 (not b_next!6287))))

(declare-fun tp!22003 () Bool)

(declare-fun b_and!13185 () Bool)

(assert (=> b!233180 (= tp!22003 b_and!13185)))

(declare-fun b!233175 () Bool)

(declare-fun res!114454 () Bool)

(declare-fun e!151477 () Bool)

(assert (=> b!233175 (=> (not res!114454) (not e!151477))))

(declare-datatypes ((V!7845 0))(
  ( (V!7846 (val!3119 Int)) )
))
(declare-datatypes ((ValueCell!2731 0))(
  ( (ValueCellFull!2731 (v!5139 V!7845)) (EmptyCell!2731) )
))
(declare-datatypes ((array!11541 0))(
  ( (array!11542 (arr!5490 (Array (_ BitVec 32) ValueCell!2731)) (size!5823 (_ BitVec 32))) )
))
(declare-datatypes ((array!11543 0))(
  ( (array!11544 (arr!5491 (Array (_ BitVec 32) (_ BitVec 64))) (size!5824 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3362 0))(
  ( (LongMapFixedSize!3363 (defaultEntry!4340 Int) (mask!10262 (_ BitVec 32)) (extraKeys!4077 (_ BitVec 32)) (zeroValue!4181 V!7845) (minValue!4181 V!7845) (_size!1730 (_ BitVec 32)) (_keys!6394 array!11543) (_values!4323 array!11541) (_vacant!1730 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3362)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4600 0))(
  ( (tuple2!4601 (_1!2311 (_ BitVec 64)) (_2!2311 V!7845)) )
))
(declare-datatypes ((List!3513 0))(
  ( (Nil!3510) (Cons!3509 (h!4157 tuple2!4600) (t!8472 List!3513)) )
))
(declare-datatypes ((ListLongMap!3513 0))(
  ( (ListLongMap!3514 (toList!1772 List!3513)) )
))
(declare-fun contains!1640 (ListLongMap!3513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1300 (array!11543 array!11541 (_ BitVec 32) (_ BitVec 32) V!7845 V!7845 (_ BitVec 32) Int) ListLongMap!3513)

(assert (=> b!233175 (= res!114454 (contains!1640 (getCurrentListMap!1300 (_keys!6394 thiss!1504) (_values!4323 thiss!1504) (mask!10262 thiss!1504) (extraKeys!4077 thiss!1504) (zeroValue!4181 thiss!1504) (minValue!4181 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4340 thiss!1504)) key!932))))

(declare-fun b!233176 () Bool)

(declare-fun e!151476 () Bool)

(declare-fun tp_is_empty!6149 () Bool)

(assert (=> b!233176 (= e!151476 tp_is_empty!6149)))

(declare-fun b!233177 () Bool)

(declare-fun e!151475 () Bool)

(declare-fun mapRes!10393 () Bool)

(assert (=> b!233177 (= e!151475 (and e!151476 mapRes!10393))))

(declare-fun condMapEmpty!10393 () Bool)

(declare-fun mapDefault!10393 () ValueCell!2731)

