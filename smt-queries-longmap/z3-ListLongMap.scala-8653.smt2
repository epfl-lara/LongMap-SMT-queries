; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105482 () Bool)

(assert start!105482)

(declare-fun b_free!26953 () Bool)

(declare-fun b_next!26953 () Bool)

(assert (=> start!105482 (= b_free!26953 (not b_next!26953))))

(declare-fun tp!94367 () Bool)

(declare-fun b_and!44781 () Bool)

(assert (=> start!105482 (= tp!94367 b_and!44781)))

(declare-fun b!1255550 () Bool)

(declare-fun e!713508 () Bool)

(assert (=> b!1255550 (= e!713508 true)))

(declare-datatypes ((V!47839 0))(
  ( (V!47840 (val!15990 Int)) )
))
(declare-datatypes ((tuple2!20662 0))(
  ( (tuple2!20663 (_1!10342 (_ BitVec 64)) (_2!10342 V!47839)) )
))
(declare-datatypes ((List!27900 0))(
  ( (Nil!27897) (Cons!27896 (h!29114 tuple2!20662) (t!41375 List!27900)) )
))
(declare-datatypes ((ListLongMap!18543 0))(
  ( (ListLongMap!18544 (toList!9287 List!27900)) )
))
(declare-fun lt!567217 () ListLongMap!18543)

(declare-fun lt!567219 () ListLongMap!18543)

(declare-fun -!2026 (ListLongMap!18543 (_ BitVec 64)) ListLongMap!18543)

