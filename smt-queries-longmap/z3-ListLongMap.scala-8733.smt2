; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105894 () Bool)

(assert start!105894)

(declare-fun b_free!27435 () Bool)

(declare-fun b_next!27435 () Bool)

(assert (=> start!105894 (= b_free!27435 (not b_next!27435))))

(declare-fun tp!95837 () Bool)

(declare-fun b_and!45343 () Bool)

(assert (=> start!105894 (= tp!95837 b_and!45343)))

(declare-fun b!1261315 () Bool)

(declare-fun e!717858 () Bool)

(declare-fun tp_is_empty!32337 () Bool)

(assert (=> b!1261315 (= e!717858 tp_is_empty!32337)))

(declare-fun b!1261316 () Bool)

(declare-fun e!717860 () Bool)

(assert (=> b!1261316 (= e!717860 tp_is_empty!32337)))

(declare-fun b!1261317 () Bool)

(declare-fun res!840503 () Bool)

(declare-fun e!717857 () Bool)

(assert (=> b!1261317 (=> (not res!840503) (not e!717857))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82288 0))(
  ( (array!82289 (arr!39697 (Array (_ BitVec 32) (_ BitVec 64))) (size!40233 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82288)

(declare-datatypes ((V!48481 0))(
  ( (V!48482 (val!16231 Int)) )
))
(declare-datatypes ((ValueCell!15405 0))(
  ( (ValueCellFull!15405 (v!18935 V!48481)) (EmptyCell!15405) )
))
(declare-datatypes ((array!82290 0))(
  ( (array!82291 (arr!39698 (Array (_ BitVec 32) ValueCell!15405)) (size!40234 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82290)

(assert (=> b!1261317 (= res!840503 (and (= (size!40234 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40233 _keys!1118) (size!40234 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50308 () Bool)

(declare-fun mapRes!50308 () Bool)

(assert (=> mapIsEmpty!50308 mapRes!50308))

(declare-fun res!840505 () Bool)

(assert (=> start!105894 (=> (not res!840505) (not e!717857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105894 (= res!840505 (validMask!0 mask!1466))))

(assert (=> start!105894 e!717857))

(assert (=> start!105894 true))

(assert (=> start!105894 tp!95837))

(assert (=> start!105894 tp_is_empty!32337))

(declare-fun array_inv!30223 (array!82288) Bool)

(assert (=> start!105894 (array_inv!30223 _keys!1118)))

(declare-fun e!717859 () Bool)

(declare-fun array_inv!30224 (array!82290) Bool)

(assert (=> start!105894 (and (array_inv!30224 _values!914) e!717859)))

(declare-fun b!1261318 () Bool)

(assert (=> b!1261318 (= e!717857 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48481)

(declare-fun zeroValue!871 () V!48481)

(declare-datatypes ((tuple2!21004 0))(
  ( (tuple2!21005 (_1!10513 (_ BitVec 64)) (_2!10513 V!48481)) )
))
(declare-datatypes ((List!28202 0))(
  ( (Nil!28199) (Cons!28198 (h!29407 tuple2!21004) (t!41701 List!28202)) )
))
(declare-datatypes ((ListLongMap!18877 0))(
  ( (ListLongMap!18878 (toList!9454 List!28202)) )
))
(declare-fun lt!571593 () ListLongMap!18877)

(declare-fun getCurrentListMapNoExtraKeys!5822 (array!82288 array!82290 (_ BitVec 32) (_ BitVec 32) V!48481 V!48481 (_ BitVec 32) Int) ListLongMap!18877)

(assert (=> b!1261318 (= lt!571593 (getCurrentListMapNoExtraKeys!5822 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571592 () ListLongMap!18877)

(declare-fun minValueBefore!43 () V!48481)

(assert (=> b!1261318 (= lt!571592 (getCurrentListMapNoExtraKeys!5822 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261319 () Bool)

(declare-fun res!840504 () Bool)

(assert (=> b!1261319 (=> (not res!840504) (not e!717857))))

(declare-datatypes ((List!28203 0))(
  ( (Nil!28200) (Cons!28199 (h!29408 (_ BitVec 64)) (t!41702 List!28203)) )
))
(declare-fun arrayNoDuplicates!0 (array!82288 (_ BitVec 32) List!28203) Bool)

(assert (=> b!1261319 (= res!840504 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28200))))

(declare-fun mapNonEmpty!50308 () Bool)

(declare-fun tp!95836 () Bool)

(assert (=> mapNonEmpty!50308 (= mapRes!50308 (and tp!95836 e!717858))))

(declare-fun mapRest!50308 () (Array (_ BitVec 32) ValueCell!15405))

(declare-fun mapValue!50308 () ValueCell!15405)

(declare-fun mapKey!50308 () (_ BitVec 32))

(assert (=> mapNonEmpty!50308 (= (arr!39698 _values!914) (store mapRest!50308 mapKey!50308 mapValue!50308))))

(declare-fun b!1261320 () Bool)

(declare-fun res!840502 () Bool)

(assert (=> b!1261320 (=> (not res!840502) (not e!717857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82288 (_ BitVec 32)) Bool)

(assert (=> b!1261320 (= res!840502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261321 () Bool)

(assert (=> b!1261321 (= e!717859 (and e!717860 mapRes!50308))))

(declare-fun condMapEmpty!50308 () Bool)

(declare-fun mapDefault!50308 () ValueCell!15405)

(assert (=> b!1261321 (= condMapEmpty!50308 (= (arr!39698 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15405)) mapDefault!50308)))))

(assert (= (and start!105894 res!840505) b!1261317))

(assert (= (and b!1261317 res!840503) b!1261320))

(assert (= (and b!1261320 res!840502) b!1261319))

(assert (= (and b!1261319 res!840504) b!1261318))

(assert (= (and b!1261321 condMapEmpty!50308) mapIsEmpty!50308))

(assert (= (and b!1261321 (not condMapEmpty!50308)) mapNonEmpty!50308))

(get-info :version)

(assert (= (and mapNonEmpty!50308 ((_ is ValueCellFull!15405) mapValue!50308)) b!1261315))

(assert (= (and b!1261321 ((_ is ValueCellFull!15405) mapDefault!50308)) b!1261316))

(assert (= start!105894 b!1261321))

(declare-fun m!1161969 () Bool)

(assert (=> b!1261318 m!1161969))

(declare-fun m!1161971 () Bool)

(assert (=> b!1261318 m!1161971))

(declare-fun m!1161973 () Bool)

(assert (=> mapNonEmpty!50308 m!1161973))

(declare-fun m!1161975 () Bool)

(assert (=> b!1261320 m!1161975))

(declare-fun m!1161977 () Bool)

(assert (=> start!105894 m!1161977))

(declare-fun m!1161979 () Bool)

(assert (=> start!105894 m!1161979))

(declare-fun m!1161981 () Bool)

(assert (=> start!105894 m!1161981))

(declare-fun m!1161983 () Bool)

(assert (=> b!1261319 m!1161983))

(check-sat (not b_next!27435) (not b!1261318) (not start!105894) b_and!45343 tp_is_empty!32337 (not mapNonEmpty!50308) (not b!1261320) (not b!1261319))
(check-sat b_and!45343 (not b_next!27435))
