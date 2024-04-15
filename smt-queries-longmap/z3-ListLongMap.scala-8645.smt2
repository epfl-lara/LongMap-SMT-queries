; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105184 () Bool)

(assert start!105184)

(declare-fun b_free!26905 () Bool)

(declare-fun b_next!26905 () Bool)

(assert (=> start!105184 (= b_free!26905 (not b_next!26905))))

(declare-fun tp!94219 () Bool)

(declare-fun b_and!44701 () Bool)

(assert (=> start!105184 (= tp!94219 b_and!44701)))

(declare-fun b!1253403 () Bool)

(declare-fun res!835819 () Bool)

(declare-fun e!712063 () Bool)

(assert (=> b!1253403 (=> (not res!835819) (not e!712063))))

(declare-datatypes ((array!81199 0))(
  ( (array!81200 (arr!39162 (Array (_ BitVec 32) (_ BitVec 64))) (size!39700 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81199)

(declare-datatypes ((List!27905 0))(
  ( (Nil!27902) (Cons!27901 (h!29110 (_ BitVec 64)) (t!41377 List!27905)) )
))
(declare-fun arrayNoDuplicates!0 (array!81199 (_ BitVec 32) List!27905) Bool)

(assert (=> b!1253403 (= res!835819 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27902))))

(declare-fun b!1253404 () Bool)

(declare-fun res!835817 () Bool)

(assert (=> b!1253404 (=> (not res!835817) (not e!712063))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47775 0))(
  ( (V!47776 (val!15966 Int)) )
))
(declare-datatypes ((ValueCell!15140 0))(
  ( (ValueCellFull!15140 (v!18663 V!47775)) (EmptyCell!15140) )
))
(declare-datatypes ((array!81201 0))(
  ( (array!81202 (arr!39163 (Array (_ BitVec 32) ValueCell!15140)) (size!39701 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81201)

(assert (=> b!1253404 (= res!835817 (and (= (size!39701 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39700 _keys!1118) (size!39701 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49486 () Bool)

(declare-fun mapRes!49486 () Bool)

(declare-fun tp!94220 () Bool)

(declare-fun e!712066 () Bool)

(assert (=> mapNonEmpty!49486 (= mapRes!49486 (and tp!94220 e!712066))))

(declare-fun mapRest!49486 () (Array (_ BitVec 32) ValueCell!15140))

(declare-fun mapValue!49486 () ValueCell!15140)

(declare-fun mapKey!49486 () (_ BitVec 32))

(assert (=> mapNonEmpty!49486 (= (arr!39163 _values!914) (store mapRest!49486 mapKey!49486 mapValue!49486))))

(declare-fun b!1253405 () Bool)

(declare-fun e!712067 () Bool)

(assert (=> b!1253405 (= e!712063 (not e!712067))))

(declare-fun res!835818 () Bool)

(assert (=> b!1253405 (=> res!835818 e!712067)))

(assert (=> b!1253405 (= res!835818 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20692 0))(
  ( (tuple2!20693 (_1!10357 (_ BitVec 64)) (_2!10357 V!47775)) )
))
(declare-datatypes ((List!27906 0))(
  ( (Nil!27903) (Cons!27902 (h!29111 tuple2!20692) (t!41378 List!27906)) )
))
(declare-datatypes ((ListLongMap!18565 0))(
  ( (ListLongMap!18566 (toList!9298 List!27906)) )
))
(declare-fun lt!565843 () ListLongMap!18565)

(declare-fun lt!565836 () ListLongMap!18565)

(assert (=> b!1253405 (= lt!565843 lt!565836)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41559 0))(
  ( (Unit!41560) )
))
(declare-fun lt!565839 () Unit!41559)

(declare-fun zeroValue!871 () V!47775)

(declare-fun minValueBefore!43 () V!47775)

(declare-fun minValueAfter!43 () V!47775)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1020 (array!81199 array!81201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47775 V!47775 V!47775 V!47775 (_ BitVec 32) Int) Unit!41559)

(assert (=> b!1253405 (= lt!565839 (lemmaNoChangeToArrayThenSameMapNoExtras!1020 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5698 (array!81199 array!81201 (_ BitVec 32) (_ BitVec 32) V!47775 V!47775 (_ BitVec 32) Int) ListLongMap!18565)

(assert (=> b!1253405 (= lt!565836 (getCurrentListMapNoExtraKeys!5698 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253405 (= lt!565843 (getCurrentListMapNoExtraKeys!5698 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253406 () Bool)

(declare-fun e!712065 () Bool)

(declare-fun e!712068 () Bool)

(assert (=> b!1253406 (= e!712065 (and e!712068 mapRes!49486))))

(declare-fun condMapEmpty!49486 () Bool)

(declare-fun mapDefault!49486 () ValueCell!15140)

(assert (=> b!1253406 (= condMapEmpty!49486 (= (arr!39163 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15140)) mapDefault!49486)))))

(declare-fun b!1253407 () Bool)

(declare-fun tp_is_empty!31807 () Bool)

(assert (=> b!1253407 (= e!712068 tp_is_empty!31807)))

(declare-fun mapIsEmpty!49486 () Bool)

(assert (=> mapIsEmpty!49486 mapRes!49486))

(declare-fun b!1253408 () Bool)

(assert (=> b!1253408 (= e!712067 true)))

(declare-fun lt!565840 () ListLongMap!18565)

(declare-fun lt!565838 () ListLongMap!18565)

(declare-fun -!1994 (ListLongMap!18565 (_ BitVec 64)) ListLongMap!18565)

(assert (=> b!1253408 (= lt!565840 (-!1994 lt!565838 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565842 () ListLongMap!18565)

(assert (=> b!1253408 (= (-!1994 lt!565842 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565843)))

(declare-fun lt!565841 () Unit!41559)

(declare-fun addThenRemoveForNewKeyIsSame!283 (ListLongMap!18565 (_ BitVec 64) V!47775) Unit!41559)

(assert (=> b!1253408 (= lt!565841 (addThenRemoveForNewKeyIsSame!283 lt!565843 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565837 () ListLongMap!18565)

(assert (=> b!1253408 (and (= lt!565838 lt!565842) (= lt!565837 lt!565836))))

(declare-fun +!4197 (ListLongMap!18565 tuple2!20692) ListLongMap!18565)

(assert (=> b!1253408 (= lt!565842 (+!4197 lt!565843 (tuple2!20693 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4433 (array!81199 array!81201 (_ BitVec 32) (_ BitVec 32) V!47775 V!47775 (_ BitVec 32) Int) ListLongMap!18565)

(assert (=> b!1253408 (= lt!565837 (getCurrentListMap!4433 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253408 (= lt!565838 (getCurrentListMap!4433 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253409 () Bool)

(assert (=> b!1253409 (= e!712066 tp_is_empty!31807)))

(declare-fun b!1253410 () Bool)

(declare-fun res!835815 () Bool)

(assert (=> b!1253410 (=> (not res!835815) (not e!712063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81199 (_ BitVec 32)) Bool)

(assert (=> b!1253410 (= res!835815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!835816 () Bool)

(assert (=> start!105184 (=> (not res!835816) (not e!712063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105184 (= res!835816 (validMask!0 mask!1466))))

(assert (=> start!105184 e!712063))

(assert (=> start!105184 true))

(assert (=> start!105184 tp!94219))

(assert (=> start!105184 tp_is_empty!31807))

(declare-fun array_inv!29983 (array!81199) Bool)

(assert (=> start!105184 (array_inv!29983 _keys!1118)))

(declare-fun array_inv!29984 (array!81201) Bool)

(assert (=> start!105184 (and (array_inv!29984 _values!914) e!712065)))

(assert (= (and start!105184 res!835816) b!1253404))

(assert (= (and b!1253404 res!835817) b!1253410))

(assert (= (and b!1253410 res!835815) b!1253403))

(assert (= (and b!1253403 res!835819) b!1253405))

(assert (= (and b!1253405 (not res!835818)) b!1253408))

(assert (= (and b!1253406 condMapEmpty!49486) mapIsEmpty!49486))

(assert (= (and b!1253406 (not condMapEmpty!49486)) mapNonEmpty!49486))

(get-info :version)

(assert (= (and mapNonEmpty!49486 ((_ is ValueCellFull!15140) mapValue!49486)) b!1253409))

(assert (= (and b!1253406 ((_ is ValueCellFull!15140) mapDefault!49486)) b!1253407))

(assert (= start!105184 b!1253406))

(declare-fun m!1153505 () Bool)

(assert (=> b!1253410 m!1153505))

(declare-fun m!1153507 () Bool)

(assert (=> b!1253408 m!1153507))

(declare-fun m!1153509 () Bool)

(assert (=> b!1253408 m!1153509))

(declare-fun m!1153511 () Bool)

(assert (=> b!1253408 m!1153511))

(declare-fun m!1153513 () Bool)

(assert (=> b!1253408 m!1153513))

(declare-fun m!1153515 () Bool)

(assert (=> b!1253408 m!1153515))

(declare-fun m!1153517 () Bool)

(assert (=> b!1253408 m!1153517))

(declare-fun m!1153519 () Bool)

(assert (=> start!105184 m!1153519))

(declare-fun m!1153521 () Bool)

(assert (=> start!105184 m!1153521))

(declare-fun m!1153523 () Bool)

(assert (=> start!105184 m!1153523))

(declare-fun m!1153525 () Bool)

(assert (=> mapNonEmpty!49486 m!1153525))

(declare-fun m!1153527 () Bool)

(assert (=> b!1253403 m!1153527))

(declare-fun m!1153529 () Bool)

(assert (=> b!1253405 m!1153529))

(declare-fun m!1153531 () Bool)

(assert (=> b!1253405 m!1153531))

(declare-fun m!1153533 () Bool)

(assert (=> b!1253405 m!1153533))

(check-sat (not b!1253405) (not b!1253408) (not mapNonEmpty!49486) (not b!1253410) (not b_next!26905) (not start!105184) b_and!44701 tp_is_empty!31807 (not b!1253403))
(check-sat b_and!44701 (not b_next!26905))
