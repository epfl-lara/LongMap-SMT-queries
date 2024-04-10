; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75834 () Bool)

(assert start!75834)

(declare-fun b!892235 () Bool)

(declare-fun b_free!15805 () Bool)

(declare-fun b_next!15805 () Bool)

(assert (=> b!892235 (= b_free!15805 (not b_next!15805))))

(declare-fun tp!55383 () Bool)

(declare-fun b_and!26045 () Bool)

(assert (=> b!892235 (= tp!55383 b_and!26045)))

(declare-fun res!604494 () Bool)

(declare-fun e!498025 () Bool)

(assert (=> start!75834 (=> (not res!604494) (not e!498025))))

(declare-datatypes ((array!52246 0))(
  ( (array!52247 (arr!25129 (Array (_ BitVec 32) (_ BitVec 64))) (size!25573 (_ BitVec 32))) )
))
(declare-datatypes ((V!29143 0))(
  ( (V!29144 (val!9117 Int)) )
))
(declare-datatypes ((ValueCell!8585 0))(
  ( (ValueCellFull!8585 (v!11595 V!29143)) (EmptyCell!8585) )
))
(declare-datatypes ((array!52248 0))(
  ( (array!52249 (arr!25130 (Array (_ BitVec 32) ValueCell!8585)) (size!25574 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4186 0))(
  ( (LongMapFixedSize!4187 (defaultEntry!5290 Int) (mask!25799 (_ BitVec 32)) (extraKeys!4984 (_ BitVec 32)) (zeroValue!5088 V!29143) (minValue!5088 V!29143) (_size!2148 (_ BitVec 32)) (_keys!9973 array!52246) (_values!5275 array!52248) (_vacant!2148 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4186)

(declare-fun valid!1619 (LongMapFixedSize!4186) Bool)

(assert (=> start!75834 (= res!604494 (valid!1619 thiss!1181))))

(assert (=> start!75834 e!498025))

(declare-fun e!498030 () Bool)

(assert (=> start!75834 e!498030))

(assert (=> start!75834 true))

(declare-fun b!892231 () Bool)

(declare-fun e!498027 () Bool)

(declare-fun e!498028 () Bool)

(declare-fun mapRes!28754 () Bool)

(assert (=> b!892231 (= e!498027 (and e!498028 mapRes!28754))))

(declare-fun condMapEmpty!28754 () Bool)

(declare-fun mapDefault!28754 () ValueCell!8585)

