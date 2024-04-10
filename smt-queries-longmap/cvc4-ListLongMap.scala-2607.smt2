; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39464 () Bool)

(assert start!39464)

(declare-fun b_free!9731 () Bool)

(declare-fun b_next!9731 () Bool)

(assert (=> start!39464 (= b_free!9731 (not b_next!9731))))

(declare-fun tp!34721 () Bool)

(declare-fun b_and!17337 () Bool)

(assert (=> start!39464 (= tp!34721 b_and!17337)))

(declare-fun b!420852 () Bool)

(declare-fun res!245545 () Bool)

(declare-fun e!250622 () Bool)

(assert (=> b!420852 (=> (not res!245545) (not e!250622))))

(declare-datatypes ((array!25615 0))(
  ( (array!25616 (arr!12257 (Array (_ BitVec 32) (_ BitVec 64))) (size!12609 (_ BitVec 32))) )
))
(declare-fun lt!193144 () array!25615)

(declare-datatypes ((List!7201 0))(
  ( (Nil!7198) (Cons!7197 (h!8053 (_ BitVec 64)) (t!12597 List!7201)) )
))
(declare-fun arrayNoDuplicates!0 (array!25615 (_ BitVec 32) List!7201) Bool)

(assert (=> b!420852 (= res!245545 (arrayNoDuplicates!0 lt!193144 #b00000000000000000000000000000000 Nil!7198))))

(declare-fun b!420853 () Bool)

(declare-fun e!250625 () Bool)

(declare-fun e!250621 () Bool)

(declare-fun mapRes!17946 () Bool)

(assert (=> b!420853 (= e!250625 (and e!250621 mapRes!17946))))

(declare-fun condMapEmpty!17946 () Bool)

(declare-datatypes ((V!15615 0))(
  ( (V!15616 (val!5486 Int)) )
))
(declare-datatypes ((ValueCell!5098 0))(
  ( (ValueCellFull!5098 (v!7733 V!15615)) (EmptyCell!5098) )
))
(declare-datatypes ((array!25617 0))(
  ( (array!25618 (arr!12258 (Array (_ BitVec 32) ValueCell!5098)) (size!12610 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25617)

(declare-fun mapDefault!17946 () ValueCell!5098)

