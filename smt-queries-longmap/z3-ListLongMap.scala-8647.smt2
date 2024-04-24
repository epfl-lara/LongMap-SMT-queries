; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105424 () Bool)

(assert start!105424)

(declare-fun b_free!26917 () Bool)

(declare-fun b_next!26917 () Bool)

(assert (=> start!105424 (= b_free!26917 (not b_next!26917))))

(declare-fun tp!94255 () Bool)

(declare-fun b_and!44733 () Bool)

(assert (=> start!105424 (= tp!94255 b_and!44733)))

(declare-fun mapIsEmpty!49504 () Bool)

(declare-fun mapRes!49504 () Bool)

(assert (=> mapIsEmpty!49504 mapRes!49504))

(declare-fun b!1254934 () Bool)

(declare-fun res!836469 () Bool)

(declare-fun e!713066 () Bool)

(assert (=> b!1254934 (=> (not res!836469) (not e!713066))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81339 0))(
  ( (array!81340 (arr!39227 (Array (_ BitVec 32) (_ BitVec 64))) (size!39764 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81339)

(declare-datatypes ((V!47791 0))(
  ( (V!47792 (val!15972 Int)) )
))
(declare-datatypes ((ValueCell!15146 0))(
  ( (ValueCellFull!15146 (v!18666 V!47791)) (EmptyCell!15146) )
))
(declare-datatypes ((array!81341 0))(
  ( (array!81342 (arr!39228 (Array (_ BitVec 32) ValueCell!15146)) (size!39765 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81341)

(assert (=> b!1254934 (= res!836469 (and (= (size!39765 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39764 _keys!1118) (size!39765 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254935 () Bool)

(declare-fun res!836465 () Bool)

(assert (=> b!1254935 (=> (not res!836465) (not e!713066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81339 (_ BitVec 32)) Bool)

(assert (=> b!1254935 (= res!836465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254936 () Bool)

(declare-fun e!713063 () Bool)

(declare-fun e!713068 () Bool)

(assert (=> b!1254936 (= e!713063 (and e!713068 mapRes!49504))))

(declare-fun condMapEmpty!49504 () Bool)

(declare-fun mapDefault!49504 () ValueCell!15146)

(assert (=> b!1254936 (= condMapEmpty!49504 (= (arr!39228 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15146)) mapDefault!49504)))))

(declare-fun b!1254937 () Bool)

(declare-fun res!836467 () Bool)

(assert (=> b!1254937 (=> (not res!836467) (not e!713066))))

(declare-datatypes ((List!27869 0))(
  ( (Nil!27866) (Cons!27865 (h!29083 (_ BitVec 64)) (t!41342 List!27869)) )
))
(declare-fun arrayNoDuplicates!0 (array!81339 (_ BitVec 32) List!27869) Bool)

(assert (=> b!1254937 (= res!836467 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27866))))

(declare-fun res!836468 () Bool)

(assert (=> start!105424 (=> (not res!836468) (not e!713066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105424 (= res!836468 (validMask!0 mask!1466))))

(assert (=> start!105424 e!713066))

(assert (=> start!105424 true))

(assert (=> start!105424 tp!94255))

(declare-fun tp_is_empty!31819 () Bool)

(assert (=> start!105424 tp_is_empty!31819))

(declare-fun array_inv!30021 (array!81339) Bool)

(assert (=> start!105424 (array_inv!30021 _keys!1118)))

(declare-fun array_inv!30022 (array!81341) Bool)

(assert (=> start!105424 (and (array_inv!30022 _values!914) e!713063)))

(declare-fun b!1254938 () Bool)

(declare-fun e!713067 () Bool)

(assert (=> b!1254938 (= e!713066 (not e!713067))))

(declare-fun res!836466 () Bool)

(assert (=> b!1254938 (=> res!836466 e!713067)))

(assert (=> b!1254938 (= res!836466 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20630 0))(
  ( (tuple2!20631 (_1!10326 (_ BitVec 64)) (_2!10326 V!47791)) )
))
(declare-datatypes ((List!27870 0))(
  ( (Nil!27867) (Cons!27866 (h!29084 tuple2!20630) (t!41343 List!27870)) )
))
(declare-datatypes ((ListLongMap!18511 0))(
  ( (ListLongMap!18512 (toList!9271 List!27870)) )
))
(declare-fun lt!566646 () ListLongMap!18511)

(declare-fun lt!566647 () ListLongMap!18511)

(assert (=> b!1254938 (= lt!566646 lt!566647)))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47791)

(declare-fun minValueAfter!43 () V!47791)

(declare-datatypes ((Unit!41679 0))(
  ( (Unit!41680) )
))
(declare-fun lt!566650 () Unit!41679)

(declare-fun minValueBefore!43 () V!47791)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1010 (array!81339 array!81341 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47791 V!47791 V!47791 V!47791 (_ BitVec 32) Int) Unit!41679)

(assert (=> b!1254938 (= lt!566650 (lemmaNoChangeToArrayThenSameMapNoExtras!1010 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5696 (array!81339 array!81341 (_ BitVec 32) (_ BitVec 32) V!47791 V!47791 (_ BitVec 32) Int) ListLongMap!18511)

(assert (=> b!1254938 (= lt!566647 (getCurrentListMapNoExtraKeys!5696 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254938 (= lt!566646 (getCurrentListMapNoExtraKeys!5696 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49504 () Bool)

(declare-fun tp!94256 () Bool)

(declare-fun e!713064 () Bool)

(assert (=> mapNonEmpty!49504 (= mapRes!49504 (and tp!94256 e!713064))))

(declare-fun mapRest!49504 () (Array (_ BitVec 32) ValueCell!15146))

(declare-fun mapValue!49504 () ValueCell!15146)

(declare-fun mapKey!49504 () (_ BitVec 32))

(assert (=> mapNonEmpty!49504 (= (arr!39228 _values!914) (store mapRest!49504 mapKey!49504 mapValue!49504))))

(declare-fun b!1254939 () Bool)

(assert (=> b!1254939 (= e!713068 tp_is_empty!31819)))

(declare-fun b!1254940 () Bool)

(assert (=> b!1254940 (= e!713064 tp_is_empty!31819)))

(declare-fun b!1254941 () Bool)

(assert (=> b!1254941 (= e!713067 true)))

(declare-fun lt!566643 () ListLongMap!18511)

(declare-fun lt!566648 () ListLongMap!18511)

(declare-fun -!2013 (ListLongMap!18511 (_ BitVec 64)) ListLongMap!18511)

(assert (=> b!1254941 (= lt!566643 (-!2013 lt!566648 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566645 () ListLongMap!18511)

(assert (=> b!1254941 (= (-!2013 lt!566645 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566646)))

(declare-fun lt!566644 () Unit!41679)

(declare-fun addThenRemoveForNewKeyIsSame!303 (ListLongMap!18511 (_ BitVec 64) V!47791) Unit!41679)

(assert (=> b!1254941 (= lt!566644 (addThenRemoveForNewKeyIsSame!303 lt!566646 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566649 () ListLongMap!18511)

(assert (=> b!1254941 (and (= lt!566648 lt!566645) (= lt!566649 lt!566647))))

(declare-fun +!4209 (ListLongMap!18511 tuple2!20630) ListLongMap!18511)

(assert (=> b!1254941 (= lt!566645 (+!4209 lt!566646 (tuple2!20631 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4506 (array!81339 array!81341 (_ BitVec 32) (_ BitVec 32) V!47791 V!47791 (_ BitVec 32) Int) ListLongMap!18511)

(assert (=> b!1254941 (= lt!566649 (getCurrentListMap!4506 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254941 (= lt!566648 (getCurrentListMap!4506 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105424 res!836468) b!1254934))

(assert (= (and b!1254934 res!836469) b!1254935))

(assert (= (and b!1254935 res!836465) b!1254937))

(assert (= (and b!1254937 res!836467) b!1254938))

(assert (= (and b!1254938 (not res!836466)) b!1254941))

(assert (= (and b!1254936 condMapEmpty!49504) mapIsEmpty!49504))

(assert (= (and b!1254936 (not condMapEmpty!49504)) mapNonEmpty!49504))

(get-info :version)

(assert (= (and mapNonEmpty!49504 ((_ is ValueCellFull!15146) mapValue!49504)) b!1254940))

(assert (= (and b!1254936 ((_ is ValueCellFull!15146) mapDefault!49504)) b!1254939))

(assert (= start!105424 b!1254936))

(declare-fun m!1155817 () Bool)

(assert (=> mapNonEmpty!49504 m!1155817))

(declare-fun m!1155819 () Bool)

(assert (=> b!1254937 m!1155819))

(declare-fun m!1155821 () Bool)

(assert (=> b!1254938 m!1155821))

(declare-fun m!1155823 () Bool)

(assert (=> b!1254938 m!1155823))

(declare-fun m!1155825 () Bool)

(assert (=> b!1254938 m!1155825))

(declare-fun m!1155827 () Bool)

(assert (=> start!105424 m!1155827))

(declare-fun m!1155829 () Bool)

(assert (=> start!105424 m!1155829))

(declare-fun m!1155831 () Bool)

(assert (=> start!105424 m!1155831))

(declare-fun m!1155833 () Bool)

(assert (=> b!1254941 m!1155833))

(declare-fun m!1155835 () Bool)

(assert (=> b!1254941 m!1155835))

(declare-fun m!1155837 () Bool)

(assert (=> b!1254941 m!1155837))

(declare-fun m!1155839 () Bool)

(assert (=> b!1254941 m!1155839))

(declare-fun m!1155841 () Bool)

(assert (=> b!1254941 m!1155841))

(declare-fun m!1155843 () Bool)

(assert (=> b!1254941 m!1155843))

(declare-fun m!1155845 () Bool)

(assert (=> b!1254935 m!1155845))

(check-sat (not b!1254941) (not b!1254938) (not mapNonEmpty!49504) (not b_next!26917) b_and!44733 (not b!1254937) (not start!105424) tp_is_empty!31819 (not b!1254935))
(check-sat b_and!44733 (not b_next!26917))
