; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105330 () Bool)

(assert start!105330)

(declare-fun b_free!27007 () Bool)

(declare-fun b_next!27007 () Bool)

(assert (=> start!105330 (= b_free!27007 (not b_next!27007))))

(declare-fun tp!94532 () Bool)

(declare-fun b_and!44827 () Bool)

(assert (=> start!105330 (= tp!94532 b_and!44827)))

(declare-fun mapNonEmpty!49645 () Bool)

(declare-fun mapRes!49645 () Bool)

(declare-fun tp!94531 () Bool)

(declare-fun e!713203 () Bool)

(assert (=> mapNonEmpty!49645 (= mapRes!49645 (and tp!94531 e!713203))))

(declare-fun mapKey!49645 () (_ BitVec 32))

(declare-datatypes ((V!47911 0))(
  ( (V!47912 (val!16017 Int)) )
))
(declare-datatypes ((ValueCell!15191 0))(
  ( (ValueCellFull!15191 (v!18716 V!47911)) (EmptyCell!15191) )
))
(declare-fun mapValue!49645 () ValueCell!15191)

(declare-datatypes ((array!81395 0))(
  ( (array!81396 (arr!39258 (Array (_ BitVec 32) ValueCell!15191)) (size!39796 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81395)

(declare-fun mapRest!49645 () (Array (_ BitVec 32) ValueCell!15191))

(assert (=> mapNonEmpty!49645 (= (arr!39258 _values!914) (store mapRest!49645 mapKey!49645 mapValue!49645))))

(declare-fun mapIsEmpty!49645 () Bool)

(assert (=> mapIsEmpty!49645 mapRes!49645))

(declare-fun res!836724 () Bool)

(declare-fun e!713201 () Bool)

(assert (=> start!105330 (=> (not res!836724) (not e!713201))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105330 (= res!836724 (validMask!0 mask!1466))))

(assert (=> start!105330 e!713201))

(assert (=> start!105330 true))

(assert (=> start!105330 tp!94532))

(declare-fun tp_is_empty!31909 () Bool)

(assert (=> start!105330 tp_is_empty!31909))

(declare-datatypes ((array!81397 0))(
  ( (array!81398 (arr!39259 (Array (_ BitVec 32) (_ BitVec 64))) (size!39797 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81397)

(declare-fun array_inv!30055 (array!81397) Bool)

(assert (=> start!105330 (array_inv!30055 _keys!1118)))

(declare-fun e!713202 () Bool)

(declare-fun array_inv!30056 (array!81395) Bool)

(assert (=> start!105330 (and (array_inv!30056 _values!914) e!713202)))

(declare-fun b!1254975 () Bool)

(declare-fun res!836726 () Bool)

(assert (=> b!1254975 (=> (not res!836726) (not e!713201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81397 (_ BitVec 32)) Bool)

(assert (=> b!1254975 (= res!836726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254976 () Bool)

(declare-fun res!836727 () Bool)

(assert (=> b!1254976 (=> (not res!836727) (not e!713201))))

(declare-datatypes ((List!27973 0))(
  ( (Nil!27970) (Cons!27969 (h!29178 (_ BitVec 64)) (t!41449 List!27973)) )
))
(declare-fun arrayNoDuplicates!0 (array!81397 (_ BitVec 32) List!27973) Bool)

(assert (=> b!1254976 (= res!836727 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27970))))

(declare-fun b!1254977 () Bool)

(assert (=> b!1254977 (= e!713203 tp_is_empty!31909)))

(declare-fun b!1254978 () Bool)

(declare-fun e!713200 () Bool)

(assert (=> b!1254978 (= e!713200 tp_is_empty!31909)))

(declare-fun b!1254979 () Bool)

(assert (=> b!1254979 (= e!713202 (and e!713200 mapRes!49645))))

(declare-fun condMapEmpty!49645 () Bool)

(declare-fun mapDefault!49645 () ValueCell!15191)

(assert (=> b!1254979 (= condMapEmpty!49645 (= (arr!39258 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15191)) mapDefault!49645)))))

(declare-fun b!1254980 () Bool)

(assert (=> b!1254980 (= e!713201 (not true))))

(declare-datatypes ((tuple2!20762 0))(
  ( (tuple2!20763 (_1!10392 (_ BitVec 64)) (_2!10392 V!47911)) )
))
(declare-datatypes ((List!27974 0))(
  ( (Nil!27971) (Cons!27970 (h!29179 tuple2!20762) (t!41450 List!27974)) )
))
(declare-datatypes ((ListLongMap!18635 0))(
  ( (ListLongMap!18636 (toList!9333 List!27974)) )
))
(declare-fun lt!567236 () ListLongMap!18635)

(declare-fun lt!567237 () ListLongMap!18635)

(assert (=> b!1254980 (= lt!567236 lt!567237)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47911)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47911)

(declare-fun minValueBefore!43 () V!47911)

(declare-datatypes ((Unit!41633 0))(
  ( (Unit!41634) )
))
(declare-fun lt!567238 () Unit!41633)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1050 (array!81397 array!81395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47911 V!47911 V!47911 V!47911 (_ BitVec 32) Int) Unit!41633)

(assert (=> b!1254980 (= lt!567238 (lemmaNoChangeToArrayThenSameMapNoExtras!1050 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5728 (array!81397 array!81395 (_ BitVec 32) (_ BitVec 32) V!47911 V!47911 (_ BitVec 32) Int) ListLongMap!18635)

(assert (=> b!1254980 (= lt!567237 (getCurrentListMapNoExtraKeys!5728 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254980 (= lt!567236 (getCurrentListMapNoExtraKeys!5728 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254981 () Bool)

(declare-fun res!836725 () Bool)

(assert (=> b!1254981 (=> (not res!836725) (not e!713201))))

(assert (=> b!1254981 (= res!836725 (and (= (size!39796 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39797 _keys!1118) (size!39796 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105330 res!836724) b!1254981))

(assert (= (and b!1254981 res!836725) b!1254975))

(assert (= (and b!1254975 res!836726) b!1254976))

(assert (= (and b!1254976 res!836727) b!1254980))

(assert (= (and b!1254979 condMapEmpty!49645) mapIsEmpty!49645))

(assert (= (and b!1254979 (not condMapEmpty!49645)) mapNonEmpty!49645))

(get-info :version)

(assert (= (and mapNonEmpty!49645 ((_ is ValueCellFull!15191) mapValue!49645)) b!1254977))

(assert (= (and b!1254979 ((_ is ValueCellFull!15191) mapDefault!49645)) b!1254978))

(assert (= start!105330 b!1254979))

(declare-fun m!1155331 () Bool)

(assert (=> b!1254975 m!1155331))

(declare-fun m!1155333 () Bool)

(assert (=> b!1254980 m!1155333))

(declare-fun m!1155335 () Bool)

(assert (=> b!1254980 m!1155335))

(declare-fun m!1155337 () Bool)

(assert (=> b!1254980 m!1155337))

(declare-fun m!1155339 () Bool)

(assert (=> b!1254976 m!1155339))

(declare-fun m!1155341 () Bool)

(assert (=> mapNonEmpty!49645 m!1155341))

(declare-fun m!1155343 () Bool)

(assert (=> start!105330 m!1155343))

(declare-fun m!1155345 () Bool)

(assert (=> start!105330 m!1155345))

(declare-fun m!1155347 () Bool)

(assert (=> start!105330 m!1155347))

(check-sat (not b!1254980) (not start!105330) b_and!44827 (not b!1254976) (not b!1254975) (not b_next!27007) (not mapNonEmpty!49645) tp_is_empty!31909)
(check-sat b_and!44827 (not b_next!27007))
