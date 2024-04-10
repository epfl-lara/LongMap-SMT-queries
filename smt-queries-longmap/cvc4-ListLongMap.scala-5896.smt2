; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76162 () Bool)

(assert start!76162)

(declare-fun b!894628 () Bool)

(declare-fun b_free!15881 () Bool)

(declare-fun b_next!15881 () Bool)

(assert (=> b!894628 (= b_free!15881 (not b_next!15881))))

(declare-fun tp!55634 () Bool)

(declare-fun b_and!26173 () Bool)

(assert (=> b!894628 (= tp!55634 b_and!26173)))

(declare-fun b!894625 () Bool)

(declare-fun e!499739 () Bool)

(declare-fun e!499742 () Bool)

(declare-fun mapRes!28890 () Bool)

(assert (=> b!894625 (= e!499739 (and e!499742 mapRes!28890))))

(declare-fun condMapEmpty!28890 () Bool)

(declare-datatypes ((array!52410 0))(
  ( (array!52411 (arr!25205 (Array (_ BitVec 32) (_ BitVec 64))) (size!25651 (_ BitVec 32))) )
))
(declare-datatypes ((V!29243 0))(
  ( (V!29244 (val!9155 Int)) )
))
(declare-datatypes ((ValueCell!8623 0))(
  ( (ValueCellFull!8623 (v!11645 V!29243)) (EmptyCell!8623) )
))
(declare-datatypes ((array!52412 0))(
  ( (array!52413 (arr!25206 (Array (_ BitVec 32) ValueCell!8623)) (size!25652 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4262 0))(
  ( (LongMapFixedSize!4263 (defaultEntry!5343 Int) (mask!25906 (_ BitVec 32)) (extraKeys!5039 (_ BitVec 32)) (zeroValue!5143 V!29243) (minValue!5143 V!29243) (_size!2186 (_ BitVec 32)) (_keys!10041 array!52410) (_values!5330 array!52412) (_vacant!2186 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4262)

(declare-fun mapDefault!28890 () ValueCell!8623)

