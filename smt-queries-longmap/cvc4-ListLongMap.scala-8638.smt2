; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105134 () Bool)

(assert start!105134)

(declare-fun b_free!26867 () Bool)

(declare-fun b_next!26867 () Bool)

(assert (=> start!105134 (= b_free!26867 (not b_next!26867))))

(declare-fun tp!94102 () Bool)

(declare-fun b_and!44671 () Bool)

(assert (=> start!105134 (= tp!94102 b_and!44671)))

(declare-fun b!1252872 () Bool)

(declare-fun e!711666 () Bool)

(declare-fun e!711664 () Bool)

(declare-fun mapRes!49426 () Bool)

(assert (=> b!1252872 (= e!711666 (and e!711664 mapRes!49426))))

(declare-fun condMapEmpty!49426 () Bool)

(declare-datatypes ((V!47723 0))(
  ( (V!47724 (val!15947 Int)) )
))
(declare-datatypes ((ValueCell!15121 0))(
  ( (ValueCellFull!15121 (v!18645 V!47723)) (EmptyCell!15121) )
))
(declare-datatypes ((array!81200 0))(
  ( (array!81201 (arr!39163 (Array (_ BitVec 32) ValueCell!15121)) (size!39699 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81200)

(declare-fun mapDefault!49426 () ValueCell!15121)

