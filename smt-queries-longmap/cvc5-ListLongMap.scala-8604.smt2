; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104868 () Bool)

(assert start!104868)

(declare-fun b_free!26659 () Bool)

(declare-fun b_next!26659 () Bool)

(assert (=> start!104868 (= b_free!26659 (not b_next!26659))))

(declare-fun tp!93470 () Bool)

(declare-fun b_and!44435 () Bool)

(assert (=> start!104868 (= tp!93470 b_and!44435)))

(declare-fun b!1249896 () Bool)

(declare-fun e!709455 () Bool)

(declare-fun e!709458 () Bool)

(declare-fun mapRes!49105 () Bool)

(assert (=> b!1249896 (= e!709455 (and e!709458 mapRes!49105))))

(declare-fun condMapEmpty!49105 () Bool)

(declare-datatypes ((V!47447 0))(
  ( (V!47448 (val!15843 Int)) )
))
(declare-datatypes ((ValueCell!15017 0))(
  ( (ValueCellFull!15017 (v!18539 V!47447)) (EmptyCell!15017) )
))
(declare-datatypes ((array!80796 0))(
  ( (array!80797 (arr!38964 (Array (_ BitVec 32) ValueCell!15017)) (size!39500 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80796)

(declare-fun mapDefault!49105 () ValueCell!15017)

