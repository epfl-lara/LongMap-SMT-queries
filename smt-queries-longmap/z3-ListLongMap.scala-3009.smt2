; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42390 () Bool)

(assert start!42390)

(declare-fun b_free!11865 () Bool)

(declare-fun b_next!11865 () Bool)

(assert (=> start!42390 (= b_free!11865 (not b_next!11865))))

(declare-fun tp!41629 () Bool)

(declare-fun b_and!20321 () Bool)

(assert (=> start!42390 (= tp!41629 b_and!20321)))

(declare-fun b!472952 () Bool)

(declare-fun e!277390 () Bool)

(declare-fun e!277391 () Bool)

(assert (=> b!472952 (= e!277390 (not e!277391))))

(declare-fun res!282495 () Bool)

(assert (=> b!472952 (=> res!282495 e!277391)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472952 (= res!282495 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18829 0))(
  ( (V!18830 (val!6691 Int)) )
))
(declare-datatypes ((tuple2!8814 0))(
  ( (tuple2!8815 (_1!4418 (_ BitVec 64)) (_2!4418 V!18829)) )
))
(declare-datatypes ((List!8897 0))(
  ( (Nil!8894) (Cons!8893 (h!9749 tuple2!8814) (t!14867 List!8897)) )
))
(declare-datatypes ((ListLongMap!7727 0))(
  ( (ListLongMap!7728 (toList!3879 List!8897)) )
))
(declare-fun lt!214659 () ListLongMap!7727)

(declare-fun lt!214656 () ListLongMap!7727)

(assert (=> b!472952 (= lt!214659 lt!214656)))

(declare-datatypes ((Unit!13914 0))(
  ( (Unit!13915) )
))
(declare-fun lt!214655 () Unit!13914)

(declare-fun minValueBefore!38 () V!18829)

