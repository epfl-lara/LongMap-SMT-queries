; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78022 () Bool)

(assert start!78022)

(declare-fun b_free!16567 () Bool)

(declare-fun b_next!16567 () Bool)

(assert (=> start!78022 (= b_free!16567 (not b_next!16567))))

(declare-fun tp!57973 () Bool)

(declare-fun b_and!27113 () Bool)

(assert (=> start!78022 (= tp!57973 b_and!27113)))

(declare-fun b!910729 () Bool)

(declare-fun res!614556 () Bool)

(declare-fun e!510690 () Bool)

(assert (=> b!910729 (=> (not res!614556) (not e!510690))))

(declare-datatypes ((V!30279 0))(
  ( (V!30280 (val!9543 Int)) )
))
(declare-datatypes ((ValueCell!9011 0))(
  ( (ValueCellFull!9011 (v!12051 V!30279)) (EmptyCell!9011) )
))
(declare-datatypes ((array!53975 0))(
  ( (array!53976 (arr!25944 (Array (_ BitVec 32) ValueCell!9011)) (size!26405 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53975)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53977 0))(
  ( (array!53978 (arr!25945 (Array (_ BitVec 32) (_ BitVec 64))) (size!26406 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53977)

(assert (=> b!910729 (= res!614556 (and (= (size!26405 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26406 _keys!1386) (size!26405 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910730 () Bool)

(declare-fun res!614557 () Bool)

(assert (=> b!910730 (=> (not res!614557) (not e!510690))))

(declare-datatypes ((List!18256 0))(
  ( (Nil!18253) (Cons!18252 (h!19398 (_ BitVec 64)) (t!25832 List!18256)) )
))
(declare-fun arrayNoDuplicates!0 (array!53977 (_ BitVec 32) List!18256) Bool)

(assert (=> b!910730 (= res!614557 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18253))))

(declare-fun mapNonEmpty!30199 () Bool)

(declare-fun mapRes!30199 () Bool)

(declare-fun tp!57972 () Bool)

(declare-fun e!510691 () Bool)

(assert (=> mapNonEmpty!30199 (= mapRes!30199 (and tp!57972 e!510691))))

(declare-fun mapRest!30199 () (Array (_ BitVec 32) ValueCell!9011))

(declare-fun mapValue!30199 () ValueCell!9011)

(declare-fun mapKey!30199 () (_ BitVec 32))

(assert (=> mapNonEmpty!30199 (= (arr!25944 _values!1152) (store mapRest!30199 mapKey!30199 mapValue!30199))))

(declare-fun mapIsEmpty!30199 () Bool)

(assert (=> mapIsEmpty!30199 mapRes!30199))

(declare-fun b!910731 () Bool)

(assert (=> b!910731 (= e!510690 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!410097 () Bool)

(declare-fun zeroValue!1094 () V!30279)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30279)

(declare-datatypes ((tuple2!12470 0))(
  ( (tuple2!12471 (_1!6246 (_ BitVec 64)) (_2!6246 V!30279)) )
))
(declare-datatypes ((List!18257 0))(
  ( (Nil!18254) (Cons!18253 (h!19399 tuple2!12470) (t!25833 List!18257)) )
))
(declare-datatypes ((ListLongMap!11157 0))(
  ( (ListLongMap!11158 (toList!5594 List!18257)) )
))
(declare-fun contains!4595 (ListLongMap!11157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2796 (array!53977 array!53975 (_ BitVec 32) (_ BitVec 32) V!30279 V!30279 (_ BitVec 32) Int) ListLongMap!11157)

(assert (=> b!910731 (= lt!410097 (contains!4595 (getCurrentListMap!2796 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun res!614554 () Bool)

(assert (=> start!78022 (=> (not res!614554) (not e!510690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78022 (= res!614554 (validMask!0 mask!1756))))

(assert (=> start!78022 e!510690))

(declare-fun e!510688 () Bool)

(declare-fun array_inv!20340 (array!53975) Bool)

(assert (=> start!78022 (and (array_inv!20340 _values!1152) e!510688)))

(assert (=> start!78022 tp!57973))

(assert (=> start!78022 true))

(declare-fun tp_is_empty!18985 () Bool)

(assert (=> start!78022 tp_is_empty!18985))

(declare-fun array_inv!20341 (array!53977) Bool)

(assert (=> start!78022 (array_inv!20341 _keys!1386)))

(declare-fun b!910732 () Bool)

(declare-fun e!510692 () Bool)

(assert (=> b!910732 (= e!510692 tp_is_empty!18985)))

(declare-fun b!910733 () Bool)

(assert (=> b!910733 (= e!510691 tp_is_empty!18985)))

(declare-fun b!910734 () Bool)

(declare-fun res!614555 () Bool)

(assert (=> b!910734 (=> (not res!614555) (not e!510690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53977 (_ BitVec 32)) Bool)

(assert (=> b!910734 (= res!614555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910735 () Bool)

(assert (=> b!910735 (= e!510688 (and e!510692 mapRes!30199))))

(declare-fun condMapEmpty!30199 () Bool)

(declare-fun mapDefault!30199 () ValueCell!9011)

(assert (=> b!910735 (= condMapEmpty!30199 (= (arr!25944 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9011)) mapDefault!30199)))))

(assert (= (and start!78022 res!614554) b!910729))

(assert (= (and b!910729 res!614556) b!910734))

(assert (= (and b!910734 res!614555) b!910730))

(assert (= (and b!910730 res!614557) b!910731))

(assert (= (and b!910735 condMapEmpty!30199) mapIsEmpty!30199))

(assert (= (and b!910735 (not condMapEmpty!30199)) mapNonEmpty!30199))

(get-info :version)

(assert (= (and mapNonEmpty!30199 ((_ is ValueCellFull!9011) mapValue!30199)) b!910733))

(assert (= (and b!910735 ((_ is ValueCellFull!9011) mapDefault!30199)) b!910732))

(assert (= start!78022 b!910735))

(declare-fun m!845083 () Bool)

(assert (=> b!910734 m!845083))

(declare-fun m!845085 () Bool)

(assert (=> start!78022 m!845085))

(declare-fun m!845087 () Bool)

(assert (=> start!78022 m!845087))

(declare-fun m!845089 () Bool)

(assert (=> start!78022 m!845089))

(declare-fun m!845091 () Bool)

(assert (=> mapNonEmpty!30199 m!845091))

(declare-fun m!845093 () Bool)

(assert (=> b!910731 m!845093))

(assert (=> b!910731 m!845093))

(declare-fun m!845095 () Bool)

(assert (=> b!910731 m!845095))

(declare-fun m!845097 () Bool)

(assert (=> b!910730 m!845097))

(check-sat b_and!27113 (not b!910731) (not b!910734) tp_is_empty!18985 (not mapNonEmpty!30199) (not start!78022) (not b_next!16567) (not b!910730))
(check-sat b_and!27113 (not b_next!16567))
