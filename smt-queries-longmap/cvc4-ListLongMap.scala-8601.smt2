; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104840 () Bool)

(assert start!104840)

(declare-fun b_free!26645 () Bool)

(declare-fun b_next!26645 () Bool)

(assert (=> start!104840 (= b_free!26645 (not b_next!26645))))

(declare-fun tp!93424 () Bool)

(declare-fun b_and!44413 () Bool)

(assert (=> start!104840 (= tp!93424 b_and!44413)))

(declare-fun b!1249662 () Bool)

(declare-fun e!709294 () Bool)

(declare-fun e!709293 () Bool)

(declare-fun mapRes!49081 () Bool)

(assert (=> b!1249662 (= e!709294 (and e!709293 mapRes!49081))))

(declare-fun condMapEmpty!49081 () Bool)

(declare-datatypes ((V!47427 0))(
  ( (V!47428 (val!15836 Int)) )
))
(declare-datatypes ((ValueCell!15010 0))(
  ( (ValueCellFull!15010 (v!18532 V!47427)) (EmptyCell!15010) )
))
(declare-datatypes ((array!80772 0))(
  ( (array!80773 (arr!38953 (Array (_ BitVec 32) ValueCell!15010)) (size!39489 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80772)

(declare-fun mapDefault!49081 () ValueCell!15010)

