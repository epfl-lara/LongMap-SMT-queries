; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105260 () Bool)

(assert start!105260)

(declare-fun b_free!26959 () Bool)

(declare-fun b_next!26959 () Bool)

(assert (=> start!105260 (= b_free!26959 (not b_next!26959))))

(declare-fun tp!94384 () Bool)

(declare-fun b_and!44767 () Bool)

(assert (=> start!105260 (= tp!94384 b_and!44767)))

(declare-fun b!1254235 () Bool)

(declare-fun e!712668 () Bool)

(declare-fun tp_is_empty!31861 () Bool)

(assert (=> b!1254235 (= e!712668 tp_is_empty!31861)))

(declare-fun mapNonEmpty!49570 () Bool)

(declare-fun mapRes!49570 () Bool)

(declare-fun tp!94385 () Bool)

(declare-fun e!712672 () Bool)

(assert (=> mapNonEmpty!49570 (= mapRes!49570 (and tp!94385 e!712672))))

(declare-datatypes ((V!47847 0))(
  ( (V!47848 (val!15993 Int)) )
))
(declare-datatypes ((ValueCell!15167 0))(
  ( (ValueCellFull!15167 (v!18691 V!47847)) (EmptyCell!15167) )
))
(declare-fun mapValue!49570 () ValueCell!15167)

(declare-fun mapRest!49570 () (Array (_ BitVec 32) ValueCell!15167))

(declare-fun mapKey!49570 () (_ BitVec 32))

