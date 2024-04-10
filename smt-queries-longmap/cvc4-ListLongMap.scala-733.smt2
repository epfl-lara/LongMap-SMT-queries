; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17106 () Bool)

(assert start!17106)

(declare-fun b!172084 () Bool)

(declare-fun b_free!4241 () Bool)

(declare-fun b_next!4241 () Bool)

(assert (=> b!172084 (= b_free!4241 (not b_next!4241))))

(declare-fun tp!15357 () Bool)

(declare-fun b_and!10681 () Bool)

(assert (=> b!172084 (= tp!15357 b_and!10681)))

(declare-fun b!172083 () Bool)

(declare-fun e!113577 () Bool)

(declare-datatypes ((V!4997 0))(
  ( (V!4998 (val!2051 Int)) )
))
(declare-datatypes ((ValueCell!1663 0))(
  ( (ValueCellFull!1663 (v!3919 V!4997)) (EmptyCell!1663) )
))
(declare-datatypes ((array!7141 0))(
  ( (array!7142 (arr!3397 (Array (_ BitVec 32) (_ BitVec 64))) (size!3691 (_ BitVec 32))) )
))
(declare-datatypes ((array!7143 0))(
  ( (array!7144 (arr!3398 (Array (_ BitVec 32) ValueCell!1663)) (size!3692 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2234 0))(
  ( (LongMapFixedSize!2235 (defaultEntry!3563 Int) (mask!8396 (_ BitVec 32)) (extraKeys!3302 (_ BitVec 32)) (zeroValue!3404 V!4997) (minValue!3406 V!4997) (_size!1166 (_ BitVec 32)) (_keys!5397 array!7141) (_values!3546 array!7143) (_vacant!1166 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2234)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172083 (= e!113577 (not (validMask!0 (mask!8396 thiss!1248))))))

(declare-fun res!81710 () Bool)

(assert (=> start!17106 (=> (not res!81710) (not e!113577))))

(declare-fun valid!949 (LongMapFixedSize!2234) Bool)

(assert (=> start!17106 (= res!81710 (valid!949 thiss!1248))))

(assert (=> start!17106 e!113577))

(declare-fun e!113573 () Bool)

(assert (=> start!17106 e!113573))

(assert (=> start!17106 true))

(declare-fun mapIsEmpty!6817 () Bool)

(declare-fun mapRes!6817 () Bool)

(assert (=> mapIsEmpty!6817 mapRes!6817))

(declare-fun tp_is_empty!4013 () Bool)

(declare-fun e!113576 () Bool)

(declare-fun array_inv!2175 (array!7141) Bool)

(declare-fun array_inv!2176 (array!7143) Bool)

(assert (=> b!172084 (= e!113573 (and tp!15357 tp_is_empty!4013 (array_inv!2175 (_keys!5397 thiss!1248)) (array_inv!2176 (_values!3546 thiss!1248)) e!113576))))

(declare-fun b!172085 () Bool)

(declare-fun e!113575 () Bool)

(assert (=> b!172085 (= e!113576 (and e!113575 mapRes!6817))))

(declare-fun condMapEmpty!6817 () Bool)

(declare-fun mapDefault!6817 () ValueCell!1663)

