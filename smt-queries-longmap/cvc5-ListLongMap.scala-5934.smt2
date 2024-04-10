; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77382 () Bool)

(assert start!77382)

(declare-fun b!902226 () Bool)

(declare-fun e!505248 () Bool)

(declare-fun e!505245 () Bool)

(declare-fun mapRes!29347 () Bool)

(assert (=> b!902226 (= e!505248 (and e!505245 mapRes!29347))))

(declare-fun condMapEmpty!29347 () Bool)

(declare-datatypes ((V!29543 0))(
  ( (V!29544 (val!9267 Int)) )
))
(declare-datatypes ((ValueCell!8735 0))(
  ( (ValueCellFull!8735 (v!11771 V!29543)) (EmptyCell!8735) )
))
(declare-datatypes ((array!52930 0))(
  ( (array!52931 (arr!25429 (Array (_ BitVec 32) ValueCell!8735)) (size!25888 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52930)

(declare-fun mapDefault!29347 () ValueCell!8735)