(assert (=> b!1255550 (= lt!567217 (-!2026 lt!567219 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!567214 () ListLongMap!18543)

(declare-fun lt!567218 () ListLongMap!18543)

(assert (=> b!1255550 (= (-!2026 lt!567214 #b1000000000000000000000000000000000000000000000000000000000000000) lt!567218)))

(declare-datatypes ((Unit!41713 0))(
  ( (Unit!41714) )
))
(declare-fun lt!567215 () Unit!41713)

(declare-fun minValueBefore!43 () V!47839)

(declare-fun addThenRemoveForNewKeyIsSame!316 (ListLongMap!18543 (_ BitVec 64) V!47839) Unit!41713)

(assert (=> b!1255550 (= lt!567215 (addThenRemoveForNewKeyIsSame!316 lt!567218 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!567220 () ListLongMap!18543)

(declare-fun lt!567213 () ListLongMap!18543)

(assert (=> b!1255550 (and (= lt!567219 lt!567214) (= lt!567213 lt!567220))))

(declare-fun +!4222 (ListLongMap!18543 tuple2!20662) ListLongMap!18543)

(assert (=> b!1255550 (= lt!567214 (+!4222 lt!567218 (tuple2!20663 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47839)

(declare-datatypes ((array!81411 0))(
  ( (array!81412 (arr!39262 (Array (_ BitVec 32) (_ BitVec 64))) (size!39799 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81411)

(declare-datatypes ((ValueCell!15164 0))(
  ( (ValueCellFull!15164 (v!18685 V!47839)) (EmptyCell!15164) )
))
(declare-datatypes ((array!81413 0))(
  ( (array!81414 (arr!39263 (Array (_ BitVec 32) ValueCell!15164)) (size!39800 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81413)

(declare-fun minValueAfter!43 () V!47839)

(declare-fun getCurrentListMap!4519 (array!81411 array!81413 (_ BitVec 32) (_ BitVec 32) V!47839 V!47839 (_ BitVec 32) Int) ListLongMap!18543)

(assert (=> b!1255550 (= lt!567213 (getCurrentListMap!4519 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1255550 (= lt!567219 (getCurrentListMap!4519 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255551 () Bool)

(declare-fun e!713507 () Bool)

(assert (=> b!1255551 (= e!713507 (not e!713508))))

(declare-fun res!836817 () Bool)

(assert (=> b!1255551 (=> res!836817 e!713508)))

(assert (=> b!1255551 (= res!836817 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1255551 (= lt!567218 lt!567220)))

(declare-fun lt!567216 () Unit!41713)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1025 (array!81411 array!81413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47839 V!47839 V!47839 V!47839 (_ BitVec 32) Int) Unit!41713)

(assert (=> b!1255551 (= lt!567216 (lemmaNoChangeToArrayThenSameMapNoExtras!1025 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5711 (array!81411 array!81413 (_ BitVec 32) (_ BitVec 32) V!47839 V!47839 (_ BitVec 32) Int) ListLongMap!18543)

(assert (=> b!1255551 (= lt!567220 (getCurrentListMapNoExtraKeys!5711 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255551 (= lt!567218 (getCurrentListMapNoExtraKeys!5711 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1255552 () Bool)

(declare-fun res!836819 () Bool)

(assert (=> b!1255552 (=> (not res!836819) (not e!713507))))

(declare-datatypes ((List!27901 0))(
  ( (Nil!27898) (Cons!27897 (h!29115 (_ BitVec 64)) (t!41376 List!27901)) )
))
(declare-fun arrayNoDuplicates!0 (array!81411 (_ BitVec 32) List!27901) Bool)

(assert (=> b!1255552 (= res!836819 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27898))))

(declare-fun b!1255553 () Bool)

(declare-fun e!713510 () Bool)

(declare-fun e!713506 () Bool)

(declare-fun mapRes!49561 () Bool)

(assert (=> b!1255553 (= e!713510 (and e!713506 mapRes!49561))))

(declare-fun condMapEmpty!49561 () Bool)

(declare-fun mapDefault!49561 () ValueCell!15164)

(assert (=> b!1255553 (= condMapEmpty!49561 (= (arr!39263 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15164)) mapDefault!49561)))))

(declare-fun b!1255554 () Bool)

(declare-fun e!713511 () Bool)

(declare-fun tp_is_empty!31855 () Bool)

(assert (=> b!1255554 (= e!713511 tp_is_empty!31855)))

(declare-fun res!836818 () Bool)

(assert (=> start!105482 (=> (not res!836818) (not e!713507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105482 (= res!836818 (validMask!0 mask!1466))))

(assert (=> start!105482 e!713507))

(assert (=> start!105482 true))

(assert (=> start!105482 tp!94367))

(assert (=> start!105482 tp_is_empty!31855))

(declare-fun array_inv!30047 (array!81411) Bool)

(assert (=> start!105482 (array_inv!30047 _keys!1118)))

(declare-fun array_inv!30048 (array!81413) Bool)

(assert (=> start!105482 (and (array_inv!30048 _values!914) e!713510)))

(declare-fun mapIsEmpty!49561 () Bool)

(assert (=> mapIsEmpty!49561 mapRes!49561))

(declare-fun b!1255555 () Bool)

(assert (=> b!1255555 (= e!713506 tp_is_empty!31855)))

(declare-fun b!1255556 () Bool)

(declare-fun res!836821 () Bool)

(assert (=> b!1255556 (=> (not res!836821) (not e!713507))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81411 (_ BitVec 32)) Bool)

(assert (=> b!1255556 (= res!836821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49561 () Bool)

(declare-fun tp!94366 () Bool)

(assert (=> mapNonEmpty!49561 (= mapRes!49561 (and tp!94366 e!713511))))

(declare-fun mapValue!49561 () ValueCell!15164)

(declare-fun mapKey!49561 () (_ BitVec 32))

(declare-fun mapRest!49561 () (Array (_ BitVec 32) ValueCell!15164))

(assert (=> mapNonEmpty!49561 (= (arr!39263 _values!914) (store mapRest!49561 mapKey!49561 mapValue!49561))))

(declare-fun b!1255557 () Bool)

(declare-fun res!836820 () Bool)

(assert (=> b!1255557 (=> (not res!836820) (not e!713507))))

(assert (=> b!1255557 (= res!836820 (and (= (size!39800 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39799 _keys!1118) (size!39800 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105482 res!836818) b!1255557))

(assert (= (and b!1255557 res!836820) b!1255556))

(assert (= (and b!1255556 res!836821) b!1255552))

(assert (= (and b!1255552 res!836819) b!1255551))

(assert (= (and b!1255551 (not res!836817)) b!1255550))

(assert (= (and b!1255553 condMapEmpty!49561) mapIsEmpty!49561))

(assert (= (and b!1255553 (not condMapEmpty!49561)) mapNonEmpty!49561))

(get-info :version)

(assert (= (and mapNonEmpty!49561 ((_ is ValueCellFull!15164) mapValue!49561)) b!1255554))

(assert (= (and b!1255553 ((_ is ValueCellFull!15164) mapDefault!49561)) b!1255555))

(assert (= start!105482 b!1255553))

(declare-fun m!1156541 () Bool)

(assert (=> mapNonEmpty!49561 m!1156541))

(declare-fun m!1156543 () Bool)

(assert (=> b!1255550 m!1156543))

(declare-fun m!1156545 () Bool)

(assert (=> b!1255550 m!1156545))

(declare-fun m!1156547 () Bool)

(assert (=> b!1255550 m!1156547))

(declare-fun m!1156549 () Bool)

(assert (=> b!1255550 m!1156549))

(declare-fun m!1156551 () Bool)

(assert (=> b!1255550 m!1156551))

(declare-fun m!1156553 () Bool)

(assert (=> b!1255550 m!1156553))

(declare-fun m!1156555 () Bool)

(assert (=> b!1255556 m!1156555))

(declare-fun m!1156557 () Bool)

(assert (=> b!1255551 m!1156557))

(declare-fun m!1156559 () Bool)

(assert (=> b!1255551 m!1156559))

(declare-fun m!1156561 () Bool)

(assert (=> b!1255551 m!1156561))

(declare-fun m!1156563 () Bool)

(assert (=> start!105482 m!1156563))

(declare-fun m!1156565 () Bool)

(assert (=> start!105482 m!1156565))

(declare-fun m!1156567 () Bool)

(assert (=> start!105482 m!1156567))

(declare-fun m!1156569 () Bool)

(assert (=> b!1255552 m!1156569))

(check-sat (not b_next!26953) (not start!105482) b_and!44781 (not b!1255552) (not b!1255551) (not mapNonEmpty!49561) tp_is_empty!31855 (not b!1255556) (not b!1255550))
(check-sat b_and!44781 (not b_next!26953))