(declare-fun zeroValue!794 () V!18829)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30345 0))(
  ( (array!30346 (arr!14592 (Array (_ BitVec 32) (_ BitVec 64))) (size!14944 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30345)

(declare-datatypes ((ValueCell!6303 0))(
  ( (ValueCellFull!6303 (v!8982 V!18829)) (EmptyCell!6303) )
))
(declare-datatypes ((array!30347 0))(
  ( (array!30348 (arr!14593 (Array (_ BitVec 32) ValueCell!6303)) (size!14945 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30347)

(declare-fun minValueAfter!38 () V!18829)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!220 (array!30345 array!30347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18829 V!18829 V!18829 V!18829 (_ BitVec 32) Int) Unit!13914)

(assert (=> b!472952 (= lt!214655 (lemmaNoChangeToArrayThenSameMapNoExtras!220 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2040 (array!30345 array!30347 (_ BitVec 32) (_ BitVec 32) V!18829 V!18829 (_ BitVec 32) Int) ListLongMap!7727)

(assert (=> b!472952 (= lt!214656 (getCurrentListMapNoExtraKeys!2040 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472952 (= lt!214659 (getCurrentListMapNoExtraKeys!2040 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472953 () Bool)

(declare-fun res!282492 () Bool)

(assert (=> b!472953 (=> (not res!282492) (not e!277390))))

(assert (=> b!472953 (= res!282492 (and (= (size!14945 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14944 _keys!1025) (size!14945 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472954 () Bool)

(declare-fun res!282493 () Bool)

(assert (=> b!472954 (=> (not res!282493) (not e!277390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30345 (_ BitVec 32)) Bool)

(assert (=> b!472954 (= res!282493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472955 () Bool)

(declare-fun res!282494 () Bool)

(assert (=> b!472955 (=> (not res!282494) (not e!277390))))

(declare-datatypes ((List!8898 0))(
  ( (Nil!8895) (Cons!8894 (h!9750 (_ BitVec 64)) (t!14868 List!8898)) )
))
(declare-fun arrayNoDuplicates!0 (array!30345 (_ BitVec 32) List!8898) Bool)

(assert (=> b!472955 (= res!282494 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8895))))

(declare-fun mapNonEmpty!21652 () Bool)

(declare-fun mapRes!21652 () Bool)

(declare-fun tp!41628 () Bool)

(declare-fun e!277389 () Bool)

(assert (=> mapNonEmpty!21652 (= mapRes!21652 (and tp!41628 e!277389))))

(declare-fun mapValue!21652 () ValueCell!6303)

(declare-fun mapKey!21652 () (_ BitVec 32))

(declare-fun mapRest!21652 () (Array (_ BitVec 32) ValueCell!6303))

(assert (=> mapNonEmpty!21652 (= (arr!14593 _values!833) (store mapRest!21652 mapKey!21652 mapValue!21652))))

(declare-fun res!282496 () Bool)

(assert (=> start!42390 (=> (not res!282496) (not e!277390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42390 (= res!282496 (validMask!0 mask!1365))))

(assert (=> start!42390 e!277390))

(declare-fun tp_is_empty!13293 () Bool)

(assert (=> start!42390 tp_is_empty!13293))

(assert (=> start!42390 tp!41629))

(assert (=> start!42390 true))

(declare-fun array_inv!10522 (array!30345) Bool)

(assert (=> start!42390 (array_inv!10522 _keys!1025)))

(declare-fun e!277388 () Bool)

(declare-fun array_inv!10523 (array!30347) Bool)

(assert (=> start!42390 (and (array_inv!10523 _values!833) e!277388)))

(declare-fun b!472956 () Bool)

(declare-fun e!277387 () Bool)

(assert (=> b!472956 (= e!277387 tp_is_empty!13293)))

(declare-fun b!472957 () Bool)

(assert (=> b!472957 (= e!277389 tp_is_empty!13293)))

(declare-fun b!472958 () Bool)

(assert (=> b!472958 (= e!277388 (and e!277387 mapRes!21652))))

(declare-fun condMapEmpty!21652 () Bool)

(declare-fun mapDefault!21652 () ValueCell!6303)

(assert (=> b!472958 (= condMapEmpty!21652 (= (arr!14593 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6303)) mapDefault!21652)))))

(declare-fun b!472959 () Bool)

(assert (=> b!472959 (= e!277391 true)))

(declare-fun lt!214660 () ListLongMap!7727)

(declare-fun lt!214653 () tuple2!8814)

(declare-fun +!1719 (ListLongMap!7727 tuple2!8814) ListLongMap!7727)

(assert (=> b!472959 (= (+!1719 lt!214660 lt!214653) (+!1719 (+!1719 lt!214660 (tuple2!8815 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!214653))))

(assert (=> b!472959 (= lt!214653 (tuple2!8815 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!214654 () Unit!13914)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!128 (ListLongMap!7727 (_ BitVec 64) V!18829 V!18829) Unit!13914)

(assert (=> b!472959 (= lt!214654 (addSameAsAddTwiceSameKeyDiffValues!128 lt!214660 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!472959 (= lt!214660 (+!1719 lt!214659 (tuple2!8815 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!214658 () ListLongMap!7727)

(declare-fun getCurrentListMap!2248 (array!30345 array!30347 (_ BitVec 32) (_ BitVec 32) V!18829 V!18829 (_ BitVec 32) Int) ListLongMap!7727)

(assert (=> b!472959 (= lt!214658 (getCurrentListMap!2248 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!214657 () ListLongMap!7727)

(assert (=> b!472959 (= lt!214657 (getCurrentListMap!2248 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21652 () Bool)

(assert (=> mapIsEmpty!21652 mapRes!21652))

(assert (= (and start!42390 res!282496) b!472953))

(assert (= (and b!472953 res!282492) b!472954))

(assert (= (and b!472954 res!282493) b!472955))

(assert (= (and b!472955 res!282494) b!472952))

(assert (= (and b!472952 (not res!282495)) b!472959))

(assert (= (and b!472958 condMapEmpty!21652) mapIsEmpty!21652))

(assert (= (and b!472958 (not condMapEmpty!21652)) mapNonEmpty!21652))

(get-info :version)

(assert (= (and mapNonEmpty!21652 ((_ is ValueCellFull!6303) mapValue!21652)) b!472957))

(assert (= (and b!472958 ((_ is ValueCellFull!6303) mapDefault!21652)) b!472956))

(assert (= start!42390 b!472958))

(declare-fun m!454841 () Bool)

(assert (=> b!472954 m!454841))

(declare-fun m!454843 () Bool)

(assert (=> mapNonEmpty!21652 m!454843))

(declare-fun m!454845 () Bool)

(assert (=> b!472955 m!454845))

(declare-fun m!454847 () Bool)

(assert (=> b!472959 m!454847))

(assert (=> b!472959 m!454847))

(declare-fun m!454849 () Bool)

(assert (=> b!472959 m!454849))

(declare-fun m!454851 () Bool)

(assert (=> b!472959 m!454851))

(declare-fun m!454853 () Bool)

(assert (=> b!472959 m!454853))

(declare-fun m!454855 () Bool)

(assert (=> b!472959 m!454855))

(declare-fun m!454857 () Bool)

(assert (=> b!472959 m!454857))

(declare-fun m!454859 () Bool)

(assert (=> b!472959 m!454859))

(declare-fun m!454861 () Bool)

(assert (=> b!472952 m!454861))

(declare-fun m!454863 () Bool)

(assert (=> b!472952 m!454863))

(declare-fun m!454865 () Bool)

(assert (=> b!472952 m!454865))

(declare-fun m!454867 () Bool)

(assert (=> start!42390 m!454867))

(declare-fun m!454869 () Bool)

(assert (=> start!42390 m!454869))

(declare-fun m!454871 () Bool)

(assert (=> start!42390 m!454871))

(check-sat (not start!42390) (not b!472952) tp_is_empty!13293 b_and!20321 (not b_next!11865) (not b!472954) (not mapNonEmpty!21652) (not b!472959) (not b!472955))
(check-sat b_and!20321 (not b_next!11865))
