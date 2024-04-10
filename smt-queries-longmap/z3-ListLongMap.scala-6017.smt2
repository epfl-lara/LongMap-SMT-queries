; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77972 () Bool)

(assert start!77972)

(declare-fun b_free!16515 () Bool)

(declare-fun b_next!16515 () Bool)

(assert (=> start!77972 (= b_free!16515 (not b_next!16515))))

(declare-fun tp!57813 () Bool)

(declare-fun b_and!27085 () Bool)

(assert (=> start!77972 (= tp!57813 b_and!27085)))

(declare-fun b!910296 () Bool)

(declare-fun res!614291 () Bool)

(declare-fun e!510374 () Bool)

(assert (=> b!910296 (=> (not res!614291) (not e!510374))))

(declare-datatypes ((V!30209 0))(
  ( (V!30210 (val!9517 Int)) )
))
(declare-datatypes ((ValueCell!8985 0))(
  ( (ValueCellFull!8985 (v!12025 V!30209)) (EmptyCell!8985) )
))
(declare-datatypes ((array!53882 0))(
  ( (array!53883 (arr!25898 (Array (_ BitVec 32) ValueCell!8985)) (size!26357 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53882)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53884 0))(
  ( (array!53885 (arr!25899 (Array (_ BitVec 32) (_ BitVec 64))) (size!26358 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53884)

(assert (=> b!910296 (= res!614291 (and (= (size!26357 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26358 _keys!1386) (size!26357 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!910297 () Bool)

(declare-fun e!510377 () Bool)

(declare-fun tp_is_empty!18933 () Bool)

(assert (=> b!910297 (= e!510377 tp_is_empty!18933)))

(declare-fun b!910298 () Bool)

(declare-fun res!614289 () Bool)

(assert (=> b!910298 (=> (not res!614289) (not e!510374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53884 (_ BitVec 32)) Bool)

(assert (=> b!910298 (= res!614289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!910299 () Bool)

(declare-fun res!614290 () Bool)

(assert (=> b!910299 (=> (not res!614290) (not e!510374))))

(declare-datatypes ((List!18191 0))(
  ( (Nil!18188) (Cons!18187 (h!19333 (_ BitVec 64)) (t!25774 List!18191)) )
))
(declare-fun arrayNoDuplicates!0 (array!53884 (_ BitVec 32) List!18191) Bool)

(assert (=> b!910299 (= res!614290 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18188))))

(declare-fun mapIsEmpty!30118 () Bool)

(declare-fun mapRes!30118 () Bool)

(assert (=> mapIsEmpty!30118 mapRes!30118))

(declare-fun b!910300 () Bool)

(assert (=> b!910300 (= e!510374 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun minValue!1094 () V!30209)

(declare-fun lt!410177 () Bool)

(declare-fun zeroValue!1094 () V!30209)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12400 0))(
  ( (tuple2!12401 (_1!6211 (_ BitVec 64)) (_2!6211 V!30209)) )
))
(declare-datatypes ((List!18192 0))(
  ( (Nil!18189) (Cons!18188 (h!19334 tuple2!12400) (t!25775 List!18192)) )
))
(declare-datatypes ((ListLongMap!11097 0))(
  ( (ListLongMap!11098 (toList!5564 List!18192)) )
))
(declare-fun contains!4607 (ListLongMap!11097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2826 (array!53884 array!53882 (_ BitVec 32) (_ BitVec 32) V!30209 V!30209 (_ BitVec 32) Int) ListLongMap!11097)

(assert (=> b!910300 (= lt!410177 (contains!4607 (getCurrentListMap!2826 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!30118 () Bool)

(declare-fun tp!57812 () Bool)

(assert (=> mapNonEmpty!30118 (= mapRes!30118 (and tp!57812 e!510377))))

(declare-fun mapValue!30118 () ValueCell!8985)

(declare-fun mapRest!30118 () (Array (_ BitVec 32) ValueCell!8985))

(declare-fun mapKey!30118 () (_ BitVec 32))

(assert (=> mapNonEmpty!30118 (= (arr!25898 _values!1152) (store mapRest!30118 mapKey!30118 mapValue!30118))))

(declare-fun b!910301 () Bool)

(declare-fun e!510376 () Bool)

(assert (=> b!910301 (= e!510376 tp_is_empty!18933)))

(declare-fun b!910295 () Bool)

(declare-fun e!510375 () Bool)

(assert (=> b!910295 (= e!510375 (and e!510376 mapRes!30118))))

(declare-fun condMapEmpty!30118 () Bool)

(declare-fun mapDefault!30118 () ValueCell!8985)

(assert (=> b!910295 (= condMapEmpty!30118 (= (arr!25898 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8985)) mapDefault!30118)))))

(declare-fun res!614292 () Bool)

(assert (=> start!77972 (=> (not res!614292) (not e!510374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77972 (= res!614292 (validMask!0 mask!1756))))

(assert (=> start!77972 e!510374))

(declare-fun array_inv!20254 (array!53882) Bool)

(assert (=> start!77972 (and (array_inv!20254 _values!1152) e!510375)))

(assert (=> start!77972 tp!57813))

(assert (=> start!77972 true))

(assert (=> start!77972 tp_is_empty!18933))

(declare-fun array_inv!20255 (array!53884) Bool)

(assert (=> start!77972 (array_inv!20255 _keys!1386)))

(assert (= (and start!77972 res!614292) b!910296))

(assert (= (and b!910296 res!614291) b!910298))

(assert (= (and b!910298 res!614289) b!910299))

(assert (= (and b!910299 res!614290) b!910300))

(assert (= (and b!910295 condMapEmpty!30118) mapIsEmpty!30118))

(assert (= (and b!910295 (not condMapEmpty!30118)) mapNonEmpty!30118))

(get-info :version)

(assert (= (and mapNonEmpty!30118 ((_ is ValueCellFull!8985) mapValue!30118)) b!910297))

(assert (= (and b!910295 ((_ is ValueCellFull!8985) mapDefault!30118)) b!910301))

(assert (= start!77972 b!910295))

(declare-fun m!845333 () Bool)

(assert (=> mapNonEmpty!30118 m!845333))

(declare-fun m!845335 () Bool)

(assert (=> b!910298 m!845335))

(declare-fun m!845337 () Bool)

(assert (=> start!77972 m!845337))

(declare-fun m!845339 () Bool)

(assert (=> start!77972 m!845339))

(declare-fun m!845341 () Bool)

(assert (=> start!77972 m!845341))

(declare-fun m!845343 () Bool)

(assert (=> b!910299 m!845343))

(declare-fun m!845345 () Bool)

(assert (=> b!910300 m!845345))

(assert (=> b!910300 m!845345))

(declare-fun m!845347 () Bool)

(assert (=> b!910300 m!845347))

(check-sat (not b!910299) (not b_next!16515) (not b!910298) (not start!77972) (not b!910300) tp_is_empty!18933 b_and!27085 (not mapNonEmpty!30118))
(check-sat b_and!27085 (not b_next!16515))
