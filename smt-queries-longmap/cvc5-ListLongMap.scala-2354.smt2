; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37586 () Bool)

(assert start!37586)

(declare-fun b_free!8713 () Bool)

(declare-fun b_next!8713 () Bool)

(assert (=> start!37586 (= b_free!8713 (not b_next!8713))))

(declare-fun tp!30855 () Bool)

(declare-fun b_and!15955 () Bool)

(assert (=> start!37586 (= tp!30855 b_and!15955)))

(declare-fun res!218962 () Bool)

(declare-fun e!233315 () Bool)

(assert (=> start!37586 (=> (not res!218962) (not e!233315))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37586 (= res!218962 (validMask!0 mask!970))))

(assert (=> start!37586 e!233315))

(declare-datatypes ((V!13587 0))(
  ( (V!13588 (val!4725 Int)) )
))
(declare-datatypes ((ValueCell!4337 0))(
  ( (ValueCellFull!4337 (v!6922 V!13587)) (EmptyCell!4337) )
))
(declare-datatypes ((array!22627 0))(
  ( (array!22628 (arr!10782 (Array (_ BitVec 32) ValueCell!4337)) (size!11134 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22627)

(declare-fun e!233320 () Bool)

(declare-fun array_inv!7938 (array!22627) Bool)

(assert (=> start!37586 (and (array_inv!7938 _values!506) e!233320)))

(assert (=> start!37586 tp!30855))

(assert (=> start!37586 true))

(declare-fun tp_is_empty!9361 () Bool)

(assert (=> start!37586 tp_is_empty!9361))

(declare-datatypes ((array!22629 0))(
  ( (array!22630 (arr!10783 (Array (_ BitVec 32) (_ BitVec 64))) (size!11135 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22629)

(declare-fun array_inv!7939 (array!22629) Bool)

(assert (=> start!37586 (array_inv!7939 _keys!658)))

(declare-fun mapNonEmpty!15606 () Bool)

(declare-fun mapRes!15606 () Bool)

(declare-fun tp!30854 () Bool)

(declare-fun e!233317 () Bool)

(assert (=> mapNonEmpty!15606 (= mapRes!15606 (and tp!30854 e!233317))))

(declare-fun mapValue!15606 () ValueCell!4337)

(declare-fun mapRest!15606 () (Array (_ BitVec 32) ValueCell!4337))

(declare-fun mapKey!15606 () (_ BitVec 32))

(assert (=> mapNonEmpty!15606 (= (arr!10782 _values!506) (store mapRest!15606 mapKey!15606 mapValue!15606))))

(declare-fun b!384259 () Bool)

(declare-fun e!233318 () Bool)

(assert (=> b!384259 (= e!233320 (and e!233318 mapRes!15606))))

(declare-fun condMapEmpty!15606 () Bool)

(declare-fun mapDefault!15606 () ValueCell!4337)

