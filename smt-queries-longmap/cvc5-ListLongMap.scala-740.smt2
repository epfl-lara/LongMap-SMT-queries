; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17232 () Bool)

(assert start!17232)

(declare-fun b!172854 () Bool)

(declare-fun b_free!4279 () Bool)

(declare-fun b_next!4279 () Bool)

(assert (=> b!172854 (= b_free!4279 (not b_next!4279))))

(declare-fun tp!15495 () Bool)

(declare-fun b_and!10719 () Bool)

(assert (=> b!172854 (= tp!15495 b_and!10719)))

(declare-fun b!172848 () Bool)

(declare-fun res!82070 () Bool)

(declare-fun e!114132 () Bool)

(assert (=> b!172848 (=> (not res!82070) (not e!114132))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172848 (= res!82070 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172849 () Bool)

(declare-fun e!114134 () Bool)

(declare-fun tp_is_empty!4051 () Bool)

(assert (=> b!172849 (= e!114134 tp_is_empty!4051)))

(declare-fun b!172850 () Bool)

(declare-fun e!114129 () Bool)

(assert (=> b!172850 (= e!114129 tp_is_empty!4051)))

(declare-fun res!82071 () Bool)

(assert (=> start!17232 (=> (not res!82071) (not e!114132))))

(declare-datatypes ((V!5049 0))(
  ( (V!5050 (val!2070 Int)) )
))
(declare-datatypes ((ValueCell!1682 0))(
  ( (ValueCellFull!1682 (v!3938 V!5049)) (EmptyCell!1682) )
))
(declare-datatypes ((array!7229 0))(
  ( (array!7230 (arr!3435 (Array (_ BitVec 32) (_ BitVec 64))) (size!3734 (_ BitVec 32))) )
))
(declare-datatypes ((array!7231 0))(
  ( (array!7232 (arr!3436 (Array (_ BitVec 32) ValueCell!1682)) (size!3735 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2272 0))(
  ( (LongMapFixedSize!2273 (defaultEntry!3582 Int) (mask!8440 (_ BitVec 32)) (extraKeys!3321 (_ BitVec 32)) (zeroValue!3423 V!5049) (minValue!3425 V!5049) (_size!1185 (_ BitVec 32)) (_keys!5421 array!7229) (_values!3565 array!7231) (_vacant!1185 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2272)

(declare-fun valid!963 (LongMapFixedSize!2272) Bool)

(assert (=> start!17232 (= res!82071 (valid!963 thiss!1248))))

(assert (=> start!17232 e!114132))

(declare-fun e!114133 () Bool)

(assert (=> start!17232 e!114133))

(assert (=> start!17232 true))

(declare-fun b!172851 () Bool)

(declare-fun e!114130 () Bool)

(declare-fun mapRes!6897 () Bool)

(assert (=> b!172851 (= e!114130 (and e!114129 mapRes!6897))))

(declare-fun condMapEmpty!6897 () Bool)

(declare-fun mapDefault!6897 () ValueCell!1682)

