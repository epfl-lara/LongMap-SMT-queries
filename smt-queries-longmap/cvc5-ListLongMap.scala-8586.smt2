; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104746 () Bool)

(assert start!104746)

(declare-fun b_free!26551 () Bool)

(declare-fun b_next!26551 () Bool)

(assert (=> start!104746 (= b_free!26551 (not b_next!26551))))

(declare-fun tp!93143 () Bool)

(declare-fun b_and!44319 () Bool)

(assert (=> start!104746 (= tp!93143 b_and!44319)))

(declare-fun b!1248675 () Bool)

(declare-fun e!708590 () Bool)

(declare-fun e!708591 () Bool)

(declare-fun mapRes!48940 () Bool)

(assert (=> b!1248675 (= e!708590 (and e!708591 mapRes!48940))))

(declare-fun condMapEmpty!48940 () Bool)

(declare-datatypes ((V!47303 0))(
  ( (V!47304 (val!15789 Int)) )
))
(declare-datatypes ((ValueCell!14963 0))(
  ( (ValueCellFull!14963 (v!18485 V!47303)) (EmptyCell!14963) )
))
(declare-datatypes ((array!80596 0))(
  ( (array!80597 (arr!38865 (Array (_ BitVec 32) ValueCell!14963)) (size!39401 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80596)

(declare-fun mapDefault!48940 () ValueCell!14963)

