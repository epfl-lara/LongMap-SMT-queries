; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75820 () Bool)

(assert start!75820)

(declare-fun b!891989 () Bool)

(declare-fun b_free!15791 () Bool)

(declare-fun b_next!15791 () Bool)

(assert (=> b!891989 (= b_free!15791 (not b_next!15791))))

(declare-fun tp!55341 () Bool)

(declare-fun b_and!26031 () Bool)

(assert (=> b!891989 (= tp!55341 b_and!26031)))

(declare-fun b!891979 () Bool)

(declare-fun e!497840 () Bool)

(declare-fun tp_is_empty!18119 () Bool)

(assert (=> b!891979 (= e!497840 tp_is_empty!18119)))

(declare-fun b!891980 () Bool)

(declare-fun e!497839 () Bool)

(declare-fun mapRes!28733 () Bool)

(assert (=> b!891980 (= e!497839 (and e!497840 mapRes!28733))))

(declare-fun condMapEmpty!28733 () Bool)

(declare-datatypes ((array!52218 0))(
  ( (array!52219 (arr!25115 (Array (_ BitVec 32) (_ BitVec 64))) (size!25559 (_ BitVec 32))) )
))
(declare-datatypes ((V!29123 0))(
  ( (V!29124 (val!9110 Int)) )
))
(declare-datatypes ((ValueCell!8578 0))(
  ( (ValueCellFull!8578 (v!11588 V!29123)) (EmptyCell!8578) )
))
(declare-datatypes ((array!52220 0))(
  ( (array!52221 (arr!25116 (Array (_ BitVec 32) ValueCell!8578)) (size!25560 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4172 0))(
  ( (LongMapFixedSize!4173 (defaultEntry!5283 Int) (mask!25786 (_ BitVec 32)) (extraKeys!4977 (_ BitVec 32)) (zeroValue!5081 V!29123) (minValue!5081 V!29123) (_size!2141 (_ BitVec 32)) (_keys!9966 array!52218) (_values!5268 array!52220) (_vacant!2141 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4172)

(declare-fun mapDefault!28733 () ValueCell!8578)

