; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105178 () Bool)

(assert start!105178)

(declare-fun b_free!26895 () Bool)

(declare-fun b_next!26895 () Bool)

(assert (=> start!105178 (= b_free!26895 (not b_next!26895))))

(declare-fun tp!94189 () Bool)

(declare-fun b_and!44709 () Bool)

(assert (=> start!105178 (= tp!94189 b_and!44709)))

(declare-fun b!1253365 () Bool)

(declare-fun e!712023 () Bool)

(declare-fun tp_is_empty!31797 () Bool)

(assert (=> b!1253365 (= e!712023 tp_is_empty!31797)))

(declare-fun res!835781 () Bool)

(declare-fun e!712019 () Bool)

(assert (=> start!105178 (=> (not res!835781) (not e!712019))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105178 (= res!835781 (validMask!0 mask!1466))))

(assert (=> start!105178 e!712019))

(assert (=> start!105178 true))

(assert (=> start!105178 tp!94189))

(assert (=> start!105178 tp_is_empty!31797))

(declare-datatypes ((array!81254 0))(
  ( (array!81255 (arr!39189 (Array (_ BitVec 32) (_ BitVec 64))) (size!39725 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81254)

(declare-fun array_inv!29879 (array!81254) Bool)

(assert (=> start!105178 (array_inv!29879 _keys!1118)))

(declare-datatypes ((V!47761 0))(
  ( (V!47762 (val!15961 Int)) )
))
(declare-datatypes ((ValueCell!15135 0))(
  ( (ValueCellFull!15135 (v!18659 V!47761)) (EmptyCell!15135) )
))
(declare-datatypes ((array!81256 0))(
  ( (array!81257 (arr!39190 (Array (_ BitVec 32) ValueCell!15135)) (size!39726 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81256)

(declare-fun e!712021 () Bool)

(declare-fun array_inv!29880 (array!81256) Bool)

(assert (=> start!105178 (and (array_inv!29880 _values!914) e!712021)))

(declare-fun b!1253366 () Bool)

(declare-fun res!835782 () Bool)

(assert (=> b!1253366 (=> (not res!835782) (not e!712019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81254 (_ BitVec 32)) Bool)

(assert (=> b!1253366 (= res!835782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253367 () Bool)

(declare-fun res!835780 () Bool)

(assert (=> b!1253367 (=> (not res!835780) (not e!712019))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1253367 (= res!835780 (and (= (size!39726 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39725 _keys!1118) (size!39726 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1253368 () Bool)

(declare-fun e!712018 () Bool)

(assert (=> b!1253368 (= e!712018 true)))

(declare-datatypes ((tuple2!20598 0))(
  ( (tuple2!20599 (_1!10310 (_ BitVec 64)) (_2!10310 V!47761)) )
))
(declare-datatypes ((List!27827 0))(
  ( (Nil!27824) (Cons!27823 (h!29032 tuple2!20598) (t!41308 List!27827)) )
))
(declare-datatypes ((ListLongMap!18471 0))(
  ( (ListLongMap!18472 (toList!9251 List!27827)) )
))
(declare-fun lt!565899 () ListLongMap!18471)

(declare-fun lt!565897 () ListLongMap!18471)

(declare-fun -!2024 (ListLongMap!18471 (_ BitVec 64)) ListLongMap!18471)

(assert (=> b!1253368 (= lt!565899 (-!2024 lt!565897 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565895 () ListLongMap!18471)

(declare-fun lt!565902 () ListLongMap!18471)

(assert (=> b!1253368 (= (-!2024 lt!565895 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565902)))

(declare-datatypes ((Unit!41684 0))(
  ( (Unit!41685) )
))
(declare-fun lt!565900 () Unit!41684)

(declare-fun minValueBefore!43 () V!47761)

(declare-fun addThenRemoveForNewKeyIsSame!294 (ListLongMap!18471 (_ BitVec 64) V!47761) Unit!41684)

(assert (=> b!1253368 (= lt!565900 (addThenRemoveForNewKeyIsSame!294 lt!565902 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565896 () ListLongMap!18471)

(declare-fun lt!565898 () ListLongMap!18471)

(assert (=> b!1253368 (and (= lt!565897 lt!565895) (= lt!565896 lt!565898))))

(declare-fun +!4147 (ListLongMap!18471 tuple2!20598) ListLongMap!18471)

(assert (=> b!1253368 (= lt!565895 (+!4147 lt!565902 (tuple2!20599 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47761)

(declare-fun minValueAfter!43 () V!47761)

(declare-fun getCurrentListMap!4495 (array!81254 array!81256 (_ BitVec 32) (_ BitVec 32) V!47761 V!47761 (_ BitVec 32) Int) ListLongMap!18471)

(assert (=> b!1253368 (= lt!565896 (getCurrentListMap!4495 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253368 (= lt!565897 (getCurrentListMap!4495 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49471 () Bool)

(declare-fun mapRes!49471 () Bool)

(declare-fun tp!94190 () Bool)

(assert (=> mapNonEmpty!49471 (= mapRes!49471 (and tp!94190 e!712023))))

(declare-fun mapRest!49471 () (Array (_ BitVec 32) ValueCell!15135))

(declare-fun mapKey!49471 () (_ BitVec 32))

(declare-fun mapValue!49471 () ValueCell!15135)

(assert (=> mapNonEmpty!49471 (= (arr!39190 _values!914) (store mapRest!49471 mapKey!49471 mapValue!49471))))

(declare-fun b!1253369 () Bool)

(declare-fun e!712020 () Bool)

(assert (=> b!1253369 (= e!712021 (and e!712020 mapRes!49471))))

(declare-fun condMapEmpty!49471 () Bool)

(declare-fun mapDefault!49471 () ValueCell!15135)

(assert (=> b!1253369 (= condMapEmpty!49471 (= (arr!39190 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15135)) mapDefault!49471)))))

(declare-fun mapIsEmpty!49471 () Bool)

(assert (=> mapIsEmpty!49471 mapRes!49471))

(declare-fun b!1253370 () Bool)

(assert (=> b!1253370 (= e!712020 tp_is_empty!31797)))

(declare-fun b!1253371 () Bool)

(declare-fun res!835783 () Bool)

(assert (=> b!1253371 (=> (not res!835783) (not e!712019))))

(declare-datatypes ((List!27828 0))(
  ( (Nil!27825) (Cons!27824 (h!29033 (_ BitVec 64)) (t!41309 List!27828)) )
))
(declare-fun arrayNoDuplicates!0 (array!81254 (_ BitVec 32) List!27828) Bool)

(assert (=> b!1253371 (= res!835783 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27825))))

(declare-fun b!1253372 () Bool)

(assert (=> b!1253372 (= e!712019 (not e!712018))))

(declare-fun res!835784 () Bool)

(assert (=> b!1253372 (=> res!835784 e!712018)))

(assert (=> b!1253372 (= res!835784 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253372 (= lt!565902 lt!565898)))

(declare-fun lt!565901 () Unit!41684)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1006 (array!81254 array!81256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47761 V!47761 V!47761 V!47761 (_ BitVec 32) Int) Unit!41684)

(assert (=> b!1253372 (= lt!565901 (lemmaNoChangeToArrayThenSameMapNoExtras!1006 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5642 (array!81254 array!81256 (_ BitVec 32) (_ BitVec 32) V!47761 V!47761 (_ BitVec 32) Int) ListLongMap!18471)

(assert (=> b!1253372 (= lt!565898 (getCurrentListMapNoExtraKeys!5642 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253372 (= lt!565902 (getCurrentListMapNoExtraKeys!5642 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105178 res!835781) b!1253367))

(assert (= (and b!1253367 res!835780) b!1253366))

(assert (= (and b!1253366 res!835782) b!1253371))

(assert (= (and b!1253371 res!835783) b!1253372))

(assert (= (and b!1253372 (not res!835784)) b!1253368))

(assert (= (and b!1253369 condMapEmpty!49471) mapIsEmpty!49471))

(assert (= (and b!1253369 (not condMapEmpty!49471)) mapNonEmpty!49471))

(get-info :version)

(assert (= (and mapNonEmpty!49471 ((_ is ValueCellFull!15135) mapValue!49471)) b!1253365))

(assert (= (and b!1253369 ((_ is ValueCellFull!15135) mapDefault!49471)) b!1253370))

(assert (= start!105178 b!1253369))

(declare-fun m!1153875 () Bool)

(assert (=> b!1253368 m!1153875))

(declare-fun m!1153877 () Bool)

(assert (=> b!1253368 m!1153877))

(declare-fun m!1153879 () Bool)

(assert (=> b!1253368 m!1153879))

(declare-fun m!1153881 () Bool)

(assert (=> b!1253368 m!1153881))

(declare-fun m!1153883 () Bool)

(assert (=> b!1253368 m!1153883))

(declare-fun m!1153885 () Bool)

(assert (=> b!1253368 m!1153885))

(declare-fun m!1153887 () Bool)

(assert (=> b!1253372 m!1153887))

(declare-fun m!1153889 () Bool)

(assert (=> b!1253372 m!1153889))

(declare-fun m!1153891 () Bool)

(assert (=> b!1253372 m!1153891))

(declare-fun m!1153893 () Bool)

(assert (=> b!1253366 m!1153893))

(declare-fun m!1153895 () Bool)

(assert (=> start!105178 m!1153895))

(declare-fun m!1153897 () Bool)

(assert (=> start!105178 m!1153897))

(declare-fun m!1153899 () Bool)

(assert (=> start!105178 m!1153899))

(declare-fun m!1153901 () Bool)

(assert (=> mapNonEmpty!49471 m!1153901))

(declare-fun m!1153903 () Bool)

(assert (=> b!1253371 m!1153903))

(check-sat (not b!1253372) (not b!1253371) (not start!105178) (not b_next!26895) b_and!44709 tp_is_empty!31797 (not mapNonEmpty!49471) (not b!1253366) (not b!1253368))
(check-sat b_and!44709 (not b_next!26895))
