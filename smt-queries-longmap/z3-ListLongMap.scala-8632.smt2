; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105090 () Bool)

(assert start!105090)

(declare-fun b_free!26827 () Bool)

(declare-fun b_next!26827 () Bool)

(assert (=> start!105090 (= b_free!26827 (not b_next!26827))))

(declare-fun tp!93982 () Bool)

(declare-fun b_and!44613 () Bool)

(assert (=> start!105090 (= tp!93982 b_and!44613)))

(declare-fun b!1252310 () Bool)

(declare-fun e!711263 () Bool)

(declare-fun e!711262 () Bool)

(declare-fun mapRes!49366 () Bool)

(assert (=> b!1252310 (= e!711263 (and e!711262 mapRes!49366))))

(declare-fun condMapEmpty!49366 () Bool)

(declare-datatypes ((V!47671 0))(
  ( (V!47672 (val!15927 Int)) )
))
(declare-datatypes ((ValueCell!15101 0))(
  ( (ValueCellFull!15101 (v!18624 V!47671)) (EmptyCell!15101) )
))
(declare-datatypes ((array!81045 0))(
  ( (array!81046 (arr!39086 (Array (_ BitVec 32) ValueCell!15101)) (size!39624 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81045)

(declare-fun mapDefault!49366 () ValueCell!15101)

(assert (=> b!1252310 (= condMapEmpty!49366 (= (arr!39086 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15101)) mapDefault!49366)))))

(declare-fun b!1252311 () Bool)

(declare-fun tp_is_empty!31729 () Bool)

(assert (=> b!1252311 (= e!711262 tp_is_empty!31729)))

(declare-fun b!1252312 () Bool)

(declare-fun res!835164 () Bool)

(declare-fun e!711259 () Bool)

(assert (=> b!1252312 (=> (not res!835164) (not e!711259))))

(declare-datatypes ((array!81047 0))(
  ( (array!81048 (arr!39087 (Array (_ BitVec 32) (_ BitVec 64))) (size!39625 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81047)

(declare-datatypes ((List!27846 0))(
  ( (Nil!27843) (Cons!27842 (h!29051 (_ BitVec 64)) (t!41316 List!27846)) )
))
(declare-fun arrayNoDuplicates!0 (array!81047 (_ BitVec 32) List!27846) Bool)

(assert (=> b!1252312 (= res!835164 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27843))))

(declare-fun res!835165 () Bool)

(assert (=> start!105090 (=> (not res!835165) (not e!711259))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105090 (= res!835165 (validMask!0 mask!1466))))

(assert (=> start!105090 e!711259))

(assert (=> start!105090 true))

(assert (=> start!105090 tp!93982))

(assert (=> start!105090 tp_is_empty!31729))

(declare-fun array_inv!29935 (array!81047) Bool)

(assert (=> start!105090 (array_inv!29935 _keys!1118)))

(declare-fun array_inv!29936 (array!81045) Bool)

(assert (=> start!105090 (and (array_inv!29936 _values!914) e!711263)))

(declare-fun b!1252313 () Bool)

(declare-fun res!835163 () Bool)

(assert (=> b!1252313 (=> (not res!835163) (not e!711259))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1252313 (= res!835163 (and (= (size!39624 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39625 _keys!1118) (size!39624 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49366 () Bool)

(declare-fun tp!93983 () Bool)

(declare-fun e!711258 () Bool)

(assert (=> mapNonEmpty!49366 (= mapRes!49366 (and tp!93983 e!711258))))

(declare-fun mapValue!49366 () ValueCell!15101)

(declare-fun mapRest!49366 () (Array (_ BitVec 32) ValueCell!15101))

(declare-fun mapKey!49366 () (_ BitVec 32))

(assert (=> mapNonEmpty!49366 (= (arr!39086 _values!914) (store mapRest!49366 mapKey!49366 mapValue!49366))))

(declare-fun b!1252314 () Bool)

(declare-fun e!711261 () Bool)

(assert (=> b!1252314 (= e!711259 (not e!711261))))

(declare-fun res!835166 () Bool)

(assert (=> b!1252314 (=> res!835166 e!711261)))

(assert (=> b!1252314 (= res!835166 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20630 0))(
  ( (tuple2!20631 (_1!10326 (_ BitVec 64)) (_2!10326 V!47671)) )
))
(declare-datatypes ((List!27847 0))(
  ( (Nil!27844) (Cons!27843 (h!29052 tuple2!20630) (t!41317 List!27847)) )
))
(declare-datatypes ((ListLongMap!18503 0))(
  ( (ListLongMap!18504 (toList!9267 List!27847)) )
))
(declare-fun lt!565131 () ListLongMap!18503)

(declare-fun lt!565130 () ListLongMap!18503)

(assert (=> b!1252314 (= lt!565131 lt!565130)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47671)

(declare-fun zeroValue!871 () V!47671)

(declare-datatypes ((Unit!41500 0))(
  ( (Unit!41501) )
))
(declare-fun lt!565128 () Unit!41500)

(declare-fun minValueBefore!43 () V!47671)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!993 (array!81047 array!81045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47671 V!47671 V!47671 V!47671 (_ BitVec 32) Int) Unit!41500)

(assert (=> b!1252314 (= lt!565128 (lemmaNoChangeToArrayThenSameMapNoExtras!993 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5671 (array!81047 array!81045 (_ BitVec 32) (_ BitVec 32) V!47671 V!47671 (_ BitVec 32) Int) ListLongMap!18503)

(assert (=> b!1252314 (= lt!565130 (getCurrentListMapNoExtraKeys!5671 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252314 (= lt!565131 (getCurrentListMapNoExtraKeys!5671 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252315 () Bool)

(assert (=> b!1252315 (= e!711261 true)))

(declare-fun lt!565129 () ListLongMap!18503)

(declare-fun getCurrentListMap!4411 (array!81047 array!81045 (_ BitVec 32) (_ BitVec 32) V!47671 V!47671 (_ BitVec 32) Int) ListLongMap!18503)

(assert (=> b!1252315 (= lt!565129 (getCurrentListMap!4411 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252316 () Bool)

(assert (=> b!1252316 (= e!711258 tp_is_empty!31729)))

(declare-fun mapIsEmpty!49366 () Bool)

(assert (=> mapIsEmpty!49366 mapRes!49366))

(declare-fun b!1252317 () Bool)

(declare-fun res!835167 () Bool)

(assert (=> b!1252317 (=> (not res!835167) (not e!711259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81047 (_ BitVec 32)) Bool)

(assert (=> b!1252317 (= res!835167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105090 res!835165) b!1252313))

(assert (= (and b!1252313 res!835163) b!1252317))

(assert (= (and b!1252317 res!835167) b!1252312))

(assert (= (and b!1252312 res!835164) b!1252314))

(assert (= (and b!1252314 (not res!835166)) b!1252315))

(assert (= (and b!1252310 condMapEmpty!49366) mapIsEmpty!49366))

(assert (= (and b!1252310 (not condMapEmpty!49366)) mapNonEmpty!49366))

(get-info :version)

(assert (= (and mapNonEmpty!49366 ((_ is ValueCellFull!15101) mapValue!49366)) b!1252316))

(assert (= (and b!1252310 ((_ is ValueCellFull!15101) mapDefault!49366)) b!1252311))

(assert (= start!105090 b!1252310))

(declare-fun m!1152505 () Bool)

(assert (=> start!105090 m!1152505))

(declare-fun m!1152507 () Bool)

(assert (=> start!105090 m!1152507))

(declare-fun m!1152509 () Bool)

(assert (=> start!105090 m!1152509))

(declare-fun m!1152511 () Bool)

(assert (=> mapNonEmpty!49366 m!1152511))

(declare-fun m!1152513 () Bool)

(assert (=> b!1252317 m!1152513))

(declare-fun m!1152515 () Bool)

(assert (=> b!1252315 m!1152515))

(declare-fun m!1152517 () Bool)

(assert (=> b!1252314 m!1152517))

(declare-fun m!1152519 () Bool)

(assert (=> b!1252314 m!1152519))

(declare-fun m!1152521 () Bool)

(assert (=> b!1252314 m!1152521))

(declare-fun m!1152523 () Bool)

(assert (=> b!1252312 m!1152523))

(check-sat tp_is_empty!31729 (not b!1252314) (not b!1252312) (not b!1252315) (not b_next!26827) (not mapNonEmpty!49366) (not start!105090) (not b!1252317) b_and!44613)
(check-sat b_and!44613 (not b_next!26827))
