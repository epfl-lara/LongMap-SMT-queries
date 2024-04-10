; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39470 () Bool)

(assert start!39470)

(declare-fun b_free!9737 () Bool)

(declare-fun b_next!9737 () Bool)

(assert (=> start!39470 (= b_free!9737 (not b_next!9737))))

(declare-fun tp!34739 () Bool)

(declare-fun b_and!17349 () Bool)

(assert (=> start!39470 (= tp!34739 b_and!17349)))

(declare-fun b!421029 () Bool)

(declare-fun res!245663 () Bool)

(declare-fun e!250706 () Bool)

(assert (=> b!421029 (=> (not res!245663) (not e!250706))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421029 (= res!245663 (bvsle from!863 i!563))))

(declare-fun b!421030 () Bool)

(declare-fun res!245660 () Bool)

(declare-fun e!250701 () Bool)

(assert (=> b!421030 (=> (not res!245660) (not e!250701))))

(declare-datatypes ((array!25627 0))(
  ( (array!25628 (arr!12263 (Array (_ BitVec 32) (_ BitVec 64))) (size!12615 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25627)

(assert (=> b!421030 (= res!245660 (or (= (select (arr!12263 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12263 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421031 () Bool)

(declare-fun e!250705 () Bool)

(declare-fun e!250703 () Bool)

(declare-fun mapRes!17955 () Bool)

(assert (=> b!421031 (= e!250705 (and e!250703 mapRes!17955))))

(declare-fun condMapEmpty!17955 () Bool)

(declare-datatypes ((V!15623 0))(
  ( (V!15624 (val!5489 Int)) )
))
(declare-datatypes ((ValueCell!5101 0))(
  ( (ValueCellFull!5101 (v!7736 V!15623)) (EmptyCell!5101) )
))
(declare-datatypes ((array!25629 0))(
  ( (array!25630 (arr!12264 (Array (_ BitVec 32) ValueCell!5101)) (size!12616 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25629)

(declare-fun mapDefault!17955 () ValueCell!5101)

