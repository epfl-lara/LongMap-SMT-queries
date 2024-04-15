; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105096 () Bool)

(assert start!105096)

(declare-fun b_free!26833 () Bool)

(declare-fun b_next!26833 () Bool)

(assert (=> start!105096 (= b_free!26833 (not b_next!26833))))

(declare-fun tp!94001 () Bool)

(declare-fun b_and!44619 () Bool)

(assert (=> start!105096 (= tp!94001 b_and!44619)))

(declare-fun b!1252382 () Bool)

(declare-fun res!835208 () Bool)

(declare-fun e!711313 () Bool)

(assert (=> b!1252382 (=> (not res!835208) (not e!711313))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47679 0))(
  ( (V!47680 (val!15930 Int)) )
))
(declare-datatypes ((ValueCell!15104 0))(
  ( (ValueCellFull!15104 (v!18627 V!47679)) (EmptyCell!15104) )
))
(declare-datatypes ((array!81057 0))(
  ( (array!81058 (arr!39092 (Array (_ BitVec 32) ValueCell!15104)) (size!39630 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81057)

(declare-datatypes ((array!81059 0))(
  ( (array!81060 (arr!39093 (Array (_ BitVec 32) (_ BitVec 64))) (size!39631 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81059)

(assert (=> b!1252382 (= res!835208 (and (= (size!39630 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39631 _keys!1118) (size!39630 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49375 () Bool)

(declare-fun mapRes!49375 () Bool)

(declare-fun tp!94000 () Bool)

(declare-fun e!711312 () Bool)

(assert (=> mapNonEmpty!49375 (= mapRes!49375 (and tp!94000 e!711312))))

(declare-fun mapKey!49375 () (_ BitVec 32))

(declare-fun mapValue!49375 () ValueCell!15104)

(declare-fun mapRest!49375 () (Array (_ BitVec 32) ValueCell!15104))

(assert (=> mapNonEmpty!49375 (= (arr!39092 _values!914) (store mapRest!49375 mapKey!49375 mapValue!49375))))

(declare-fun b!1252383 () Bool)

(declare-fun e!711317 () Bool)

(assert (=> b!1252383 (= e!711317 true)))

(declare-fun zeroValue!871 () V!47679)

(declare-fun minValueBefore!43 () V!47679)

(declare-datatypes ((tuple2!20636 0))(
  ( (tuple2!20637 (_1!10329 (_ BitVec 64)) (_2!10329 V!47679)) )
))
(declare-datatypes ((List!27851 0))(
  ( (Nil!27848) (Cons!27847 (h!29056 tuple2!20636) (t!41321 List!27851)) )
))
(declare-datatypes ((ListLongMap!18509 0))(
  ( (ListLongMap!18510 (toList!9270 List!27851)) )
))
(declare-fun lt!565166 () ListLongMap!18509)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMap!4412 (array!81059 array!81057 (_ BitVec 32) (_ BitVec 32) V!47679 V!47679 (_ BitVec 32) Int) ListLongMap!18509)

(assert (=> b!1252383 (= lt!565166 (getCurrentListMap!4412 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49375 () Bool)

(assert (=> mapIsEmpty!49375 mapRes!49375))

(declare-fun b!1252384 () Bool)

(declare-fun res!835210 () Bool)

(assert (=> b!1252384 (=> (not res!835210) (not e!711313))))

(declare-datatypes ((List!27852 0))(
  ( (Nil!27849) (Cons!27848 (h!29057 (_ BitVec 64)) (t!41322 List!27852)) )
))
(declare-fun arrayNoDuplicates!0 (array!81059 (_ BitVec 32) List!27852) Bool)

(assert (=> b!1252384 (= res!835210 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27849))))

(declare-fun b!1252385 () Bool)

(declare-fun e!711315 () Bool)

(declare-fun tp_is_empty!31735 () Bool)

(assert (=> b!1252385 (= e!711315 tp_is_empty!31735)))

(declare-fun res!835212 () Bool)

(assert (=> start!105096 (=> (not res!835212) (not e!711313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105096 (= res!835212 (validMask!0 mask!1466))))

(assert (=> start!105096 e!711313))

(assert (=> start!105096 true))

(assert (=> start!105096 tp!94001))

(assert (=> start!105096 tp_is_empty!31735))

(declare-fun array_inv!29937 (array!81059) Bool)

(assert (=> start!105096 (array_inv!29937 _keys!1118)))

(declare-fun e!711316 () Bool)

(declare-fun array_inv!29938 (array!81057) Bool)

(assert (=> start!105096 (and (array_inv!29938 _values!914) e!711316)))

(declare-fun b!1252386 () Bool)

(assert (=> b!1252386 (= e!711313 (not e!711317))))

(declare-fun res!835211 () Bool)

(assert (=> b!1252386 (=> res!835211 e!711317)))

(assert (=> b!1252386 (= res!835211 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565167 () ListLongMap!18509)

(declare-fun lt!565164 () ListLongMap!18509)

(assert (=> b!1252386 (= lt!565167 lt!565164)))

(declare-datatypes ((Unit!41506 0))(
  ( (Unit!41507) )
))
(declare-fun lt!565165 () Unit!41506)

(declare-fun minValueAfter!43 () V!47679)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!996 (array!81059 array!81057 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47679 V!47679 V!47679 V!47679 (_ BitVec 32) Int) Unit!41506)

(assert (=> b!1252386 (= lt!565165 (lemmaNoChangeToArrayThenSameMapNoExtras!996 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5674 (array!81059 array!81057 (_ BitVec 32) (_ BitVec 32) V!47679 V!47679 (_ BitVec 32) Int) ListLongMap!18509)

(assert (=> b!1252386 (= lt!565164 (getCurrentListMapNoExtraKeys!5674 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252386 (= lt!565167 (getCurrentListMapNoExtraKeys!5674 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252387 () Bool)

(assert (=> b!1252387 (= e!711316 (and e!711315 mapRes!49375))))

(declare-fun condMapEmpty!49375 () Bool)

(declare-fun mapDefault!49375 () ValueCell!15104)

(assert (=> b!1252387 (= condMapEmpty!49375 (= (arr!39092 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15104)) mapDefault!49375)))))

(declare-fun b!1252388 () Bool)

(declare-fun res!835209 () Bool)

(assert (=> b!1252388 (=> (not res!835209) (not e!711313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81059 (_ BitVec 32)) Bool)

(assert (=> b!1252388 (= res!835209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252389 () Bool)

(assert (=> b!1252389 (= e!711312 tp_is_empty!31735)))

(assert (= (and start!105096 res!835212) b!1252382))

(assert (= (and b!1252382 res!835208) b!1252388))

(assert (= (and b!1252388 res!835209) b!1252384))

(assert (= (and b!1252384 res!835210) b!1252386))

(assert (= (and b!1252386 (not res!835211)) b!1252383))

(assert (= (and b!1252387 condMapEmpty!49375) mapIsEmpty!49375))

(assert (= (and b!1252387 (not condMapEmpty!49375)) mapNonEmpty!49375))

(get-info :version)

(assert (= (and mapNonEmpty!49375 ((_ is ValueCellFull!15104) mapValue!49375)) b!1252389))

(assert (= (and b!1252387 ((_ is ValueCellFull!15104) mapDefault!49375)) b!1252385))

(assert (= start!105096 b!1252387))

(declare-fun m!1152565 () Bool)

(assert (=> b!1252388 m!1152565))

(declare-fun m!1152567 () Bool)

(assert (=> start!105096 m!1152567))

(declare-fun m!1152569 () Bool)

(assert (=> start!105096 m!1152569))

(declare-fun m!1152571 () Bool)

(assert (=> start!105096 m!1152571))

(declare-fun m!1152573 () Bool)

(assert (=> b!1252386 m!1152573))

(declare-fun m!1152575 () Bool)

(assert (=> b!1252386 m!1152575))

(declare-fun m!1152577 () Bool)

(assert (=> b!1252386 m!1152577))

(declare-fun m!1152579 () Bool)

(assert (=> b!1252384 m!1152579))

(declare-fun m!1152581 () Bool)

(assert (=> mapNonEmpty!49375 m!1152581))

(declare-fun m!1152583 () Bool)

(assert (=> b!1252383 m!1152583))

(check-sat (not start!105096) (not b!1252386) (not mapNonEmpty!49375) (not b!1252384) (not b!1252388) (not b_next!26833) (not b!1252383) tp_is_empty!31735 b_and!44619)
(check-sat b_and!44619 (not b_next!26833))
