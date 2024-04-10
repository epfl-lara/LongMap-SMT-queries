; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77876 () Bool)

(assert start!77876)

(declare-fun b_free!16435 () Bool)

(declare-fun b_next!16435 () Bool)

(assert (=> start!77876 (= b_free!16435 (not b_next!16435))))

(declare-fun tp!57570 () Bool)

(declare-fun b_and!27003 () Bool)

(assert (=> start!77876 (= tp!57570 b_and!27003)))

(declare-fun b!909328 () Bool)

(declare-fun res!613749 () Bool)

(declare-fun e!509703 () Bool)

(assert (=> b!909328 (=> (not res!613749) (not e!509703))))

(declare-datatypes ((V!30103 0))(
  ( (V!30104 (val!9477 Int)) )
))
(declare-datatypes ((ValueCell!8945 0))(
  ( (ValueCellFull!8945 (v!11984 V!30103)) (EmptyCell!8945) )
))
(declare-datatypes ((array!53732 0))(
  ( (array!53733 (arr!25824 (Array (_ BitVec 32) ValueCell!8945)) (size!26283 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53732)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53734 0))(
  ( (array!53735 (arr!25825 (Array (_ BitVec 32) (_ BitVec 64))) (size!26284 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53734)

(assert (=> b!909328 (= res!613749 (and (= (size!26283 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26284 _keys!1386) (size!26283 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909329 () Bool)

(declare-fun res!613747 () Bool)

(assert (=> b!909329 (=> (not res!613747) (not e!509703))))

(declare-datatypes ((List!18145 0))(
  ( (Nil!18142) (Cons!18141 (h!19287 (_ BitVec 64)) (t!25726 List!18145)) )
))
(declare-fun arrayNoDuplicates!0 (array!53734 (_ BitVec 32) List!18145) Bool)

(assert (=> b!909329 (= res!613747 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18142))))

(declare-fun b!909330 () Bool)

(declare-fun e!509706 () Bool)

(declare-fun e!509705 () Bool)

(declare-fun mapRes!29995 () Bool)

(assert (=> b!909330 (= e!509706 (and e!509705 mapRes!29995))))

(declare-fun condMapEmpty!29995 () Bool)

(declare-fun mapDefault!29995 () ValueCell!8945)

