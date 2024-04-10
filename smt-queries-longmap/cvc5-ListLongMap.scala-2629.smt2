; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39592 () Bool)

(assert start!39592)

(declare-fun b_free!9859 () Bool)

(declare-fun b_next!9859 () Bool)

(assert (=> start!39592 (= b_free!9859 (not b_next!9859))))

(declare-fun tp!35105 () Bool)

(declare-fun b_and!17515 () Bool)

(assert (=> start!39592 (= tp!35105 b_and!17515)))

(declare-fun b!424074 () Bool)

(declare-fun res!247985 () Bool)

(declare-fun e!251992 () Bool)

(assert (=> b!424074 (=> (not res!247985) (not e!251992))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424074 (= res!247985 (bvsle from!863 i!563))))

(declare-fun b!424075 () Bool)

(declare-fun e!251991 () Bool)

(declare-fun e!251993 () Bool)

(declare-fun mapRes!18138 () Bool)

(assert (=> b!424075 (= e!251991 (and e!251993 mapRes!18138))))

(declare-fun condMapEmpty!18138 () Bool)

(declare-datatypes ((V!15787 0))(
  ( (V!15788 (val!5550 Int)) )
))
(declare-datatypes ((ValueCell!5162 0))(
  ( (ValueCellFull!5162 (v!7797 V!15787)) (EmptyCell!5162) )
))
(declare-datatypes ((array!25863 0))(
  ( (array!25864 (arr!12381 (Array (_ BitVec 32) ValueCell!5162)) (size!12733 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25863)

(declare-fun mapDefault!18138 () ValueCell!5162)

