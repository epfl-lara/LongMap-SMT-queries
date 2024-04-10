; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77960 () Bool)

(assert start!77960)

(declare-fun b_free!16503 () Bool)

(declare-fun b_next!16503 () Bool)

(assert (=> start!77960 (= b_free!16503 (not b_next!16503))))

(declare-fun tp!57777 () Bool)

(declare-fun b_and!27073 () Bool)

(assert (=> start!77960 (= tp!57777 b_and!27073)))

(declare-fun b!910169 () Bool)

(declare-fun e!510287 () Bool)

(assert (=> b!910169 (= e!510287 false)))

(declare-datatypes ((V!30193 0))(
  ( (V!30194 (val!9511 Int)) )
))
(declare-datatypes ((ValueCell!8979 0))(
  ( (ValueCellFull!8979 (v!12019 V!30193)) (EmptyCell!8979) )
))
(declare-datatypes ((array!53862 0))(
  ( (array!53863 (arr!25888 (Array (_ BitVec 32) ValueCell!8979)) (size!26347 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53862)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30193)

(declare-datatypes ((array!53864 0))(
  ( (array!53865 (arr!25889 (Array (_ BitVec 32) (_ BitVec 64))) (size!26348 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53864)

(declare-fun lt!410159 () Bool)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30193)

(declare-datatypes ((tuple2!12394 0))(
  ( (tuple2!12395 (_1!6208 (_ BitVec 64)) (_2!6208 V!30193)) )
))
(declare-datatypes ((List!18185 0))(
  ( (Nil!18182) (Cons!18181 (h!19327 tuple2!12394) (t!25768 List!18185)) )
))
(declare-datatypes ((ListLongMap!11091 0))(
  ( (ListLongMap!11092 (toList!5561 List!18185)) )
))
(declare-fun contains!4604 (ListLongMap!11091 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2823 (array!53864 array!53862 (_ BitVec 32) (_ BitVec 32) V!30193 V!30193 (_ BitVec 32) Int) ListLongMap!11091)

(assert (=> b!910169 (= lt!410159 (contains!4604 (getCurrentListMap!2823 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!910170 () Bool)

(declare-fun res!614218 () Bool)

(assert (=> b!910170 (=> (not res!614218) (not e!510287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53864 (_ BitVec 32)) Bool)

(assert (=> b!910170 (= res!614218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910171 () Bool)

(declare-fun e!510288 () Bool)

(declare-fun tp_is_empty!18921 () Bool)

(assert (=> b!910171 (= e!510288 tp_is_empty!18921)))

(declare-fun b!910173 () Bool)

(declare-fun res!614219 () Bool)

(assert (=> b!910173 (=> (not res!614219) (not e!510287))))

(assert (=> b!910173 (= res!614219 (and (= (size!26347 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26348 _keys!1386) (size!26347 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910174 () Bool)

(declare-fun e!510286 () Bool)

(assert (=> b!910174 (= e!510286 tp_is_empty!18921)))

(declare-fun mapNonEmpty!30100 () Bool)

(declare-fun mapRes!30100 () Bool)

(declare-fun tp!57776 () Bool)

(assert (=> mapNonEmpty!30100 (= mapRes!30100 (and tp!57776 e!510288))))

(declare-fun mapKey!30100 () (_ BitVec 32))

(declare-fun mapValue!30100 () ValueCell!8979)

(declare-fun mapRest!30100 () (Array (_ BitVec 32) ValueCell!8979))

(assert (=> mapNonEmpty!30100 (= (arr!25888 _values!1152) (store mapRest!30100 mapKey!30100 mapValue!30100))))

(declare-fun res!614217 () Bool)

(assert (=> start!77960 (=> (not res!614217) (not e!510287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77960 (= res!614217 (validMask!0 mask!1756))))

(assert (=> start!77960 e!510287))

(declare-fun e!510284 () Bool)

(declare-fun array_inv!20250 (array!53862) Bool)

(assert (=> start!77960 (and (array_inv!20250 _values!1152) e!510284)))

(assert (=> start!77960 tp!57777))

(assert (=> start!77960 true))

(assert (=> start!77960 tp_is_empty!18921))

(declare-fun array_inv!20251 (array!53864) Bool)

(assert (=> start!77960 (array_inv!20251 _keys!1386)))

(declare-fun b!910172 () Bool)

(declare-fun res!614220 () Bool)

(assert (=> b!910172 (=> (not res!614220) (not e!510287))))

(declare-datatypes ((List!18186 0))(
  ( (Nil!18183) (Cons!18182 (h!19328 (_ BitVec 64)) (t!25769 List!18186)) )
))
(declare-fun arrayNoDuplicates!0 (array!53864 (_ BitVec 32) List!18186) Bool)

(assert (=> b!910172 (= res!614220 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18183))))

(declare-fun mapIsEmpty!30100 () Bool)

(assert (=> mapIsEmpty!30100 mapRes!30100))

(declare-fun b!910175 () Bool)

(assert (=> b!910175 (= e!510284 (and e!510286 mapRes!30100))))

(declare-fun condMapEmpty!30100 () Bool)

(declare-fun mapDefault!30100 () ValueCell!8979)

(assert (=> b!910175 (= condMapEmpty!30100 (= (arr!25888 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8979)) mapDefault!30100)))))

(assert (= (and start!77960 res!614217) b!910173))

(assert (= (and b!910173 res!614219) b!910170))

(assert (= (and b!910170 res!614218) b!910172))

(assert (= (and b!910172 res!614220) b!910169))

(assert (= (and b!910175 condMapEmpty!30100) mapIsEmpty!30100))

(assert (= (and b!910175 (not condMapEmpty!30100)) mapNonEmpty!30100))

(get-info :version)

(assert (= (and mapNonEmpty!30100 ((_ is ValueCellFull!8979) mapValue!30100)) b!910171))

(assert (= (and b!910175 ((_ is ValueCellFull!8979) mapDefault!30100)) b!910174))

(assert (= start!77960 b!910175))

(declare-fun m!845237 () Bool)

(assert (=> b!910170 m!845237))

(declare-fun m!845239 () Bool)

(assert (=> b!910169 m!845239))

(assert (=> b!910169 m!845239))

(declare-fun m!845241 () Bool)

(assert (=> b!910169 m!845241))

(declare-fun m!845243 () Bool)

(assert (=> mapNonEmpty!30100 m!845243))

(declare-fun m!845245 () Bool)

(assert (=> start!77960 m!845245))

(declare-fun m!845247 () Bool)

(assert (=> start!77960 m!845247))

(declare-fun m!845249 () Bool)

(assert (=> start!77960 m!845249))

(declare-fun m!845251 () Bool)

(assert (=> b!910172 m!845251))

(check-sat (not mapNonEmpty!30100) (not b!910169) (not b!910170) (not b_next!16503) (not start!77960) tp_is_empty!18921 b_and!27073 (not b!910172))
(check-sat b_and!27073 (not b_next!16503))
