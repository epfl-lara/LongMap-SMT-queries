; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105570 () Bool)

(assert start!105570)

(declare-fun b_free!27019 () Bool)

(declare-fun b_next!27019 () Bool)

(assert (=> start!105570 (= b_free!27019 (not b_next!27019))))

(declare-fun tp!94567 () Bool)

(declare-fun b_and!44859 () Bool)

(assert (=> start!105570 (= tp!94567 b_and!44859)))

(declare-fun b!1256488 () Bool)

(declare-fun e!714183 () Bool)

(assert (=> b!1256488 (= e!714183 (not true))))

(declare-datatypes ((V!47927 0))(
  ( (V!47928 (val!16023 Int)) )
))
(declare-datatypes ((tuple2!20714 0))(
  ( (tuple2!20715 (_1!10368 (_ BitVec 64)) (_2!10368 V!47927)) )
))
(declare-datatypes ((List!27949 0))(
  ( (Nil!27946) (Cons!27945 (h!29163 tuple2!20714) (t!41426 List!27949)) )
))
(declare-datatypes ((ListLongMap!18595 0))(
  ( (ListLongMap!18596 (toList!9313 List!27949)) )
))
(declare-fun lt!567955 () ListLongMap!18595)

(declare-fun lt!567953 () ListLongMap!18595)

(assert (=> b!1256488 (= lt!567955 lt!567953)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47927)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47927)

