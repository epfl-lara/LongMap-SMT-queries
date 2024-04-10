; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75630 () Bool)

(assert start!75630)

(declare-fun b!889245 () Bool)

(declare-fun b_free!15611 () Bool)

(declare-fun b_next!15611 () Bool)

(assert (=> b!889245 (= b_free!15611 (not b_next!15611))))

(declare-fun tp!54798 () Bool)

(declare-fun b_and!25851 () Bool)

(assert (=> b!889245 (= tp!54798 b_and!25851)))

(declare-fun b!889239 () Bool)

(declare-fun e!495634 () Bool)

(declare-fun e!495635 () Bool)

(declare-fun mapRes!28460 () Bool)

(assert (=> b!889239 (= e!495634 (and e!495635 mapRes!28460))))

(declare-fun condMapEmpty!28460 () Bool)

(declare-datatypes ((array!51856 0))(
  ( (array!51857 (arr!24935 (Array (_ BitVec 32) (_ BitVec 64))) (size!25379 (_ BitVec 32))) )
))
(declare-datatypes ((V!28883 0))(
  ( (V!28884 (val!9020 Int)) )
))
(declare-datatypes ((ValueCell!8488 0))(
  ( (ValueCellFull!8488 (v!11498 V!28883)) (EmptyCell!8488) )
))
(declare-datatypes ((array!51858 0))(
  ( (array!51859 (arr!24936 (Array (_ BitVec 32) ValueCell!8488)) (size!25380 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3992 0))(
  ( (LongMapFixedSize!3993 (defaultEntry!5193 Int) (mask!25635 (_ BitVec 32)) (extraKeys!4887 (_ BitVec 32)) (zeroValue!4991 V!28883) (minValue!4991 V!28883) (_size!2051 (_ BitVec 32)) (_keys!9876 array!51856) (_values!5178 array!51858) (_vacant!2051 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3992)

(declare-fun mapDefault!28460 () ValueCell!8488)

