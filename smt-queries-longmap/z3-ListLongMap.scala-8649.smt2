; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105436 () Bool)

(assert start!105436)

(declare-fun b_free!26929 () Bool)

(declare-fun b_next!26929 () Bool)

(assert (=> start!105436 (= b_free!26929 (not b_next!26929))))

(declare-fun tp!94291 () Bool)

(declare-fun b_and!44745 () Bool)

(assert (=> start!105436 (= tp!94291 b_and!44745)))

(declare-fun b!1255078 () Bool)

(declare-fun e!713174 () Bool)

(declare-fun e!713172 () Bool)

(declare-fun mapRes!49522 () Bool)

(assert (=> b!1255078 (= e!713174 (and e!713172 mapRes!49522))))

(declare-fun condMapEmpty!49522 () Bool)

(declare-datatypes ((V!47807 0))(
  ( (V!47808 (val!15978 Int)) )
))
(declare-datatypes ((ValueCell!15152 0))(
  ( (ValueCellFull!15152 (v!18672 V!47807)) (EmptyCell!15152) )
))
(declare-datatypes ((array!81363 0))(
  ( (array!81364 (arr!39239 (Array (_ BitVec 32) ValueCell!15152)) (size!39776 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81363)

(declare-fun mapDefault!49522 () ValueCell!15152)

(assert (=> b!1255078 (= condMapEmpty!49522 (= (arr!39239 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15152)) mapDefault!49522)))))

(declare-fun b!1255079 () Bool)

(declare-fun res!836558 () Bool)

(declare-fun e!713175 () Bool)

(assert (=> b!1255079 (=> (not res!836558) (not e!713175))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81365 0))(
  ( (array!81366 (arr!39240 (Array (_ BitVec 32) (_ BitVec 64))) (size!39777 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81365)

(assert (=> b!1255079 (= res!836558 (and (= (size!39776 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39777 _keys!1118) (size!39776 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49522 () Bool)

(declare-fun tp!94292 () Bool)

(declare-fun e!713173 () Bool)

(assert (=> mapNonEmpty!49522 (= mapRes!49522 (and tp!94292 e!713173))))

(declare-fun mapRest!49522 () (Array (_ BitVec 32) ValueCell!15152))

(declare-fun mapKey!49522 () (_ BitVec 32))

(declare-fun mapValue!49522 () ValueCell!15152)

(assert (=> mapNonEmpty!49522 (= (arr!39239 _values!914) (store mapRest!49522 mapKey!49522 mapValue!49522))))

(declare-fun b!1255080 () Bool)

(declare-fun res!836556 () Bool)

(assert (=> b!1255080 (=> (not res!836556) (not e!713175))))

(declare-datatypes ((List!27881 0))(
  ( (Nil!27878) (Cons!27877 (h!29095 (_ BitVec 64)) (t!41354 List!27881)) )
))
(declare-fun arrayNoDuplicates!0 (array!81365 (_ BitVec 32) List!27881) Bool)

(assert (=> b!1255080 (= res!836556 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27878))))

(declare-fun b!1255081 () Bool)

(declare-fun tp_is_empty!31831 () Bool)

(assert (=> b!1255081 (= e!713172 tp_is_empty!31831)))

(declare-fun b!1255082 () Bool)

(declare-fun e!713171 () Bool)

(assert (=> b!1255082 (= e!713171 true)))

(declare-datatypes ((tuple2!20642 0))(
  ( (tuple2!20643 (_1!10332 (_ BitVec 64)) (_2!10332 V!47807)) )
))
(declare-datatypes ((List!27882 0))(
  ( (Nil!27879) (Cons!27878 (h!29096 tuple2!20642) (t!41355 List!27882)) )
))
(declare-datatypes ((ListLongMap!18523 0))(
  ( (ListLongMap!18524 (toList!9277 List!27882)) )
))
(declare-fun lt!566793 () ListLongMap!18523)

(declare-fun lt!566789 () ListLongMap!18523)

(declare-fun -!2017 (ListLongMap!18523 (_ BitVec 64)) ListLongMap!18523)

(assert (=> b!1255082 (= lt!566793 (-!2017 lt!566789 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566794 () ListLongMap!18523)

(declare-fun lt!566787 () ListLongMap!18523)

(assert (=> b!1255082 (= (-!2017 lt!566794 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566787)))

(declare-datatypes ((Unit!41691 0))(
  ( (Unit!41692) )
))
(declare-fun lt!566791 () Unit!41691)

(declare-fun minValueBefore!43 () V!47807)

(declare-fun addThenRemoveForNewKeyIsSame!307 (ListLongMap!18523 (_ BitVec 64) V!47807) Unit!41691)

(assert (=> b!1255082 (= lt!566791 (addThenRemoveForNewKeyIsSame!307 lt!566787 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566790 () ListLongMap!18523)

(declare-fun lt!566788 () ListLongMap!18523)

(assert (=> b!1255082 (and (= lt!566789 lt!566794) (= lt!566788 lt!566790))))

(declare-fun +!4213 (ListLongMap!18523 tuple2!20642) ListLongMap!18523)

(assert (=> b!1255082 (= lt!566794 (+!4213 lt!566787 (tuple2!20643 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47807)

(declare-fun zeroValue!871 () V!47807)

(declare-fun getCurrentListMap!4510 (array!81365 array!81363 (_ BitVec 32) (_ BitVec 32) V!47807 V!47807 (_ BitVec 32) Int) ListLongMap!18523)

(assert (=> b!1255082 (= lt!566788 (getCurrentListMap!4510 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255082 (= lt!566789 (getCurrentListMap!4510 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255083 () Bool)

(assert (=> b!1255083 (= e!713173 tp_is_empty!31831)))

(declare-fun b!1255084 () Bool)

(assert (=> b!1255084 (= e!713175 (not e!713171))))

(declare-fun res!836555 () Bool)

(assert (=> b!1255084 (=> res!836555 e!713171)))

(assert (=> b!1255084 (= res!836555 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1255084 (= lt!566787 lt!566790)))

(declare-fun lt!566792 () Unit!41691)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1016 (array!81365 array!81363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47807 V!47807 V!47807 V!47807 (_ BitVec 32) Int) Unit!41691)

(assert (=> b!1255084 (= lt!566792 (lemmaNoChangeToArrayThenSameMapNoExtras!1016 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5702 (array!81365 array!81363 (_ BitVec 32) (_ BitVec 32) V!47807 V!47807 (_ BitVec 32) Int) ListLongMap!18523)

(assert (=> b!1255084 (= lt!566790 (getCurrentListMapNoExtraKeys!5702 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255084 (= lt!566787 (getCurrentListMapNoExtraKeys!5702 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49522 () Bool)

(assert (=> mapIsEmpty!49522 mapRes!49522))

(declare-fun res!836559 () Bool)

(assert (=> start!105436 (=> (not res!836559) (not e!713175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105436 (= res!836559 (validMask!0 mask!1466))))

(assert (=> start!105436 e!713175))

(assert (=> start!105436 true))

(assert (=> start!105436 tp!94291))

(assert (=> start!105436 tp_is_empty!31831))

(declare-fun array_inv!30031 (array!81365) Bool)

(assert (=> start!105436 (array_inv!30031 _keys!1118)))

(declare-fun array_inv!30032 (array!81363) Bool)

(assert (=> start!105436 (and (array_inv!30032 _values!914) e!713174)))

(declare-fun b!1255085 () Bool)

(declare-fun res!836557 () Bool)

(assert (=> b!1255085 (=> (not res!836557) (not e!713175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81365 (_ BitVec 32)) Bool)

(assert (=> b!1255085 (= res!836557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105436 res!836559) b!1255079))

(assert (= (and b!1255079 res!836558) b!1255085))

(assert (= (and b!1255085 res!836557) b!1255080))

(assert (= (and b!1255080 res!836556) b!1255084))

(assert (= (and b!1255084 (not res!836555)) b!1255082))

(assert (= (and b!1255078 condMapEmpty!49522) mapIsEmpty!49522))

(assert (= (and b!1255078 (not condMapEmpty!49522)) mapNonEmpty!49522))

(get-info :version)

(assert (= (and mapNonEmpty!49522 ((_ is ValueCellFull!15152) mapValue!49522)) b!1255083))

(assert (= (and b!1255078 ((_ is ValueCellFull!15152) mapDefault!49522)) b!1255081))

(assert (= start!105436 b!1255078))

(declare-fun m!1155997 () Bool)

(assert (=> start!105436 m!1155997))

(declare-fun m!1155999 () Bool)

(assert (=> start!105436 m!1155999))

(declare-fun m!1156001 () Bool)

(assert (=> start!105436 m!1156001))

(declare-fun m!1156003 () Bool)

(assert (=> mapNonEmpty!49522 m!1156003))

(declare-fun m!1156005 () Bool)

(assert (=> b!1255080 m!1156005))

(declare-fun m!1156007 () Bool)

(assert (=> b!1255085 m!1156007))

(declare-fun m!1156009 () Bool)

(assert (=> b!1255082 m!1156009))

(declare-fun m!1156011 () Bool)

(assert (=> b!1255082 m!1156011))

(declare-fun m!1156013 () Bool)

(assert (=> b!1255082 m!1156013))

(declare-fun m!1156015 () Bool)

(assert (=> b!1255082 m!1156015))

(declare-fun m!1156017 () Bool)

(assert (=> b!1255082 m!1156017))

(declare-fun m!1156019 () Bool)

(assert (=> b!1255082 m!1156019))

(declare-fun m!1156021 () Bool)

(assert (=> b!1255084 m!1156021))

(declare-fun m!1156023 () Bool)

(assert (=> b!1255084 m!1156023))

(declare-fun m!1156025 () Bool)

(assert (=> b!1255084 m!1156025))

(check-sat (not b!1255082) (not start!105436) (not b_next!26929) b_and!44745 (not b!1255084) tp_is_empty!31831 (not b!1255080) (not b!1255085) (not mapNonEmpty!49522))
(check-sat b_and!44745 (not b_next!26929))
