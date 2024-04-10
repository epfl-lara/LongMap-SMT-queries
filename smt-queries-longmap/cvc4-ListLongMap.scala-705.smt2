; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16738 () Bool)

(assert start!16738)

(declare-fun b!168161 () Bool)

(declare-fun b_free!4043 () Bool)

(declare-fun b_next!4043 () Bool)

(assert (=> b!168161 (= b_free!4043 (not b_next!4043))))

(declare-fun tp!14729 () Bool)

(declare-fun b_and!10457 () Bool)

(assert (=> b!168161 (= tp!14729 b_and!10457)))

(declare-fun b!168150 () Bool)

(declare-fun e!110511 () Bool)

(declare-fun tp_is_empty!3845 () Bool)

(assert (=> b!168150 (= e!110511 tp_is_empty!3845)))

(declare-fun b!168151 () Bool)

(declare-fun e!110516 () Bool)

(declare-fun mapRes!6486 () Bool)

(assert (=> b!168151 (= e!110516 (and e!110511 mapRes!6486))))

(declare-fun condMapEmpty!6486 () Bool)

(declare-datatypes ((V!4773 0))(
  ( (V!4774 (val!1967 Int)) )
))
(declare-datatypes ((ValueCell!1579 0))(
  ( (ValueCellFull!1579 (v!3832 V!4773)) (EmptyCell!1579) )
))
(declare-datatypes ((array!6787 0))(
  ( (array!6788 (arr!3229 (Array (_ BitVec 32) (_ BitVec 64))) (size!3517 (_ BitVec 32))) )
))
(declare-datatypes ((array!6789 0))(
  ( (array!6790 (arr!3230 (Array (_ BitVec 32) ValueCell!1579)) (size!3518 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2066 0))(
  ( (LongMapFixedSize!2067 (defaultEntry!3475 Int) (mask!8234 (_ BitVec 32)) (extraKeys!3216 (_ BitVec 32)) (zeroValue!3318 V!4773) (minValue!3318 V!4773) (_size!1082 (_ BitVec 32)) (_keys!5300 array!6787) (_values!3458 array!6789) (_vacant!1082 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2066)

(declare-fun mapDefault!6486 () ValueCell!1579)

