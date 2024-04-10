; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39644 () Bool)

(assert start!39644)

(declare-fun b_free!9911 () Bool)

(declare-fun b_next!9911 () Bool)

(assert (=> start!39644 (= b_free!9911 (not b_next!9911))))

(declare-fun tp!35262 () Bool)

(declare-fun b_and!17567 () Bool)

(assert (=> start!39644 (= tp!35262 b_and!17567)))

(declare-fun res!248967 () Bool)

(declare-fun e!252496 () Bool)

(assert (=> start!39644 (=> (not res!248967) (not e!252496))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25965 0))(
  ( (array!25966 (arr!12432 (Array (_ BitVec 32) (_ BitVec 64))) (size!12784 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25965)

(assert (=> start!39644 (= res!248967 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12784 _keys!709))))))

(assert (=> start!39644 e!252496))

(declare-fun tp_is_empty!11063 () Bool)

(assert (=> start!39644 tp_is_empty!11063))

(assert (=> start!39644 tp!35262))

(assert (=> start!39644 true))

(declare-datatypes ((V!15855 0))(
  ( (V!15856 (val!5576 Int)) )
))
(declare-datatypes ((ValueCell!5188 0))(
  ( (ValueCellFull!5188 (v!7823 V!15855)) (EmptyCell!5188) )
))
(declare-datatypes ((array!25967 0))(
  ( (array!25968 (arr!12433 (Array (_ BitVec 32) ValueCell!5188)) (size!12785 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25967)

(declare-fun e!252493 () Bool)

(declare-fun array_inv!9058 (array!25967) Bool)

(assert (=> start!39644 (and (array_inv!9058 _values!549) e!252493)))

(declare-fun array_inv!9059 (array!25965) Bool)

(assert (=> start!39644 (array_inv!9059 _keys!709)))

(declare-fun b!425279 () Bool)

(declare-fun res!248960 () Bool)

(assert (=> b!425279 (=> (not res!248960) (not e!252496))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425279 (= res!248960 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!425280 () Bool)

(declare-fun res!248956 () Bool)

(declare-fun e!252495 () Bool)

(assert (=> b!425280 (=> (not res!248956) (not e!252495))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425280 (= res!248956 (bvsle from!863 i!563))))

(declare-fun b!425281 () Bool)

(declare-fun e!252494 () Bool)

(declare-fun mapRes!18216 () Bool)

(assert (=> b!425281 (= e!252493 (and e!252494 mapRes!18216))))

(declare-fun condMapEmpty!18216 () Bool)

(declare-fun mapDefault!18216 () ValueCell!5188)

