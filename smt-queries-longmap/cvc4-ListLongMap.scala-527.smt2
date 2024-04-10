; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13156 () Bool)

(assert start!13156)

(declare-fun b!115704 () Bool)

(declare-fun b_free!2721 () Bool)

(declare-fun b_next!2721 () Bool)

(assert (=> b!115704 (= b_free!2721 (not b_next!2721))))

(declare-fun tp!10527 () Bool)

(declare-fun b_and!7191 () Bool)

(assert (=> b!115704 (= tp!10527 b_and!7191)))

(declare-fun b!115708 () Bool)

(declare-fun b_free!2723 () Bool)

(declare-fun b_next!2723 () Bool)

(assert (=> b!115708 (= b_free!2723 (not b_next!2723))))

(declare-fun tp!10525 () Bool)

(declare-fun b_and!7193 () Bool)

(assert (=> b!115708 (= tp!10525 b_and!7193)))

(declare-fun b!115698 () Bool)

(declare-fun e!75527 () Bool)

(declare-fun e!75524 () Bool)

(declare-fun mapRes!4264 () Bool)

(assert (=> b!115698 (= e!75527 (and e!75524 mapRes!4264))))

(declare-fun condMapEmpty!4264 () Bool)

(declare-datatypes ((V!3349 0))(
  ( (V!3350 (val!1433 Int)) )
))
(declare-datatypes ((array!4557 0))(
  ( (array!4558 (arr!2161 (Array (_ BitVec 32) (_ BitVec 64))) (size!2421 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1045 0))(
  ( (ValueCellFull!1045 (v!3034 V!3349)) (EmptyCell!1045) )
))
(declare-datatypes ((array!4559 0))(
  ( (array!4560 (arr!2162 (Array (_ BitVec 32) ValueCell!1045)) (size!2422 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!998 0))(
  ( (LongMapFixedSize!999 (defaultEntry!2708 Int) (mask!6918 (_ BitVec 32)) (extraKeys!2497 (_ BitVec 32)) (zeroValue!2575 V!3349) (minValue!2575 V!3349) (_size!548 (_ BitVec 32)) (_keys!4430 array!4557) (_values!2691 array!4559) (_vacant!548 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!796 0))(
  ( (Cell!797 (v!3035 LongMapFixedSize!998)) )
))
(declare-datatypes ((LongMap!796 0))(
  ( (LongMap!797 (underlying!409 Cell!796)) )
))
(declare-fun thiss!992 () LongMap!796)

(declare-fun mapDefault!4264 () ValueCell!1045)

