; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106116 () Bool)

(assert start!106116)

(declare-fun b_free!27433 () Bool)

(declare-fun b_next!27433 () Bool)

(assert (=> start!106116 (= b_free!27433 (not b_next!27433))))

(declare-fun tp!95831 () Bool)

(declare-fun b_and!45343 () Bool)

(assert (=> start!106116 (= tp!95831 b_and!45343)))

(declare-fun mapIsEmpty!50305 () Bool)

(declare-fun mapRes!50305 () Bool)

(assert (=> mapIsEmpty!50305 mapRes!50305))

(declare-fun b!1262599 () Bool)

(declare-fun res!841012 () Bool)

(declare-fun e!718691 () Bool)

(assert (=> b!1262599 (=> (not res!841012) (not e!718691))))

(declare-datatypes ((array!82331 0))(
  ( (array!82332 (arr!39714 (Array (_ BitVec 32) (_ BitVec 64))) (size!40251 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82331)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82331 (_ BitVec 32)) Bool)

(assert (=> b!1262599 (= res!841012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262600 () Bool)

(declare-fun e!718689 () Bool)

(declare-fun e!718690 () Bool)

(assert (=> b!1262600 (= e!718689 (and e!718690 mapRes!50305))))

(declare-fun condMapEmpty!50305 () Bool)

(declare-datatypes ((V!48479 0))(
  ( (V!48480 (val!16230 Int)) )
))
(declare-datatypes ((ValueCell!15404 0))(
  ( (ValueCellFull!15404 (v!18930 V!48479)) (EmptyCell!15404) )
))
(declare-datatypes ((array!82333 0))(
  ( (array!82334 (arr!39715 (Array (_ BitVec 32) ValueCell!15404)) (size!40252 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82333)

(declare-fun mapDefault!50305 () ValueCell!15404)

(assert (=> b!1262600 (= condMapEmpty!50305 (= (arr!39715 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15404)) mapDefault!50305)))))

(declare-fun b!1262601 () Bool)

(declare-fun e!718688 () Bool)

(declare-fun tp_is_empty!32335 () Bool)

(assert (=> b!1262601 (= e!718688 tp_is_empty!32335)))

(declare-fun res!841011 () Bool)

(assert (=> start!106116 (=> (not res!841011) (not e!718691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106116 (= res!841011 (validMask!0 mask!1466))))

(assert (=> start!106116 e!718691))

(assert (=> start!106116 true))

(assert (=> start!106116 tp!95831))

(assert (=> start!106116 tp_is_empty!32335))

(declare-fun array_inv!30383 (array!82331) Bool)

(assert (=> start!106116 (array_inv!30383 _keys!1118)))

(declare-fun array_inv!30384 (array!82333) Bool)

(assert (=> start!106116 (and (array_inv!30384 _values!914) e!718689)))

(declare-fun mapNonEmpty!50305 () Bool)

(declare-fun tp!95830 () Bool)

(assert (=> mapNonEmpty!50305 (= mapRes!50305 (and tp!95830 e!718688))))

(declare-fun mapRest!50305 () (Array (_ BitVec 32) ValueCell!15404))

(declare-fun mapValue!50305 () ValueCell!15404)

(declare-fun mapKey!50305 () (_ BitVec 32))

(assert (=> mapNonEmpty!50305 (= (arr!39715 _values!914) (store mapRest!50305 mapKey!50305 mapValue!50305))))

(declare-fun b!1262602 () Bool)

(declare-fun res!841013 () Bool)

(assert (=> b!1262602 (=> (not res!841013) (not e!718691))))

(declare-datatypes ((List!28238 0))(
  ( (Nil!28235) (Cons!28234 (h!29452 (_ BitVec 64)) (t!41729 List!28238)) )
))
(declare-fun arrayNoDuplicates!0 (array!82331 (_ BitVec 32) List!28238) Bool)

(assert (=> b!1262602 (= res!841013 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28235))))

(declare-fun b!1262603 () Bool)

(declare-fun res!841010 () Bool)

(assert (=> b!1262603 (=> (not res!841010) (not e!718691))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1262603 (= res!841010 (and (= (size!40252 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40251 _keys!1118) (size!40252 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262604 () Bool)

(assert (=> b!1262604 (= e!718690 tp_is_empty!32335)))

(declare-fun b!1262605 () Bool)

(assert (=> b!1262605 (= e!718691 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48479)

(declare-fun zeroValue!871 () V!48479)

(declare-datatypes ((tuple2!21016 0))(
  ( (tuple2!21017 (_1!10519 (_ BitVec 64)) (_2!10519 V!48479)) )
))
(declare-datatypes ((List!28239 0))(
  ( (Nil!28236) (Cons!28235 (h!29453 tuple2!21016) (t!41730 List!28239)) )
))
(declare-datatypes ((ListLongMap!18897 0))(
  ( (ListLongMap!18898 (toList!9464 List!28239)) )
))
(declare-fun lt!572070 () ListLongMap!18897)

(declare-fun getCurrentListMapNoExtraKeys!5870 (array!82331 array!82333 (_ BitVec 32) (_ BitVec 32) V!48479 V!48479 (_ BitVec 32) Int) ListLongMap!18897)

(assert (=> b!1262605 (= lt!572070 (getCurrentListMapNoExtraKeys!5870 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572071 () ListLongMap!18897)

(declare-fun minValueBefore!43 () V!48479)

(assert (=> b!1262605 (= lt!572071 (getCurrentListMapNoExtraKeys!5870 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!106116 res!841011) b!1262603))

(assert (= (and b!1262603 res!841010) b!1262599))

(assert (= (and b!1262599 res!841012) b!1262602))

(assert (= (and b!1262602 res!841013) b!1262605))

(assert (= (and b!1262600 condMapEmpty!50305) mapIsEmpty!50305))

(assert (= (and b!1262600 (not condMapEmpty!50305)) mapNonEmpty!50305))

(get-info :version)

(assert (= (and mapNonEmpty!50305 ((_ is ValueCellFull!15404) mapValue!50305)) b!1262601))

(assert (= (and b!1262600 ((_ is ValueCellFull!15404) mapDefault!50305)) b!1262604))

(assert (= start!106116 b!1262600))

(declare-fun m!1163565 () Bool)

(assert (=> start!106116 m!1163565))

(declare-fun m!1163567 () Bool)

(assert (=> start!106116 m!1163567))

(declare-fun m!1163569 () Bool)

(assert (=> start!106116 m!1163569))

(declare-fun m!1163571 () Bool)

(assert (=> mapNonEmpty!50305 m!1163571))

(declare-fun m!1163573 () Bool)

(assert (=> b!1262602 m!1163573))

(declare-fun m!1163575 () Bool)

(assert (=> b!1262605 m!1163575))

(declare-fun m!1163577 () Bool)

(assert (=> b!1262605 m!1163577))

(declare-fun m!1163579 () Bool)

(assert (=> b!1262599 m!1163579))

(check-sat (not b!1262599) (not mapNonEmpty!50305) (not b!1262602) (not b_next!27433) (not b!1262605) b_and!45343 (not start!106116) tp_is_empty!32335)
(check-sat b_and!45343 (not b_next!27433))
