; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39524 () Bool)

(assert start!39524)

(declare-fun b_free!9791 () Bool)

(declare-fun b_next!9791 () Bool)

(assert (=> start!39524 (= b_free!9791 (not b_next!9791))))

(declare-fun tp!34901 () Bool)

(declare-fun b_and!17447 () Bool)

(assert (=> start!39524 (= tp!34901 b_and!17447)))

(declare-fun b!422544 () Bool)

(declare-fun res!246768 () Bool)

(declare-fun e!251377 () Bool)

(assert (=> b!422544 (=> (not res!246768) (not e!251377))))

(declare-datatypes ((array!25733 0))(
  ( (array!25734 (arr!12316 (Array (_ BitVec 32) (_ BitVec 64))) (size!12668 (_ BitVec 32))) )
))
(declare-fun lt!193989 () array!25733)

(declare-datatypes ((List!7251 0))(
  ( (Nil!7248) (Cons!7247 (h!8103 (_ BitVec 64)) (t!12695 List!7251)) )
))
(declare-fun arrayNoDuplicates!0 (array!25733 (_ BitVec 32) List!7251) Bool)

(assert (=> b!422544 (= res!246768 (arrayNoDuplicates!0 lt!193989 #b00000000000000000000000000000000 Nil!7248))))

(declare-fun b!422545 () Bool)

(declare-fun res!246766 () Bool)

(assert (=> b!422545 (=> (not res!246766) (not e!251377))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422545 (= res!246766 (bvsle from!863 i!563))))

(declare-fun b!422546 () Bool)

(declare-fun e!251380 () Bool)

(declare-fun e!251378 () Bool)

(declare-fun mapRes!18036 () Bool)

(assert (=> b!422546 (= e!251380 (and e!251378 mapRes!18036))))

(declare-fun condMapEmpty!18036 () Bool)

(declare-datatypes ((V!15695 0))(
  ( (V!15696 (val!5516 Int)) )
))
(declare-datatypes ((ValueCell!5128 0))(
  ( (ValueCellFull!5128 (v!7763 V!15695)) (EmptyCell!5128) )
))
(declare-datatypes ((array!25735 0))(
  ( (array!25736 (arr!12317 (Array (_ BitVec 32) ValueCell!5128)) (size!12669 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25735)

(declare-fun mapDefault!18036 () ValueCell!5128)

