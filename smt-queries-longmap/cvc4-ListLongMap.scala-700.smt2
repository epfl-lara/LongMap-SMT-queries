; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16708 () Bool)

(assert start!16708)

(declare-fun b!167569 () Bool)

(declare-fun b_free!4013 () Bool)

(declare-fun b_next!4013 () Bool)

(assert (=> b!167569 (= b_free!4013 (not b_next!4013))))

(declare-fun tp!14639 () Bool)

(declare-fun b_and!10427 () Bool)

(assert (=> b!167569 (= tp!14639 b_and!10427)))

(declare-fun b!167565 () Bool)

(declare-fun e!110064 () Bool)

(declare-fun e!110063 () Bool)

(declare-fun mapRes!6441 () Bool)

(assert (=> b!167565 (= e!110064 (and e!110063 mapRes!6441))))

(declare-fun condMapEmpty!6441 () Bool)

(declare-datatypes ((V!4733 0))(
  ( (V!4734 (val!1952 Int)) )
))
(declare-datatypes ((ValueCell!1564 0))(
  ( (ValueCellFull!1564 (v!3817 V!4733)) (EmptyCell!1564) )
))
(declare-datatypes ((array!6727 0))(
  ( (array!6728 (arr!3199 (Array (_ BitVec 32) (_ BitVec 64))) (size!3487 (_ BitVec 32))) )
))
(declare-datatypes ((array!6729 0))(
  ( (array!6730 (arr!3200 (Array (_ BitVec 32) ValueCell!1564)) (size!3488 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2036 0))(
  ( (LongMapFixedSize!2037 (defaultEntry!3460 Int) (mask!8209 (_ BitVec 32)) (extraKeys!3201 (_ BitVec 32)) (zeroValue!3303 V!4733) (minValue!3303 V!4733) (_size!1067 (_ BitVec 32)) (_keys!5285 array!6727) (_values!3443 array!6729) (_vacant!1067 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2036)

(declare-fun mapDefault!6441 () ValueCell!1564)

