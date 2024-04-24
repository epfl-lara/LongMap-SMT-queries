; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78172 () Bool)

(assert start!78172)

(declare-fun b_free!16531 () Bool)

(declare-fun b_next!16531 () Bool)

(assert (=> start!78172 (= b_free!16531 (not b_next!16531))))

(declare-fun tp!57865 () Bool)

(declare-fun b_and!27113 () Bool)

(assert (=> start!78172 (= tp!57865 b_and!27113)))

(declare-fun b!911493 () Bool)

(declare-fun res!614793 () Bool)

(declare-fun e!511148 () Bool)

(assert (=> b!911493 (=> (not res!614793) (not e!511148))))

(declare-datatypes ((array!53969 0))(
  ( (array!53970 (arr!25936 (Array (_ BitVec 32) (_ BitVec 64))) (size!26396 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53969)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53969 (_ BitVec 32)) Bool)

(assert (=> b!911493 (= res!614793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapNonEmpty!30145 () Bool)

(declare-fun mapRes!30145 () Bool)

(declare-fun tp!57864 () Bool)

(declare-fun e!511151 () Bool)

(assert (=> mapNonEmpty!30145 (= mapRes!30145 (and tp!57864 e!511151))))

(declare-datatypes ((V!30231 0))(
  ( (V!30232 (val!9525 Int)) )
))
(declare-datatypes ((ValueCell!8993 0))(
  ( (ValueCellFull!8993 (v!12031 V!30231)) (EmptyCell!8993) )
))
(declare-datatypes ((array!53971 0))(
  ( (array!53972 (arr!25937 (Array (_ BitVec 32) ValueCell!8993)) (size!26397 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53971)

(declare-fun mapRest!30145 () (Array (_ BitVec 32) ValueCell!8993))

(declare-fun mapKey!30145 () (_ BitVec 32))

(declare-fun mapValue!30145 () ValueCell!8993)

(assert (=> mapNonEmpty!30145 (= (arr!25937 _values!1152) (store mapRest!30145 mapKey!30145 mapValue!30145))))

(declare-fun b!911494 () Bool)

(declare-fun e!511149 () Bool)

(declare-fun e!511152 () Bool)

(assert (=> b!911494 (= e!511149 (and e!511152 mapRes!30145))))

(declare-fun condMapEmpty!30145 () Bool)

(declare-fun mapDefault!30145 () ValueCell!8993)

(assert (=> b!911494 (= condMapEmpty!30145 (= (arr!25937 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8993)) mapDefault!30145)))))

(declare-fun b!911495 () Bool)

(declare-fun tp_is_empty!18949 () Bool)

(assert (=> b!911495 (= e!511152 tp_is_empty!18949)))

(declare-fun b!911496 () Bool)

(assert (=> b!911496 (= e!511151 tp_is_empty!18949)))

(declare-fun b!911497 () Bool)

(declare-fun res!614795 () Bool)

(assert (=> b!911497 (=> (not res!614795) (not e!511148))))

(declare-datatypes ((List!18190 0))(
  ( (Nil!18187) (Cons!18186 (h!19338 (_ BitVec 64)) (t!25767 List!18190)) )
))
(declare-fun arrayNoDuplicates!0 (array!53969 (_ BitVec 32) List!18190) Bool)

(assert (=> b!911497 (= res!614795 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18187))))

(declare-fun b!911498 () Bool)

(assert (=> b!911498 (= e!511148 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410640 () Bool)

(declare-fun zeroValue!1094 () V!30231)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30231)

(declare-datatypes ((tuple2!12370 0))(
  ( (tuple2!12371 (_1!6196 (_ BitVec 64)) (_2!6196 V!30231)) )
))
(declare-datatypes ((List!18191 0))(
  ( (Nil!18188) (Cons!18187 (h!19339 tuple2!12370) (t!25768 List!18191)) )
))
(declare-datatypes ((ListLongMap!11069 0))(
  ( (ListLongMap!11070 (toList!5550 List!18191)) )
))
(declare-fun contains!4603 (ListLongMap!11069 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2811 (array!53969 array!53971 (_ BitVec 32) (_ BitVec 32) V!30231 V!30231 (_ BitVec 32) Int) ListLongMap!11069)

(assert (=> b!911498 (= lt!410640 (contains!4603 (getCurrentListMap!2811 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614794 () Bool)

(assert (=> start!78172 (=> (not res!614794) (not e!511148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78172 (= res!614794 (validMask!0 mask!1756))))

(assert (=> start!78172 e!511148))

(declare-fun array_inv!20352 (array!53971) Bool)

(assert (=> start!78172 (and (array_inv!20352 _values!1152) e!511149)))

(assert (=> start!78172 tp!57865))

(assert (=> start!78172 true))

(assert (=> start!78172 tp_is_empty!18949))

(declare-fun array_inv!20353 (array!53969) Bool)

(assert (=> start!78172 (array_inv!20353 _keys!1386)))

(declare-fun mapIsEmpty!30145 () Bool)

(assert (=> mapIsEmpty!30145 mapRes!30145))

(declare-fun b!911499 () Bool)

(declare-fun res!614792 () Bool)

(assert (=> b!911499 (=> (not res!614792) (not e!511148))))

(assert (=> b!911499 (= res!614792 (and (= (size!26397 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26396 _keys!1386) (size!26397 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!78172 res!614794) b!911499))

(assert (= (and b!911499 res!614792) b!911493))

(assert (= (and b!911493 res!614793) b!911497))

(assert (= (and b!911497 res!614795) b!911498))

(assert (= (and b!911494 condMapEmpty!30145) mapIsEmpty!30145))

(assert (= (and b!911494 (not condMapEmpty!30145)) mapNonEmpty!30145))

(get-info :version)

(assert (= (and mapNonEmpty!30145 ((_ is ValueCellFull!8993) mapValue!30145)) b!911496))

(assert (= (and b!911494 ((_ is ValueCellFull!8993) mapDefault!30145)) b!911495))

(assert (= start!78172 b!911494))

(declare-fun m!846847 () Bool)

(assert (=> b!911498 m!846847))

(assert (=> b!911498 m!846847))

(declare-fun m!846849 () Bool)

(assert (=> b!911498 m!846849))

(declare-fun m!846851 () Bool)

(assert (=> b!911497 m!846851))

(declare-fun m!846853 () Bool)

(assert (=> mapNonEmpty!30145 m!846853))

(declare-fun m!846855 () Bool)

(assert (=> start!78172 m!846855))

(declare-fun m!846857 () Bool)

(assert (=> start!78172 m!846857))

(declare-fun m!846859 () Bool)

(assert (=> start!78172 m!846859))

(declare-fun m!846861 () Bool)

(assert (=> b!911493 m!846861))

(check-sat tp_is_empty!18949 (not b!911498) (not mapNonEmpty!30145) (not b!911493) (not start!78172) (not b_next!16531) b_and!27113 (not b!911497))
(check-sat b_and!27113 (not b_next!16531))
