; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39596 () Bool)

(assert start!39596)

(declare-fun b_free!9863 () Bool)

(declare-fun b_next!9863 () Bool)

(assert (=> start!39596 (= b_free!9863 (not b_next!9863))))

(declare-fun tp!35117 () Bool)

(declare-fun b_and!17519 () Bool)

(assert (=> start!39596 (= tp!35117 b_and!17519)))

(declare-fun res!248061 () Bool)

(declare-fun e!252028 () Bool)

(assert (=> start!39596 (=> (not res!248061) (not e!252028))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25869 0))(
  ( (array!25870 (arr!12384 (Array (_ BitVec 32) (_ BitVec 64))) (size!12736 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25869)

(assert (=> start!39596 (= res!248061 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12736 _keys!709))))))

(assert (=> start!39596 e!252028))

(declare-fun tp_is_empty!11015 () Bool)

(assert (=> start!39596 tp_is_empty!11015))

(assert (=> start!39596 tp!35117))

(assert (=> start!39596 true))

(declare-datatypes ((V!15791 0))(
  ( (V!15792 (val!5552 Int)) )
))
(declare-datatypes ((ValueCell!5164 0))(
  ( (ValueCellFull!5164 (v!7799 V!15791)) (EmptyCell!5164) )
))
(declare-datatypes ((array!25871 0))(
  ( (array!25872 (arr!12385 (Array (_ BitVec 32) ValueCell!5164)) (size!12737 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25871)

(declare-fun e!252029 () Bool)

(declare-fun array_inv!9026 (array!25871) Bool)

(assert (=> start!39596 (and (array_inv!9026 _values!549) e!252029)))

(declare-fun array_inv!9027 (array!25869) Bool)

(assert (=> start!39596 (array_inv!9027 _keys!709)))

(declare-fun b!424164 () Bool)

(declare-fun res!248067 () Bool)

(assert (=> b!424164 (=> (not res!248067) (not e!252028))))

(declare-datatypes ((List!7301 0))(
  ( (Nil!7298) (Cons!7297 (h!8153 (_ BitVec 64)) (t!12745 List!7301)) )
))
(declare-fun arrayNoDuplicates!0 (array!25869 (_ BitVec 32) List!7301) Bool)

(assert (=> b!424164 (= res!248067 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7298))))

(declare-fun b!424165 () Bool)

(declare-fun e!252025 () Bool)

(declare-fun mapRes!18144 () Bool)

(assert (=> b!424165 (= e!252029 (and e!252025 mapRes!18144))))

(declare-fun condMapEmpty!18144 () Bool)

(declare-fun mapDefault!18144 () ValueCell!5164)