(declare-datatypes ((array!81305 0))(
  ( (array!81306 (arr!39214 (Array (_ BitVec 32) ValueCell!15167)) (size!39752 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81305)

(assert (=> mapNonEmpty!49570 (= (arr!39214 _values!914) (store mapRest!49570 mapKey!49570 mapValue!49570))))

(declare-fun mapIsEmpty!49570 () Bool)

(assert (=> mapIsEmpty!49570 mapRes!49570))

(declare-fun b!1254237 () Bool)

(declare-fun e!712671 () Bool)

(declare-fun e!712673 () Bool)

(assert (=> b!1254237 (= e!712671 (not e!712673))))

(declare-fun res!836306 () Bool)

(assert (=> b!1254237 (=> res!836306 e!712673)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254237 (= res!836306 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20734 0))(
  ( (tuple2!20735 (_1!10378 (_ BitVec 64)) (_2!10378 V!47847)) )
))
(declare-datatypes ((List!27945 0))(
  ( (Nil!27942) (Cons!27941 (h!29150 tuple2!20734) (t!41419 List!27945)) )
))
(declare-datatypes ((ListLongMap!18607 0))(
  ( (ListLongMap!18608 (toList!9319 List!27945)) )
))
(declare-fun lt!566622 () ListLongMap!18607)

(declare-fun lt!566625 () ListLongMap!18607)

(assert (=> b!1254237 (= lt!566622 lt!566625)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41603 0))(
  ( (Unit!41604) )
))
(declare-fun lt!566624 () Unit!41603)

(declare-fun minValueAfter!43 () V!47847)

(declare-fun zeroValue!871 () V!47847)

(declare-datatypes ((array!81307 0))(
  ( (array!81308 (arr!39215 (Array (_ BitVec 32) (_ BitVec 64))) (size!39753 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81307)

(declare-fun minValueBefore!43 () V!47847)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1039 (array!81307 array!81305 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47847 V!47847 V!47847 V!47847 (_ BitVec 32) Int) Unit!41603)

(assert (=> b!1254237 (= lt!566624 (lemmaNoChangeToArrayThenSameMapNoExtras!1039 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5717 (array!81307 array!81305 (_ BitVec 32) (_ BitVec 32) V!47847 V!47847 (_ BitVec 32) Int) ListLongMap!18607)

(assert (=> b!1254237 (= lt!566625 (getCurrentListMapNoExtraKeys!5717 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254237 (= lt!566622 (getCurrentListMapNoExtraKeys!5717 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254238 () Bool)

(declare-fun res!836304 () Bool)

(assert (=> b!1254238 (=> (not res!836304) (not e!712671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81307 (_ BitVec 32)) Bool)

(assert (=> b!1254238 (= res!836304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254239 () Bool)

(declare-fun e!712669 () Bool)

(assert (=> b!1254239 (= e!712669 (and e!712668 mapRes!49570))))

(declare-fun condMapEmpty!49570 () Bool)

(declare-fun mapDefault!49570 () ValueCell!15167)

(assert (=> b!1254239 (= condMapEmpty!49570 (= (arr!39214 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15167)) mapDefault!49570)))))

(declare-fun b!1254240 () Bool)

(assert (=> b!1254240 (= e!712673 true)))

(declare-fun lt!566629 () ListLongMap!18607)

(declare-fun lt!566627 () ListLongMap!18607)

(declare-fun -!2011 (ListLongMap!18607 (_ BitVec 64)) ListLongMap!18607)

(assert (=> b!1254240 (= lt!566629 (-!2011 lt!566627 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566623 () ListLongMap!18607)

(assert (=> b!1254240 (= (-!2011 lt!566623 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566622)))

(declare-fun lt!566628 () Unit!41603)

(declare-fun addThenRemoveForNewKeyIsSame!300 (ListLongMap!18607 (_ BitVec 64) V!47847) Unit!41603)

(assert (=> b!1254240 (= lt!566628 (addThenRemoveForNewKeyIsSame!300 lt!566622 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566626 () ListLongMap!18607)

(assert (=> b!1254240 (and (= lt!566627 lt!566623) (= lt!566626 lt!566625))))

(declare-fun +!4214 (ListLongMap!18607 tuple2!20734) ListLongMap!18607)

(assert (=> b!1254240 (= lt!566623 (+!4214 lt!566622 (tuple2!20735 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4450 (array!81307 array!81305 (_ BitVec 32) (_ BitVec 32) V!47847 V!47847 (_ BitVec 32) Int) ListLongMap!18607)

(assert (=> b!1254240 (= lt!566626 (getCurrentListMap!4450 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254240 (= lt!566627 (getCurrentListMap!4450 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!836305 () Bool)

(assert (=> start!105260 (=> (not res!836305) (not e!712671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105260 (= res!836305 (validMask!0 mask!1466))))

(assert (=> start!105260 e!712671))

(assert (=> start!105260 true))

(assert (=> start!105260 tp!94384))

(assert (=> start!105260 tp_is_empty!31861))

(declare-fun array_inv!30023 (array!81307) Bool)

(assert (=> start!105260 (array_inv!30023 _keys!1118)))

(declare-fun array_inv!30024 (array!81305) Bool)

(assert (=> start!105260 (and (array_inv!30024 _values!914) e!712669)))

(declare-fun b!1254236 () Bool)

(declare-fun res!836302 () Bool)

(assert (=> b!1254236 (=> (not res!836302) (not e!712671))))

(assert (=> b!1254236 (= res!836302 (and (= (size!39752 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39753 _keys!1118) (size!39752 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254241 () Bool)

(declare-fun res!836303 () Bool)

(assert (=> b!1254241 (=> (not res!836303) (not e!712671))))

(declare-datatypes ((List!27946 0))(
  ( (Nil!27943) (Cons!27942 (h!29151 (_ BitVec 64)) (t!41420 List!27946)) )
))
(declare-fun arrayNoDuplicates!0 (array!81307 (_ BitVec 32) List!27946) Bool)

(assert (=> b!1254241 (= res!836303 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27943))))

(declare-fun b!1254242 () Bool)

(assert (=> b!1254242 (= e!712672 tp_is_empty!31861)))

(assert (= (and start!105260 res!836305) b!1254236))

(assert (= (and b!1254236 res!836302) b!1254238))

(assert (= (and b!1254238 res!836304) b!1254241))

(assert (= (and b!1254241 res!836303) b!1254237))

(assert (= (and b!1254237 (not res!836306)) b!1254240))

(assert (= (and b!1254239 condMapEmpty!49570) mapIsEmpty!49570))

(assert (= (and b!1254239 (not condMapEmpty!49570)) mapNonEmpty!49570))

(get-info :version)

(assert (= (and mapNonEmpty!49570 ((_ is ValueCellFull!15167) mapValue!49570)) b!1254242))

(assert (= (and b!1254239 ((_ is ValueCellFull!15167) mapDefault!49570)) b!1254235))

(assert (= start!105260 b!1254239))

(declare-fun m!1154499 () Bool)

(assert (=> b!1254238 m!1154499))

(declare-fun m!1154501 () Bool)

(assert (=> mapNonEmpty!49570 m!1154501))

(declare-fun m!1154503 () Bool)

(assert (=> start!105260 m!1154503))

(declare-fun m!1154505 () Bool)

(assert (=> start!105260 m!1154505))

(declare-fun m!1154507 () Bool)

(assert (=> start!105260 m!1154507))

(declare-fun m!1154509 () Bool)

(assert (=> b!1254241 m!1154509))

(declare-fun m!1154511 () Bool)

(assert (=> b!1254237 m!1154511))

(declare-fun m!1154513 () Bool)

(assert (=> b!1254237 m!1154513))

(declare-fun m!1154515 () Bool)

(assert (=> b!1254237 m!1154515))

(declare-fun m!1154517 () Bool)

(assert (=> b!1254240 m!1154517))

(declare-fun m!1154519 () Bool)

(assert (=> b!1254240 m!1154519))

(declare-fun m!1154521 () Bool)

(assert (=> b!1254240 m!1154521))

(declare-fun m!1154523 () Bool)

(assert (=> b!1254240 m!1154523))

(declare-fun m!1154525 () Bool)

(assert (=> b!1254240 m!1154525))

(declare-fun m!1154527 () Bool)

(assert (=> b!1254240 m!1154527))

(check-sat tp_is_empty!31861 b_and!44767 (not b!1254240) (not mapNonEmpty!49570) (not b!1254238) (not b!1254241) (not b_next!26959) (not b!1254237) (not start!105260))
(check-sat b_and!44767 (not b_next!26959))
