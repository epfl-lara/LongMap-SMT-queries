; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105488 () Bool)

(assert start!105488)

(declare-fun b_free!26959 () Bool)

(declare-fun b_next!26959 () Bool)

(assert (=> start!105488 (= b_free!26959 (not b_next!26959))))

(declare-fun tp!94384 () Bool)

(declare-fun b_and!44787 () Bool)

(assert (=> start!105488 (= tp!94384 b_and!44787)))

(declare-fun b!1255622 () Bool)

(declare-fun e!713561 () Bool)

(declare-fun tp_is_empty!31861 () Bool)

(assert (=> b!1255622 (= e!713561 tp_is_empty!31861)))

(declare-fun b!1255623 () Bool)

(declare-fun e!713562 () Bool)

(declare-fun e!713563 () Bool)

(assert (=> b!1255623 (= e!713562 (not e!713563))))

(declare-fun res!836865 () Bool)

(assert (=> b!1255623 (=> res!836865 e!713563)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255623 (= res!836865 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47847 0))(
  ( (V!47848 (val!15993 Int)) )
))
(declare-datatypes ((tuple2!20666 0))(
  ( (tuple2!20667 (_1!10344 (_ BitVec 64)) (_2!10344 V!47847)) )
))
(declare-datatypes ((List!27903 0))(
  ( (Nil!27900) (Cons!27899 (h!29117 tuple2!20666) (t!41378 List!27903)) )
))
(declare-datatypes ((ListLongMap!18547 0))(
  ( (ListLongMap!18548 (toList!9289 List!27903)) )
))
(declare-fun lt!567292 () ListLongMap!18547)

(declare-fun lt!567285 () ListLongMap!18547)

(assert (=> b!1255623 (= lt!567292 lt!567285)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47847)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47847)

