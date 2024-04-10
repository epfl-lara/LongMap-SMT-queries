; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105102 () Bool)

(assert start!105102)

(declare-fun b_free!26835 () Bool)

(declare-fun b_next!26835 () Bool)

(assert (=> start!105102 (= b_free!26835 (not b_next!26835))))

(declare-fun tp!94007 () Bool)

(declare-fun b_and!44639 () Bool)

(assert (=> start!105102 (= tp!94007 b_and!44639)))

(declare-fun b!1252488 () Bool)

(declare-fun e!711376 () Bool)

(declare-fun e!711375 () Bool)

(declare-fun mapRes!49378 () Bool)

(assert (=> b!1252488 (= e!711376 (and e!711375 mapRes!49378))))

(declare-fun condMapEmpty!49378 () Bool)

(declare-datatypes ((V!47681 0))(
  ( (V!47682 (val!15931 Int)) )
))
(declare-datatypes ((ValueCell!15105 0))(
  ( (ValueCellFull!15105 (v!18629 V!47681)) (EmptyCell!15105) )
))
(declare-datatypes ((array!81136 0))(
  ( (array!81137 (arr!39131 (Array (_ BitVec 32) ValueCell!15105)) (size!39667 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81136)

(declare-fun mapDefault!49378 () ValueCell!15105)

(assert (=> b!1252488 (= condMapEmpty!49378 (= (arr!39131 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15105)) mapDefault!49378)))))

(declare-fun b!1252489 () Bool)

(declare-fun res!835266 () Bool)

(declare-fun e!711377 () Bool)

(assert (=> b!1252489 (=> (not res!835266) (not e!711377))))

(declare-datatypes ((array!81138 0))(
  ( (array!81139 (arr!39132 (Array (_ BitVec 32) (_ BitVec 64))) (size!39668 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81138)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81138 (_ BitVec 32)) Bool)

(assert (=> b!1252489 (= res!835266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49378 () Bool)

(declare-fun tp!94006 () Bool)

(declare-fun e!711380 () Bool)

(assert (=> mapNonEmpty!49378 (= mapRes!49378 (and tp!94006 e!711380))))

(declare-fun mapValue!49378 () ValueCell!15105)

(declare-fun mapRest!49378 () (Array (_ BitVec 32) ValueCell!15105))

(declare-fun mapKey!49378 () (_ BitVec 32))

(assert (=> mapNonEmpty!49378 (= (arr!39131 _values!914) (store mapRest!49378 mapKey!49378 mapValue!49378))))

(declare-fun mapIsEmpty!49378 () Bool)

(assert (=> mapIsEmpty!49378 mapRes!49378))

(declare-fun b!1252490 () Bool)

(declare-fun e!711378 () Bool)

(assert (=> b!1252490 (= e!711378 true)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20550 0))(
  ( (tuple2!20551 (_1!10286 (_ BitVec 64)) (_2!10286 V!47681)) )
))
(declare-datatypes ((List!27782 0))(
  ( (Nil!27779) (Cons!27778 (h!28987 tuple2!20550) (t!41261 List!27782)) )
))
(declare-datatypes ((ListLongMap!18423 0))(
  ( (ListLongMap!18424 (toList!9227 List!27782)) )
))
(declare-fun lt!565357 () ListLongMap!18423)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47681)

(declare-fun minValueBefore!43 () V!47681)

(declare-fun getCurrentListMap!4475 (array!81138 array!81136 (_ BitVec 32) (_ BitVec 32) V!47681 V!47681 (_ BitVec 32) Int) ListLongMap!18423)

(assert (=> b!1252490 (= lt!565357 (getCurrentListMap!4475 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252491 () Bool)

(declare-fun tp_is_empty!31737 () Bool)

(assert (=> b!1252491 (= e!711380 tp_is_empty!31737)))

(declare-fun b!1252492 () Bool)

(assert (=> b!1252492 (= e!711375 tp_is_empty!31737)))

(declare-fun b!1252493 () Bool)

(assert (=> b!1252493 (= e!711377 (not e!711378))))

(declare-fun res!835264 () Bool)

(assert (=> b!1252493 (=> res!835264 e!711378)))

(assert (=> b!1252493 (= res!835264 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!565358 () ListLongMap!18423)

(declare-fun lt!565356 () ListLongMap!18423)

(assert (=> b!1252493 (= lt!565358 lt!565356)))

(declare-datatypes ((Unit!41643 0))(
  ( (Unit!41644) )
))
(declare-fun lt!565355 () Unit!41643)

(declare-fun minValueAfter!43 () V!47681)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!987 (array!81138 array!81136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47681 V!47681 V!47681 V!47681 (_ BitVec 32) Int) Unit!41643)

(assert (=> b!1252493 (= lt!565355 (lemmaNoChangeToArrayThenSameMapNoExtras!987 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5623 (array!81138 array!81136 (_ BitVec 32) (_ BitVec 32) V!47681 V!47681 (_ BitVec 32) Int) ListLongMap!18423)

(assert (=> b!1252493 (= lt!565356 (getCurrentListMapNoExtraKeys!5623 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252493 (= lt!565358 (getCurrentListMapNoExtraKeys!5623 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252494 () Bool)

(declare-fun res!835267 () Bool)

(assert (=> b!1252494 (=> (not res!835267) (not e!711377))))

(assert (=> b!1252494 (= res!835267 (and (= (size!39667 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39668 _keys!1118) (size!39667 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252495 () Bool)

(declare-fun res!835263 () Bool)

(assert (=> b!1252495 (=> (not res!835263) (not e!711377))))

(declare-datatypes ((List!27783 0))(
  ( (Nil!27780) (Cons!27779 (h!28988 (_ BitVec 64)) (t!41262 List!27783)) )
))
(declare-fun arrayNoDuplicates!0 (array!81138 (_ BitVec 32) List!27783) Bool)

(assert (=> b!1252495 (= res!835263 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27780))))

(declare-fun res!835265 () Bool)

(assert (=> start!105102 (=> (not res!835265) (not e!711377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105102 (= res!835265 (validMask!0 mask!1466))))

(assert (=> start!105102 e!711377))

(assert (=> start!105102 true))

(assert (=> start!105102 tp!94007))

(assert (=> start!105102 tp_is_empty!31737))

(declare-fun array_inv!29847 (array!81138) Bool)

(assert (=> start!105102 (array_inv!29847 _keys!1118)))

(declare-fun array_inv!29848 (array!81136) Bool)

(assert (=> start!105102 (and (array_inv!29848 _values!914) e!711376)))

(assert (= (and start!105102 res!835265) b!1252494))

(assert (= (and b!1252494 res!835267) b!1252489))

(assert (= (and b!1252489 res!835266) b!1252495))

(assert (= (and b!1252495 res!835263) b!1252493))

(assert (= (and b!1252493 (not res!835264)) b!1252490))

(assert (= (and b!1252488 condMapEmpty!49378) mapIsEmpty!49378))

(assert (= (and b!1252488 (not condMapEmpty!49378)) mapNonEmpty!49378))

(get-info :version)

(assert (= (and mapNonEmpty!49378 ((_ is ValueCellFull!15105) mapValue!49378)) b!1252491))

(assert (= (and b!1252488 ((_ is ValueCellFull!15105) mapDefault!49378)) b!1252492))

(assert (= start!105102 b!1252488))

(declare-fun m!1153105 () Bool)

(assert (=> b!1252493 m!1153105))

(declare-fun m!1153107 () Bool)

(assert (=> b!1252493 m!1153107))

(declare-fun m!1153109 () Bool)

(assert (=> b!1252493 m!1153109))

(declare-fun m!1153111 () Bool)

(assert (=> b!1252490 m!1153111))

(declare-fun m!1153113 () Bool)

(assert (=> b!1252489 m!1153113))

(declare-fun m!1153115 () Bool)

(assert (=> start!105102 m!1153115))

(declare-fun m!1153117 () Bool)

(assert (=> start!105102 m!1153117))

(declare-fun m!1153119 () Bool)

(assert (=> start!105102 m!1153119))

(declare-fun m!1153121 () Bool)

(assert (=> b!1252495 m!1153121))

(declare-fun m!1153123 () Bool)

(assert (=> mapNonEmpty!49378 m!1153123))

(check-sat (not b!1252489) (not b!1252495) (not mapNonEmpty!49378) (not b_next!26835) (not start!105102) (not b!1252493) tp_is_empty!31737 (not b!1252490) b_and!44639)
(check-sat b_and!44639 (not b_next!26835))
