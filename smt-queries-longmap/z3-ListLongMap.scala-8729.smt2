; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105864 () Bool)

(assert start!105864)

(declare-fun b_free!27409 () Bool)

(declare-fun b_next!27409 () Bool)

(assert (=> start!105864 (= b_free!27409 (not b_next!27409))))

(declare-fun tp!95759 () Bool)

(declare-fun b_and!45299 () Bool)

(assert (=> start!105864 (= tp!95759 b_and!45299)))

(declare-fun b!1260960 () Bool)

(declare-fun e!717618 () Bool)

(declare-fun tp_is_empty!32311 () Bool)

(assert (=> b!1260960 (= e!717618 tp_is_empty!32311)))

(declare-fun res!840306 () Bool)

(declare-fun e!717617 () Bool)

(assert (=> start!105864 (=> (not res!840306) (not e!717617))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105864 (= res!840306 (validMask!0 mask!1466))))

(assert (=> start!105864 e!717617))

(assert (=> start!105864 true))

(assert (=> start!105864 tp!95759))

(assert (=> start!105864 tp_is_empty!32311))

(declare-datatypes ((array!82163 0))(
  ( (array!82164 (arr!39635 (Array (_ BitVec 32) (_ BitVec 64))) (size!40173 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82163)

(declare-fun array_inv!30323 (array!82163) Bool)

(assert (=> start!105864 (array_inv!30323 _keys!1118)))

(declare-datatypes ((V!48447 0))(
  ( (V!48448 (val!16218 Int)) )
))
(declare-datatypes ((ValueCell!15392 0))(
  ( (ValueCellFull!15392 (v!18921 V!48447)) (EmptyCell!15392) )
))
(declare-datatypes ((array!82165 0))(
  ( (array!82166 (arr!39636 (Array (_ BitVec 32) ValueCell!15392)) (size!40174 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82165)

(declare-fun e!717616 () Bool)

(declare-fun array_inv!30324 (array!82165) Bool)

(assert (=> start!105864 (and (array_inv!30324 _values!914) e!717616)))

(declare-fun b!1260961 () Bool)

(declare-fun e!717619 () Bool)

(declare-fun mapRes!50269 () Bool)

(assert (=> b!1260961 (= e!717616 (and e!717619 mapRes!50269))))

(declare-fun condMapEmpty!50269 () Bool)

(declare-fun mapDefault!50269 () ValueCell!15392)

(assert (=> b!1260961 (= condMapEmpty!50269 (= (arr!39636 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15392)) mapDefault!50269)))))

(declare-fun b!1260962 () Bool)

(assert (=> b!1260962 (= e!717619 tp_is_empty!32311)))

(declare-fun mapIsEmpty!50269 () Bool)

(assert (=> mapIsEmpty!50269 mapRes!50269))

(declare-fun b!1260963 () Bool)

(declare-fun res!840309 () Bool)

(assert (=> b!1260963 (=> (not res!840309) (not e!717617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82163 (_ BitVec 32)) Bool)

(assert (=> b!1260963 (= res!840309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260964 () Bool)

(declare-fun res!840307 () Bool)

(assert (=> b!1260964 (=> (not res!840307) (not e!717617))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1260964 (= res!840307 (and (= (size!40174 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40173 _keys!1118) (size!40174 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260965 () Bool)

(assert (=> b!1260965 (= e!717617 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48447)

(declare-fun zeroValue!871 () V!48447)

(declare-datatypes ((tuple2!21058 0))(
  ( (tuple2!21059 (_1!10540 (_ BitVec 64)) (_2!10540 V!48447)) )
))
(declare-datatypes ((List!28259 0))(
  ( (Nil!28256) (Cons!28255 (h!29464 tuple2!21058) (t!41749 List!28259)) )
))
(declare-datatypes ((ListLongMap!18931 0))(
  ( (ListLongMap!18932 (toList!9481 List!28259)) )
))
(declare-fun lt!571335 () ListLongMap!18931)

(declare-fun getCurrentListMapNoExtraKeys!5850 (array!82163 array!82165 (_ BitVec 32) (_ BitVec 32) V!48447 V!48447 (_ BitVec 32) Int) ListLongMap!18931)

(assert (=> b!1260965 (= lt!571335 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48447)

(declare-fun lt!571336 () ListLongMap!18931)

(assert (=> b!1260965 (= lt!571336 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260966 () Bool)

(declare-fun res!840308 () Bool)

(assert (=> b!1260966 (=> (not res!840308) (not e!717617))))

(declare-datatypes ((List!28260 0))(
  ( (Nil!28257) (Cons!28256 (h!29465 (_ BitVec 64)) (t!41750 List!28260)) )
))
(declare-fun arrayNoDuplicates!0 (array!82163 (_ BitVec 32) List!28260) Bool)

(assert (=> b!1260966 (= res!840308 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28257))))

(declare-fun mapNonEmpty!50269 () Bool)

(declare-fun tp!95758 () Bool)

(assert (=> mapNonEmpty!50269 (= mapRes!50269 (and tp!95758 e!717618))))

(declare-fun mapRest!50269 () (Array (_ BitVec 32) ValueCell!15392))

(declare-fun mapValue!50269 () ValueCell!15392)

(declare-fun mapKey!50269 () (_ BitVec 32))

(assert (=> mapNonEmpty!50269 (= (arr!39636 _values!914) (store mapRest!50269 mapKey!50269 mapValue!50269))))

(assert (= (and start!105864 res!840306) b!1260964))

(assert (= (and b!1260964 res!840307) b!1260963))

(assert (= (and b!1260963 res!840309) b!1260966))

(assert (= (and b!1260966 res!840308) b!1260965))

(assert (= (and b!1260961 condMapEmpty!50269) mapIsEmpty!50269))

(assert (= (and b!1260961 (not condMapEmpty!50269)) mapNonEmpty!50269))

(get-info :version)

(assert (= (and mapNonEmpty!50269 ((_ is ValueCellFull!15392) mapValue!50269)) b!1260960))

(assert (= (and b!1260961 ((_ is ValueCellFull!15392) mapDefault!50269)) b!1260962))

(assert (= start!105864 b!1260961))

(declare-fun m!1161241 () Bool)

(assert (=> b!1260963 m!1161241))

(declare-fun m!1161243 () Bool)

(assert (=> start!105864 m!1161243))

(declare-fun m!1161245 () Bool)

(assert (=> start!105864 m!1161245))

(declare-fun m!1161247 () Bool)

(assert (=> start!105864 m!1161247))

(declare-fun m!1161249 () Bool)

(assert (=> b!1260966 m!1161249))

(declare-fun m!1161251 () Bool)

(assert (=> mapNonEmpty!50269 m!1161251))

(declare-fun m!1161253 () Bool)

(assert (=> b!1260965 m!1161253))

(declare-fun m!1161255 () Bool)

(assert (=> b!1260965 m!1161255))

(check-sat tp_is_empty!32311 b_and!45299 (not b!1260965) (not b!1260963) (not start!105864) (not mapNonEmpty!50269) (not b!1260966) (not b_next!27409))
(check-sat b_and!45299 (not b_next!27409))
