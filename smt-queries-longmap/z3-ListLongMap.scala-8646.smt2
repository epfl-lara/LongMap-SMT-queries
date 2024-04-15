; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105190 () Bool)

(assert start!105190)

(declare-fun b_free!26911 () Bool)

(declare-fun b_next!26911 () Bool)

(assert (=> start!105190 (= b_free!26911 (not b_next!26911))))

(declare-fun tp!94237 () Bool)

(declare-fun b_and!44707 () Bool)

(assert (=> start!105190 (= tp!94237 b_and!44707)))

(declare-fun b!1253475 () Bool)

(declare-fun res!835862 () Bool)

(declare-fun e!712121 () Bool)

(assert (=> b!1253475 (=> (not res!835862) (not e!712121))))

(declare-datatypes ((array!81211 0))(
  ( (array!81212 (arr!39168 (Array (_ BitVec 32) (_ BitVec 64))) (size!39706 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81211)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81211 (_ BitVec 32)) Bool)

(assert (=> b!1253475 (= res!835862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1253476 () Bool)

(declare-fun res!835860 () Bool)

(assert (=> b!1253476 (=> (not res!835860) (not e!712121))))

(declare-datatypes ((List!27909 0))(
  ( (Nil!27906) (Cons!27905 (h!29114 (_ BitVec 64)) (t!41381 List!27909)) )
))
(declare-fun arrayNoDuplicates!0 (array!81211 (_ BitVec 32) List!27909) Bool)

(assert (=> b!1253476 (= res!835860 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27906))))

(declare-fun b!1253477 () Bool)

(declare-fun e!712118 () Bool)

(declare-fun tp_is_empty!31813 () Bool)

(assert (=> b!1253477 (= e!712118 tp_is_empty!31813)))

(declare-fun b!1253478 () Bool)

(declare-fun res!835863 () Bool)

(assert (=> b!1253478 (=> (not res!835863) (not e!712121))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47783 0))(
  ( (V!47784 (val!15969 Int)) )
))
(declare-datatypes ((ValueCell!15143 0))(
  ( (ValueCellFull!15143 (v!18666 V!47783)) (EmptyCell!15143) )
))
(declare-datatypes ((array!81213 0))(
  ( (array!81214 (arr!39169 (Array (_ BitVec 32) ValueCell!15143)) (size!39707 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81213)

(assert (=> b!1253478 (= res!835863 (and (= (size!39707 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39706 _keys!1118) (size!39707 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!835861 () Bool)

(assert (=> start!105190 (=> (not res!835861) (not e!712121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105190 (= res!835861 (validMask!0 mask!1466))))

(assert (=> start!105190 e!712121))

(assert (=> start!105190 true))

(assert (=> start!105190 tp!94237))

(assert (=> start!105190 tp_is_empty!31813))

(declare-fun array_inv!29989 (array!81211) Bool)

(assert (=> start!105190 (array_inv!29989 _keys!1118)))

(declare-fun e!712122 () Bool)

(declare-fun array_inv!29990 (array!81213) Bool)

(assert (=> start!105190 (and (array_inv!29990 _values!914) e!712122)))

(declare-fun b!1253479 () Bool)

(declare-fun e!712117 () Bool)

(declare-fun mapRes!49495 () Bool)

(assert (=> b!1253479 (= e!712122 (and e!712117 mapRes!49495))))

(declare-fun condMapEmpty!49495 () Bool)

(declare-fun mapDefault!49495 () ValueCell!15143)

(assert (=> b!1253479 (= condMapEmpty!49495 (= (arr!39169 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15143)) mapDefault!49495)))))

(declare-fun b!1253480 () Bool)

(declare-fun e!712119 () Bool)

(assert (=> b!1253480 (= e!712121 (not e!712119))))

(declare-fun res!835864 () Bool)

(assert (=> b!1253480 (=> res!835864 e!712119)))

(assert (=> b!1253480 (= res!835864 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20696 0))(
  ( (tuple2!20697 (_1!10359 (_ BitVec 64)) (_2!10359 V!47783)) )
))
(declare-datatypes ((List!27910 0))(
  ( (Nil!27907) (Cons!27906 (h!29115 tuple2!20696) (t!41382 List!27910)) )
))
(declare-datatypes ((ListLongMap!18569 0))(
  ( (ListLongMap!18570 (toList!9300 List!27910)) )
))
(declare-fun lt!565909 () ListLongMap!18569)

(declare-fun lt!565913 () ListLongMap!18569)

(assert (=> b!1253480 (= lt!565909 lt!565913)))

(declare-fun minValueAfter!43 () V!47783)

(declare-fun zeroValue!871 () V!47783)

(declare-fun minValueBefore!43 () V!47783)

(declare-datatypes ((Unit!41563 0))(
  ( (Unit!41564) )
))
(declare-fun lt!565910 () Unit!41563)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1022 (array!81211 array!81213 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47783 V!47783 V!47783 V!47783 (_ BitVec 32) Int) Unit!41563)

(assert (=> b!1253480 (= lt!565910 (lemmaNoChangeToArrayThenSameMapNoExtras!1022 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5700 (array!81211 array!81213 (_ BitVec 32) (_ BitVec 32) V!47783 V!47783 (_ BitVec 32) Int) ListLongMap!18569)

(assert (=> b!1253480 (= lt!565913 (getCurrentListMapNoExtraKeys!5700 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253480 (= lt!565909 (getCurrentListMapNoExtraKeys!5700 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253481 () Bool)

(assert (=> b!1253481 (= e!712117 tp_is_empty!31813)))

(declare-fun mapIsEmpty!49495 () Bool)

(assert (=> mapIsEmpty!49495 mapRes!49495))

(declare-fun b!1253482 () Bool)

(assert (=> b!1253482 (= e!712119 true)))

(declare-fun lt!565914 () ListLongMap!18569)

(declare-fun lt!565915 () ListLongMap!18569)

(declare-fun -!1996 (ListLongMap!18569 (_ BitVec 64)) ListLongMap!18569)

(assert (=> b!1253482 (= lt!565914 (-!1996 lt!565915 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!565912 () ListLongMap!18569)

(assert (=> b!1253482 (= (-!1996 lt!565912 #b1000000000000000000000000000000000000000000000000000000000000000) lt!565909)))

(declare-fun lt!565908 () Unit!41563)

(declare-fun addThenRemoveForNewKeyIsSame!285 (ListLongMap!18569 (_ BitVec 64) V!47783) Unit!41563)

(assert (=> b!1253482 (= lt!565908 (addThenRemoveForNewKeyIsSame!285 lt!565909 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!565911 () ListLongMap!18569)

(assert (=> b!1253482 (and (= lt!565915 lt!565912) (= lt!565911 lt!565913))))

(declare-fun +!4199 (ListLongMap!18569 tuple2!20696) ListLongMap!18569)

(assert (=> b!1253482 (= lt!565912 (+!4199 lt!565909 (tuple2!20697 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun getCurrentListMap!4435 (array!81211 array!81213 (_ BitVec 32) (_ BitVec 32) V!47783 V!47783 (_ BitVec 32) Int) ListLongMap!18569)

(assert (=> b!1253482 (= lt!565911 (getCurrentListMap!4435 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253482 (= lt!565915 (getCurrentListMap!4435 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49495 () Bool)

(declare-fun tp!94238 () Bool)

(assert (=> mapNonEmpty!49495 (= mapRes!49495 (and tp!94238 e!712118))))

(declare-fun mapValue!49495 () ValueCell!15143)

(declare-fun mapRest!49495 () (Array (_ BitVec 32) ValueCell!15143))

(declare-fun mapKey!49495 () (_ BitVec 32))

(assert (=> mapNonEmpty!49495 (= (arr!39169 _values!914) (store mapRest!49495 mapKey!49495 mapValue!49495))))

(assert (= (and start!105190 res!835861) b!1253478))

(assert (= (and b!1253478 res!835863) b!1253475))

(assert (= (and b!1253475 res!835862) b!1253476))

(assert (= (and b!1253476 res!835860) b!1253480))

(assert (= (and b!1253480 (not res!835864)) b!1253482))

(assert (= (and b!1253479 condMapEmpty!49495) mapIsEmpty!49495))

(assert (= (and b!1253479 (not condMapEmpty!49495)) mapNonEmpty!49495))

(get-info :version)

(assert (= (and mapNonEmpty!49495 ((_ is ValueCellFull!15143) mapValue!49495)) b!1253477))

(assert (= (and b!1253479 ((_ is ValueCellFull!15143) mapDefault!49495)) b!1253481))

(assert (= start!105190 b!1253479))

(declare-fun m!1153595 () Bool)

(assert (=> b!1253475 m!1153595))

(declare-fun m!1153597 () Bool)

(assert (=> start!105190 m!1153597))

(declare-fun m!1153599 () Bool)

(assert (=> start!105190 m!1153599))

(declare-fun m!1153601 () Bool)

(assert (=> start!105190 m!1153601))

(declare-fun m!1153603 () Bool)

(assert (=> mapNonEmpty!49495 m!1153603))

(declare-fun m!1153605 () Bool)

(assert (=> b!1253482 m!1153605))

(declare-fun m!1153607 () Bool)

(assert (=> b!1253482 m!1153607))

(declare-fun m!1153609 () Bool)

(assert (=> b!1253482 m!1153609))

(declare-fun m!1153611 () Bool)

(assert (=> b!1253482 m!1153611))

(declare-fun m!1153613 () Bool)

(assert (=> b!1253482 m!1153613))

(declare-fun m!1153615 () Bool)

(assert (=> b!1253482 m!1153615))

(declare-fun m!1153617 () Bool)

(assert (=> b!1253476 m!1153617))

(declare-fun m!1153619 () Bool)

(assert (=> b!1253480 m!1153619))

(declare-fun m!1153621 () Bool)

(assert (=> b!1253480 m!1153621))

(declare-fun m!1153623 () Bool)

(assert (=> b!1253480 m!1153623))

(check-sat (not b!1253476) (not b!1253482) (not mapNonEmpty!49495) (not start!105190) (not b!1253480) (not b_next!26911) b_and!44707 tp_is_empty!31813 (not b!1253475))
(check-sat b_and!44707 (not b_next!26911))
