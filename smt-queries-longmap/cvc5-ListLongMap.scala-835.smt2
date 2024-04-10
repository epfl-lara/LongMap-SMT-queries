; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20106 () Bool)

(assert start!20106)

(declare-fun b_free!4765 () Bool)

(declare-fun b_next!4765 () Bool)

(assert (=> start!20106 (= b_free!4765 (not b_next!4765))))

(declare-fun tp!17326 () Bool)

(declare-fun b_and!11511 () Bool)

(assert (=> start!20106 (= tp!17326 b_and!11511)))

(declare-fun b!197025 () Bool)

(declare-fun res!93100 () Bool)

(declare-fun e!129718 () Bool)

(assert (=> b!197025 (=> (not res!93100) (not e!129718))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8497 0))(
  ( (array!8498 (arr!3999 (Array (_ BitVec 32) (_ BitVec 64))) (size!4324 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8497)

(assert (=> b!197025 (= res!93100 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4324 _keys!825))))))

(declare-fun b!197026 () Bool)

(declare-fun e!129717 () Bool)

(declare-fun e!129715 () Bool)

(declare-fun mapRes!8000 () Bool)

(assert (=> b!197026 (= e!129717 (and e!129715 mapRes!8000))))

(declare-fun condMapEmpty!8000 () Bool)

(declare-datatypes ((V!5809 0))(
  ( (V!5810 (val!2355 Int)) )
))
(declare-datatypes ((ValueCell!1967 0))(
  ( (ValueCellFull!1967 (v!4325 V!5809)) (EmptyCell!1967) )
))
(declare-datatypes ((array!8499 0))(
  ( (array!8500 (arr!4000 (Array (_ BitVec 32) ValueCell!1967)) (size!4325 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8499)

(declare-fun mapDefault!8000 () ValueCell!1967)

