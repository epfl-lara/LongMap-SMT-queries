; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105348 () Bool)

(assert start!105348)

(declare-fun b_free!27021 () Bool)

(declare-fun b_next!27021 () Bool)

(assert (=> start!105348 (= b_free!27021 (not b_next!27021))))

(declare-fun tp!94573 () Bool)

(declare-fun b_and!44859 () Bool)

(assert (=> start!105348 (= tp!94573 b_and!44859)))

(declare-fun b!1255204 () Bool)

(declare-fun res!836850 () Bool)

(declare-fun e!713349 () Bool)

(assert (=> b!1255204 (=> (not res!836850) (not e!713349))))

(declare-datatypes ((array!81492 0))(
  ( (array!81493 (arr!39306 (Array (_ BitVec 32) (_ BitVec 64))) (size!39842 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81492)

(declare-datatypes ((List!27914 0))(
  ( (Nil!27911) (Cons!27910 (h!29119 (_ BitVec 64)) (t!41399 List!27914)) )
))
(declare-fun arrayNoDuplicates!0 (array!81492 (_ BitVec 32) List!27914) Bool)

(assert (=> b!1255204 (= res!836850 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27911))))

(declare-fun res!836848 () Bool)

(assert (=> start!105348 (=> (not res!836848) (not e!713349))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105348 (= res!836848 (validMask!0 mask!1466))))

(assert (=> start!105348 e!713349))

(assert (=> start!105348 true))

(assert (=> start!105348 tp!94573))

(declare-fun tp_is_empty!31923 () Bool)

(assert (=> start!105348 tp_is_empty!31923))

(declare-fun array_inv!29955 (array!81492) Bool)

(assert (=> start!105348 (array_inv!29955 _keys!1118)))

(declare-datatypes ((V!47929 0))(
  ( (V!47930 (val!16024 Int)) )
))
(declare-datatypes ((ValueCell!15198 0))(
  ( (ValueCellFull!15198 (v!18724 V!47929)) (EmptyCell!15198) )
))
(declare-datatypes ((array!81494 0))(
  ( (array!81495 (arr!39307 (Array (_ BitVec 32) ValueCell!15198)) (size!39843 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81494)

(declare-fun e!713350 () Bool)

(declare-fun array_inv!29956 (array!81494) Bool)

(assert (=> start!105348 (and (array_inv!29956 _values!914) e!713350)))

(declare-fun b!1255205 () Bool)

(assert (=> b!1255205 (= e!713349 (not true))))

(declare-datatypes ((tuple2!20692 0))(
  ( (tuple2!20693 (_1!10357 (_ BitVec 64)) (_2!10357 V!47929)) )
))
(declare-datatypes ((List!27915 0))(
  ( (Nil!27912) (Cons!27911 (h!29120 tuple2!20692) (t!41400 List!27915)) )
))
(declare-datatypes ((ListLongMap!18565 0))(
  ( (ListLongMap!18566 (toList!9298 List!27915)) )
))
(declare-fun lt!567478 () ListLongMap!18565)

(declare-fun lt!567479 () ListLongMap!18565)

(assert (=> b!1255205 (= lt!567478 lt!567479)))

(declare-fun minValueAfter!43 () V!47929)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47929)

(declare-fun minValueBefore!43 () V!47929)

(declare-datatypes ((Unit!41782 0))(
  ( (Unit!41783) )
))
(declare-fun lt!567480 () Unit!41782)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1047 (array!81492 array!81494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47929 V!47929 V!47929 V!47929 (_ BitVec 32) Int) Unit!41782)

(assert (=> b!1255205 (= lt!567480 (lemmaNoChangeToArrayThenSameMapNoExtras!1047 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5683 (array!81492 array!81494 (_ BitVec 32) (_ BitVec 32) V!47929 V!47929 (_ BitVec 32) Int) ListLongMap!18565)

(assert (=> b!1255205 (= lt!567479 (getCurrentListMapNoExtraKeys!5683 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255205 (= lt!567478 (getCurrentListMapNoExtraKeys!5683 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255206 () Bool)

(declare-fun e!713351 () Bool)

(assert (=> b!1255206 (= e!713351 tp_is_empty!31923)))

(declare-fun b!1255207 () Bool)

(declare-fun res!836849 () Bool)

(assert (=> b!1255207 (=> (not res!836849) (not e!713349))))

(assert (=> b!1255207 (= res!836849 (and (= (size!39843 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39842 _keys!1118) (size!39843 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49666 () Bool)

(declare-fun mapRes!49666 () Bool)

(declare-fun tp!94574 () Bool)

(declare-fun e!713353 () Bool)

(assert (=> mapNonEmpty!49666 (= mapRes!49666 (and tp!94574 e!713353))))

(declare-fun mapValue!49666 () ValueCell!15198)

(declare-fun mapKey!49666 () (_ BitVec 32))

(declare-fun mapRest!49666 () (Array (_ BitVec 32) ValueCell!15198))

(assert (=> mapNonEmpty!49666 (= (arr!39307 _values!914) (store mapRest!49666 mapKey!49666 mapValue!49666))))

(declare-fun mapIsEmpty!49666 () Bool)

(assert (=> mapIsEmpty!49666 mapRes!49666))

(declare-fun b!1255208 () Bool)

(assert (=> b!1255208 (= e!713353 tp_is_empty!31923)))

(declare-fun b!1255209 () Bool)

(assert (=> b!1255209 (= e!713350 (and e!713351 mapRes!49666))))

(declare-fun condMapEmpty!49666 () Bool)

(declare-fun mapDefault!49666 () ValueCell!15198)

(assert (=> b!1255209 (= condMapEmpty!49666 (= (arr!39307 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15198)) mapDefault!49666)))))

(declare-fun b!1255210 () Bool)

(declare-fun res!836851 () Bool)

(assert (=> b!1255210 (=> (not res!836851) (not e!713349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81492 (_ BitVec 32)) Bool)

(assert (=> b!1255210 (= res!836851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105348 res!836848) b!1255207))

(assert (= (and b!1255207 res!836849) b!1255210))

(assert (= (and b!1255210 res!836851) b!1255204))

(assert (= (and b!1255204 res!836850) b!1255205))

(assert (= (and b!1255209 condMapEmpty!49666) mapIsEmpty!49666))

(assert (= (and b!1255209 (not condMapEmpty!49666)) mapNonEmpty!49666))

(get-info :version)

(assert (= (and mapNonEmpty!49666 ((_ is ValueCellFull!15198) mapValue!49666)) b!1255208))

(assert (= (and b!1255209 ((_ is ValueCellFull!15198) mapDefault!49666)) b!1255206))

(assert (= start!105348 b!1255209))

(declare-fun m!1155977 () Bool)

(assert (=> b!1255205 m!1155977))

(declare-fun m!1155979 () Bool)

(assert (=> b!1255205 m!1155979))

(declare-fun m!1155981 () Bool)

(assert (=> b!1255205 m!1155981))

(declare-fun m!1155983 () Bool)

(assert (=> start!105348 m!1155983))

(declare-fun m!1155985 () Bool)

(assert (=> start!105348 m!1155985))

(declare-fun m!1155987 () Bool)

(assert (=> start!105348 m!1155987))

(declare-fun m!1155989 () Bool)

(assert (=> b!1255210 m!1155989))

(declare-fun m!1155991 () Bool)

(assert (=> mapNonEmpty!49666 m!1155991))

(declare-fun m!1155993 () Bool)

(assert (=> b!1255204 m!1155993))

(check-sat tp_is_empty!31923 (not b!1255210) (not b!1255205) b_and!44859 (not b!1255204) (not mapNonEmpty!49666) (not b_next!27021) (not start!105348))
(check-sat b_and!44859 (not b_next!27021))
