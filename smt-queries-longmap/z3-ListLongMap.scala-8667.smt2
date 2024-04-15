; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105360 () Bool)

(assert start!105360)

(declare-fun b_free!27037 () Bool)

(declare-fun b_next!27037 () Bool)

(assert (=> start!105360 (= b_free!27037 (not b_next!27037))))

(declare-fun tp!94622 () Bool)

(declare-fun b_and!44857 () Bool)

(assert (=> start!105360 (= tp!94622 b_and!44857)))

(declare-fun b!1255290 () Bool)

(declare-fun e!713428 () Bool)

(declare-fun e!713425 () Bool)

(declare-fun mapRes!49690 () Bool)

(assert (=> b!1255290 (= e!713428 (and e!713425 mapRes!49690))))

(declare-fun condMapEmpty!49690 () Bool)

(declare-datatypes ((V!47951 0))(
  ( (V!47952 (val!16032 Int)) )
))
(declare-datatypes ((ValueCell!15206 0))(
  ( (ValueCellFull!15206 (v!18731 V!47951)) (EmptyCell!15206) )
))
(declare-datatypes ((array!81451 0))(
  ( (array!81452 (arr!39286 (Array (_ BitVec 32) ValueCell!15206)) (size!39824 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81451)

(declare-fun mapDefault!49690 () ValueCell!15206)

(assert (=> b!1255290 (= condMapEmpty!49690 (= (arr!39286 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15206)) mapDefault!49690)))))

(declare-fun mapIsEmpty!49690 () Bool)

(assert (=> mapIsEmpty!49690 mapRes!49690))

(declare-fun b!1255291 () Bool)

(declare-fun e!713424 () Bool)

(assert (=> b!1255291 (= e!713424 (not true))))

(declare-datatypes ((tuple2!20782 0))(
  ( (tuple2!20783 (_1!10402 (_ BitVec 64)) (_2!10402 V!47951)) )
))
(declare-datatypes ((List!27993 0))(
  ( (Nil!27990) (Cons!27989 (h!29198 tuple2!20782) (t!41469 List!27993)) )
))
(declare-datatypes ((ListLongMap!18655 0))(
  ( (ListLongMap!18656 (toList!9343 List!27993)) )
))
(declare-fun lt!567371 () ListLongMap!18655)

(declare-fun lt!567372 () ListLongMap!18655)

(assert (=> b!1255291 (= lt!567371 lt!567372)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41653 0))(
  ( (Unit!41654) )
))
(declare-fun lt!567373 () Unit!41653)

(declare-fun minValueAfter!43 () V!47951)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47951)

(declare-fun minValueBefore!43 () V!47951)

