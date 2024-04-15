; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105284 () Bool)

(assert start!105284)

(declare-fun b_free!26983 () Bool)

(declare-fun b_next!26983 () Bool)

(assert (=> start!105284 (= b_free!26983 (not b_next!26983))))

(declare-fun tp!94457 () Bool)

(declare-fun b_and!44791 () Bool)

(assert (=> start!105284 (= tp!94457 b_and!44791)))

(declare-fun b!1254523 () Bool)

(declare-fun e!712885 () Bool)

(assert (=> b!1254523 (= e!712885 true)))

(declare-datatypes ((V!47879 0))(
  ( (V!47880 (val!16005 Int)) )
))
(declare-datatypes ((tuple2!20748 0))(
  ( (tuple2!20749 (_1!10385 (_ BitVec 64)) (_2!10385 V!47879)) )
))
(declare-datatypes ((List!27958 0))(
  ( (Nil!27955) (Cons!27954 (h!29163 tuple2!20748) (t!41432 List!27958)) )
))
(declare-datatypes ((ListLongMap!18621 0))(
  ( (ListLongMap!18622 (toList!9326 List!27958)) )
))
(declare-fun lt!566916 () ListLongMap!18621)

(declare-fun lt!566914 () ListLongMap!18621)

(declare-fun -!2018 (ListLongMap!18621 (_ BitVec 64)) ListLongMap!18621)

