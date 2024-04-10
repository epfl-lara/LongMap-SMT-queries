; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37182 () Bool)

(assert start!37182)

(declare-fun b_free!8309 () Bool)

(declare-fun b_next!8309 () Bool)

(assert (=> start!37182 (= b_free!8309 (not b_next!8309))))

(declare-fun tp!29642 () Bool)

(declare-fun b_and!15551 () Bool)

(assert (=> start!37182 (= tp!29642 b_and!15551)))

(declare-fun b!375387 () Bool)

(declare-fun e!228707 () Bool)

(declare-fun tp_is_empty!8957 () Bool)

(assert (=> b!375387 (= e!228707 tp_is_empty!8957)))

(declare-fun b!375388 () Bool)

(declare-fun res!211913 () Bool)

(declare-fun e!228709 () Bool)

(assert (=> b!375388 (=> (not res!211913) (not e!228709))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21849 0))(
  ( (array!21850 (arr!10393 (Array (_ BitVec 32) (_ BitVec 64))) (size!10745 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21849)

(assert (=> b!375388 (= res!211913 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10745 _keys!658))))))

(declare-fun b!375389 () Bool)

(declare-fun e!228708 () Bool)

(declare-fun mapRes!15000 () Bool)

(assert (=> b!375389 (= e!228708 (and e!228707 mapRes!15000))))

(declare-fun condMapEmpty!15000 () Bool)

(declare-datatypes ((V!13047 0))(
  ( (V!13048 (val!4523 Int)) )
))
(declare-datatypes ((ValueCell!4135 0))(
  ( (ValueCellFull!4135 (v!6720 V!13047)) (EmptyCell!4135) )
))
(declare-datatypes ((array!21851 0))(
  ( (array!21852 (arr!10394 (Array (_ BitVec 32) ValueCell!4135)) (size!10746 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21851)

(declare-fun mapDefault!15000 () ValueCell!4135)

