; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21282 () Bool)

(assert start!21282)

(declare-fun b!214293 () Bool)

(declare-fun b_free!5669 () Bool)

(declare-fun b_next!5669 () Bool)

(assert (=> b!214293 (= b_free!5669 (not b_next!5669))))

(declare-fun tp!20090 () Bool)

(declare-fun b_and!12559 () Bool)

(assert (=> b!214293 (= tp!20090 b_and!12559)))

(declare-fun res!104904 () Bool)

(declare-fun e!139368 () Bool)

(assert (=> start!21282 (=> (not res!104904) (not e!139368))))

(declare-datatypes ((V!7021 0))(
  ( (V!7022 (val!2810 Int)) )
))
(declare-datatypes ((ValueCell!2422 0))(
  ( (ValueCellFull!2422 (v!4828 V!7021)) (EmptyCell!2422) )
))
(declare-datatypes ((array!10271 0))(
  ( (array!10272 (arr!4872 (Array (_ BitVec 32) ValueCell!2422)) (size!5198 (_ BitVec 32))) )
))
(declare-datatypes ((array!10273 0))(
  ( (array!10274 (arr!4873 (Array (_ BitVec 32) (_ BitVec 64))) (size!5199 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2744 0))(
  ( (LongMapFixedSize!2745 (defaultEntry!4022 Int) (mask!9677 (_ BitVec 32)) (extraKeys!3759 (_ BitVec 32)) (zeroValue!3863 V!7021) (minValue!3863 V!7021) (_size!1421 (_ BitVec 32)) (_keys!6039 array!10273) (_values!4005 array!10271) (_vacant!1421 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2744)

(declare-fun valid!1124 (LongMapFixedSize!2744) Bool)

(assert (=> start!21282 (= res!104904 (valid!1124 thiss!1504))))

(assert (=> start!21282 e!139368))

(declare-fun e!139367 () Bool)

(assert (=> start!21282 e!139367))

(assert (=> start!21282 true))

(declare-fun b!214289 () Bool)

(assert (=> b!214289 (= e!139368 (and (bvsge (mask!9677 thiss!1504) #b00000000000000000000000000000000) (not (= (size!5199 (_keys!6039 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9677 thiss!1504))))))))

(declare-fun b!214290 () Bool)

(declare-fun e!139369 () Bool)

(declare-fun e!139365 () Bool)

(declare-fun mapRes!9408 () Bool)

(assert (=> b!214290 (= e!139369 (and e!139365 mapRes!9408))))

(declare-fun condMapEmpty!9408 () Bool)

(declare-fun mapDefault!9408 () ValueCell!2422)

