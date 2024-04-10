; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39722 () Bool)

(assert start!39722)

(declare-fun b_free!9989 () Bool)

(declare-fun b_next!9989 () Bool)

(assert (=> start!39722 (= b_free!9989 (not b_next!9989))))

(declare-fun tp!35495 () Bool)

(declare-fun b_and!17645 () Bool)

(assert (=> start!39722 (= tp!35495 b_and!17645)))

(declare-fun b!427151 () Bool)

(declare-fun e!253311 () Bool)

(declare-fun e!253312 () Bool)

(declare-fun mapRes!18333 () Bool)

(assert (=> b!427151 (= e!253311 (and e!253312 mapRes!18333))))

(declare-fun condMapEmpty!18333 () Bool)

(declare-datatypes ((V!15959 0))(
  ( (V!15960 (val!5615 Int)) )
))
(declare-datatypes ((ValueCell!5227 0))(
  ( (ValueCellFull!5227 (v!7862 V!15959)) (EmptyCell!5227) )
))
(declare-datatypes ((array!26121 0))(
  ( (array!26122 (arr!12510 (Array (_ BitVec 32) ValueCell!5227)) (size!12862 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26121)

(declare-fun mapDefault!18333 () ValueCell!5227)