(declare-datatypes ((array!81539 0))(
  ( (array!81540 (arr!39325 (Array (_ BitVec 32) (_ BitVec 64))) (size!39862 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81539)

(declare-datatypes ((ValueCell!15197 0))(
  ( (ValueCellFull!15197 (v!18719 V!47927)) (EmptyCell!15197) )
))
(declare-datatypes ((array!81541 0))(
  ( (array!81542 (arr!39326 (Array (_ BitVec 32) ValueCell!15197)) (size!39863 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81541)

(declare-datatypes ((Unit!41767 0))(
  ( (Unit!41768) )
))
(declare-fun lt!567954 () Unit!41767)

(declare-fun minValueBefore!43 () V!47927)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1049 (array!81539 array!81541 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47927 V!47927 V!47927 V!47927 (_ BitVec 32) Int) Unit!41767)

(assert (=> b!1256488 (= lt!567954 (lemmaNoChangeToArrayThenSameMapNoExtras!1049 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5735 (array!81539 array!81541 (_ BitVec 32) (_ BitVec 32) V!47927 V!47927 (_ BitVec 32) Int) ListLongMap!18595)

(assert (=> b!1256488 (= lt!567953 (getCurrentListMapNoExtraKeys!5735 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256488 (= lt!567955 (getCurrentListMapNoExtraKeys!5735 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256489 () Bool)

(declare-fun e!714185 () Bool)

(declare-fun tp_is_empty!31921 () Bool)

(assert (=> b!1256489 (= e!714185 tp_is_empty!31921)))

(declare-fun b!1256490 () Bool)

(declare-fun res!837356 () Bool)

(assert (=> b!1256490 (=> (not res!837356) (not e!714183))))

(declare-datatypes ((List!27950 0))(
  ( (Nil!27947) (Cons!27946 (h!29164 (_ BitVec 64)) (t!41427 List!27950)) )
))
(declare-fun arrayNoDuplicates!0 (array!81539 (_ BitVec 32) List!27950) Bool)

(assert (=> b!1256490 (= res!837356 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27947))))

(declare-fun res!837358 () Bool)

(assert (=> start!105570 (=> (not res!837358) (not e!714183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105570 (= res!837358 (validMask!0 mask!1466))))

(assert (=> start!105570 e!714183))

(assert (=> start!105570 true))

(assert (=> start!105570 tp!94567))

(assert (=> start!105570 tp_is_empty!31921))

(declare-fun array_inv!30097 (array!81539) Bool)

(assert (=> start!105570 (array_inv!30097 _keys!1118)))

(declare-fun e!714182 () Bool)

(declare-fun array_inv!30098 (array!81541) Bool)

(assert (=> start!105570 (and (array_inv!30098 _values!914) e!714182)))

(declare-fun mapIsEmpty!49663 () Bool)

(declare-fun mapRes!49663 () Bool)

(assert (=> mapIsEmpty!49663 mapRes!49663))

(declare-fun b!1256491 () Bool)

(declare-fun res!837359 () Bool)

(assert (=> b!1256491 (=> (not res!837359) (not e!714183))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81539 (_ BitVec 32)) Bool)

(assert (=> b!1256491 (= res!837359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256492 () Bool)

(declare-fun e!714181 () Bool)

(assert (=> b!1256492 (= e!714181 tp_is_empty!31921)))

(declare-fun b!1256493 () Bool)

(declare-fun res!837357 () Bool)

(assert (=> b!1256493 (=> (not res!837357) (not e!714183))))

(assert (=> b!1256493 (= res!837357 (and (= (size!39863 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39862 _keys!1118) (size!39863 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256494 () Bool)

(assert (=> b!1256494 (= e!714182 (and e!714185 mapRes!49663))))

(declare-fun condMapEmpty!49663 () Bool)

(declare-fun mapDefault!49663 () ValueCell!15197)

(assert (=> b!1256494 (= condMapEmpty!49663 (= (arr!39326 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15197)) mapDefault!49663)))))

(declare-fun mapNonEmpty!49663 () Bool)

(declare-fun tp!94568 () Bool)

(assert (=> mapNonEmpty!49663 (= mapRes!49663 (and tp!94568 e!714181))))

(declare-fun mapRest!49663 () (Array (_ BitVec 32) ValueCell!15197))

(declare-fun mapValue!49663 () ValueCell!15197)

(declare-fun mapKey!49663 () (_ BitVec 32))

(assert (=> mapNonEmpty!49663 (= (arr!39326 _values!914) (store mapRest!49663 mapKey!49663 mapValue!49663))))

(assert (= (and start!105570 res!837358) b!1256493))

(assert (= (and b!1256493 res!837357) b!1256491))

(assert (= (and b!1256491 res!837359) b!1256490))

(assert (= (and b!1256490 res!837356) b!1256488))

(assert (= (and b!1256494 condMapEmpty!49663) mapIsEmpty!49663))

(assert (= (and b!1256494 (not condMapEmpty!49663)) mapNonEmpty!49663))

(get-info :version)

(assert (= (and mapNonEmpty!49663 ((_ is ValueCellFull!15197) mapValue!49663)) b!1256492))

(assert (= (and b!1256494 ((_ is ValueCellFull!15197) mapDefault!49663)) b!1256489))

(assert (= start!105570 b!1256494))

(declare-fun m!1157571 () Bool)

(assert (=> b!1256488 m!1157571))

(declare-fun m!1157573 () Bool)

(assert (=> b!1256488 m!1157573))

(declare-fun m!1157575 () Bool)

(assert (=> b!1256488 m!1157575))

(declare-fun m!1157577 () Bool)

(assert (=> mapNonEmpty!49663 m!1157577))

(declare-fun m!1157579 () Bool)

(assert (=> start!105570 m!1157579))

(declare-fun m!1157581 () Bool)

(assert (=> start!105570 m!1157581))

(declare-fun m!1157583 () Bool)

(assert (=> start!105570 m!1157583))

(declare-fun m!1157585 () Bool)

(assert (=> b!1256490 m!1157585))

(declare-fun m!1157587 () Bool)

(assert (=> b!1256491 m!1157587))

(check-sat (not b_next!27019) (not start!105570) b_and!44859 (not b!1256491) tp_is_empty!31921 (not b!1256490) (not mapNonEmpty!49663) (not b!1256488))
(check-sat b_and!44859 (not b_next!27019))
