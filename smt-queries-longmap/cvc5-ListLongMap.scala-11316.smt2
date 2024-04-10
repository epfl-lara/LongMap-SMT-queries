; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131800 () Bool)

(assert start!131800)

(declare-fun b!1543155 () Bool)

(declare-fun e!858729 () Bool)

(declare-fun tp_is_empty!37789 () Bool)

(assert (=> b!1543155 (= e!858729 tp_is_empty!37789)))

(declare-fun b!1543156 () Bool)

(declare-fun e!858726 () Bool)

(assert (=> b!1543156 (= e!858726 false)))

(declare-fun lt!665936 () Bool)

(declare-datatypes ((array!102804 0))(
  ( (array!102805 (arr!49604 (Array (_ BitVec 32) (_ BitVec 64))) (size!50154 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102804)

(declare-datatypes ((List!35908 0))(
  ( (Nil!35905) (Cons!35904 (h!37349 (_ BitVec 64)) (t!50602 List!35908)) )
))
(declare-fun arrayNoDuplicates!0 (array!102804 (_ BitVec 32) List!35908) Bool)

(assert (=> b!1543156 (= lt!665936 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35905))))

(declare-fun b!1543157 () Bool)

(declare-fun e!858725 () Bool)

(assert (=> b!1543157 (= e!858725 tp_is_empty!37789)))

(declare-fun b!1543158 () Bool)

(declare-fun e!858727 () Bool)

(declare-fun mapRes!58387 () Bool)

(assert (=> b!1543158 (= e!858727 (and e!858725 mapRes!58387))))

(declare-fun condMapEmpty!58387 () Bool)

(declare-datatypes ((V!58829 0))(
  ( (V!58830 (val!18972 Int)) )
))
(declare-datatypes ((ValueCell!17984 0))(
  ( (ValueCellFull!17984 (v!21773 V!58829)) (EmptyCell!17984) )
))
(declare-datatypes ((array!102806 0))(
  ( (array!102807 (arr!49605 (Array (_ BitVec 32) ValueCell!17984)) (size!50155 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102806)

(declare-fun mapDefault!58387 () ValueCell!17984)

