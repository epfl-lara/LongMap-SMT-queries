; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104960 () Bool)

(assert start!104960)

(declare-fun b_free!26729 () Bool)

(declare-fun b_next!26729 () Bool)

(assert (=> start!104960 (= b_free!26729 (not b_next!26729))))

(declare-fun tp!93683 () Bool)

(declare-fun b_and!44515 () Bool)

(assert (=> start!104960 (= tp!93683 b_and!44515)))

(declare-fun b!1250991 () Bool)

(declare-fun e!710285 () Bool)

(declare-fun e!710286 () Bool)

(declare-fun mapRes!49213 () Bool)

(assert (=> b!1250991 (= e!710285 (and e!710286 mapRes!49213))))

(declare-fun condMapEmpty!49213 () Bool)

(declare-datatypes ((V!47539 0))(
  ( (V!47540 (val!15878 Int)) )
))
(declare-datatypes ((ValueCell!15052 0))(
  ( (ValueCellFull!15052 (v!18575 V!47539)) (EmptyCell!15052) )
))
(declare-datatypes ((array!80930 0))(
  ( (array!80931 (arr!39030 (Array (_ BitVec 32) ValueCell!15052)) (size!39566 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80930)

(declare-fun mapDefault!49213 () ValueCell!15052)

