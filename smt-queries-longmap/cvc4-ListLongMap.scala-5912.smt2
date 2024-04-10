; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76582 () Bool)

(assert start!76582)

(declare-fun b!897162 () Bool)

(declare-fun b_free!15977 () Bool)

(declare-fun b_next!15977 () Bool)

(assert (=> b!897162 (= b_free!15977 (not b_next!15977))))

(declare-fun tp!55976 () Bool)

(declare-fun b_and!26269 () Bool)

(assert (=> b!897162 (= tp!55976 b_and!26269)))

(declare-fun b!897154 () Bool)

(declare-fun e!501632 () Bool)

(declare-fun e!501638 () Bool)

(declare-fun mapRes!29089 () Bool)

(assert (=> b!897154 (= e!501632 (and e!501638 mapRes!29089))))

(declare-fun condMapEmpty!29089 () Bool)

(declare-datatypes ((array!52634 0))(
  ( (array!52635 (arr!25301 (Array (_ BitVec 32) (_ BitVec 64))) (size!25754 (_ BitVec 32))) )
))
(declare-datatypes ((V!29371 0))(
  ( (V!29372 (val!9203 Int)) )
))
(declare-datatypes ((ValueCell!8671 0))(
  ( (ValueCellFull!8671 (v!11693 V!29371)) (EmptyCell!8671) )
))
(declare-datatypes ((array!52636 0))(
  ( (array!52637 (arr!25302 (Array (_ BitVec 32) ValueCell!8671)) (size!25755 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4358 0))(
  ( (LongMapFixedSize!4359 (defaultEntry!5391 Int) (mask!26065 (_ BitVec 32)) (extraKeys!5098 (_ BitVec 32)) (zeroValue!5202 V!29371) (minValue!5202 V!29371) (_size!2234 (_ BitVec 32)) (_keys!10140 array!52634) (_values!5389 array!52636) (_vacant!2234 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4358)

(declare-fun mapDefault!29089 () ValueCell!8671)

