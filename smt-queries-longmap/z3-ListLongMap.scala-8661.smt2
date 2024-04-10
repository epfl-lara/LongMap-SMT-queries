; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105330 () Bool)

(assert start!105330)

(declare-fun b_free!27003 () Bool)

(declare-fun b_next!27003 () Bool)

(assert (=> start!105330 (= b_free!27003 (not b_next!27003))))

(declare-fun tp!94519 () Bool)

(declare-fun b_and!44841 () Bool)

(assert (=> start!105330 (= tp!94519 b_and!44841)))

(declare-fun b!1255015 () Bool)

(declare-fun res!836742 () Bool)

(declare-fun e!713215 () Bool)

(assert (=> b!1255015 (=> (not res!836742) (not e!713215))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81462 0))(
  ( (array!81463 (arr!39291 (Array (_ BitVec 32) (_ BitVec 64))) (size!39827 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81462)

(declare-datatypes ((V!47905 0))(
  ( (V!47906 (val!16015 Int)) )
))
(declare-datatypes ((ValueCell!15189 0))(
  ( (ValueCellFull!15189 (v!18715 V!47905)) (EmptyCell!15189) )
))
(declare-datatypes ((array!81464 0))(
  ( (array!81465 (arr!39292 (Array (_ BitVec 32) ValueCell!15189)) (size!39828 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81464)

(assert (=> b!1255015 (= res!836742 (and (= (size!39828 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39827 _keys!1118) (size!39828 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1255016 () Bool)

(assert (=> b!1255016 (= e!713215 (not true))))

(declare-datatypes ((tuple2!20684 0))(
  ( (tuple2!20685 (_1!10353 (_ BitVec 64)) (_2!10353 V!47905)) )
))
(declare-datatypes ((List!27907 0))(
  ( (Nil!27904) (Cons!27903 (h!29112 tuple2!20684) (t!41392 List!27907)) )
))
(declare-datatypes ((ListLongMap!18557 0))(
  ( (ListLongMap!18558 (toList!9294 List!27907)) )
))
(declare-fun lt!567398 () ListLongMap!18557)

(declare-fun lt!567399 () ListLongMap!18557)

(assert (=> b!1255016 (= lt!567398 lt!567399)))

(declare-fun minValueAfter!43 () V!47905)

(declare-fun zeroValue!871 () V!47905)

(declare-fun minValueBefore!43 () V!47905)

(declare-datatypes ((Unit!41774 0))(
  ( (Unit!41775) )
))
(declare-fun lt!567397 () Unit!41774)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1043 (array!81462 array!81464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47905 V!47905 V!47905 V!47905 (_ BitVec 32) Int) Unit!41774)

(assert (=> b!1255016 (= lt!567397 (lemmaNoChangeToArrayThenSameMapNoExtras!1043 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5679 (array!81462 array!81464 (_ BitVec 32) (_ BitVec 32) V!47905 V!47905 (_ BitVec 32) Int) ListLongMap!18557)

(assert (=> b!1255016 (= lt!567399 (getCurrentListMapNoExtraKeys!5679 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1255016 (= lt!567398 (getCurrentListMapNoExtraKeys!5679 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49639 () Bool)

(declare-fun mapRes!49639 () Bool)

(assert (=> mapIsEmpty!49639 mapRes!49639))

(declare-fun b!1255017 () Bool)

(declare-fun e!713218 () Bool)

(declare-fun e!713217 () Bool)

(assert (=> b!1255017 (= e!713218 (and e!713217 mapRes!49639))))

(declare-fun condMapEmpty!49639 () Bool)

(declare-fun mapDefault!49639 () ValueCell!15189)

(assert (=> b!1255017 (= condMapEmpty!49639 (= (arr!39292 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15189)) mapDefault!49639)))))

(declare-fun b!1255018 () Bool)

(declare-fun res!836743 () Bool)

(assert (=> b!1255018 (=> (not res!836743) (not e!713215))))

(declare-datatypes ((List!27908 0))(
  ( (Nil!27905) (Cons!27904 (h!29113 (_ BitVec 64)) (t!41393 List!27908)) )
))
(declare-fun arrayNoDuplicates!0 (array!81462 (_ BitVec 32) List!27908) Bool)

(assert (=> b!1255018 (= res!836743 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27905))))

(declare-fun res!836741 () Bool)

(assert (=> start!105330 (=> (not res!836741) (not e!713215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105330 (= res!836741 (validMask!0 mask!1466))))

(assert (=> start!105330 e!713215))

(assert (=> start!105330 true))

(assert (=> start!105330 tp!94519))

(declare-fun tp_is_empty!31905 () Bool)

(assert (=> start!105330 tp_is_empty!31905))

(declare-fun array_inv!29947 (array!81462) Bool)

(assert (=> start!105330 (array_inv!29947 _keys!1118)))

(declare-fun array_inv!29948 (array!81464) Bool)

(assert (=> start!105330 (and (array_inv!29948 _values!914) e!713218)))

(declare-fun b!1255019 () Bool)

(assert (=> b!1255019 (= e!713217 tp_is_empty!31905)))

(declare-fun b!1255020 () Bool)

(declare-fun e!713216 () Bool)

(assert (=> b!1255020 (= e!713216 tp_is_empty!31905)))

(declare-fun b!1255021 () Bool)

(declare-fun res!836740 () Bool)

(assert (=> b!1255021 (=> (not res!836740) (not e!713215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81462 (_ BitVec 32)) Bool)

(assert (=> b!1255021 (= res!836740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49639 () Bool)

(declare-fun tp!94520 () Bool)

(assert (=> mapNonEmpty!49639 (= mapRes!49639 (and tp!94520 e!713216))))

(declare-fun mapRest!49639 () (Array (_ BitVec 32) ValueCell!15189))

(declare-fun mapKey!49639 () (_ BitVec 32))

(declare-fun mapValue!49639 () ValueCell!15189)

(assert (=> mapNonEmpty!49639 (= (arr!39292 _values!914) (store mapRest!49639 mapKey!49639 mapValue!49639))))

(assert (= (and start!105330 res!836741) b!1255015))

(assert (= (and b!1255015 res!836742) b!1255021))

(assert (= (and b!1255021 res!836740) b!1255018))

(assert (= (and b!1255018 res!836743) b!1255016))

(assert (= (and b!1255017 condMapEmpty!49639) mapIsEmpty!49639))

(assert (= (and b!1255017 (not condMapEmpty!49639)) mapNonEmpty!49639))

(get-info :version)

(assert (= (and mapNonEmpty!49639 ((_ is ValueCellFull!15189) mapValue!49639)) b!1255020))

(assert (= (and b!1255017 ((_ is ValueCellFull!15189) mapDefault!49639)) b!1255019))

(assert (= start!105330 b!1255017))

(declare-fun m!1155815 () Bool)

(assert (=> b!1255018 m!1155815))

(declare-fun m!1155817 () Bool)

(assert (=> mapNonEmpty!49639 m!1155817))

(declare-fun m!1155819 () Bool)

(assert (=> b!1255021 m!1155819))

(declare-fun m!1155821 () Bool)

(assert (=> start!105330 m!1155821))

(declare-fun m!1155823 () Bool)

(assert (=> start!105330 m!1155823))

(declare-fun m!1155825 () Bool)

(assert (=> start!105330 m!1155825))

(declare-fun m!1155827 () Bool)

(assert (=> b!1255016 m!1155827))

(declare-fun m!1155829 () Bool)

(assert (=> b!1255016 m!1155829))

(declare-fun m!1155831 () Bool)

(assert (=> b!1255016 m!1155831))

(check-sat tp_is_empty!31905 (not b!1255018) (not b!1255021) (not mapNonEmpty!49639) (not b!1255016) (not start!105330) (not b_next!27003) b_and!44841)
(check-sat b_and!44841 (not b_next!27003))
