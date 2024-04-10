; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39232 () Bool)

(assert start!39232)

(declare-fun b_free!9499 () Bool)

(declare-fun b_next!9499 () Bool)

(assert (=> start!39232 (= b_free!9499 (not b_next!9499))))

(declare-fun tp!34026 () Bool)

(declare-fun b_and!16885 () Bool)

(assert (=> start!39232 (= tp!34026 b_and!16885)))

(declare-fun b!414027 () Bool)

(declare-fun res!240674 () Bool)

(declare-fun e!247496 () Bool)

(assert (=> b!414027 (=> (not res!240674) (not e!247496))))

(declare-datatypes ((array!25159 0))(
  ( (array!25160 (arr!12029 (Array (_ BitVec 32) (_ BitVec 64))) (size!12381 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25159)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414027 (= res!240674 (or (= (select (arr!12029 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12029 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414028 () Bool)

(declare-fun res!240679 () Bool)

(assert (=> b!414028 (=> (not res!240679) (not e!247496))))

(assert (=> b!414028 (= res!240679 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12381 _keys!709))))))

(declare-fun b!414029 () Bool)

(declare-fun e!247500 () Bool)

(declare-fun e!247494 () Bool)

(declare-fun mapRes!17598 () Bool)

(assert (=> b!414029 (= e!247500 (and e!247494 mapRes!17598))))

(declare-fun condMapEmpty!17598 () Bool)

(declare-datatypes ((V!15307 0))(
  ( (V!15308 (val!5370 Int)) )
))
(declare-datatypes ((ValueCell!4982 0))(
  ( (ValueCellFull!4982 (v!7617 V!15307)) (EmptyCell!4982) )
))
(declare-datatypes ((array!25161 0))(
  ( (array!25162 (arr!12030 (Array (_ BitVec 32) ValueCell!4982)) (size!12382 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25161)

(declare-fun mapDefault!17598 () ValueCell!4982)