(declare-datatypes ((array!81453 0))(
  ( (array!81454 (arr!39287 (Array (_ BitVec 32) (_ BitVec 64))) (size!39825 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81453)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1060 (array!81453 array!81451 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47951 V!47951 V!47951 V!47951 (_ BitVec 32) Int) Unit!41653)

(assert (=> b!1255291 (= lt!567373 (lemmaNoChangeToArrayThenSameMapNoExtras!1060 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5738 (array!81453 array!81451 (_ BitVec 32) (_ BitVec 32) V!47951 V!47951 (_ BitVec 32) Int) ListLongMap!18655)

(assert (=> b!1255291 (= lt!567372 (getCurrentListMapNoExtraKeys!5738 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255291 (= lt!567371 (getCurrentListMapNoExtraKeys!5738 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255292 () Bool)

(declare-fun e!713426 () Bool)

(declare-fun tp_is_empty!31939 () Bool)

(assert (=> b!1255292 (= e!713426 tp_is_empty!31939)))

(declare-fun mapNonEmpty!49690 () Bool)

(declare-fun tp!94621 () Bool)

(assert (=> mapNonEmpty!49690 (= mapRes!49690 (and tp!94621 e!713426))))

(declare-fun mapValue!49690 () ValueCell!15206)

(declare-fun mapKey!49690 () (_ BitVec 32))

(declare-fun mapRest!49690 () (Array (_ BitVec 32) ValueCell!15206))

(assert (=> mapNonEmpty!49690 (= (arr!39286 _values!914) (store mapRest!49690 mapKey!49690 mapValue!49690))))

(declare-fun b!1255293 () Bool)

(declare-fun res!836905 () Bool)

(assert (=> b!1255293 (=> (not res!836905) (not e!713424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81453 (_ BitVec 32)) Bool)

(assert (=> b!1255293 (= res!836905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1255294 () Bool)

(declare-fun res!836907 () Bool)

(assert (=> b!1255294 (=> (not res!836907) (not e!713424))))

(assert (=> b!1255294 (= res!836907 (and (= (size!39824 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39825 _keys!1118) (size!39824 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!836904 () Bool)

(assert (=> start!105360 (=> (not res!836904) (not e!713424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105360 (= res!836904 (validMask!0 mask!1466))))

(assert (=> start!105360 e!713424))

(assert (=> start!105360 true))

(assert (=> start!105360 tp!94622))

(assert (=> start!105360 tp_is_empty!31939))

(declare-fun array_inv!30075 (array!81453) Bool)

(assert (=> start!105360 (array_inv!30075 _keys!1118)))

(declare-fun array_inv!30076 (array!81451) Bool)

(assert (=> start!105360 (and (array_inv!30076 _values!914) e!713428)))

(declare-fun b!1255295 () Bool)

(declare-fun res!836906 () Bool)

(assert (=> b!1255295 (=> (not res!836906) (not e!713424))))

(declare-datatypes ((List!27994 0))(
  ( (Nil!27991) (Cons!27990 (h!29199 (_ BitVec 64)) (t!41470 List!27994)) )
))
(declare-fun arrayNoDuplicates!0 (array!81453 (_ BitVec 32) List!27994) Bool)

(assert (=> b!1255295 (= res!836906 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27991))))

(declare-fun b!1255296 () Bool)

(assert (=> b!1255296 (= e!713425 tp_is_empty!31939)))

(assert (= (and start!105360 res!836904) b!1255294))

(assert (= (and b!1255294 res!836907) b!1255293))

(assert (= (and b!1255293 res!836905) b!1255295))

(assert (= (and b!1255295 res!836906) b!1255291))

(assert (= (and b!1255290 condMapEmpty!49690) mapIsEmpty!49690))

(assert (= (and b!1255290 (not condMapEmpty!49690)) mapNonEmpty!49690))

(get-info :version)

(assert (= (and mapNonEmpty!49690 ((_ is ValueCellFull!15206) mapValue!49690)) b!1255292))

(assert (= (and b!1255290 ((_ is ValueCellFull!15206) mapDefault!49690)) b!1255296))

(assert (= start!105360 b!1255290))

(declare-fun m!1155601 () Bool)

(assert (=> mapNonEmpty!49690 m!1155601))

(declare-fun m!1155603 () Bool)

(assert (=> b!1255293 m!1155603))

(declare-fun m!1155605 () Bool)

(assert (=> start!105360 m!1155605))

(declare-fun m!1155607 () Bool)

(assert (=> start!105360 m!1155607))

(declare-fun m!1155609 () Bool)

(assert (=> start!105360 m!1155609))

(declare-fun m!1155611 () Bool)

(assert (=> b!1255291 m!1155611))

(declare-fun m!1155613 () Bool)

(assert (=> b!1255291 m!1155613))

(declare-fun m!1155615 () Bool)

(assert (=> b!1255291 m!1155615))

(declare-fun m!1155617 () Bool)

(assert (=> b!1255295 m!1155617))

(check-sat b_and!44857 (not b_next!27037) (not b!1255293) (not b!1255295) (not start!105360) (not b!1255291) tp_is_empty!31939 (not mapNonEmpty!49690))
(check-sat b_and!44857 (not b_next!27037))
