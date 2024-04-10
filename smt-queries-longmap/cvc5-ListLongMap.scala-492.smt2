; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11100 () Bool)

(assert start!11100)

(declare-fun b!90530 () Bool)

(declare-fun b_free!2293 () Bool)

(declare-fun b_next!2293 () Bool)

(assert (=> b!90530 (= b_free!2293 (not b_next!2293))))

(declare-fun tp!9128 () Bool)

(declare-fun b_and!5451 () Bool)

(assert (=> b!90530 (= tp!9128 b_and!5451)))

(declare-fun b!90545 () Bool)

(declare-fun b_free!2295 () Bool)

(declare-fun b_next!2295 () Bool)

(assert (=> b!90545 (= b_free!2295 (not b_next!2295))))

(declare-fun tp!9130 () Bool)

(declare-fun b_and!5453 () Bool)

(assert (=> b!90545 (= tp!9130 b_and!5453)))

(declare-fun b!90528 () Bool)

(declare-fun res!46194 () Bool)

(declare-fun e!58958 () Bool)

(assert (=> b!90528 (=> (not res!46194) (not e!58958))))

(declare-datatypes ((V!3065 0))(
  ( (V!3066 (val!1326 Int)) )
))
(declare-datatypes ((array!4093 0))(
  ( (array!4094 (arr!1947 (Array (_ BitVec 32) (_ BitVec 64))) (size!2194 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!938 0))(
  ( (ValueCellFull!938 (v!2698 V!3065)) (EmptyCell!938) )
))
(declare-datatypes ((array!4095 0))(
  ( (array!4096 (arr!1948 (Array (_ BitVec 32) ValueCell!938)) (size!2195 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!784 0))(
  ( (LongMapFixedSize!785 (defaultEntry!2393 Int) (mask!6447 (_ BitVec 32)) (extraKeys!2224 (_ BitVec 32)) (zeroValue!2281 V!3065) (minValue!2281 V!3065) (_size!441 (_ BitVec 32)) (_keys!4073 array!4093) (_values!2376 array!4095) (_vacant!441 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!784)

(declare-datatypes ((Cell!584 0))(
  ( (Cell!585 (v!2699 LongMapFixedSize!784)) )
))
(declare-datatypes ((LongMap!584 0))(
  ( (LongMap!585 (underlying!303 Cell!584)) )
))
(declare-fun thiss!992 () LongMap!584)

(assert (=> b!90528 (= res!46194 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6447 newMap!16)) (_size!441 (v!2699 (underlying!303 thiss!992)))))))

(declare-fun mapIsEmpty!3507 () Bool)

(declare-fun mapRes!3508 () Bool)

(assert (=> mapIsEmpty!3507 mapRes!3508))

(declare-fun b!90529 () Bool)

(declare-fun e!58970 () Bool)

(declare-fun e!58956 () Bool)

(assert (=> b!90529 (= e!58970 (and e!58956 mapRes!3508))))

(declare-fun condMapEmpty!3508 () Bool)

(declare-fun mapDefault!3507 () ValueCell!938)

