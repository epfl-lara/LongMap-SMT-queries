; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105278 () Bool)

(assert start!105278)

(declare-fun b_free!26977 () Bool)

(declare-fun b_next!26977 () Bool)

(assert (=> start!105278 (= b_free!26977 (not b_next!26977))))

(declare-fun tp!94439 () Bool)

(declare-fun b_and!44785 () Bool)

(assert (=> start!105278 (= tp!94439 b_and!44785)))

(declare-fun res!836438 () Bool)

(declare-fun e!712830 () Bool)

(assert (=> start!105278 (=> (not res!836438) (not e!712830))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105278 (= res!836438 (validMask!0 mask!1466))))

(assert (=> start!105278 e!712830))

(assert (=> start!105278 true))

(assert (=> start!105278 tp!94439))

(declare-fun tp_is_empty!31879 () Bool)

(assert (=> start!105278 tp_is_empty!31879))

(declare-datatypes ((array!81337 0))(
  ( (array!81338 (arr!39230 (Array (_ BitVec 32) (_ BitVec 64))) (size!39768 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81337)

(declare-fun array_inv!30031 (array!81337) Bool)

(assert (=> start!105278 (array_inv!30031 _keys!1118)))

(declare-datatypes ((V!47871 0))(
  ( (V!47872 (val!16002 Int)) )
))
(declare-datatypes ((ValueCell!15176 0))(
  ( (ValueCellFull!15176 (v!18700 V!47871)) (EmptyCell!15176) )
))
(declare-datatypes ((array!81339 0))(
  ( (array!81340 (arr!39231 (Array (_ BitVec 32) ValueCell!15176)) (size!39769 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81339)

(declare-fun e!712834 () Bool)

(declare-fun array_inv!30032 (array!81339) Bool)

(assert (=> start!105278 (and (array_inv!30032 _values!914) e!712834)))

(declare-fun mapNonEmpty!49597 () Bool)

(declare-fun mapRes!49597 () Bool)

(declare-fun tp!94438 () Bool)

(declare-fun e!712835 () Bool)

(assert (=> mapNonEmpty!49597 (= mapRes!49597 (and tp!94438 e!712835))))

(declare-fun mapKey!49597 () (_ BitVec 32))

(declare-fun mapRest!49597 () (Array (_ BitVec 32) ValueCell!15176))

(declare-fun mapValue!49597 () ValueCell!15176)

(assert (=> mapNonEmpty!49597 (= (arr!39231 _values!914) (store mapRest!49597 mapKey!49597 mapValue!49597))))

(declare-fun b!1254451 () Bool)

(declare-fun res!836441 () Bool)

(assert (=> b!1254451 (=> (not res!836441) (not e!712830))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1254451 (= res!836441 (and (= (size!39769 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39768 _keys!1118) (size!39769 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254452 () Bool)

(assert (=> b!1254452 (= e!712835 tp_is_empty!31879)))

(declare-fun b!1254453 () Bool)

(declare-fun e!712831 () Bool)

(assert (=> b!1254453 (= e!712831 true)))

(declare-datatypes ((tuple2!20744 0))(
  ( (tuple2!20745 (_1!10383 (_ BitVec 64)) (_2!10383 V!47871)) )
))
(declare-datatypes ((List!27954 0))(
  ( (Nil!27951) (Cons!27950 (h!29159 tuple2!20744) (t!41428 List!27954)) )
))
(declare-datatypes ((ListLongMap!18617 0))(
  ( (ListLongMap!18618 (toList!9324 List!27954)) )
))
(declare-fun lt!566843 () ListLongMap!18617)

(declare-fun lt!566842 () ListLongMap!18617)

(declare-fun -!2016 (ListLongMap!18617 (_ BitVec 64)) ListLongMap!18617)

(assert (=> b!1254453 (= lt!566843 (-!2016 lt!566842 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566839 () ListLongMap!18617)

(declare-fun lt!566844 () ListLongMap!18617)

(assert (=> b!1254453 (= (-!2016 lt!566839 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566844)))

(declare-datatypes ((Unit!41613 0))(
  ( (Unit!41614) )
))
(declare-fun lt!566838 () Unit!41613)

(declare-fun minValueBefore!43 () V!47871)

(declare-fun addThenRemoveForNewKeyIsSame!305 (ListLongMap!18617 (_ BitVec 64) V!47871) Unit!41613)

(assert (=> b!1254453 (= lt!566838 (addThenRemoveForNewKeyIsSame!305 lt!566844 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566845 () ListLongMap!18617)

(declare-fun lt!566840 () ListLongMap!18617)

(assert (=> b!1254453 (and (= lt!566842 lt!566839) (= lt!566840 lt!566845))))

(declare-fun +!4219 (ListLongMap!18617 tuple2!20744) ListLongMap!18617)

(assert (=> b!1254453 (= lt!566839 (+!4219 lt!566844 (tuple2!20745 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47871)

(declare-fun zeroValue!871 () V!47871)

(declare-fun getCurrentListMap!4455 (array!81337 array!81339 (_ BitVec 32) (_ BitVec 32) V!47871 V!47871 (_ BitVec 32) Int) ListLongMap!18617)

(assert (=> b!1254453 (= lt!566840 (getCurrentListMap!4455 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254453 (= lt!566842 (getCurrentListMap!4455 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254454 () Bool)

(declare-fun res!836439 () Bool)

(assert (=> b!1254454 (=> (not res!836439) (not e!712830))))

(declare-datatypes ((List!27955 0))(
  ( (Nil!27952) (Cons!27951 (h!29160 (_ BitVec 64)) (t!41429 List!27955)) )
))
(declare-fun arrayNoDuplicates!0 (array!81337 (_ BitVec 32) List!27955) Bool)

(assert (=> b!1254454 (= res!836439 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27952))))

(declare-fun b!1254455 () Bool)

(declare-fun res!836437 () Bool)

(assert (=> b!1254455 (=> (not res!836437) (not e!712830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81337 (_ BitVec 32)) Bool)

(assert (=> b!1254455 (= res!836437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1254456 () Bool)

(assert (=> b!1254456 (= e!712830 (not e!712831))))

(declare-fun res!836440 () Bool)

(assert (=> b!1254456 (=> res!836440 e!712831)))

(assert (=> b!1254456 (= res!836440 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1254456 (= lt!566844 lt!566845)))

(declare-fun lt!566841 () Unit!41613)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1043 (array!81337 array!81339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47871 V!47871 V!47871 V!47871 (_ BitVec 32) Int) Unit!41613)

(assert (=> b!1254456 (= lt!566841 (lemmaNoChangeToArrayThenSameMapNoExtras!1043 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5721 (array!81337 array!81339 (_ BitVec 32) (_ BitVec 32) V!47871 V!47871 (_ BitVec 32) Int) ListLongMap!18617)

(assert (=> b!1254456 (= lt!566845 (getCurrentListMapNoExtraKeys!5721 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254456 (= lt!566844 (getCurrentListMapNoExtraKeys!5721 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254457 () Bool)

(declare-fun e!712833 () Bool)

(assert (=> b!1254457 (= e!712834 (and e!712833 mapRes!49597))))

(declare-fun condMapEmpty!49597 () Bool)

(declare-fun mapDefault!49597 () ValueCell!15176)

(assert (=> b!1254457 (= condMapEmpty!49597 (= (arr!39231 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15176)) mapDefault!49597)))))

(declare-fun mapIsEmpty!49597 () Bool)

(assert (=> mapIsEmpty!49597 mapRes!49597))

(declare-fun b!1254458 () Bool)

(assert (=> b!1254458 (= e!712833 tp_is_empty!31879)))

(assert (= (and start!105278 res!836438) b!1254451))

(assert (= (and b!1254451 res!836441) b!1254455))

(assert (= (and b!1254455 res!836437) b!1254454))

(assert (= (and b!1254454 res!836439) b!1254456))

(assert (= (and b!1254456 (not res!836440)) b!1254453))

(assert (= (and b!1254457 condMapEmpty!49597) mapIsEmpty!49597))

(assert (= (and b!1254457 (not condMapEmpty!49597)) mapNonEmpty!49597))

(get-info :version)

(assert (= (and mapNonEmpty!49597 ((_ is ValueCellFull!15176) mapValue!49597)) b!1254452))

(assert (= (and b!1254457 ((_ is ValueCellFull!15176) mapDefault!49597)) b!1254458))

(assert (= start!105278 b!1254457))

(declare-fun m!1154769 () Bool)

(assert (=> b!1254454 m!1154769))

(declare-fun m!1154771 () Bool)

(assert (=> b!1254453 m!1154771))

(declare-fun m!1154773 () Bool)

(assert (=> b!1254453 m!1154773))

(declare-fun m!1154775 () Bool)

(assert (=> b!1254453 m!1154775))

(declare-fun m!1154777 () Bool)

(assert (=> b!1254453 m!1154777))

(declare-fun m!1154779 () Bool)

(assert (=> b!1254453 m!1154779))

(declare-fun m!1154781 () Bool)

(assert (=> b!1254453 m!1154781))

(declare-fun m!1154783 () Bool)

(assert (=> b!1254455 m!1154783))

(declare-fun m!1154785 () Bool)

(assert (=> start!105278 m!1154785))

(declare-fun m!1154787 () Bool)

(assert (=> start!105278 m!1154787))

(declare-fun m!1154789 () Bool)

(assert (=> start!105278 m!1154789))

(declare-fun m!1154791 () Bool)

(assert (=> b!1254456 m!1154791))

(declare-fun m!1154793 () Bool)

(assert (=> b!1254456 m!1154793))

(declare-fun m!1154795 () Bool)

(assert (=> b!1254456 m!1154795))

(declare-fun m!1154797 () Bool)

(assert (=> mapNonEmpty!49597 m!1154797))

(check-sat (not start!105278) (not b_next!26977) (not mapNonEmpty!49597) (not b!1254453) b_and!44785 (not b!1254456) tp_is_empty!31879 (not b!1254455) (not b!1254454))
(check-sat b_and!44785 (not b_next!26977))