(assert (=> b!1254523 (= lt!566916 (-!2018 lt!566914 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566917 () ListLongMap!18621)

(declare-fun lt!566913 () ListLongMap!18621)

(assert (=> b!1254523 (= (-!2018 lt!566917 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566913)))

(declare-datatypes ((Unit!41617 0))(
  ( (Unit!41618) )
))
(declare-fun lt!566910 () Unit!41617)

(declare-fun minValueBefore!43 () V!47879)

(declare-fun addThenRemoveForNewKeyIsSame!307 (ListLongMap!18621 (_ BitVec 64) V!47879) Unit!41617)

(assert (=> b!1254523 (= lt!566910 (addThenRemoveForNewKeyIsSame!307 lt!566913 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566912 () ListLongMap!18621)

(declare-fun lt!566911 () ListLongMap!18621)

(assert (=> b!1254523 (and (= lt!566914 lt!566917) (= lt!566912 lt!566911))))

(declare-fun +!4221 (ListLongMap!18621 tuple2!20748) ListLongMap!18621)

(assert (=> b!1254523 (= lt!566917 (+!4221 lt!566913 (tuple2!20749 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47879)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47879)

(declare-datatypes ((array!81349 0))(
  ( (array!81350 (arr!39236 (Array (_ BitVec 32) (_ BitVec 64))) (size!39774 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81349)

(declare-datatypes ((ValueCell!15179 0))(
  ( (ValueCellFull!15179 (v!18703 V!47879)) (EmptyCell!15179) )
))
(declare-datatypes ((array!81351 0))(
  ( (array!81352 (arr!39237 (Array (_ BitVec 32) ValueCell!15179)) (size!39775 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81351)

(declare-fun getCurrentListMap!4457 (array!81349 array!81351 (_ BitVec 32) (_ BitVec 32) V!47879 V!47879 (_ BitVec 32) Int) ListLongMap!18621)

(assert (=> b!1254523 (= lt!566912 (getCurrentListMap!4457 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254523 (= lt!566914 (getCurrentListMap!4457 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254524 () Bool)

(declare-fun e!712888 () Bool)

(assert (=> b!1254524 (= e!712888 (not e!712885))))

(declare-fun res!836486 () Bool)

(assert (=> b!1254524 (=> res!836486 e!712885)))

(assert (=> b!1254524 (= res!836486 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254524 (= lt!566913 lt!566911)))

(declare-fun lt!566915 () Unit!41617)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1044 (array!81349 array!81351 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47879 V!47879 V!47879 V!47879 (_ BitVec 32) Int) Unit!41617)

(assert (=> b!1254524 (= lt!566915 (lemmaNoChangeToArrayThenSameMapNoExtras!1044 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5722 (array!81349 array!81351 (_ BitVec 32) (_ BitVec 32) V!47879 V!47879 (_ BitVec 32) Int) ListLongMap!18621)

(assert (=> b!1254524 (= lt!566911 (getCurrentListMapNoExtraKeys!5722 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254524 (= lt!566913 (getCurrentListMapNoExtraKeys!5722 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254525 () Bool)

(declare-fun e!712887 () Bool)

(declare-fun tp_is_empty!31885 () Bool)

(assert (=> b!1254525 (= e!712887 tp_is_empty!31885)))

(declare-fun res!836485 () Bool)

(assert (=> start!105284 (=> (not res!836485) (not e!712888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105284 (= res!836485 (validMask!0 mask!1466))))

(assert (=> start!105284 e!712888))

(assert (=> start!105284 true))

(assert (=> start!105284 tp!94457))

(assert (=> start!105284 tp_is_empty!31885))

(declare-fun array_inv!30035 (array!81349) Bool)

(assert (=> start!105284 (array_inv!30035 _keys!1118)))

(declare-fun e!712889 () Bool)

(declare-fun array_inv!30036 (array!81351) Bool)

(assert (=> start!105284 (and (array_inv!30036 _values!914) e!712889)))

(declare-fun b!1254526 () Bool)

(declare-fun res!836483 () Bool)

(assert (=> b!1254526 (=> (not res!836483) (not e!712888))))

(assert (=> b!1254526 (= res!836483 (and (= (size!39775 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39774 _keys!1118) (size!39775 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254527 () Bool)

(declare-fun res!836482 () Bool)

(assert (=> b!1254527 (=> (not res!836482) (not e!712888))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81349 (_ BitVec 32)) Bool)

(assert (=> b!1254527 (= res!836482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254528 () Bool)

(declare-fun res!836484 () Bool)

(assert (=> b!1254528 (=> (not res!836484) (not e!712888))))

(declare-datatypes ((List!27959 0))(
  ( (Nil!27956) (Cons!27955 (h!29164 (_ BitVec 64)) (t!41433 List!27959)) )
))
(declare-fun arrayNoDuplicates!0 (array!81349 (_ BitVec 32) List!27959) Bool)

(assert (=> b!1254528 (= res!836484 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27956))))

(declare-fun mapNonEmpty!49606 () Bool)

(declare-fun mapRes!49606 () Bool)

(declare-fun tp!94456 () Bool)

(assert (=> mapNonEmpty!49606 (= mapRes!49606 (and tp!94456 e!712887))))

(declare-fun mapRest!49606 () (Array (_ BitVec 32) ValueCell!15179))

(declare-fun mapValue!49606 () ValueCell!15179)

(declare-fun mapKey!49606 () (_ BitVec 32))

(assert (=> mapNonEmpty!49606 (= (arr!39237 _values!914) (store mapRest!49606 mapKey!49606 mapValue!49606))))

(declare-fun b!1254529 () Bool)

(declare-fun e!712886 () Bool)

(assert (=> b!1254529 (= e!712886 tp_is_empty!31885)))

(declare-fun mapIsEmpty!49606 () Bool)

(assert (=> mapIsEmpty!49606 mapRes!49606))

(declare-fun b!1254530 () Bool)

(assert (=> b!1254530 (= e!712889 (and e!712886 mapRes!49606))))

(declare-fun condMapEmpty!49606 () Bool)

(declare-fun mapDefault!49606 () ValueCell!15179)

(assert (=> b!1254530 (= condMapEmpty!49606 (= (arr!39237 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15179)) mapDefault!49606)))))

(assert (= (and start!105284 res!836485) b!1254526))

(assert (= (and b!1254526 res!836483) b!1254527))

(assert (= (and b!1254527 res!836482) b!1254528))

(assert (= (and b!1254528 res!836484) b!1254524))

(assert (= (and b!1254524 (not res!836486)) b!1254523))

(assert (= (and b!1254530 condMapEmpty!49606) mapIsEmpty!49606))

(assert (= (and b!1254530 (not condMapEmpty!49606)) mapNonEmpty!49606))

(get-info :version)

(assert (= (and mapNonEmpty!49606 ((_ is ValueCellFull!15179) mapValue!49606)) b!1254525))

(assert (= (and b!1254530 ((_ is ValueCellFull!15179) mapDefault!49606)) b!1254529))

(assert (= start!105284 b!1254530))

(declare-fun m!1154859 () Bool)

(assert (=> b!1254523 m!1154859))

(declare-fun m!1154861 () Bool)

(assert (=> b!1254523 m!1154861))

(declare-fun m!1154863 () Bool)

(assert (=> b!1254523 m!1154863))

(declare-fun m!1154865 () Bool)

(assert (=> b!1254523 m!1154865))

(declare-fun m!1154867 () Bool)

(assert (=> b!1254523 m!1154867))

(declare-fun m!1154869 () Bool)

(assert (=> b!1254523 m!1154869))

(declare-fun m!1154871 () Bool)

(assert (=> mapNonEmpty!49606 m!1154871))

(declare-fun m!1154873 () Bool)

(assert (=> start!105284 m!1154873))

(declare-fun m!1154875 () Bool)

(assert (=> start!105284 m!1154875))

(declare-fun m!1154877 () Bool)

(assert (=> start!105284 m!1154877))

(declare-fun m!1154879 () Bool)

(assert (=> b!1254528 m!1154879))

(declare-fun m!1154881 () Bool)

(assert (=> b!1254524 m!1154881))

(declare-fun m!1154883 () Bool)

(assert (=> b!1254524 m!1154883))

(declare-fun m!1154885 () Bool)

(assert (=> b!1254524 m!1154885))

(declare-fun m!1154887 () Bool)

(assert (=> b!1254527 m!1154887))

(check-sat (not b!1254527) (not mapNonEmpty!49606) tp_is_empty!31885 (not start!105284) b_and!44791 (not b!1254523) (not b!1254524) (not b_next!26983) (not b!1254528))
(check-sat b_and!44791 (not b_next!26983))
