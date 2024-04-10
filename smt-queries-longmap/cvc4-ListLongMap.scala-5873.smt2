; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75772 () Bool)

(assert start!75772)

(declare-fun b!891129 () Bool)

(declare-fun b_free!15743 () Bool)

(declare-fun b_next!15743 () Bool)

(assert (=> b!891129 (= b_free!15743 (not b_next!15743))))

(declare-fun tp!55197 () Bool)

(declare-fun b_and!25983 () Bool)

(assert (=> b!891129 (= tp!55197 b_and!25983)))

(declare-fun b!891125 () Bool)

(declare-fun e!497195 () Bool)

(declare-fun e!497193 () Bool)

(declare-fun mapRes!28661 () Bool)

(assert (=> b!891125 (= e!497195 (and e!497193 mapRes!28661))))

(declare-fun condMapEmpty!28661 () Bool)

(declare-datatypes ((array!52122 0))(
  ( (array!52123 (arr!25067 (Array (_ BitVec 32) (_ BitVec 64))) (size!25511 (_ BitVec 32))) )
))
(declare-datatypes ((V!29059 0))(
  ( (V!29060 (val!9086 Int)) )
))
(declare-datatypes ((ValueCell!8554 0))(
  ( (ValueCellFull!8554 (v!11564 V!29059)) (EmptyCell!8554) )
))
(declare-datatypes ((array!52124 0))(
  ( (array!52125 (arr!25068 (Array (_ BitVec 32) ValueCell!8554)) (size!25512 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4124 0))(
  ( (LongMapFixedSize!4125 (defaultEntry!5259 Int) (mask!25746 (_ BitVec 32)) (extraKeys!4953 (_ BitVec 32)) (zeroValue!5057 V!29059) (minValue!5057 V!29059) (_size!2117 (_ BitVec 32)) (_keys!9942 array!52122) (_values!5244 array!52124) (_vacant!2117 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4124)

(declare-fun mapDefault!28661 () ValueCell!8554)

