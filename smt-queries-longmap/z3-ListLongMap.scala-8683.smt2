; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105498 () Bool)

(assert start!105498)

(declare-fun b_free!27135 () Bool)

(declare-fun b_next!27135 () Bool)

(assert (=> start!105498 (= b_free!27135 (not b_next!27135))))

(declare-fun tp!94921 () Bool)

(declare-fun b_and!44991 () Bool)

(assert (=> start!105498 (= tp!94921 b_and!44991)))

(declare-fun b!1256896 () Bool)

(declare-fun res!837877 () Bool)

(declare-fun e!714614 () Bool)

(assert (=> b!1256896 (=> (not res!837877) (not e!714614))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81712 0))(
  ( (array!81713 (arr!39414 (Array (_ BitVec 32) (_ BitVec 64))) (size!39950 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81712)

(declare-datatypes ((V!48081 0))(
  ( (V!48082 (val!16081 Int)) )
))
(declare-datatypes ((ValueCell!15255 0))(
  ( (ValueCellFull!15255 (v!18782 V!48081)) (EmptyCell!15255) )
))
(declare-datatypes ((array!81714 0))(
  ( (array!81715 (arr!39415 (Array (_ BitVec 32) ValueCell!15255)) (size!39951 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81714)

(assert (=> b!1256896 (= res!837877 (and (= (size!39951 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39950 _keys!1118) (size!39951 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!837879 () Bool)

(assert (=> start!105498 (=> (not res!837879) (not e!714614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105498 (= res!837879 (validMask!0 mask!1466))))

(assert (=> start!105498 e!714614))

(assert (=> start!105498 true))

(assert (=> start!105498 tp!94921))

(declare-fun tp_is_empty!32037 () Bool)

(assert (=> start!105498 tp_is_empty!32037))

(declare-fun array_inv!30023 (array!81712) Bool)

(assert (=> start!105498 (array_inv!30023 _keys!1118)))

(declare-fun e!714612 () Bool)

(declare-fun array_inv!30024 (array!81714) Bool)

(assert (=> start!105498 (and (array_inv!30024 _values!914) e!714612)))

(declare-fun b!1256897 () Bool)

(declare-fun res!837882 () Bool)

(assert (=> b!1256897 (=> (not res!837882) (not e!714614))))

(declare-datatypes ((List!27991 0))(
  ( (Nil!27988) (Cons!27987 (h!29196 (_ BitVec 64)) (t!41480 List!27991)) )
))
(declare-fun arrayNoDuplicates!0 (array!81712 (_ BitVec 32) List!27991) Bool)

(assert (=> b!1256897 (= res!837882 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27988))))

(declare-fun b!1256898 () Bool)

(declare-fun e!714616 () Bool)

(assert (=> b!1256898 (= e!714616 true)))

(declare-datatypes ((tuple2!20774 0))(
  ( (tuple2!20775 (_1!10398 (_ BitVec 64)) (_2!10398 V!48081)) )
))
(declare-datatypes ((List!27992 0))(
  ( (Nil!27989) (Cons!27988 (h!29197 tuple2!20774) (t!41481 List!27992)) )
))
(declare-datatypes ((ListLongMap!18647 0))(
  ( (ListLongMap!18648 (toList!9339 List!27992)) )
))
(declare-fun lt!568408 () ListLongMap!18647)

(declare-fun -!2087 (ListLongMap!18647 (_ BitVec 64)) ListLongMap!18647)

(assert (=> b!1256898 (= (-!2087 lt!568408 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568408)))

(declare-datatypes ((Unit!41862 0))(
  ( (Unit!41863) )
))
(declare-fun lt!568412 () Unit!41862)

(declare-fun removeNotPresentStillSame!140 (ListLongMap!18647 (_ BitVec 64)) Unit!41862)

(assert (=> b!1256898 (= lt!568412 (removeNotPresentStillSame!140 lt!568408 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!49843 () Bool)

(declare-fun mapRes!49843 () Bool)

(assert (=> mapIsEmpty!49843 mapRes!49843))

(declare-fun b!1256899 () Bool)

(declare-fun res!837878 () Bool)

(assert (=> b!1256899 (=> (not res!837878) (not e!714614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81712 (_ BitVec 32)) Bool)

(assert (=> b!1256899 (= res!837878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256900 () Bool)

(declare-fun e!714617 () Bool)

(assert (=> b!1256900 (= e!714617 tp_is_empty!32037)))

(declare-fun b!1256901 () Bool)

(declare-fun e!714613 () Bool)

(assert (=> b!1256901 (= e!714612 (and e!714613 mapRes!49843))))

(declare-fun condMapEmpty!49843 () Bool)

(declare-fun mapDefault!49843 () ValueCell!15255)

(assert (=> b!1256901 (= condMapEmpty!49843 (= (arr!39415 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15255)) mapDefault!49843)))))

(declare-fun b!1256902 () Bool)

(declare-fun e!714618 () Bool)

(assert (=> b!1256902 (= e!714614 (not e!714618))))

(declare-fun res!837881 () Bool)

(assert (=> b!1256902 (=> res!837881 e!714618)))

(assert (=> b!1256902 (= res!837881 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568410 () ListLongMap!18647)

(declare-fun lt!568411 () ListLongMap!18647)

(assert (=> b!1256902 (= lt!568410 lt!568411)))

(declare-fun minValueAfter!43 () V!48081)

(declare-fun zeroValue!871 () V!48081)

(declare-fun minValueBefore!43 () V!48081)

(declare-fun lt!568409 () Unit!41862)

(declare-fun defaultEntry!922 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1085 (array!81712 array!81714 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48081 V!48081 V!48081 V!48081 (_ BitVec 32) Int) Unit!41862)

(assert (=> b!1256902 (= lt!568409 (lemmaNoChangeToArrayThenSameMapNoExtras!1085 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5721 (array!81712 array!81714 (_ BitVec 32) (_ BitVec 32) V!48081 V!48081 (_ BitVec 32) Int) ListLongMap!18647)

(assert (=> b!1256902 (= lt!568411 (getCurrentListMapNoExtraKeys!5721 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256902 (= lt!568410 (getCurrentListMapNoExtraKeys!5721 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!49843 () Bool)

(declare-fun tp!94922 () Bool)

(assert (=> mapNonEmpty!49843 (= mapRes!49843 (and tp!94922 e!714617))))

(declare-fun mapValue!49843 () ValueCell!15255)

(declare-fun mapKey!49843 () (_ BitVec 32))

(declare-fun mapRest!49843 () (Array (_ BitVec 32) ValueCell!15255))

(assert (=> mapNonEmpty!49843 (= (arr!39415 _values!914) (store mapRest!49843 mapKey!49843 mapValue!49843))))

(declare-fun b!1256903 () Bool)

(assert (=> b!1256903 (= e!714613 tp_is_empty!32037)))

(declare-fun b!1256904 () Bool)

(assert (=> b!1256904 (= e!714618 e!714616)))

(declare-fun res!837880 () Bool)

(assert (=> b!1256904 (=> res!837880 e!714616)))

(declare-fun contains!7556 (ListLongMap!18647 (_ BitVec 64)) Bool)

(assert (=> b!1256904 (= res!837880 (contains!7556 lt!568408 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4561 (array!81712 array!81714 (_ BitVec 32) (_ BitVec 32) V!48081 V!48081 (_ BitVec 32) Int) ListLongMap!18647)

(assert (=> b!1256904 (= lt!568408 (getCurrentListMap!4561 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105498 res!837879) b!1256896))

(assert (= (and b!1256896 res!837877) b!1256899))

(assert (= (and b!1256899 res!837878) b!1256897))

(assert (= (and b!1256897 res!837882) b!1256902))

(assert (= (and b!1256902 (not res!837881)) b!1256904))

(assert (= (and b!1256904 (not res!837880)) b!1256898))

(assert (= (and b!1256901 condMapEmpty!49843) mapIsEmpty!49843))

(assert (= (and b!1256901 (not condMapEmpty!49843)) mapNonEmpty!49843))

(get-info :version)

(assert (= (and mapNonEmpty!49843 ((_ is ValueCellFull!15255) mapValue!49843)) b!1256900))

(assert (= (and b!1256901 ((_ is ValueCellFull!15255) mapDefault!49843)) b!1256903))

(assert (= start!105498 b!1256901))

(declare-fun m!1157527 () Bool)

(assert (=> b!1256904 m!1157527))

(declare-fun m!1157529 () Bool)

(assert (=> b!1256904 m!1157529))

(declare-fun m!1157531 () Bool)

(assert (=> start!105498 m!1157531))

(declare-fun m!1157533 () Bool)

(assert (=> start!105498 m!1157533))

(declare-fun m!1157535 () Bool)

(assert (=> start!105498 m!1157535))

(declare-fun m!1157537 () Bool)

(assert (=> b!1256902 m!1157537))

(declare-fun m!1157539 () Bool)

(assert (=> b!1256902 m!1157539))

(declare-fun m!1157541 () Bool)

(assert (=> b!1256902 m!1157541))

(declare-fun m!1157543 () Bool)

(assert (=> b!1256898 m!1157543))

(declare-fun m!1157545 () Bool)

(assert (=> b!1256898 m!1157545))

(declare-fun m!1157547 () Bool)

(assert (=> b!1256897 m!1157547))

(declare-fun m!1157549 () Bool)

(assert (=> b!1256899 m!1157549))

(declare-fun m!1157551 () Bool)

(assert (=> mapNonEmpty!49843 m!1157551))

(check-sat tp_is_empty!32037 (not b!1256898) (not mapNonEmpty!49843) (not b!1256899) (not b_next!27135) (not start!105498) (not b!1256904) (not b!1256897) b_and!44991 (not b!1256902))
(check-sat b_and!44991 (not b_next!27135))
