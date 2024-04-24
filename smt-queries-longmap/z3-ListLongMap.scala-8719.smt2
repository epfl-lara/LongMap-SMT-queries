; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106010 () Bool)

(assert start!106010)

(declare-fun b_free!27349 () Bool)

(declare-fun b_next!27349 () Bool)

(assert (=> start!106010 (= b_free!27349 (not b_next!27349))))

(declare-fun tp!95575 () Bool)

(declare-fun b_and!45247 () Bool)

(assert (=> start!106010 (= tp!95575 b_and!45247)))

(declare-fun b!1261425 () Bool)

(declare-fun e!717838 () Bool)

(declare-fun e!717833 () Bool)

(declare-fun mapRes!50176 () Bool)

(assert (=> b!1261425 (= e!717838 (and e!717833 mapRes!50176))))

(declare-fun condMapEmpty!50176 () Bool)

(declare-datatypes ((V!48367 0))(
  ( (V!48368 (val!16188 Int)) )
))
(declare-datatypes ((ValueCell!15362 0))(
  ( (ValueCellFull!15362 (v!18887 V!48367)) (EmptyCell!15362) )
))
(declare-datatypes ((array!82173 0))(
  ( (array!82174 (arr!39636 (Array (_ BitVec 32) ValueCell!15362)) (size!40173 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82173)

(declare-fun mapDefault!50176 () ValueCell!15362)

(assert (=> b!1261425 (= condMapEmpty!50176 (= (arr!39636 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15362)) mapDefault!50176)))))

(declare-fun b!1261426 () Bool)

(declare-fun e!717835 () Bool)

(assert (=> b!1261426 (= e!717835 true)))

(declare-datatypes ((tuple2!20954 0))(
  ( (tuple2!20955 (_1!10488 (_ BitVec 64)) (_2!10488 V!48367)) )
))
(declare-datatypes ((List!28177 0))(
  ( (Nil!28174) (Cons!28173 (h!29391 tuple2!20954) (t!41666 List!28177)) )
))
(declare-datatypes ((ListLongMap!18835 0))(
  ( (ListLongMap!18836 (toList!9433 List!28177)) )
))
(declare-fun lt!571256 () ListLongMap!18835)

(declare-fun lt!571250 () ListLongMap!18835)

(declare-fun -!2100 (ListLongMap!18835 (_ BitVec 64)) ListLongMap!18835)

(assert (=> b!1261426 (= lt!571256 (-!2100 lt!571250 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571254 () ListLongMap!18835)

(declare-fun lt!571255 () ListLongMap!18835)

(assert (=> b!1261426 (= (-!2100 lt!571254 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571255)))

(declare-datatypes ((Unit!42002 0))(
  ( (Unit!42003) )
))
(declare-fun lt!571248 () Unit!42002)

(declare-fun minValueBefore!43 () V!48367)

(declare-fun addThenRemoveForNewKeyIsSame!354 (ListLongMap!18835 (_ BitVec 64) V!48367) Unit!42002)

(assert (=> b!1261426 (= lt!571248 (addThenRemoveForNewKeyIsSame!354 lt!571255 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717837 () Bool)

(assert (=> b!1261426 e!717837))

(declare-fun res!840319 () Bool)

(assert (=> b!1261426 (=> (not res!840319) (not e!717837))))

(assert (=> b!1261426 (= res!840319 (= lt!571250 lt!571254))))

(declare-fun +!4272 (ListLongMap!18835 tuple2!20954) ListLongMap!18835)

(assert (=> b!1261426 (= lt!571254 (+!4272 lt!571255 (tuple2!20955 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571249 () ListLongMap!18835)

(declare-fun lt!571247 () tuple2!20954)

(assert (=> b!1261426 (= lt!571255 (+!4272 lt!571249 lt!571247))))

(declare-fun zeroValue!871 () V!48367)

(assert (=> b!1261426 (= lt!571247 (tuple2!20955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun lt!571251 () ListLongMap!18835)

(declare-fun minValueAfter!43 () V!48367)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82175 0))(
  ( (array!82176 (arr!39637 (Array (_ BitVec 32) (_ BitVec 64))) (size!40174 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82175)

(declare-fun getCurrentListMap!4612 (array!82175 array!82173 (_ BitVec 32) (_ BitVec 32) V!48367 V!48367 (_ BitVec 32) Int) ListLongMap!18835)

(assert (=> b!1261426 (= lt!571251 (getCurrentListMap!4612 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261426 (= lt!571250 (getCurrentListMap!4612 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261427 () Bool)

(declare-fun tp_is_empty!32251 () Bool)

(assert (=> b!1261427 (= e!717833 tp_is_empty!32251)))

(declare-fun res!840317 () Bool)

(declare-fun e!717834 () Bool)

(assert (=> start!106010 (=> (not res!840317) (not e!717834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106010 (= res!840317 (validMask!0 mask!1466))))

(assert (=> start!106010 e!717834))

(assert (=> start!106010 true))

(assert (=> start!106010 tp!95575))

(assert (=> start!106010 tp_is_empty!32251))

(declare-fun array_inv!30319 (array!82175) Bool)

(assert (=> start!106010 (array_inv!30319 _keys!1118)))

(declare-fun array_inv!30320 (array!82173) Bool)

(assert (=> start!106010 (and (array_inv!30320 _values!914) e!717838)))

(declare-fun b!1261428 () Bool)

(declare-fun res!840320 () Bool)

(assert (=> b!1261428 (=> (not res!840320) (not e!717834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82175 (_ BitVec 32)) Bool)

(assert (=> b!1261428 (= res!840320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261429 () Bool)

(declare-fun lt!571253 () ListLongMap!18835)

(assert (=> b!1261429 (= e!717837 (= lt!571251 (+!4272 lt!571253 lt!571247)))))

(declare-fun b!1261430 () Bool)

(declare-fun e!717836 () Bool)

(assert (=> b!1261430 (= e!717836 tp_is_empty!32251)))

(declare-fun b!1261431 () Bool)

(declare-fun res!840316 () Bool)

(assert (=> b!1261431 (=> (not res!840316) (not e!717834))))

(declare-datatypes ((List!28178 0))(
  ( (Nil!28175) (Cons!28174 (h!29392 (_ BitVec 64)) (t!41667 List!28178)) )
))
(declare-fun arrayNoDuplicates!0 (array!82175 (_ BitVec 32) List!28178) Bool)

(assert (=> b!1261431 (= res!840316 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28175))))

(declare-fun mapIsEmpty!50176 () Bool)

(assert (=> mapIsEmpty!50176 mapRes!50176))

(declare-fun b!1261432 () Bool)

(declare-fun res!840321 () Bool)

(assert (=> b!1261432 (=> (not res!840321) (not e!717834))))

(assert (=> b!1261432 (= res!840321 (and (= (size!40173 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40174 _keys!1118) (size!40173 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50176 () Bool)

(declare-fun tp!95576 () Bool)

(assert (=> mapNonEmpty!50176 (= mapRes!50176 (and tp!95576 e!717836))))

(declare-fun mapRest!50176 () (Array (_ BitVec 32) ValueCell!15362))

(declare-fun mapKey!50176 () (_ BitVec 32))

(declare-fun mapValue!50176 () ValueCell!15362)

(assert (=> mapNonEmpty!50176 (= (arr!39636 _values!914) (store mapRest!50176 mapKey!50176 mapValue!50176))))

(declare-fun b!1261433 () Bool)

(assert (=> b!1261433 (= e!717834 (not e!717835))))

(declare-fun res!840318 () Bool)

(assert (=> b!1261433 (=> res!840318 e!717835)))

(assert (=> b!1261433 (= res!840318 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1261433 (= lt!571249 lt!571253)))

(declare-fun lt!571252 () Unit!42002)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1155 (array!82175 array!82173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48367 V!48367 V!48367 V!48367 (_ BitVec 32) Int) Unit!42002)

(assert (=> b!1261433 (= lt!571252 (lemmaNoChangeToArrayThenSameMapNoExtras!1155 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5841 (array!82175 array!82173 (_ BitVec 32) (_ BitVec 32) V!48367 V!48367 (_ BitVec 32) Int) ListLongMap!18835)

(assert (=> b!1261433 (= lt!571253 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261433 (= lt!571249 (getCurrentListMapNoExtraKeys!5841 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!106010 res!840317) b!1261432))

(assert (= (and b!1261432 res!840321) b!1261428))

(assert (= (and b!1261428 res!840320) b!1261431))

(assert (= (and b!1261431 res!840316) b!1261433))

(assert (= (and b!1261433 (not res!840318)) b!1261426))

(assert (= (and b!1261426 res!840319) b!1261429))

(assert (= (and b!1261425 condMapEmpty!50176) mapIsEmpty!50176))

(assert (= (and b!1261425 (not condMapEmpty!50176)) mapNonEmpty!50176))

(get-info :version)

(assert (= (and mapNonEmpty!50176 ((_ is ValueCellFull!15362) mapValue!50176)) b!1261430))

(assert (= (and b!1261425 ((_ is ValueCellFull!15362) mapDefault!50176)) b!1261427))

(assert (= start!106010 b!1261425))

(declare-fun m!1162355 () Bool)

(assert (=> b!1261431 m!1162355))

(declare-fun m!1162357 () Bool)

(assert (=> b!1261429 m!1162357))

(declare-fun m!1162359 () Bool)

(assert (=> b!1261428 m!1162359))

(declare-fun m!1162361 () Bool)

(assert (=> start!106010 m!1162361))

(declare-fun m!1162363 () Bool)

(assert (=> start!106010 m!1162363))

(declare-fun m!1162365 () Bool)

(assert (=> start!106010 m!1162365))

(declare-fun m!1162367 () Bool)

(assert (=> b!1261426 m!1162367))

(declare-fun m!1162369 () Bool)

(assert (=> b!1261426 m!1162369))

(declare-fun m!1162371 () Bool)

(assert (=> b!1261426 m!1162371))

(declare-fun m!1162373 () Bool)

(assert (=> b!1261426 m!1162373))

(declare-fun m!1162375 () Bool)

(assert (=> b!1261426 m!1162375))

(declare-fun m!1162377 () Bool)

(assert (=> b!1261426 m!1162377))

(declare-fun m!1162379 () Bool)

(assert (=> b!1261426 m!1162379))

(declare-fun m!1162381 () Bool)

(assert (=> mapNonEmpty!50176 m!1162381))

(declare-fun m!1162383 () Bool)

(assert (=> b!1261433 m!1162383))

(declare-fun m!1162385 () Bool)

(assert (=> b!1261433 m!1162385))

(declare-fun m!1162387 () Bool)

(assert (=> b!1261433 m!1162387))

(check-sat (not b!1261429) (not b!1261431) (not b!1261426) (not start!106010) b_and!45247 tp_is_empty!32251 (not b!1261433) (not b!1261428) (not mapNonEmpty!50176) (not b_next!27349))
(check-sat b_and!45247 (not b_next!27349))
