; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39542 () Bool)

(assert start!39542)

(declare-fun b_free!9809 () Bool)

(declare-fun b_next!9809 () Bool)

(assert (=> start!39542 (= b_free!9809 (not b_next!9809))))

(declare-fun tp!34955 () Bool)

(declare-fun b_and!17465 () Bool)

(assert (=> start!39542 (= tp!34955 b_and!17465)))

(declare-fun b!422950 () Bool)

(declare-fun res!247089 () Bool)

(declare-fun e!251543 () Bool)

(assert (=> b!422950 (=> (not res!247089) (not e!251543))))

(declare-datatypes ((array!25769 0))(
  ( (array!25770 (arr!12334 (Array (_ BitVec 32) (_ BitVec 64))) (size!12686 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25769)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422950 (= res!247089 (or (= (select (arr!12334 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12334 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422951 () Bool)

(declare-fun e!251542 () Bool)

(declare-fun e!251540 () Bool)

(declare-fun mapRes!18063 () Bool)

(assert (=> b!422951 (= e!251542 (and e!251540 mapRes!18063))))

(declare-fun condMapEmpty!18063 () Bool)

(declare-datatypes ((V!15719 0))(
  ( (V!15720 (val!5525 Int)) )
))
(declare-datatypes ((ValueCell!5137 0))(
  ( (ValueCellFull!5137 (v!7772 V!15719)) (EmptyCell!5137) )
))
(declare-datatypes ((array!25771 0))(
  ( (array!25772 (arr!12335 (Array (_ BitVec 32) ValueCell!5137)) (size!12687 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25771)

(declare-fun mapDefault!18063 () ValueCell!5137)

