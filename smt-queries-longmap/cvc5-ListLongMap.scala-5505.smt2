; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72814 () Bool)

(assert start!72814)

(declare-fun b!845012 () Bool)

(declare-fun e!471725 () Bool)

(declare-fun tp_is_empty!15865 () Bool)

(assert (=> b!845012 (= e!471725 tp_is_empty!15865)))

(declare-fun b!845013 () Bool)

(declare-fun e!471724 () Bool)

(declare-fun mapRes!25397 () Bool)

(assert (=> b!845013 (= e!471724 (and e!471725 mapRes!25397))))

(declare-fun condMapEmpty!25397 () Bool)

(declare-datatypes ((V!26201 0))(
  ( (V!26202 (val!7980 Int)) )
))
(declare-datatypes ((ValueCell!7493 0))(
  ( (ValueCellFull!7493 (v!10405 V!26201)) (EmptyCell!7493) )
))
(declare-datatypes ((array!47954 0))(
  ( (array!47955 (arr!23008 (Array (_ BitVec 32) ValueCell!7493)) (size!23448 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47954)

(declare-fun mapDefault!25397 () ValueCell!7493)

