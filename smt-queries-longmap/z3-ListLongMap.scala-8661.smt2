; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105552 () Bool)

(assert start!105552)

(declare-fun b_free!27001 () Bool)

(declare-fun b_next!27001 () Bool)

(assert (=> start!105552 (= b_free!27001 (not b_next!27001))))

(declare-fun tp!94514 () Bool)

(declare-fun b_and!44841 () Bool)

(assert (=> start!105552 (= tp!94514 b_and!44841)))

(declare-fun b!1256299 () Bool)

(declare-fun e!714047 () Bool)

(declare-fun e!714049 () Bool)

(declare-fun mapRes!49636 () Bool)

(assert (=> b!1256299 (= e!714047 (and e!714049 mapRes!49636))))

(declare-fun condMapEmpty!49636 () Bool)

(declare-datatypes ((V!47903 0))(
  ( (V!47904 (val!16014 Int)) )
))
(declare-datatypes ((ValueCell!15188 0))(
  ( (ValueCellFull!15188 (v!18710 V!47903)) (EmptyCell!15188) )
))
(declare-datatypes ((array!81505 0))(
  ( (array!81506 (arr!39308 (Array (_ BitVec 32) ValueCell!15188)) (size!39845 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81505)

(declare-fun mapDefault!49636 () ValueCell!15188)

(assert (=> b!1256299 (= condMapEmpty!49636 (= (arr!39308 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15188)) mapDefault!49636)))))

(declare-fun b!1256300 () Bool)

(declare-fun tp_is_empty!31903 () Bool)

(assert (=> b!1256300 (= e!714049 tp_is_empty!31903)))

(declare-fun b!1256301 () Bool)

(declare-fun res!837251 () Bool)

(declare-fun e!714050 () Bool)

(assert (=> b!1256301 (=> (not res!837251) (not e!714050))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81507 0))(
  ( (array!81508 (arr!39309 (Array (_ BitVec 32) (_ BitVec 64))) (size!39846 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81507)

(assert (=> b!1256301 (= res!837251 (and (= (size!39845 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39846 _keys!1118) (size!39845 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256302 () Bool)

(declare-fun e!714046 () Bool)

(assert (=> b!1256302 (= e!714046 tp_is_empty!31903)))

(declare-fun mapNonEmpty!49636 () Bool)

(declare-fun tp!94513 () Bool)

(assert (=> mapNonEmpty!49636 (= mapRes!49636 (and tp!94513 e!714046))))

(declare-fun mapValue!49636 () ValueCell!15188)

(declare-fun mapRest!49636 () (Array (_ BitVec 32) ValueCell!15188))

(declare-fun mapKey!49636 () (_ BitVec 32))

(assert (=> mapNonEmpty!49636 (= (arr!39308 _values!914) (store mapRest!49636 mapKey!49636 mapValue!49636))))

(declare-fun res!837248 () Bool)

(assert (=> start!105552 (=> (not res!837248) (not e!714050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105552 (= res!837248 (validMask!0 mask!1466))))

(assert (=> start!105552 e!714050))

(assert (=> start!105552 true))

(assert (=> start!105552 tp!94514))

(assert (=> start!105552 tp_is_empty!31903))

(declare-fun array_inv!30083 (array!81507) Bool)

(assert (=> start!105552 (array_inv!30083 _keys!1118)))

(declare-fun array_inv!30084 (array!81505) Bool)

(assert (=> start!105552 (and (array_inv!30084 _values!914) e!714047)))

(declare-fun b!1256303 () Bool)

(declare-fun res!837250 () Bool)

(assert (=> b!1256303 (=> (not res!837250) (not e!714050))))

(declare-datatypes ((List!27934 0))(
  ( (Nil!27931) (Cons!27930 (h!29148 (_ BitVec 64)) (t!41411 List!27934)) )
))
(declare-fun arrayNoDuplicates!0 (array!81507 (_ BitVec 32) List!27934) Bool)

(assert (=> b!1256303 (= res!837250 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27931))))

(declare-fun b!1256304 () Bool)

(declare-fun res!837249 () Bool)

(assert (=> b!1256304 (=> (not res!837249) (not e!714050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81507 (_ BitVec 32)) Bool)

(assert (=> b!1256304 (= res!837249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256305 () Bool)

(assert (=> b!1256305 (= e!714050 (not true))))

(declare-datatypes ((tuple2!20698 0))(
  ( (tuple2!20699 (_1!10360 (_ BitVec 64)) (_2!10360 V!47903)) )
))
(declare-datatypes ((List!27935 0))(
  ( (Nil!27932) (Cons!27931 (h!29149 tuple2!20698) (t!41412 List!27935)) )
))
(declare-datatypes ((ListLongMap!18579 0))(
  ( (ListLongMap!18580 (toList!9305 List!27935)) )
))
(declare-fun lt!567874 () ListLongMap!18579)

(declare-fun lt!567873 () ListLongMap!18579)

(assert (=> b!1256305 (= lt!567874 lt!567873)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41751 0))(
  ( (Unit!41752) )
))
(declare-fun lt!567872 () Unit!41751)

(declare-fun minValueAfter!43 () V!47903)

(declare-fun zeroValue!871 () V!47903)

(declare-fun minValueBefore!43 () V!47903)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1041 (array!81507 array!81505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47903 V!47903 V!47903 V!47903 (_ BitVec 32) Int) Unit!41751)

(assert (=> b!1256305 (= lt!567872 (lemmaNoChangeToArrayThenSameMapNoExtras!1041 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5727 (array!81507 array!81505 (_ BitVec 32) (_ BitVec 32) V!47903 V!47903 (_ BitVec 32) Int) ListLongMap!18579)

(assert (=> b!1256305 (= lt!567873 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256305 (= lt!567874 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49636 () Bool)

(assert (=> mapIsEmpty!49636 mapRes!49636))

(assert (= (and start!105552 res!837248) b!1256301))

(assert (= (and b!1256301 res!837251) b!1256304))

(assert (= (and b!1256304 res!837249) b!1256303))

(assert (= (and b!1256303 res!837250) b!1256305))

(assert (= (and b!1256299 condMapEmpty!49636) mapIsEmpty!49636))

(assert (= (and b!1256299 (not condMapEmpty!49636)) mapNonEmpty!49636))

(get-info :version)

(assert (= (and mapNonEmpty!49636 ((_ is ValueCellFull!15188) mapValue!49636)) b!1256302))

(assert (= (and b!1256299 ((_ is ValueCellFull!15188) mapDefault!49636)) b!1256300))

(assert (= start!105552 b!1256299))

(declare-fun m!1157409 () Bool)

(assert (=> b!1256305 m!1157409))

(declare-fun m!1157411 () Bool)

(assert (=> b!1256305 m!1157411))

(declare-fun m!1157413 () Bool)

(assert (=> b!1256305 m!1157413))

(declare-fun m!1157415 () Bool)

(assert (=> start!105552 m!1157415))

(declare-fun m!1157417 () Bool)

(assert (=> start!105552 m!1157417))

(declare-fun m!1157419 () Bool)

(assert (=> start!105552 m!1157419))

(declare-fun m!1157421 () Bool)

(assert (=> b!1256303 m!1157421))

(declare-fun m!1157423 () Bool)

(assert (=> b!1256304 m!1157423))

(declare-fun m!1157425 () Bool)

(assert (=> mapNonEmpty!49636 m!1157425))

(check-sat (not b!1256303) (not b!1256305) b_and!44841 (not mapNonEmpty!49636) (not start!105552) (not b!1256304) (not b_next!27001) tp_is_empty!31903)
(check-sat b_and!44841 (not b_next!27001))
