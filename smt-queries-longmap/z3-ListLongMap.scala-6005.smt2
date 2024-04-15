; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77864 () Bool)

(assert start!77864)

(declare-fun b_free!16441 () Bool)

(declare-fun b_next!16441 () Bool)

(assert (=> start!77864 (= b_free!16441 (not b_next!16441))))

(declare-fun tp!57589 () Bool)

(declare-fun b_and!26983 () Bool)

(assert (=> start!77864 (= tp!57589 b_and!26983)))

(declare-fun b!909152 () Bool)

(declare-fun res!613674 () Bool)

(declare-fun e!509599 () Bool)

(assert (=> b!909152 (=> (not res!613674) (not e!509599))))

(declare-datatypes ((array!53725 0))(
  ( (array!53726 (arr!25821 (Array (_ BitVec 32) (_ BitVec 64))) (size!26282 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53725)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53725 (_ BitVec 32)) Bool)

(assert (=> b!909152 (= res!613674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909153 () Bool)

(declare-fun e!509600 () Bool)

(declare-fun tp_is_empty!18859 () Bool)

(assert (=> b!909153 (= e!509600 tp_is_empty!18859)))

(declare-fun b!909154 () Bool)

(declare-fun e!509602 () Bool)

(assert (=> b!909154 (= e!509602 tp_is_empty!18859)))

(declare-fun b!909155 () Bool)

(declare-fun res!613675 () Bool)

(assert (=> b!909155 (=> (not res!613675) (not e!509599))))

(declare-datatypes ((V!30111 0))(
  ( (V!30112 (val!9480 Int)) )
))
(declare-datatypes ((ValueCell!8948 0))(
  ( (ValueCellFull!8948 (v!11986 V!30111)) (EmptyCell!8948) )
))
(declare-datatypes ((array!53727 0))(
  ( (array!53728 (arr!25822 (Array (_ BitVec 32) ValueCell!8948)) (size!26283 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53727)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909155 (= res!613675 (and (= (size!26283 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26282 _keys!1386) (size!26283 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909156 () Bool)

(declare-fun res!613673 () Bool)

(assert (=> b!909156 (=> (not res!613673) (not e!509599))))

(declare-datatypes ((List!18166 0))(
  ( (Nil!18163) (Cons!18162 (h!19308 (_ BitVec 64)) (t!25738 List!18166)) )
))
(declare-fun arrayNoDuplicates!0 (array!53725 (_ BitVec 32) List!18166) Bool)

(assert (=> b!909156 (= res!613673 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18163))))

(declare-fun mapIsEmpty!30004 () Bool)

(declare-fun mapRes!30004 () Bool)

(assert (=> mapIsEmpty!30004 mapRes!30004))

(declare-fun res!613672 () Bool)

(assert (=> start!77864 (=> (not res!613672) (not e!509599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77864 (= res!613672 (validMask!0 mask!1756))))

(assert (=> start!77864 e!509599))

(declare-fun e!509601 () Bool)

(declare-fun array_inv!20250 (array!53727) Bool)

(assert (=> start!77864 (and (array_inv!20250 _values!1152) e!509601)))

(assert (=> start!77864 tp!57589))

(assert (=> start!77864 true))

(assert (=> start!77864 tp_is_empty!18859))

(declare-fun array_inv!20251 (array!53725) Bool)

(assert (=> start!77864 (array_inv!20251 _keys!1386)))

(declare-fun b!909157 () Bool)

(assert (=> b!909157 (= e!509599 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30111)

(declare-fun lt!409752 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30111)

(declare-datatypes ((tuple2!12384 0))(
  ( (tuple2!12385 (_1!6203 (_ BitVec 64)) (_2!6203 V!30111)) )
))
(declare-datatypes ((List!18167 0))(
  ( (Nil!18164) (Cons!18163 (h!19309 tuple2!12384) (t!25739 List!18167)) )
))
(declare-datatypes ((ListLongMap!11071 0))(
  ( (ListLongMap!11072 (toList!5551 List!18167)) )
))
(declare-fun contains!4550 (ListLongMap!11071 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2753 (array!53725 array!53727 (_ BitVec 32) (_ BitVec 32) V!30111 V!30111 (_ BitVec 32) Int) ListLongMap!11071)

(assert (=> b!909157 (= lt!409752 (contains!4550 (getCurrentListMap!2753 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30004 () Bool)

(declare-fun tp!57588 () Bool)

(assert (=> mapNonEmpty!30004 (= mapRes!30004 (and tp!57588 e!509602))))

(declare-fun mapRest!30004 () (Array (_ BitVec 32) ValueCell!8948))

(declare-fun mapKey!30004 () (_ BitVec 32))

(declare-fun mapValue!30004 () ValueCell!8948)

(assert (=> mapNonEmpty!30004 (= (arr!25822 _values!1152) (store mapRest!30004 mapKey!30004 mapValue!30004))))

(declare-fun b!909158 () Bool)

(assert (=> b!909158 (= e!509601 (and e!509600 mapRes!30004))))

(declare-fun condMapEmpty!30004 () Bool)

(declare-fun mapDefault!30004 () ValueCell!8948)

(assert (=> b!909158 (= condMapEmpty!30004 (= (arr!25822 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8948)) mapDefault!30004)))))

(assert (= (and start!77864 res!613672) b!909155))

(assert (= (and b!909155 res!613675) b!909152))

(assert (= (and b!909152 res!613674) b!909156))

(assert (= (and b!909156 res!613673) b!909157))

(assert (= (and b!909158 condMapEmpty!30004) mapIsEmpty!30004))

(assert (= (and b!909158 (not condMapEmpty!30004)) mapNonEmpty!30004))

(get-info :version)

(assert (= (and mapNonEmpty!30004 ((_ is ValueCellFull!8948) mapValue!30004)) b!909154))

(assert (= (and b!909158 ((_ is ValueCellFull!8948) mapDefault!30004)) b!909153))

(assert (= start!77864 b!909158))

(declare-fun m!843891 () Bool)

(assert (=> b!909152 m!843891))

(declare-fun m!843893 () Bool)

(assert (=> b!909157 m!843893))

(assert (=> b!909157 m!843893))

(declare-fun m!843895 () Bool)

(assert (=> b!909157 m!843895))

(declare-fun m!843897 () Bool)

(assert (=> start!77864 m!843897))

(declare-fun m!843899 () Bool)

(assert (=> start!77864 m!843899))

(declare-fun m!843901 () Bool)

(assert (=> start!77864 m!843901))

(declare-fun m!843903 () Bool)

(assert (=> b!909156 m!843903))

(declare-fun m!843905 () Bool)

(assert (=> mapNonEmpty!30004 m!843905))

(check-sat (not b!909156) (not b!909152) b_and!26983 (not b!909157) (not start!77864) (not b_next!16441) (not mapNonEmpty!30004) tp_is_empty!18859)
(check-sat b_and!26983 (not b_next!16441))