(declare-datatypes ((ValueCell!15167 0))(
  ( (ValueCellFull!15167 (v!18688 V!47847)) (EmptyCell!15167) )
))
(declare-datatypes ((array!81423 0))(
  ( (array!81424 (arr!39268 (Array (_ BitVec 32) ValueCell!15167)) (size!39805 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81423)

(declare-fun minValueBefore!43 () V!47847)

(declare-datatypes ((Unit!41717 0))(
  ( (Unit!41718) )
))
(declare-fun lt!567291 () Unit!41717)

(declare-datatypes ((array!81425 0))(
  ( (array!81426 (arr!39269 (Array (_ BitVec 32) (_ BitVec 64))) (size!39806 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81425)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1027 (array!81425 array!81423 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47847 V!47847 V!47847 V!47847 (_ BitVec 32) Int) Unit!41717)

(assert (=> b!1255623 (= lt!567291 (lemmaNoChangeToArrayThenSameMapNoExtras!1027 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5713 (array!81425 array!81423 (_ BitVec 32) (_ BitVec 32) V!47847 V!47847 (_ BitVec 32) Int) ListLongMap!18547)

(assert (=> b!1255623 (= lt!567285 (getCurrentListMapNoExtraKeys!5713 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255623 (= lt!567292 (getCurrentListMapNoExtraKeys!5713 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255624 () Bool)

(declare-fun res!836864 () Bool)

(assert (=> b!1255624 (=> (not res!836864) (not e!713562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81425 (_ BitVec 32)) Bool)

(assert (=> b!1255624 (= res!836864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49570 () Bool)

(declare-fun mapRes!49570 () Bool)

(declare-fun tp!94385 () Bool)

(declare-fun e!713565 () Bool)

(assert (=> mapNonEmpty!49570 (= mapRes!49570 (and tp!94385 e!713565))))

(declare-fun mapRest!49570 () (Array (_ BitVec 32) ValueCell!15167))

(declare-fun mapValue!49570 () ValueCell!15167)

(declare-fun mapKey!49570 () (_ BitVec 32))

(assert (=> mapNonEmpty!49570 (= (arr!39268 _values!914) (store mapRest!49570 mapKey!49570 mapValue!49570))))

(declare-fun b!1255625 () Bool)

(declare-fun e!713564 () Bool)

(assert (=> b!1255625 (= e!713564 (and e!713561 mapRes!49570))))

(declare-fun condMapEmpty!49570 () Bool)

(declare-fun mapDefault!49570 () ValueCell!15167)

(assert (=> b!1255625 (= condMapEmpty!49570 (= (arr!39268 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15167)) mapDefault!49570)))))

(declare-fun b!1255626 () Bool)

(assert (=> b!1255626 (= e!713563 true)))

(declare-fun lt!567290 () ListLongMap!18547)

(declare-fun lt!567286 () ListLongMap!18547)

(declare-fun -!2028 (ListLongMap!18547 (_ BitVec 64)) ListLongMap!18547)

(assert (=> b!1255626 (= lt!567290 (-!2028 lt!567286 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567288 () ListLongMap!18547)

(assert (=> b!1255626 (= (-!2028 lt!567288 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567292)))

(declare-fun lt!567289 () Unit!41717)

(declare-fun addThenRemoveForNewKeyIsSame!318 (ListLongMap!18547 (_ BitVec 64) V!47847) Unit!41717)

(assert (=> b!1255626 (= lt!567289 (addThenRemoveForNewKeyIsSame!318 lt!567292 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567287 () ListLongMap!18547)

(assert (=> b!1255626 (and (= lt!567286 lt!567288) (= lt!567287 lt!567285))))

(declare-fun +!4224 (ListLongMap!18547 tuple2!20666) ListLongMap!18547)

(assert (=> b!1255626 (= lt!567288 (+!4224 lt!567292 (tuple2!20667 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4521 (array!81425 array!81423 (_ BitVec 32) (_ BitVec 32) V!47847 V!47847 (_ BitVec 32) Int) ListLongMap!18547)

(assert (=> b!1255626 (= lt!567287 (getCurrentListMap!4521 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255626 (= lt!567286 (getCurrentListMap!4521 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836862 () Bool)

(assert (=> start!105488 (=> (not res!836862) (not e!713562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105488 (= res!836862 (validMask!0 mask!1466))))

(assert (=> start!105488 e!713562))

(assert (=> start!105488 true))

(assert (=> start!105488 tp!94384))

(assert (=> start!105488 tp_is_empty!31861))

(declare-fun array_inv!30051 (array!81425) Bool)

(assert (=> start!105488 (array_inv!30051 _keys!1118)))

(declare-fun array_inv!30052 (array!81423) Bool)

(assert (=> start!105488 (and (array_inv!30052 _values!914) e!713564)))

(declare-fun b!1255627 () Bool)

(assert (=> b!1255627 (= e!713565 tp_is_empty!31861)))

(declare-fun b!1255628 () Bool)

(declare-fun res!836863 () Bool)

(assert (=> b!1255628 (=> (not res!836863) (not e!713562))))

(assert (=> b!1255628 (= res!836863 (and (= (size!39805 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39806 _keys!1118) (size!39805 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255629 () Bool)

(declare-fun res!836866 () Bool)

(assert (=> b!1255629 (=> (not res!836866) (not e!713562))))

(declare-datatypes ((List!27904 0))(
  ( (Nil!27901) (Cons!27900 (h!29118 (_ BitVec 64)) (t!41379 List!27904)) )
))
(declare-fun arrayNoDuplicates!0 (array!81425 (_ BitVec 32) List!27904) Bool)

(assert (=> b!1255629 (= res!836866 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27901))))

(declare-fun mapIsEmpty!49570 () Bool)

(assert (=> mapIsEmpty!49570 mapRes!49570))

(assert (= (and start!105488 res!836862) b!1255628))

(assert (= (and b!1255628 res!836863) b!1255624))

(assert (= (and b!1255624 res!836864) b!1255629))

(assert (= (and b!1255629 res!836866) b!1255623))

(assert (= (and b!1255623 (not res!836865)) b!1255626))

(assert (= (and b!1255625 condMapEmpty!49570) mapIsEmpty!49570))

(assert (= (and b!1255625 (not condMapEmpty!49570)) mapNonEmpty!49570))

(get-info :version)

(assert (= (and mapNonEmpty!49570 ((_ is ValueCellFull!15167) mapValue!49570)) b!1255627))

(assert (= (and b!1255625 ((_ is ValueCellFull!15167) mapDefault!49570)) b!1255622))

(assert (= start!105488 b!1255625))

(declare-fun m!1156631 () Bool)

(assert (=> b!1255629 m!1156631))

(declare-fun m!1156633 () Bool)

(assert (=> b!1255626 m!1156633))

(declare-fun m!1156635 () Bool)

(assert (=> b!1255626 m!1156635))

(declare-fun m!1156637 () Bool)

(assert (=> b!1255626 m!1156637))

(declare-fun m!1156639 () Bool)

(assert (=> b!1255626 m!1156639))

(declare-fun m!1156641 () Bool)

(assert (=> b!1255626 m!1156641))

(declare-fun m!1156643 () Bool)

(assert (=> b!1255626 m!1156643))

(declare-fun m!1156645 () Bool)

(assert (=> start!105488 m!1156645))

(declare-fun m!1156647 () Bool)

(assert (=> start!105488 m!1156647))

(declare-fun m!1156649 () Bool)

(assert (=> start!105488 m!1156649))

(declare-fun m!1156651 () Bool)

(assert (=> b!1255624 m!1156651))

(declare-fun m!1156653 () Bool)

(assert (=> b!1255623 m!1156653))

(declare-fun m!1156655 () Bool)

(assert (=> b!1255623 m!1156655))

(declare-fun m!1156657 () Bool)

(assert (=> b!1255623 m!1156657))

(declare-fun m!1156659 () Bool)

(assert (=> mapNonEmpty!49570 m!1156659))

(check-sat b_and!44787 (not b_next!26959) (not b!1255623) (not b!1255626) (not mapNonEmpty!49570) (not b!1255624) (not b!1255629) tp_is_empty!31861 (not start!105488))
(check-sat b_and!44787 (not b_next!26959))
