; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78166 () Bool)

(assert start!78166)

(declare-fun b_free!16675 () Bool)

(declare-fun b_next!16675 () Bool)

(assert (=> start!78166 (= b_free!16675 (not b_next!16675))))

(declare-fun tp!58303 () Bool)

(declare-fun b_and!27225 () Bool)

(assert (=> start!78166 (= tp!58303 b_and!27225)))

(declare-fun b!912144 () Bool)

(declare-fun res!615355 () Bool)

(declare-fun e!511651 () Bool)

(assert (=> b!912144 (=> (not res!615355) (not e!511651))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((V!30423 0))(
  ( (V!30424 (val!9597 Int)) )
))
(declare-fun zeroValue!1094 () V!30423)

(declare-datatypes ((array!54183 0))(
  ( (array!54184 (arr!26046 (Array (_ BitVec 32) (_ BitVec 64))) (size!26507 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54183)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((ValueCell!9065 0))(
  ( (ValueCellFull!9065 (v!12107 V!30423)) (EmptyCell!9065) )
))
(declare-datatypes ((array!54185 0))(
  ( (array!54186 (arr!26047 (Array (_ BitVec 32) ValueCell!9065)) (size!26508 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54185)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30423)

(declare-datatypes ((tuple2!12550 0))(
  ( (tuple2!12551 (_1!6286 (_ BitVec 64)) (_2!6286 V!30423)) )
))
(declare-datatypes ((List!18329 0))(
  ( (Nil!18326) (Cons!18325 (h!19471 tuple2!12550) (t!25909 List!18329)) )
))
(declare-datatypes ((ListLongMap!11237 0))(
  ( (ListLongMap!11238 (toList!5634 List!18329)) )
))
(declare-fun contains!4637 (ListLongMap!11237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2836 (array!54183 array!54185 (_ BitVec 32) (_ BitVec 32) V!30423 V!30423 (_ BitVec 32) Int) ListLongMap!11237)

(assert (=> b!912144 (= res!615355 (contains!4637 (getCurrentListMap!2836 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912145 () Bool)

(declare-fun res!615351 () Bool)

(assert (=> b!912145 (=> (not res!615351) (not e!511651))))

(assert (=> b!912145 (= res!615351 (and (= (size!26508 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26507 _keys!1386) (size!26508 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912146 () Bool)

(declare-fun e!511655 () Bool)

(declare-fun tp_is_empty!19093 () Bool)

(assert (=> b!912146 (= e!511655 tp_is_empty!19093)))

(declare-fun mapIsEmpty!30367 () Bool)

(declare-fun mapRes!30367 () Bool)

(assert (=> mapIsEmpty!30367 mapRes!30367))

(declare-fun b!912147 () Bool)

(declare-fun e!511652 () Bool)

(assert (=> b!912147 (= e!511652 tp_is_empty!19093)))

(declare-fun b!912148 () Bool)

(declare-fun res!615350 () Bool)

(assert (=> b!912148 (=> (not res!615350) (not e!511651))))

(declare-datatypes ((List!18330 0))(
  ( (Nil!18327) (Cons!18326 (h!19472 (_ BitVec 64)) (t!25910 List!18330)) )
))
(declare-fun arrayNoDuplicates!0 (array!54183 (_ BitVec 32) List!18330) Bool)

(assert (=> b!912148 (= res!615350 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18327))))

(declare-fun b!912149 () Bool)

(declare-fun res!615353 () Bool)

(assert (=> b!912149 (=> (not res!615353) (not e!511651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54183 (_ BitVec 32)) Bool)

(assert (=> b!912149 (= res!615353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912150 () Bool)

(declare-fun res!615352 () Bool)

(assert (=> b!912150 (=> (not res!615352) (not e!511651))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912150 (= res!615352 (inRange!0 i!717 mask!1756))))

(declare-fun b!912151 () Bool)

(declare-fun res!615349 () Bool)

(assert (=> b!912151 (=> (not res!615349) (not e!511651))))

(assert (=> b!912151 (= res!615349 (and (= (select (arr!26046 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!30367 () Bool)

(declare-fun tp!58302 () Bool)

(assert (=> mapNonEmpty!30367 (= mapRes!30367 (and tp!58302 e!511655))))

(declare-fun mapRest!30367 () (Array (_ BitVec 32) ValueCell!9065))

(declare-fun mapValue!30367 () ValueCell!9065)

(declare-fun mapKey!30367 () (_ BitVec 32))

(assert (=> mapNonEmpty!30367 (= (arr!26047 _values!1152) (store mapRest!30367 mapKey!30367 mapValue!30367))))

(declare-fun b!912152 () Bool)

(assert (=> b!912152 (= e!511651 (not true))))

(declare-fun arrayContainsKey!0 (array!54183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912152 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30800 0))(
  ( (Unit!30801) )
))
(declare-fun lt!410427 () Unit!30800)

(declare-fun lemmaKeyInListMapIsInArray!257 (array!54183 array!54185 (_ BitVec 32) (_ BitVec 32) V!30423 V!30423 (_ BitVec 64) Int) Unit!30800)

(assert (=> b!912152 (= lt!410427 (lemmaKeyInListMapIsInArray!257 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!615354 () Bool)

(assert (=> start!78166 (=> (not res!615354) (not e!511651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78166 (= res!615354 (validMask!0 mask!1756))))

(assert (=> start!78166 e!511651))

(declare-fun e!511654 () Bool)

(declare-fun array_inv!20420 (array!54185) Bool)

(assert (=> start!78166 (and (array_inv!20420 _values!1152) e!511654)))

(assert (=> start!78166 tp!58303))

(assert (=> start!78166 true))

(assert (=> start!78166 tp_is_empty!19093))

(declare-fun array_inv!20421 (array!54183) Bool)

(assert (=> start!78166 (array_inv!20421 _keys!1386)))

(declare-fun b!912153 () Bool)

(assert (=> b!912153 (= e!511654 (and e!511652 mapRes!30367))))

(declare-fun condMapEmpty!30367 () Bool)

(declare-fun mapDefault!30367 () ValueCell!9065)

(assert (=> b!912153 (= condMapEmpty!30367 (= (arr!26047 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9065)) mapDefault!30367)))))

(assert (= (and start!78166 res!615354) b!912145))

(assert (= (and b!912145 res!615351) b!912149))

(assert (= (and b!912149 res!615353) b!912148))

(assert (= (and b!912148 res!615350) b!912144))

(assert (= (and b!912144 res!615355) b!912150))

(assert (= (and b!912150 res!615352) b!912151))

(assert (= (and b!912151 res!615349) b!912152))

(assert (= (and b!912153 condMapEmpty!30367) mapIsEmpty!30367))

(assert (= (and b!912153 (not condMapEmpty!30367)) mapNonEmpty!30367))

(get-info :version)

(assert (= (and mapNonEmpty!30367 ((_ is ValueCellFull!9065) mapValue!30367)) b!912146))

(assert (= (and b!912153 ((_ is ValueCellFull!9065) mapDefault!30367)) b!912147))

(assert (= start!78166 b!912153))

(declare-fun m!846141 () Bool)

(assert (=> b!912150 m!846141))

(declare-fun m!846143 () Bool)

(assert (=> b!912152 m!846143))

(declare-fun m!846145 () Bool)

(assert (=> b!912152 m!846145))

(declare-fun m!846147 () Bool)

(assert (=> start!78166 m!846147))

(declare-fun m!846149 () Bool)

(assert (=> start!78166 m!846149))

(declare-fun m!846151 () Bool)

(assert (=> start!78166 m!846151))

(declare-fun m!846153 () Bool)

(assert (=> b!912149 m!846153))

(declare-fun m!846155 () Bool)

(assert (=> b!912144 m!846155))

(assert (=> b!912144 m!846155))

(declare-fun m!846157 () Bool)

(assert (=> b!912144 m!846157))

(declare-fun m!846159 () Bool)

(assert (=> b!912148 m!846159))

(declare-fun m!846161 () Bool)

(assert (=> mapNonEmpty!30367 m!846161))

(declare-fun m!846163 () Bool)

(assert (=> b!912151 m!846163))

(check-sat (not b!912144) (not b_next!16675) b_and!27225 (not b!912149) tp_is_empty!19093 (not b!912148) (not mapNonEmpty!30367) (not start!78166) (not b!912152) (not b!912150))
(check-sat b_and!27225 (not b_next!16675))
