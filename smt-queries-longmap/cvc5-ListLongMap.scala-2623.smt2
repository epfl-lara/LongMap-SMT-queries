; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39556 () Bool)

(assert start!39556)

(declare-fun b_free!9823 () Bool)

(declare-fun b_next!9823 () Bool)

(assert (=> start!39556 (= b_free!9823 (not b_next!9823))))

(declare-fun tp!34997 () Bool)

(declare-fun b_and!17479 () Bool)

(assert (=> start!39556 (= tp!34997 b_and!17479)))

(declare-fun b!423264 () Bool)

(declare-fun res!247344 () Bool)

(declare-fun e!251666 () Bool)

(assert (=> b!423264 (=> (not res!247344) (not e!251666))))

(declare-datatypes ((array!25795 0))(
  ( (array!25796 (arr!12347 (Array (_ BitVec 32) (_ BitVec 64))) (size!12699 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25795)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423264 (= res!247344 (or (= (select (arr!12347 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12347 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423265 () Bool)

(declare-fun res!247346 () Bool)

(assert (=> b!423265 (=> (not res!247346) (not e!251666))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423265 (= res!247346 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18084 () Bool)

(declare-fun mapRes!18084 () Bool)

(assert (=> mapIsEmpty!18084 mapRes!18084))

(declare-fun b!423266 () Bool)

(declare-fun e!251668 () Bool)

(declare-fun e!251670 () Bool)

(assert (=> b!423266 (= e!251668 (and e!251670 mapRes!18084))))

(declare-fun condMapEmpty!18084 () Bool)

(declare-datatypes ((V!15739 0))(
  ( (V!15740 (val!5532 Int)) )
))
(declare-datatypes ((ValueCell!5144 0))(
  ( (ValueCellFull!5144 (v!7779 V!15739)) (EmptyCell!5144) )
))
(declare-datatypes ((array!25797 0))(
  ( (array!25798 (arr!12348 (Array (_ BitVec 32) ValueCell!5144)) (size!12700 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25797)

(declare-fun mapDefault!18084 () ValueCell!5144)

