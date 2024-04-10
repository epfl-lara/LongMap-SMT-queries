; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22832 () Bool)

(assert start!22832)

(declare-fun b!237909 () Bool)

(declare-fun b_free!6389 () Bool)

(declare-fun b_next!6389 () Bool)

(assert (=> b!237909 (= b_free!6389 (not b_next!6389))))

(declare-fun tp!22362 () Bool)

(declare-fun b_and!13349 () Bool)

(assert (=> b!237909 (= tp!22362 b_and!13349)))

(declare-fun b!237900 () Bool)

(declare-fun e!154483 () Bool)

(declare-fun tp_is_empty!6251 () Bool)

(assert (=> b!237900 (= e!154483 tp_is_empty!6251)))

(declare-fun b!237901 () Bool)

(declare-fun res!116584 () Bool)

(declare-fun e!154485 () Bool)

(assert (=> b!237901 (=> (not res!116584) (not e!154485))))

(declare-datatypes ((V!7981 0))(
  ( (V!7982 (val!3170 Int)) )
))
(declare-datatypes ((ValueCell!2782 0))(
  ( (ValueCellFull!2782 (v!5205 V!7981)) (EmptyCell!2782) )
))
(declare-datatypes ((array!11775 0))(
  ( (array!11776 (arr!5592 (Array (_ BitVec 32) ValueCell!2782)) (size!5933 (_ BitVec 32))) )
))
(declare-datatypes ((array!11777 0))(
  ( (array!11778 (arr!5593 (Array (_ BitVec 32) (_ BitVec 64))) (size!5934 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3464 0))(
  ( (LongMapFixedSize!3465 (defaultEntry!4414 Int) (mask!10435 (_ BitVec 32)) (extraKeys!4151 (_ BitVec 32)) (zeroValue!4255 V!7981) (minValue!4255 V!7981) (_size!1781 (_ BitVec 32)) (_keys!6510 array!11777) (_values!4397 array!11775) (_vacant!1781 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3464)

(assert (=> b!237901 (= res!116584 (and (= (size!5933 (_values!4397 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10435 thiss!1504))) (= (size!5934 (_keys!6510 thiss!1504)) (size!5933 (_values!4397 thiss!1504))) (bvsge (mask!10435 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4151 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4151 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!237902 () Bool)

(declare-fun res!116582 () Bool)

(declare-fun e!154480 () Bool)

(assert (=> b!237902 (=> (not res!116582) (not e!154480))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!237902 (= res!116582 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237903 () Bool)

(declare-fun e!154481 () Bool)

(declare-fun e!154482 () Bool)

(declare-fun mapRes!10599 () Bool)

(assert (=> b!237903 (= e!154481 (and e!154482 mapRes!10599))))

(declare-fun condMapEmpty!10599 () Bool)

(declare-fun mapDefault!10599 () ValueCell!2782)

