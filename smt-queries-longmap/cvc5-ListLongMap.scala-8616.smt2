; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104962 () Bool)

(assert start!104962)

(declare-fun b_free!26731 () Bool)

(declare-fun b_next!26731 () Bool)

(assert (=> start!104962 (= b_free!26731 (not b_next!26731))))

(declare-fun tp!93689 () Bool)

(declare-fun b_and!44517 () Bool)

(assert (=> start!104962 (= tp!93689 b_and!44517)))

(declare-fun b!1251018 () Bool)

(declare-fun e!710305 () Bool)

(declare-fun e!710304 () Bool)

(declare-fun mapRes!49216 () Bool)

(assert (=> b!1251018 (= e!710305 (and e!710304 mapRes!49216))))

(declare-fun condMapEmpty!49216 () Bool)

(declare-datatypes ((V!47543 0))(
  ( (V!47544 (val!15879 Int)) )
))
(declare-datatypes ((ValueCell!15053 0))(
  ( (ValueCellFull!15053 (v!18576 V!47543)) (EmptyCell!15053) )
))
(declare-datatypes ((array!80932 0))(
  ( (array!80933 (arr!39031 (Array (_ BitVec 32) ValueCell!15053)) (size!39567 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80932)

(declare-fun mapDefault!49216 () ValueCell!15053)

