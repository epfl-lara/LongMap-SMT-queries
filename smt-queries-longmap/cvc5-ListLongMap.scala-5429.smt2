; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72358 () Bool)

(assert start!72358)

(declare-fun b_free!13543 () Bool)

(declare-fun b_next!13543 () Bool)

(assert (=> start!72358 (= b_free!13543 (not b_next!13543))))

(declare-fun tp!47728 () Bool)

(declare-fun b_and!22629 () Bool)

(assert (=> start!72358 (= tp!47728 b_and!22629)))

(declare-fun b!838400 () Bool)

(declare-fun e!467999 () Bool)

(declare-fun e!468001 () Bool)

(declare-fun mapRes!24713 () Bool)

(assert (=> b!838400 (= e!467999 (and e!468001 mapRes!24713))))

(declare-fun condMapEmpty!24713 () Bool)

(declare-datatypes ((V!25593 0))(
  ( (V!25594 (val!7752 Int)) )
))
(declare-datatypes ((ValueCell!7265 0))(
  ( (ValueCellFull!7265 (v!10177 V!25593)) (EmptyCell!7265) )
))
(declare-datatypes ((array!47108 0))(
  ( (array!47109 (arr!22585 (Array (_ BitVec 32) ValueCell!7265)) (size!23025 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47108)

(declare-fun mapDefault!24713 () ValueCell!7265)

