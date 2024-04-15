; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78046 () Bool)

(assert start!78046)

(declare-fun b_free!16591 () Bool)

(declare-fun b_next!16591 () Bool)

(assert (=> start!78046 (= b_free!16591 (not b_next!16591))))

(declare-fun tp!58044 () Bool)

(declare-fun b_and!27137 () Bool)

(assert (=> start!78046 (= tp!58044 b_and!27137)))

(declare-fun res!614698 () Bool)

(declare-fun e!510868 () Bool)

(assert (=> start!78046 (=> (not res!614698) (not e!510868))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78046 (= res!614698 (validMask!0 mask!1756))))

(assert (=> start!78046 e!510868))

(declare-datatypes ((V!30311 0))(
  ( (V!30312 (val!9555 Int)) )
))
(declare-datatypes ((ValueCell!9023 0))(
  ( (ValueCellFull!9023 (v!12063 V!30311)) (EmptyCell!9023) )
))
(declare-datatypes ((array!54021 0))(
  ( (array!54022 (arr!25967 (Array (_ BitVec 32) ValueCell!9023)) (size!26428 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54021)

(declare-fun e!510869 () Bool)

(declare-fun array_inv!20358 (array!54021) Bool)

(assert (=> start!78046 (and (array_inv!20358 _values!1152) e!510869)))

(assert (=> start!78046 tp!58044))

(assert (=> start!78046 true))

(declare-fun tp_is_empty!19009 () Bool)

(assert (=> start!78046 tp_is_empty!19009))

(declare-datatypes ((array!54023 0))(
  ( (array!54024 (arr!25968 (Array (_ BitVec 32) (_ BitVec 64))) (size!26429 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54023)

(declare-fun array_inv!20359 (array!54023) Bool)

(assert (=> start!78046 (array_inv!20359 _keys!1386)))

(declare-fun b!910981 () Bool)

(declare-fun e!510872 () Bool)

(assert (=> b!910981 (= e!510872 tp_is_empty!19009)))

(declare-fun mapNonEmpty!30235 () Bool)

(declare-fun mapRes!30235 () Bool)

(declare-fun tp!58045 () Bool)

(declare-fun e!510871 () Bool)

(assert (=> mapNonEmpty!30235 (= mapRes!30235 (and tp!58045 e!510871))))

(declare-fun mapKey!30235 () (_ BitVec 32))

(declare-fun mapRest!30235 () (Array (_ BitVec 32) ValueCell!9023))

(declare-fun mapValue!30235 () ValueCell!9023)

(assert (=> mapNonEmpty!30235 (= (arr!25967 _values!1152) (store mapRest!30235 mapKey!30235 mapValue!30235))))

(declare-fun mapIsEmpty!30235 () Bool)

(assert (=> mapIsEmpty!30235 mapRes!30235))

(declare-fun b!910982 () Bool)

(assert (=> b!910982 (= e!510868 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30311)

(declare-fun lt!410133 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30311)

(declare-datatypes ((tuple2!12486 0))(
  ( (tuple2!12487 (_1!6254 (_ BitVec 64)) (_2!6254 V!30311)) )
))
(declare-datatypes ((List!18270 0))(
  ( (Nil!18267) (Cons!18266 (h!19412 tuple2!12486) (t!25846 List!18270)) )
))
(declare-datatypes ((ListLongMap!11173 0))(
  ( (ListLongMap!11174 (toList!5602 List!18270)) )
))
(declare-fun contains!4603 (ListLongMap!11173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2804 (array!54023 array!54021 (_ BitVec 32) (_ BitVec 32) V!30311 V!30311 (_ BitVec 32) Int) ListLongMap!11173)

(assert (=> b!910982 (= lt!410133 (contains!4603 (getCurrentListMap!2804 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910983 () Bool)

(declare-fun res!614699 () Bool)

(assert (=> b!910983 (=> (not res!614699) (not e!510868))))

(declare-datatypes ((List!18271 0))(
  ( (Nil!18268) (Cons!18267 (h!19413 (_ BitVec 64)) (t!25847 List!18271)) )
))
(declare-fun arrayNoDuplicates!0 (array!54023 (_ BitVec 32) List!18271) Bool)

(assert (=> b!910983 (= res!614699 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18268))))

(declare-fun b!910984 () Bool)

(assert (=> b!910984 (= e!510871 tp_is_empty!19009)))

(declare-fun b!910985 () Bool)

(declare-fun res!614701 () Bool)

(assert (=> b!910985 (=> (not res!614701) (not e!510868))))

(assert (=> b!910985 (= res!614701 (and (= (size!26428 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26429 _keys!1386) (size!26428 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910986 () Bool)

(assert (=> b!910986 (= e!510869 (and e!510872 mapRes!30235))))

(declare-fun condMapEmpty!30235 () Bool)

(declare-fun mapDefault!30235 () ValueCell!9023)

(assert (=> b!910986 (= condMapEmpty!30235 (= (arr!25967 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9023)) mapDefault!30235)))))

(declare-fun b!910987 () Bool)

(declare-fun res!614700 () Bool)

(assert (=> b!910987 (=> (not res!614700) (not e!510868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54023 (_ BitVec 32)) Bool)

(assert (=> b!910987 (= res!614700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78046 res!614698) b!910985))

(assert (= (and b!910985 res!614701) b!910987))

(assert (= (and b!910987 res!614700) b!910983))

(assert (= (and b!910983 res!614699) b!910982))

(assert (= (and b!910986 condMapEmpty!30235) mapIsEmpty!30235))

(assert (= (and b!910986 (not condMapEmpty!30235)) mapNonEmpty!30235))

(get-info :version)

(assert (= (and mapNonEmpty!30235 ((_ is ValueCellFull!9023) mapValue!30235)) b!910984))

(assert (= (and b!910986 ((_ is ValueCellFull!9023) mapDefault!30235)) b!910981))

(assert (= start!78046 b!910986))

(declare-fun m!845275 () Bool)

(assert (=> b!910982 m!845275))

(assert (=> b!910982 m!845275))

(declare-fun m!845277 () Bool)

(assert (=> b!910982 m!845277))

(declare-fun m!845279 () Bool)

(assert (=> b!910983 m!845279))

(declare-fun m!845281 () Bool)

(assert (=> start!78046 m!845281))

(declare-fun m!845283 () Bool)

(assert (=> start!78046 m!845283))

(declare-fun m!845285 () Bool)

(assert (=> start!78046 m!845285))

(declare-fun m!845287 () Bool)

(assert (=> b!910987 m!845287))

(declare-fun m!845289 () Bool)

(assert (=> mapNonEmpty!30235 m!845289))

(check-sat (not b_next!16591) (not b!910982) tp_is_empty!19009 b_and!27137 (not b!910987) (not b!910983) (not start!78046) (not mapNonEmpty!30235))
(check-sat b_and!27137 (not b_next!16591))
