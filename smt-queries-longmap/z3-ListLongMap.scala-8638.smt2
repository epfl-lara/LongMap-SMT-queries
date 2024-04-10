; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105132 () Bool)

(assert start!105132)

(declare-fun b_free!26865 () Bool)

(declare-fun b_next!26865 () Bool)

(assert (=> start!105132 (= b_free!26865 (not b_next!26865))))

(declare-fun tp!94096 () Bool)

(declare-fun b_and!44669 () Bool)

(assert (=> start!105132 (= tp!94096 b_and!44669)))

(declare-fun mapIsEmpty!49423 () Bool)

(declare-fun mapRes!49423 () Bool)

(assert (=> mapIsEmpty!49423 mapRes!49423))

(declare-fun b!1252848 () Bool)

(declare-fun e!711645 () Bool)

(declare-fun e!711646 () Bool)

(assert (=> b!1252848 (= e!711645 (not e!711646))))

(declare-fun res!835489 () Bool)

(assert (=> b!1252848 (=> res!835489 e!711646)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252848 (= res!835489 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!47721 0))(
  ( (V!47722 (val!15946 Int)) )
))
(declare-datatypes ((tuple2!20574 0))(
  ( (tuple2!20575 (_1!10298 (_ BitVec 64)) (_2!10298 V!47721)) )
))
(declare-datatypes ((List!27806 0))(
  ( (Nil!27803) (Cons!27802 (h!29011 tuple2!20574) (t!41285 List!27806)) )
))
(declare-datatypes ((ListLongMap!18447 0))(
  ( (ListLongMap!18448 (toList!9239 List!27806)) )
))
(declare-fun lt!565538 () ListLongMap!18447)

(declare-fun lt!565537 () ListLongMap!18447)

(assert (=> b!1252848 (= lt!565538 lt!565537)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47721)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47721)

