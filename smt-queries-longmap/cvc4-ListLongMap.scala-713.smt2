; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16786 () Bool)

(assert start!16786)

(declare-fun b!169000 () Bool)

(declare-fun b_free!4091 () Bool)

(declare-fun b_next!4091 () Bool)

(assert (=> b!169000 (= b_free!4091 (not b_next!4091))))

(declare-fun tp!14874 () Bool)

(declare-fun b_and!10505 () Bool)

(assert (=> b!169000 (= tp!14874 b_and!10505)))

(declare-fun res!80440 () Bool)

(declare-fun e!111218 () Bool)

(assert (=> start!16786 (=> (not res!80440) (not e!111218))))

(declare-datatypes ((V!4837 0))(
  ( (V!4838 (val!1991 Int)) )
))
(declare-datatypes ((ValueCell!1603 0))(
  ( (ValueCellFull!1603 (v!3856 V!4837)) (EmptyCell!1603) )
))
(declare-datatypes ((array!6883 0))(
  ( (array!6884 (arr!3277 (Array (_ BitVec 32) (_ BitVec 64))) (size!3565 (_ BitVec 32))) )
))
(declare-datatypes ((array!6885 0))(
  ( (array!6886 (arr!3278 (Array (_ BitVec 32) ValueCell!1603)) (size!3566 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2114 0))(
  ( (LongMapFixedSize!2115 (defaultEntry!3499 Int) (mask!8274 (_ BitVec 32)) (extraKeys!3240 (_ BitVec 32)) (zeroValue!3342 V!4837) (minValue!3342 V!4837) (_size!1106 (_ BitVec 32)) (_keys!5324 array!6883) (_values!3482 array!6885) (_vacant!1106 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2114)

(declare-fun valid!916 (LongMapFixedSize!2114) Bool)

(assert (=> start!16786 (= res!80440 (valid!916 thiss!1248))))

(assert (=> start!16786 e!111218))

(declare-fun e!111217 () Bool)

(assert (=> start!16786 e!111217))

(assert (=> start!16786 true))

(declare-fun tp_is_empty!3893 () Bool)

(assert (=> start!16786 tp_is_empty!3893))

(declare-fun b!168999 () Bool)

(declare-fun e!111215 () Bool)

(declare-fun e!111214 () Bool)

(declare-fun mapRes!6558 () Bool)

(assert (=> b!168999 (= e!111215 (and e!111214 mapRes!6558))))

(declare-fun condMapEmpty!6558 () Bool)

(declare-fun mapDefault!6558 () ValueCell!1603)

