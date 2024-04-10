; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104798 () Bool)

(assert start!104798)

(declare-fun b_free!26603 () Bool)

(declare-fun b_next!26603 () Bool)

(assert (=> start!104798 (= b_free!26603 (not b_next!26603))))

(declare-fun tp!93299 () Bool)

(declare-fun b_and!44371 () Bool)

(assert (=> start!104798 (= tp!93299 b_and!44371)))

(declare-fun b!1249221 () Bool)

(declare-fun e!708981 () Bool)

(declare-fun e!708982 () Bool)

(declare-fun mapRes!49018 () Bool)

(assert (=> b!1249221 (= e!708981 (and e!708982 mapRes!49018))))

(declare-fun condMapEmpty!49018 () Bool)

(declare-datatypes ((V!47371 0))(
  ( (V!47372 (val!15815 Int)) )
))
(declare-datatypes ((ValueCell!14989 0))(
  ( (ValueCellFull!14989 (v!18511 V!47371)) (EmptyCell!14989) )
))
(declare-datatypes ((array!80694 0))(
  ( (array!80695 (arr!38914 (Array (_ BitVec 32) ValueCell!14989)) (size!39450 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80694)

(declare-fun mapDefault!49018 () ValueCell!14989)