(declare-datatypes ((array!81196 0))(
  ( (array!81197 (arr!39161 (Array (_ BitVec 32) (_ BitVec 64))) (size!39697 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81196)

(declare-datatypes ((ValueCell!15120 0))(
  ( (ValueCellFull!15120 (v!18644 V!47721)) (EmptyCell!15120) )
))
(declare-datatypes ((array!81198 0))(
  ( (array!81199 (arr!39162 (Array (_ BitVec 32) ValueCell!15120)) (size!39698 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81198)

(declare-fun minValueBefore!43 () V!47721)

(declare-datatypes ((Unit!41663 0))(
  ( (Unit!41664) )
))
(declare-fun lt!565536 () Unit!41663)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!997 (array!81196 array!81198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47721 V!47721 V!47721 V!47721 (_ BitVec 32) Int) Unit!41663)

(assert (=> b!1252848 (= lt!565536 (lemmaNoChangeToArrayThenSameMapNoExtras!997 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5633 (array!81196 array!81198 (_ BitVec 32) (_ BitVec 32) V!47721 V!47721 (_ BitVec 32) Int) ListLongMap!18447)

(assert (=> b!1252848 (= lt!565537 (getCurrentListMapNoExtraKeys!5633 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252848 (= lt!565538 (getCurrentListMapNoExtraKeys!5633 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252849 () Bool)

(declare-fun res!835491 () Bool)

(assert (=> b!1252849 (=> (not res!835491) (not e!711645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81196 (_ BitVec 32)) Bool)

(assert (=> b!1252849 (= res!835491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252850 () Bool)

(declare-fun e!711648 () Bool)

(declare-fun e!711647 () Bool)

(assert (=> b!1252850 (= e!711648 (and e!711647 mapRes!49423))))

(declare-fun condMapEmpty!49423 () Bool)

(declare-fun mapDefault!49423 () ValueCell!15120)

(assert (=> b!1252850 (= condMapEmpty!49423 (= (arr!39162 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15120)) mapDefault!49423)))))

(declare-fun b!1252851 () Bool)

(declare-fun res!835492 () Bool)

(assert (=> b!1252851 (=> (not res!835492) (not e!711645))))

(assert (=> b!1252851 (= res!835492 (and (= (size!39698 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39697 _keys!1118) (size!39698 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252852 () Bool)

(declare-fun e!711649 () Bool)

(declare-fun tp_is_empty!31767 () Bool)

(assert (=> b!1252852 (= e!711649 tp_is_empty!31767)))

(declare-fun b!1252853 () Bool)

(assert (=> b!1252853 (= e!711646 true)))

(declare-fun lt!565535 () ListLongMap!18447)

(declare-fun getCurrentListMap!4486 (array!81196 array!81198 (_ BitVec 32) (_ BitVec 32) V!47721 V!47721 (_ BitVec 32) Int) ListLongMap!18447)

(assert (=> b!1252853 (= lt!565535 (getCurrentListMap!4486 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252854 () Bool)

(assert (=> b!1252854 (= e!711647 tp_is_empty!31767)))

(declare-fun res!835488 () Bool)

(assert (=> start!105132 (=> (not res!835488) (not e!711645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105132 (= res!835488 (validMask!0 mask!1466))))

(assert (=> start!105132 e!711645))

(assert (=> start!105132 true))

(assert (=> start!105132 tp!94096))

(assert (=> start!105132 tp_is_empty!31767))

(declare-fun array_inv!29865 (array!81196) Bool)

(assert (=> start!105132 (array_inv!29865 _keys!1118)))

(declare-fun array_inv!29866 (array!81198) Bool)

(assert (=> start!105132 (and (array_inv!29866 _values!914) e!711648)))

(declare-fun mapNonEmpty!49423 () Bool)

(declare-fun tp!94097 () Bool)

(assert (=> mapNonEmpty!49423 (= mapRes!49423 (and tp!94097 e!711649))))

(declare-fun mapValue!49423 () ValueCell!15120)

(declare-fun mapRest!49423 () (Array (_ BitVec 32) ValueCell!15120))

(declare-fun mapKey!49423 () (_ BitVec 32))

(assert (=> mapNonEmpty!49423 (= (arr!39162 _values!914) (store mapRest!49423 mapKey!49423 mapValue!49423))))

(declare-fun b!1252855 () Bool)

(declare-fun res!835490 () Bool)

(assert (=> b!1252855 (=> (not res!835490) (not e!711645))))

(declare-datatypes ((List!27807 0))(
  ( (Nil!27804) (Cons!27803 (h!29012 (_ BitVec 64)) (t!41286 List!27807)) )
))
(declare-fun arrayNoDuplicates!0 (array!81196 (_ BitVec 32) List!27807) Bool)

(assert (=> b!1252855 (= res!835490 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27804))))

(assert (= (and start!105132 res!835488) b!1252851))

(assert (= (and b!1252851 res!835492) b!1252849))

(assert (= (and b!1252849 res!835491) b!1252855))

(assert (= (and b!1252855 res!835490) b!1252848))

(assert (= (and b!1252848 (not res!835489)) b!1252853))

(assert (= (and b!1252850 condMapEmpty!49423) mapIsEmpty!49423))

(assert (= (and b!1252850 (not condMapEmpty!49423)) mapNonEmpty!49423))

(get-info :version)

(assert (= (and mapNonEmpty!49423 ((_ is ValueCellFull!15120) mapValue!49423)) b!1252852))

(assert (= (and b!1252850 ((_ is ValueCellFull!15120) mapDefault!49423)) b!1252854))

(assert (= start!105132 b!1252850))

(declare-fun m!1153405 () Bool)

(assert (=> b!1252848 m!1153405))

(declare-fun m!1153407 () Bool)

(assert (=> b!1252848 m!1153407))

(declare-fun m!1153409 () Bool)

(assert (=> b!1252848 m!1153409))

(declare-fun m!1153411 () Bool)

(assert (=> start!105132 m!1153411))

(declare-fun m!1153413 () Bool)

(assert (=> start!105132 m!1153413))

(declare-fun m!1153415 () Bool)

(assert (=> start!105132 m!1153415))

(declare-fun m!1153417 () Bool)

(assert (=> b!1252855 m!1153417))

(declare-fun m!1153419 () Bool)

(assert (=> b!1252853 m!1153419))

(declare-fun m!1153421 () Bool)

(assert (=> b!1252849 m!1153421))

(declare-fun m!1153423 () Bool)

(assert (=> mapNonEmpty!49423 m!1153423))

(check-sat (not mapNonEmpty!49423) (not b!1252853) tp_is_empty!31767 b_and!44669 (not b!1252855) (not b!1252849) (not start!105132) (not b_next!26865) (not b!1252848))
(check-sat b_and!44669 (not b_next!26865))
