; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77876 () Bool)

(assert start!77876)

(declare-fun b_free!16453 () Bool)

(declare-fun b_next!16453 () Bool)

(assert (=> start!77876 (= b_free!16453 (not b_next!16453))))

(declare-fun tp!57625 () Bool)

(declare-fun b_and!26995 () Bool)

(assert (=> start!77876 (= tp!57625 b_and!26995)))

(declare-fun res!613744 () Bool)

(declare-fun e!509692 () Bool)

(assert (=> start!77876 (=> (not res!613744) (not e!509692))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77876 (= res!613744 (validMask!0 mask!1756))))

(assert (=> start!77876 e!509692))

(declare-datatypes ((V!30127 0))(
  ( (V!30128 (val!9486 Int)) )
))
(declare-datatypes ((ValueCell!8954 0))(
  ( (ValueCellFull!8954 (v!11992 V!30127)) (EmptyCell!8954) )
))
(declare-datatypes ((array!53749 0))(
  ( (array!53750 (arr!25833 (Array (_ BitVec 32) ValueCell!8954)) (size!26294 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53749)

(declare-fun e!509691 () Bool)

(declare-fun array_inv!20258 (array!53749) Bool)

(assert (=> start!77876 (and (array_inv!20258 _values!1152) e!509691)))

(assert (=> start!77876 tp!57625))

(assert (=> start!77876 true))

(declare-fun tp_is_empty!18871 () Bool)

(assert (=> start!77876 tp_is_empty!18871))

(declare-datatypes ((array!53751 0))(
  ( (array!53752 (arr!25834 (Array (_ BitVec 32) (_ BitVec 64))) (size!26295 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53751)

(declare-fun array_inv!20259 (array!53751) Bool)

(assert (=> start!77876 (array_inv!20259 _keys!1386)))

(declare-fun b!909278 () Bool)

(declare-fun res!613746 () Bool)

(assert (=> b!909278 (=> (not res!613746) (not e!509692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53751 (_ BitVec 32)) Bool)

(assert (=> b!909278 (= res!613746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!909279 () Bool)

(declare-fun res!613745 () Bool)

(assert (=> b!909279 (=> (not res!613745) (not e!509692))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!909279 (= res!613745 (and (= (size!26294 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26295 _keys!1386) (size!26294 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!909280 () Bool)

(declare-fun e!509693 () Bool)

(declare-fun mapRes!30022 () Bool)

(assert (=> b!909280 (= e!509691 (and e!509693 mapRes!30022))))

(declare-fun condMapEmpty!30022 () Bool)

(declare-fun mapDefault!30022 () ValueCell!8954)

(assert (=> b!909280 (= condMapEmpty!30022 (= (arr!25833 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8954)) mapDefault!30022)))))

(declare-fun b!909281 () Bool)

(declare-fun e!509690 () Bool)

(assert (=> b!909281 (= e!509690 tp_is_empty!18871)))

(declare-fun b!909282 () Bool)

(declare-fun res!613747 () Bool)

(assert (=> b!909282 (=> (not res!613747) (not e!509692))))

(declare-datatypes ((List!18173 0))(
  ( (Nil!18170) (Cons!18169 (h!19315 (_ BitVec 64)) (t!25745 List!18173)) )
))
(declare-fun arrayNoDuplicates!0 (array!53751 (_ BitVec 32) List!18173) Bool)

(assert (=> b!909282 (= res!613747 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18170))))

(declare-fun mapNonEmpty!30022 () Bool)

(declare-fun tp!57624 () Bool)

(assert (=> mapNonEmpty!30022 (= mapRes!30022 (and tp!57624 e!509690))))

(declare-fun mapValue!30022 () ValueCell!8954)

(declare-fun mapRest!30022 () (Array (_ BitVec 32) ValueCell!8954))

(declare-fun mapKey!30022 () (_ BitVec 32))

(assert (=> mapNonEmpty!30022 (= (arr!25833 _values!1152) (store mapRest!30022 mapKey!30022 mapValue!30022))))

(declare-fun b!909283 () Bool)

(assert (=> b!909283 (= e!509692 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409770 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30127)

(declare-fun zeroValue!1094 () V!30127)

(declare-datatypes ((tuple2!12390 0))(
  ( (tuple2!12391 (_1!6206 (_ BitVec 64)) (_2!6206 V!30127)) )
))
(declare-datatypes ((List!18174 0))(
  ( (Nil!18171) (Cons!18170 (h!19316 tuple2!12390) (t!25746 List!18174)) )
))
(declare-datatypes ((ListLongMap!11077 0))(
  ( (ListLongMap!11078 (toList!5554 List!18174)) )
))
(declare-fun contains!4553 (ListLongMap!11077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2756 (array!53751 array!53749 (_ BitVec 32) (_ BitVec 32) V!30127 V!30127 (_ BitVec 32) Int) ListLongMap!11077)

(assert (=> b!909283 (= lt!409770 (contains!4553 (getCurrentListMap!2756 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!909284 () Bool)

(assert (=> b!909284 (= e!509693 tp_is_empty!18871)))

(declare-fun mapIsEmpty!30022 () Bool)

(assert (=> mapIsEmpty!30022 mapRes!30022))

(assert (= (and start!77876 res!613744) b!909279))

(assert (= (and b!909279 res!613745) b!909278))

(assert (= (and b!909278 res!613746) b!909282))

(assert (= (and b!909282 res!613747) b!909283))

(assert (= (and b!909280 condMapEmpty!30022) mapIsEmpty!30022))

(assert (= (and b!909280 (not condMapEmpty!30022)) mapNonEmpty!30022))

(get-info :version)

(assert (= (and mapNonEmpty!30022 ((_ is ValueCellFull!8954) mapValue!30022)) b!909281))

(assert (= (and b!909280 ((_ is ValueCellFull!8954) mapDefault!30022)) b!909284))

(assert (= start!77876 b!909280))

(declare-fun m!843987 () Bool)

(assert (=> mapNonEmpty!30022 m!843987))

(declare-fun m!843989 () Bool)

(assert (=> b!909278 m!843989))

(declare-fun m!843991 () Bool)

(assert (=> b!909282 m!843991))

(declare-fun m!843993 () Bool)

(assert (=> start!77876 m!843993))

(declare-fun m!843995 () Bool)

(assert (=> start!77876 m!843995))

(declare-fun m!843997 () Bool)

(assert (=> start!77876 m!843997))

(declare-fun m!843999 () Bool)

(assert (=> b!909283 m!843999))

(assert (=> b!909283 m!843999))

(declare-fun m!844001 () Bool)

(assert (=> b!909283 m!844001))

(check-sat (not mapNonEmpty!30022) b_and!26995 tp_is_empty!18871 (not b_next!16453) (not start!77876) (not b!909283) (not b!909278) (not b!909282))
(check-sat b_and!26995 (not b_next!16453))
