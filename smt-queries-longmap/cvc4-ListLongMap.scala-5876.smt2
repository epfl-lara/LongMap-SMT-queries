; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75790 () Bool)

(assert start!75790)

(declare-fun b!891443 () Bool)

(declare-fun b_free!15761 () Bool)

(declare-fun b_next!15761 () Bool)

(assert (=> b!891443 (= b_free!15761 (not b_next!15761))))

(declare-fun tp!55251 () Bool)

(declare-fun b_and!26001 () Bool)

(assert (=> b!891443 (= tp!55251 b_and!26001)))

(declare-fun b!891439 () Bool)

(declare-fun e!497439 () Bool)

(declare-fun tp_is_empty!18089 () Bool)

(assert (=> b!891439 (= e!497439 tp_is_empty!18089)))

(declare-fun b!891441 () Bool)

(declare-fun e!497433 () Bool)

(declare-fun mapRes!28688 () Bool)

(assert (=> b!891441 (= e!497433 (and e!497439 mapRes!28688))))

(declare-fun condMapEmpty!28688 () Bool)

(declare-datatypes ((array!52158 0))(
  ( (array!52159 (arr!25085 (Array (_ BitVec 32) (_ BitVec 64))) (size!25529 (_ BitVec 32))) )
))
(declare-datatypes ((V!29083 0))(
  ( (V!29084 (val!9095 Int)) )
))
(declare-datatypes ((ValueCell!8563 0))(
  ( (ValueCellFull!8563 (v!11573 V!29083)) (EmptyCell!8563) )
))
(declare-datatypes ((array!52160 0))(
  ( (array!52161 (arr!25086 (Array (_ BitVec 32) ValueCell!8563)) (size!25530 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4142 0))(
  ( (LongMapFixedSize!4143 (defaultEntry!5268 Int) (mask!25761 (_ BitVec 32)) (extraKeys!4962 (_ BitVec 32)) (zeroValue!5066 V!29083) (minValue!5066 V!29083) (_size!2126 (_ BitVec 32)) (_keys!9951 array!52158) (_values!5253 array!52160) (_vacant!2126 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4142)

(declare-fun mapDefault!28688 () ValueCell!8563)

