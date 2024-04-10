; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72658 () Bool)

(assert start!72658)

(declare-fun b!843374 () Bool)

(declare-fun e!470557 () Bool)

(declare-fun e!470553 () Bool)

(declare-fun mapRes!25163 () Bool)

(assert (=> b!843374 (= e!470557 (and e!470553 mapRes!25163))))

(declare-fun condMapEmpty!25163 () Bool)

(declare-datatypes ((V!25993 0))(
  ( (V!25994 (val!7902 Int)) )
))
(declare-datatypes ((ValueCell!7415 0))(
  ( (ValueCellFull!7415 (v!10327 V!25993)) (EmptyCell!7415) )
))
(declare-datatypes ((array!47672 0))(
  ( (array!47673 (arr!22867 (Array (_ BitVec 32) ValueCell!7415)) (size!23307 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47672)

(declare-fun mapDefault!25163 () ValueCell!7415)

