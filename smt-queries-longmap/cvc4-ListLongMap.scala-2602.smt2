; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39434 () Bool)

(assert start!39434)

(declare-fun b_free!9701 () Bool)

(declare-fun b_next!9701 () Bool)

(assert (=> start!39434 (= b_free!9701 (not b_next!9701))))

(declare-fun tp!34632 () Bool)

(declare-fun b_and!17277 () Bool)

(assert (=> start!39434 (= tp!34632 b_and!17277)))

(declare-fun res!244912 () Bool)

(declare-fun e!250217 () Bool)

(assert (=> start!39434 (=> (not res!244912) (not e!250217))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25555 0))(
  ( (array!25556 (arr!12227 (Array (_ BitVec 32) (_ BitVec 64))) (size!12579 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25555)

(assert (=> start!39434 (= res!244912 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12579 _keys!709))))))

(assert (=> start!39434 e!250217))

(declare-fun tp_is_empty!10853 () Bool)

(assert (=> start!39434 tp_is_empty!10853))

(assert (=> start!39434 tp!34632))

(assert (=> start!39434 true))

(declare-datatypes ((V!15575 0))(
  ( (V!15576 (val!5471 Int)) )
))
(declare-datatypes ((ValueCell!5083 0))(
  ( (ValueCellFull!5083 (v!7718 V!15575)) (EmptyCell!5083) )
))
(declare-datatypes ((array!25557 0))(
  ( (array!25558 (arr!12228 (Array (_ BitVec 32) ValueCell!5083)) (size!12580 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25557)

(declare-fun e!250215 () Bool)

(declare-fun array_inv!8916 (array!25557) Bool)

(assert (=> start!39434 (and (array_inv!8916 _values!549) e!250215)))

(declare-fun array_inv!8917 (array!25555) Bool)

(assert (=> start!39434 (array_inv!8917 _keys!709)))

(declare-fun b!419967 () Bool)

(declare-fun res!244916 () Bool)

(declare-fun e!250219 () Bool)

(assert (=> b!419967 (=> (not res!244916) (not e!250219))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!419967 (= res!244916 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17901 () Bool)

(declare-fun mapRes!17901 () Bool)

(assert (=> mapIsEmpty!17901 mapRes!17901))

(declare-fun b!419968 () Bool)

(declare-fun e!250221 () Bool)

(assert (=> b!419968 (= e!250215 (and e!250221 mapRes!17901))))

(declare-fun condMapEmpty!17901 () Bool)

(declare-fun mapDefault!17901 () ValueCell!5083)

