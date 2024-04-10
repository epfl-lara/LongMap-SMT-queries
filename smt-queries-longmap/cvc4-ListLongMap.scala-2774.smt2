; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40520 () Bool)

(assert start!40520)

(declare-fun b!446424 () Bool)

(declare-fun e!262276 () Bool)

(declare-fun e!262278 () Bool)

(declare-fun mapRes!19458 () Bool)

(assert (=> b!446424 (= e!262276 (and e!262278 mapRes!19458))))

(declare-fun condMapEmpty!19458 () Bool)

(declare-datatypes ((V!16951 0))(
  ( (V!16952 (val!5987 Int)) )
))
(declare-datatypes ((ValueCell!5599 0))(
  ( (ValueCellFull!5599 (v!8242 V!16951)) (EmptyCell!5599) )
))
(declare-datatypes ((array!27579 0))(
  ( (array!27580 (arr!13236 (Array (_ BitVec 32) ValueCell!5599)) (size!13588 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27579)

(declare-fun mapDefault!19458 () ValueCell!5599)

