; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72656 () Bool)

(assert start!72656)

(declare-fun b!843353 () Bool)

(declare-fun e!470539 () Bool)

(declare-fun e!470542 () Bool)

(declare-fun mapRes!25160 () Bool)

(assert (=> b!843353 (= e!470539 (and e!470542 mapRes!25160))))

(declare-fun condMapEmpty!25160 () Bool)

(declare-datatypes ((V!25989 0))(
  ( (V!25990 (val!7901 Int)) )
))
(declare-datatypes ((ValueCell!7414 0))(
  ( (ValueCellFull!7414 (v!10326 V!25989)) (EmptyCell!7414) )
))
(declare-datatypes ((array!47670 0))(
  ( (array!47671 (arr!22866 (Array (_ BitVec 32) ValueCell!7414)) (size!23306 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47670)

(declare-fun mapDefault!25160 () ValueCell!7414)

