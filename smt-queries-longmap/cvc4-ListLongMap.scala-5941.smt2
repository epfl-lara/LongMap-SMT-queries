; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77466 () Bool)

(assert start!77466)

(declare-fun b!902776 () Bool)

(declare-fun e!505679 () Bool)

(assert (=> b!902776 (= e!505679 false)))

(declare-fun lt!407913 () Bool)

(declare-datatypes ((array!53018 0))(
  ( (array!53019 (arr!25469 (Array (_ BitVec 32) (_ BitVec 64))) (size!25928 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53018)

(declare-datatypes ((List!17892 0))(
  ( (Nil!17889) (Cons!17888 (h!19034 (_ BitVec 64)) (t!25275 List!17892)) )
))
(declare-fun arrayNoDuplicates!0 (array!53018 (_ BitVec 32) List!17892) Bool)

(assert (=> b!902776 (= lt!407913 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17889))))

(declare-fun b!902777 () Bool)

(declare-fun res!609183 () Bool)

(assert (=> b!902777 (=> (not res!609183) (not e!505679))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53018 (_ BitVec 32)) Bool)

(assert (=> b!902777 (= res!609183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902778 () Bool)

(declare-fun res!609184 () Bool)

(assert (=> b!902778 (=> (not res!609184) (not e!505679))))

(declare-datatypes ((V!29603 0))(
  ( (V!29604 (val!9290 Int)) )
))
(declare-datatypes ((ValueCell!8758 0))(
  ( (ValueCellFull!8758 (v!11795 V!29603)) (EmptyCell!8758) )
))
(declare-datatypes ((array!53020 0))(
  ( (array!53021 (arr!25470 (Array (_ BitVec 32) ValueCell!8758)) (size!25929 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53020)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!902778 (= res!609184 (and (= (size!25929 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25928 _keys!1386) (size!25929 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609185 () Bool)

(assert (=> start!77466 (=> (not res!609185) (not e!505679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77466 (= res!609185 (validMask!0 mask!1756))))

(assert (=> start!77466 e!505679))

(assert (=> start!77466 true))

(declare-fun e!505683 () Bool)

(declare-fun array_inv!19964 (array!53020) Bool)

(assert (=> start!77466 (and (array_inv!19964 _values!1152) e!505683)))

(declare-fun array_inv!19965 (array!53018) Bool)

(assert (=> start!77466 (array_inv!19965 _keys!1386)))

(declare-fun b!902779 () Bool)

(declare-fun e!505680 () Bool)

(declare-fun mapRes!29428 () Bool)

(assert (=> b!902779 (= e!505683 (and e!505680 mapRes!29428))))

(declare-fun condMapEmpty!29428 () Bool)

(declare-fun mapDefault!29428 () ValueCell!8758)

