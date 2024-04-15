; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105272 () Bool)

(assert start!105272)

(declare-fun b_free!26971 () Bool)

(declare-fun b_next!26971 () Bool)

(assert (=> start!105272 (= b_free!26971 (not b_next!26971))))

(declare-fun tp!94420 () Bool)

(declare-fun b_and!44779 () Bool)

(assert (=> start!105272 (= tp!94420 b_and!44779)))

(declare-fun mapIsEmpty!49588 () Bool)

(declare-fun mapRes!49588 () Bool)

(assert (=> mapIsEmpty!49588 mapRes!49588))

(declare-fun b!1254379 () Bool)

(declare-fun res!836396 () Bool)

(declare-fun e!712777 () Bool)

(assert (=> b!1254379 (=> (not res!836396) (not e!712777))))

(declare-datatypes ((array!81327 0))(
  ( (array!81328 (arr!39225 (Array (_ BitVec 32) (_ BitVec 64))) (size!39763 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81327)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81327 (_ BitVec 32)) Bool)

(assert (=> b!1254379 (= res!836396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254380 () Bool)

(declare-fun e!712780 () Bool)

(assert (=> b!1254380 (= e!712780 true)))

(declare-datatypes ((V!47863 0))(
  ( (V!47864 (val!15999 Int)) )
))
(declare-datatypes ((tuple2!20742 0))(
  ( (tuple2!20743 (_1!10382 (_ BitVec 64)) (_2!10382 V!47863)) )
))
(declare-datatypes ((List!27951 0))(
  ( (Nil!27948) (Cons!27947 (h!29156 tuple2!20742) (t!41425 List!27951)) )
))
(declare-datatypes ((ListLongMap!18615 0))(
  ( (ListLongMap!18616 (toList!9323 List!27951)) )
))
(declare-fun lt!566772 () ListLongMap!18615)

(declare-fun lt!566766 () ListLongMap!18615)

(declare-fun -!2015 (ListLongMap!18615 (_ BitVec 64)) ListLongMap!18615)

(assert (=> b!1254380 (= lt!566772 (-!2015 lt!566766 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566773 () ListLongMap!18615)

(declare-fun lt!566770 () ListLongMap!18615)

(assert (=> b!1254380 (= (-!2015 lt!566773 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566770)))

(declare-datatypes ((Unit!41611 0))(
  ( (Unit!41612) )
))
(declare-fun lt!566771 () Unit!41611)

(declare-fun minValueBefore!43 () V!47863)

(declare-fun addThenRemoveForNewKeyIsSame!304 (ListLongMap!18615 (_ BitVec 64) V!47863) Unit!41611)

(assert (=> b!1254380 (= lt!566771 (addThenRemoveForNewKeyIsSame!304 lt!566770 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566769 () ListLongMap!18615)

(declare-fun lt!566767 () ListLongMap!18615)

(assert (=> b!1254380 (and (= lt!566766 lt!566773) (= lt!566767 lt!566769))))

(declare-fun +!4218 (ListLongMap!18615 tuple2!20742) ListLongMap!18615)

(assert (=> b!1254380 (= lt!566773 (+!4218 lt!566770 (tuple2!20743 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47863)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47863)

(declare-datatypes ((ValueCell!15173 0))(
  ( (ValueCellFull!15173 (v!18697 V!47863)) (EmptyCell!15173) )
))
(declare-datatypes ((array!81329 0))(
  ( (array!81330 (arr!39226 (Array (_ BitVec 32) ValueCell!15173)) (size!39764 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81329)

(declare-fun getCurrentListMap!4454 (array!81327 array!81329 (_ BitVec 32) (_ BitVec 32) V!47863 V!47863 (_ BitVec 32) Int) ListLongMap!18615)

(assert (=> b!1254380 (= lt!566767 (getCurrentListMap!4454 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254380 (= lt!566766 (getCurrentListMap!4454 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254381 () Bool)

(declare-fun e!712779 () Bool)

(declare-fun tp_is_empty!31873 () Bool)

(assert (=> b!1254381 (= e!712779 tp_is_empty!31873)))

(declare-fun b!1254382 () Bool)

(declare-fun e!712778 () Bool)

(assert (=> b!1254382 (= e!712778 tp_is_empty!31873)))

(declare-fun b!1254383 () Bool)

(assert (=> b!1254383 (= e!712777 (not e!712780))))

(declare-fun res!836393 () Bool)

(assert (=> b!1254383 (=> res!836393 e!712780)))

(assert (=> b!1254383 (= res!836393 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254383 (= lt!566770 lt!566769)))

(declare-fun lt!566768 () Unit!41611)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1042 (array!81327 array!81329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47863 V!47863 V!47863 V!47863 (_ BitVec 32) Int) Unit!41611)

(assert (=> b!1254383 (= lt!566768 (lemmaNoChangeToArrayThenSameMapNoExtras!1042 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5720 (array!81327 array!81329 (_ BitVec 32) (_ BitVec 32) V!47863 V!47863 (_ BitVec 32) Int) ListLongMap!18615)

(assert (=> b!1254383 (= lt!566769 (getCurrentListMapNoExtraKeys!5720 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254383 (= lt!566770 (getCurrentListMapNoExtraKeys!5720 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254384 () Bool)

(declare-fun res!836394 () Bool)

(assert (=> b!1254384 (=> (not res!836394) (not e!712777))))

(declare-datatypes ((List!27952 0))(
  ( (Nil!27949) (Cons!27948 (h!29157 (_ BitVec 64)) (t!41426 List!27952)) )
))
(declare-fun arrayNoDuplicates!0 (array!81327 (_ BitVec 32) List!27952) Bool)

(assert (=> b!1254384 (= res!836394 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27949))))

(declare-fun res!836395 () Bool)

(assert (=> start!105272 (=> (not res!836395) (not e!712777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105272 (= res!836395 (validMask!0 mask!1466))))

(assert (=> start!105272 e!712777))

(assert (=> start!105272 true))

(assert (=> start!105272 tp!94420))

(assert (=> start!105272 tp_is_empty!31873))

(declare-fun array_inv!30029 (array!81327) Bool)

(assert (=> start!105272 (array_inv!30029 _keys!1118)))

(declare-fun e!712776 () Bool)

(declare-fun array_inv!30030 (array!81329) Bool)

(assert (=> start!105272 (and (array_inv!30030 _values!914) e!712776)))

(declare-fun b!1254385 () Bool)

(assert (=> b!1254385 (= e!712776 (and e!712779 mapRes!49588))))

(declare-fun condMapEmpty!49588 () Bool)

(declare-fun mapDefault!49588 () ValueCell!15173)

(assert (=> b!1254385 (= condMapEmpty!49588 (= (arr!39226 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15173)) mapDefault!49588)))))

(declare-fun mapNonEmpty!49588 () Bool)

(declare-fun tp!94421 () Bool)

(assert (=> mapNonEmpty!49588 (= mapRes!49588 (and tp!94421 e!712778))))

(declare-fun mapValue!49588 () ValueCell!15173)

(declare-fun mapKey!49588 () (_ BitVec 32))

(declare-fun mapRest!49588 () (Array (_ BitVec 32) ValueCell!15173))

(assert (=> mapNonEmpty!49588 (= (arr!39226 _values!914) (store mapRest!49588 mapKey!49588 mapValue!49588))))

(declare-fun b!1254386 () Bool)

(declare-fun res!836392 () Bool)

(assert (=> b!1254386 (=> (not res!836392) (not e!712777))))

(assert (=> b!1254386 (= res!836392 (and (= (size!39764 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39763 _keys!1118) (size!39764 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105272 res!836395) b!1254386))

(assert (= (and b!1254386 res!836392) b!1254379))

(assert (= (and b!1254379 res!836396) b!1254384))

(assert (= (and b!1254384 res!836394) b!1254383))

(assert (= (and b!1254383 (not res!836393)) b!1254380))

(assert (= (and b!1254385 condMapEmpty!49588) mapIsEmpty!49588))

(assert (= (and b!1254385 (not condMapEmpty!49588)) mapNonEmpty!49588))

(get-info :version)

(assert (= (and mapNonEmpty!49588 ((_ is ValueCellFull!15173) mapValue!49588)) b!1254382))

(assert (= (and b!1254385 ((_ is ValueCellFull!15173) mapDefault!49588)) b!1254381))

(assert (= start!105272 b!1254385))

(declare-fun m!1154679 () Bool)

(assert (=> b!1254379 m!1154679))

(declare-fun m!1154681 () Bool)

(assert (=> b!1254380 m!1154681))

(declare-fun m!1154683 () Bool)

(assert (=> b!1254380 m!1154683))

(declare-fun m!1154685 () Bool)

(assert (=> b!1254380 m!1154685))

(declare-fun m!1154687 () Bool)

(assert (=> b!1254380 m!1154687))

(declare-fun m!1154689 () Bool)

(assert (=> b!1254380 m!1154689))

(declare-fun m!1154691 () Bool)

(assert (=> b!1254380 m!1154691))

(declare-fun m!1154693 () Bool)

(assert (=> start!105272 m!1154693))

(declare-fun m!1154695 () Bool)

(assert (=> start!105272 m!1154695))

(declare-fun m!1154697 () Bool)

(assert (=> start!105272 m!1154697))

(declare-fun m!1154699 () Bool)

(assert (=> b!1254384 m!1154699))

(declare-fun m!1154701 () Bool)

(assert (=> mapNonEmpty!49588 m!1154701))

(declare-fun m!1154703 () Bool)

(assert (=> b!1254383 m!1154703))

(declare-fun m!1154705 () Bool)

(assert (=> b!1254383 m!1154705))

(declare-fun m!1154707 () Bool)

(assert (=> b!1254383 m!1154707))

(check-sat (not b!1254379) (not b!1254384) (not b!1254380) tp_is_empty!31873 (not b!1254383) (not start!105272) (not mapNonEmpty!49588) (not b_next!26971) b_and!44779)
(check-sat b_and!44779 (not b_next!26971))
