; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104922 () Bool)

(assert start!104922)

(declare-fun b_free!26713 () Bool)

(declare-fun b_next!26713 () Bool)

(assert (=> start!104922 (= b_free!26713 (not b_next!26713))))

(declare-fun tp!93631 () Bool)

(declare-fun b_and!44489 () Bool)

(assert (=> start!104922 (= tp!93631 b_and!44489)))

(declare-fun b!1250618 () Bool)

(declare-fun e!710021 () Bool)

(declare-fun e!710019 () Bool)

(declare-fun mapRes!49186 () Bool)

(assert (=> b!1250618 (= e!710021 (and e!710019 mapRes!49186))))

(declare-fun condMapEmpty!49186 () Bool)

(declare-datatypes ((V!47519 0))(
  ( (V!47520 (val!15870 Int)) )
))
(declare-datatypes ((ValueCell!15044 0))(
  ( (ValueCellFull!15044 (v!18566 V!47519)) (EmptyCell!15044) )
))
(declare-datatypes ((array!80898 0))(
  ( (array!80899 (arr!39015 (Array (_ BitVec 32) ValueCell!15044)) (size!39551 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80898)

(declare-fun mapDefault!49186 () ValueCell!15044)

