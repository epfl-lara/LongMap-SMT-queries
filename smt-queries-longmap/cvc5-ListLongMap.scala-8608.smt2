; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104892 () Bool)

(assert start!104892)

(declare-fun b_free!26683 () Bool)

(declare-fun b_next!26683 () Bool)

(assert (=> start!104892 (= b_free!26683 (not b_next!26683))))

(declare-fun tp!93542 () Bool)

(declare-fun b_and!44459 () Bool)

(assert (=> start!104892 (= tp!93542 b_and!44459)))

(declare-fun b!1250213 () Bool)

(declare-fun res!833920 () Bool)

(declare-fun e!709705 () Bool)

(assert (=> b!1250213 (=> (not res!833920) (not e!709705))))

(declare-datatypes ((array!80840 0))(
  ( (array!80841 (arr!38986 (Array (_ BitVec 32) (_ BitVec 64))) (size!39522 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80840)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80840 (_ BitVec 32)) Bool)

(assert (=> b!1250213 (= res!833920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250214 () Bool)

(declare-fun e!709702 () Bool)

(declare-fun e!709701 () Bool)

(declare-fun mapRes!49141 () Bool)

(assert (=> b!1250214 (= e!709702 (and e!709701 mapRes!49141))))

(declare-fun condMapEmpty!49141 () Bool)

(declare-datatypes ((V!47479 0))(
  ( (V!47480 (val!15855 Int)) )
))
(declare-datatypes ((ValueCell!15029 0))(
  ( (ValueCellFull!15029 (v!18551 V!47479)) (EmptyCell!15029) )
))
(declare-datatypes ((array!80842 0))(
  ( (array!80843 (arr!38987 (Array (_ BitVec 32) ValueCell!15029)) (size!39523 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80842)

(declare-fun mapDefault!49141 () ValueCell!15029)

