; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39622 () Bool)

(assert start!39622)

(declare-fun b_free!9889 () Bool)

(declare-fun b_next!9889 () Bool)

(assert (=> start!39622 (= b_free!9889 (not b_next!9889))))

(declare-fun tp!35195 () Bool)

(declare-fun b_and!17545 () Bool)

(assert (=> start!39622 (= tp!35195 b_and!17545)))

(declare-fun b!424751 () Bool)

(declare-fun res!248530 () Bool)

(declare-fun e!252263 () Bool)

(assert (=> b!424751 (=> (not res!248530) (not e!252263))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424751 (= res!248530 (validKeyInArray!0 k!794))))

(declare-fun b!424752 () Bool)

(declare-fun res!248531 () Bool)

(assert (=> b!424752 (=> (not res!248531) (not e!252263))))

(declare-datatypes ((array!25921 0))(
  ( (array!25922 (arr!12410 (Array (_ BitVec 32) (_ BitVec 64))) (size!12762 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25921)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15827 0))(
  ( (V!15828 (val!5565 Int)) )
))
(declare-datatypes ((ValueCell!5177 0))(
  ( (ValueCellFull!5177 (v!7812 V!15827)) (EmptyCell!5177) )
))
(declare-datatypes ((array!25923 0))(
  ( (array!25924 (arr!12411 (Array (_ BitVec 32) ValueCell!5177)) (size!12763 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25923)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!424752 (= res!248531 (and (= (size!12763 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12762 _keys!709) (size!12763 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424753 () Bool)

(declare-fun e!252262 () Bool)

(declare-fun e!252264 () Bool)

(declare-fun mapRes!18183 () Bool)

(assert (=> b!424753 (= e!252262 (and e!252264 mapRes!18183))))

(declare-fun condMapEmpty!18183 () Bool)

(declare-fun mapDefault!18183 () ValueCell!5177)

