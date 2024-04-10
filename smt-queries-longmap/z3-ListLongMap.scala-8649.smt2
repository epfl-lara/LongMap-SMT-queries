; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105214 () Bool)

(assert start!105214)

(declare-fun b_free!26931 () Bool)

(declare-fun b_next!26931 () Bool)

(assert (=> start!105214 (= b_free!26931 (not b_next!26931))))

(declare-fun tp!94297 () Bool)

(declare-fun b_and!44745 () Bool)

(assert (=> start!105214 (= tp!94297 b_and!44745)))

(declare-fun res!836050 () Bool)

(declare-fun e!712347 () Bool)

(assert (=> start!105214 (=> (not res!836050) (not e!712347))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105214 (= res!836050 (validMask!0 mask!1466))))

(assert (=> start!105214 e!712347))

(assert (=> start!105214 true))

(assert (=> start!105214 tp!94297))

(declare-fun tp_is_empty!31833 () Bool)

(assert (=> start!105214 tp_is_empty!31833))

(declare-datatypes ((array!81322 0))(
  ( (array!81323 (arr!39223 (Array (_ BitVec 32) (_ BitVec 64))) (size!39759 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81322)

(declare-fun array_inv!29901 (array!81322) Bool)

(assert (=> start!105214 (array_inv!29901 _keys!1118)))

(declare-datatypes ((V!47809 0))(
  ( (V!47810 (val!15979 Int)) )
))
(declare-datatypes ((ValueCell!15153 0))(
  ( (ValueCellFull!15153 (v!18677 V!47809)) (EmptyCell!15153) )
))
(declare-datatypes ((array!81324 0))(
  ( (array!81325 (arr!39224 (Array (_ BitVec 32) ValueCell!15153)) (size!39760 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81324)

(declare-fun e!712343 () Bool)

(declare-fun array_inv!29902 (array!81324) Bool)

(assert (=> start!105214 (and (array_inv!29902 _values!914) e!712343)))

(declare-fun mapIsEmpty!49525 () Bool)

(declare-fun mapRes!49525 () Bool)

(assert (=> mapIsEmpty!49525 mapRes!49525))

(declare-fun b!1253797 () Bool)

(declare-fun res!836053 () Bool)

(assert (=> b!1253797 (=> (not res!836053) (not e!712347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81322 (_ BitVec 32)) Bool)

(assert (=> b!1253797 (= res!836053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253798 () Bool)

(declare-fun res!836051 () Bool)

(assert (=> b!1253798 (=> (not res!836051) (not e!712347))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253798 (= res!836051 (and (= (size!39760 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39759 _keys!1118) (size!39760 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253799 () Bool)

(declare-fun e!712345 () Bool)

(assert (=> b!1253799 (= e!712347 (not e!712345))))

(declare-fun res!836054 () Bool)

(assert (=> b!1253799 (=> res!836054 e!712345)))

(assert (=> b!1253799 (= res!836054 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20624 0))(
  ( (tuple2!20625 (_1!10323 (_ BitVec 64)) (_2!10323 V!47809)) )
))
(declare-datatypes ((List!27852 0))(
  ( (Nil!27849) (Cons!27848 (h!29057 tuple2!20624) (t!41333 List!27852)) )
))
(declare-datatypes ((ListLongMap!18497 0))(
  ( (ListLongMap!18498 (toList!9264 List!27852)) )
))
(declare-fun lt!566328 () ListLongMap!18497)

(declare-fun lt!566334 () ListLongMap!18497)

(assert (=> b!1253799 (= lt!566328 lt!566334)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueBefore!43 () V!47809)

(declare-fun minValueAfter!43 () V!47809)

(declare-datatypes ((Unit!41710 0))(
  ( (Unit!41711) )
))
(declare-fun lt!566329 () Unit!41710)

(declare-fun zeroValue!871 () V!47809)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1017 (array!81322 array!81324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47809 V!47809 V!47809 V!47809 (_ BitVec 32) Int) Unit!41710)

(assert (=> b!1253799 (= lt!566329 (lemmaNoChangeToArrayThenSameMapNoExtras!1017 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5653 (array!81322 array!81324 (_ BitVec 32) (_ BitVec 32) V!47809 V!47809 (_ BitVec 32) Int) ListLongMap!18497)

(assert (=> b!1253799 (= lt!566334 (getCurrentListMapNoExtraKeys!5653 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253799 (= lt!566328 (getCurrentListMapNoExtraKeys!5653 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253800 () Bool)

(declare-fun e!712346 () Bool)

(assert (=> b!1253800 (= e!712343 (and e!712346 mapRes!49525))))

(declare-fun condMapEmpty!49525 () Bool)

(declare-fun mapDefault!49525 () ValueCell!15153)

(assert (=> b!1253800 (= condMapEmpty!49525 (= (arr!39224 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15153)) mapDefault!49525)))))

(declare-fun b!1253801 () Bool)

(assert (=> b!1253801 (= e!712345 true)))

(declare-fun lt!566333 () ListLongMap!18497)

(declare-fun lt!566332 () ListLongMap!18497)

(declare-fun -!2037 (ListLongMap!18497 (_ BitVec 64)) ListLongMap!18497)

(assert (=> b!1253801 (= lt!566333 (-!2037 lt!566332 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566331 () ListLongMap!18497)

(assert (=> b!1253801 (= (-!2037 lt!566331 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566328)))

(declare-fun lt!566327 () Unit!41710)

(declare-fun addThenRemoveForNewKeyIsSame!307 (ListLongMap!18497 (_ BitVec 64) V!47809) Unit!41710)

(assert (=> b!1253801 (= lt!566327 (addThenRemoveForNewKeyIsSame!307 lt!566328 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566330 () ListLongMap!18497)

(assert (=> b!1253801 (and (= lt!566332 lt!566331) (= lt!566330 lt!566334))))

(declare-fun +!4160 (ListLongMap!18497 tuple2!20624) ListLongMap!18497)

(assert (=> b!1253801 (= lt!566331 (+!4160 lt!566328 (tuple2!20625 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4508 (array!81322 array!81324 (_ BitVec 32) (_ BitVec 32) V!47809 V!47809 (_ BitVec 32) Int) ListLongMap!18497)

(assert (=> b!1253801 (= lt!566330 (getCurrentListMap!4508 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253801 (= lt!566332 (getCurrentListMap!4508 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253802 () Bool)

(declare-fun e!712344 () Bool)

(assert (=> b!1253802 (= e!712344 tp_is_empty!31833)))

(declare-fun b!1253803 () Bool)

(assert (=> b!1253803 (= e!712346 tp_is_empty!31833)))

(declare-fun b!1253804 () Bool)

(declare-fun res!836052 () Bool)

(assert (=> b!1253804 (=> (not res!836052) (not e!712347))))

(declare-datatypes ((List!27853 0))(
  ( (Nil!27850) (Cons!27849 (h!29058 (_ BitVec 64)) (t!41334 List!27853)) )
))
(declare-fun arrayNoDuplicates!0 (array!81322 (_ BitVec 32) List!27853) Bool)

(assert (=> b!1253804 (= res!836052 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27850))))

(declare-fun mapNonEmpty!49525 () Bool)

(declare-fun tp!94298 () Bool)

(assert (=> mapNonEmpty!49525 (= mapRes!49525 (and tp!94298 e!712344))))

(declare-fun mapRest!49525 () (Array (_ BitVec 32) ValueCell!15153))

(declare-fun mapValue!49525 () ValueCell!15153)

(declare-fun mapKey!49525 () (_ BitVec 32))

(assert (=> mapNonEmpty!49525 (= (arr!39224 _values!914) (store mapRest!49525 mapKey!49525 mapValue!49525))))

(assert (= (and start!105214 res!836050) b!1253798))

(assert (= (and b!1253798 res!836051) b!1253797))

(assert (= (and b!1253797 res!836053) b!1253804))

(assert (= (and b!1253804 res!836052) b!1253799))

(assert (= (and b!1253799 (not res!836054)) b!1253801))

(assert (= (and b!1253800 condMapEmpty!49525) mapIsEmpty!49525))

(assert (= (and b!1253800 (not condMapEmpty!49525)) mapNonEmpty!49525))

(get-info :version)

(assert (= (and mapNonEmpty!49525 ((_ is ValueCellFull!15153) mapValue!49525)) b!1253802))

(assert (= (and b!1253800 ((_ is ValueCellFull!15153) mapDefault!49525)) b!1253803))

(assert (= start!105214 b!1253800))

(declare-fun m!1154415 () Bool)

(assert (=> b!1253797 m!1154415))

(declare-fun m!1154417 () Bool)

(assert (=> b!1253804 m!1154417))

(declare-fun m!1154419 () Bool)

(assert (=> b!1253801 m!1154419))

(declare-fun m!1154421 () Bool)

(assert (=> b!1253801 m!1154421))

(declare-fun m!1154423 () Bool)

(assert (=> b!1253801 m!1154423))

(declare-fun m!1154425 () Bool)

(assert (=> b!1253801 m!1154425))

(declare-fun m!1154427 () Bool)

(assert (=> b!1253801 m!1154427))

(declare-fun m!1154429 () Bool)

(assert (=> b!1253801 m!1154429))

(declare-fun m!1154431 () Bool)

(assert (=> start!105214 m!1154431))

(declare-fun m!1154433 () Bool)

(assert (=> start!105214 m!1154433))

(declare-fun m!1154435 () Bool)

(assert (=> start!105214 m!1154435))

(declare-fun m!1154437 () Bool)

(assert (=> b!1253799 m!1154437))

(declare-fun m!1154439 () Bool)

(assert (=> b!1253799 m!1154439))

(declare-fun m!1154441 () Bool)

(assert (=> b!1253799 m!1154441))

(declare-fun m!1154443 () Bool)

(assert (=> mapNonEmpty!49525 m!1154443))

(check-sat (not b!1253799) (not b!1253804) (not b_next!26931) (not start!105214) (not mapNonEmpty!49525) b_and!44745 tp_is_empty!31833 (not b!1253797) (not b!1253801))
(check-sat b_and!44745 (not b_next!26931))
