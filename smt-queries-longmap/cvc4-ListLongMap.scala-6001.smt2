; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77862 () Bool)

(assert start!77862)

(declare-fun b_free!16421 () Bool)

(declare-fun b_next!16421 () Bool)

(assert (=> start!77862 (= b_free!16421 (not b_next!16421))))

(declare-fun tp!57527 () Bool)

(declare-fun b_and!26989 () Bool)

(assert (=> start!77862 (= tp!57527 b_and!26989)))

(declare-fun b!909181 () Bool)

(declare-fun res!613665 () Bool)

(declare-fun e!509601 () Bool)

(assert (=> b!909181 (=> (not res!613665) (not e!509601))))

(declare-datatypes ((array!53706 0))(
  ( (array!53707 (arr!25811 (Array (_ BitVec 32) (_ BitVec 64))) (size!26270 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53706)

(declare-datatypes ((List!18137 0))(
  ( (Nil!18134) (Cons!18133 (h!19279 (_ BitVec 64)) (t!25718 List!18137)) )
))
(declare-fun arrayNoDuplicates!0 (array!53706 (_ BitVec 32) List!18137) Bool)

(assert (=> b!909181 (= res!613665 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18134))))

(declare-fun b!909182 () Bool)

(declare-fun e!509600 () Bool)

(declare-fun tp_is_empty!18839 () Bool)

(assert (=> b!909182 (= e!509600 tp_is_empty!18839)))

(declare-fun b!909183 () Bool)

(declare-fun res!613662 () Bool)

(assert (=> b!909183 (=> (not res!613662) (not e!509601))))

(declare-datatypes ((V!30083 0))(
  ( (V!30084 (val!9470 Int)) )
))
(declare-datatypes ((ValueCell!8938 0))(
  ( (ValueCellFull!8938 (v!11977 V!30083)) (EmptyCell!8938) )
))
(declare-datatypes ((array!53708 0))(
  ( (array!53709 (arr!25812 (Array (_ BitVec 32) ValueCell!8938)) (size!26271 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53708)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!909183 (= res!613662 (and (= (size!26271 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26270 _keys!1386) (size!26271 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909184 () Bool)

(declare-fun e!509598 () Bool)

(declare-fun e!509599 () Bool)

(declare-fun mapRes!29974 () Bool)

(assert (=> b!909184 (= e!509598 (and e!509599 mapRes!29974))))

(declare-fun condMapEmpty!29974 () Bool)

(declare-fun mapDefault!29974 () ValueCell!8938)

