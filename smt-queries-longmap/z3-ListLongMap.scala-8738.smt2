; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105948 () Bool)

(assert start!105948)

(declare-fun b_free!27463 () Bool)

(declare-fun b_next!27463 () Bool)

(assert (=> start!105948 (= b_free!27463 (not b_next!27463))))

(declare-fun tp!95926 () Bool)

(declare-fun b_and!45371 () Bool)

(assert (=> start!105948 (= tp!95926 b_and!45371)))

(declare-fun mapIsEmpty!50356 () Bool)

(declare-fun mapRes!50356 () Bool)

(assert (=> mapIsEmpty!50356 mapRes!50356))

(declare-fun mapNonEmpty!50356 () Bool)

(declare-fun tp!95927 () Bool)

(declare-fun e!718190 () Bool)

(assert (=> mapNonEmpty!50356 (= mapRes!50356 (and tp!95927 e!718190))))

(declare-fun mapKey!50356 () (_ BitVec 32))

(declare-datatypes ((V!48519 0))(
  ( (V!48520 (val!16245 Int)) )
))
(declare-datatypes ((ValueCell!15419 0))(
  ( (ValueCellFull!15419 (v!18949 V!48519)) (EmptyCell!15419) )
))
(declare-fun mapRest!50356 () (Array (_ BitVec 32) ValueCell!15419))

(declare-datatypes ((array!82269 0))(
  ( (array!82270 (arr!39686 (Array (_ BitVec 32) ValueCell!15419)) (size!40224 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82269)

(declare-fun mapValue!50356 () ValueCell!15419)

(assert (=> mapNonEmpty!50356 (= (arr!39686 _values!914) (store mapRest!50356 mapKey!50356 mapValue!50356))))

(declare-fun b!1261782 () Bool)

(declare-fun e!718191 () Bool)

(declare-fun e!718193 () Bool)

(assert (=> b!1261782 (= e!718191 (not e!718193))))

(declare-fun res!840736 () Bool)

(assert (=> b!1261782 (=> res!840736 e!718193)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261782 (= res!840736 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!21100 0))(
  ( (tuple2!21101 (_1!10561 (_ BitVec 64)) (_2!10561 V!48519)) )
))
(declare-datatypes ((List!28302 0))(
  ( (Nil!28299) (Cons!28298 (h!29507 tuple2!21100) (t!41796 List!28302)) )
))
(declare-datatypes ((ListLongMap!18973 0))(
  ( (ListLongMap!18974 (toList!9502 List!28302)) )
))
(declare-fun lt!571674 () ListLongMap!18973)

(declare-fun lt!571672 () ListLongMap!18973)

(assert (=> b!1261782 (= lt!571674 lt!571672)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((Unit!41910 0))(
  ( (Unit!41911) )
))
(declare-fun lt!571671 () Unit!41910)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48519)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48519)

(declare-datatypes ((array!82271 0))(
  ( (array!82272 (arr!39687 (Array (_ BitVec 32) (_ BitVec 64))) (size!40225 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82271)

(declare-fun minValueBefore!43 () V!48519)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1171 (array!82271 array!82269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 V!48519 V!48519 (_ BitVec 32) Int) Unit!41910)

(assert (=> b!1261782 (= lt!571671 (lemmaNoChangeToArrayThenSameMapNoExtras!1171 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5871 (array!82271 array!82269 (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 (_ BitVec 32) Int) ListLongMap!18973)

(assert (=> b!1261782 (= lt!571672 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261782 (= lt!571674 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!840738 () Bool)

(assert (=> start!105948 (=> (not res!840738) (not e!718191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105948 (= res!840738 (validMask!0 mask!1466))))

(assert (=> start!105948 e!718191))

(assert (=> start!105948 true))

(assert (=> start!105948 tp!95926))

(declare-fun tp_is_empty!32365 () Bool)

(assert (=> start!105948 tp_is_empty!32365))

(declare-fun array_inv!30361 (array!82271) Bool)

(assert (=> start!105948 (array_inv!30361 _keys!1118)))

(declare-fun e!718192 () Bool)

(declare-fun array_inv!30362 (array!82269) Bool)

(assert (=> start!105948 (and (array_inv!30362 _values!914) e!718192)))

(declare-fun b!1261783 () Bool)

(declare-fun e!718195 () Bool)

(assert (=> b!1261783 (= e!718195 tp_is_empty!32365)))

(declare-fun b!1261784 () Bool)

(declare-fun e!718189 () Bool)

(assert (=> b!1261784 (= e!718193 e!718189)))

(declare-fun res!840737 () Bool)

(assert (=> b!1261784 (=> res!840737 e!718189)))

(declare-fun lt!571669 () ListLongMap!18973)

(declare-fun contains!7556 (ListLongMap!18973 (_ BitVec 64)) Bool)

(assert (=> b!1261784 (= res!840737 (contains!7556 lt!571669 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4559 (array!82271 array!82269 (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 (_ BitVec 32) Int) ListLongMap!18973)

(assert (=> b!1261784 (= lt!571669 (getCurrentListMap!4559 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571670 () ListLongMap!18973)

(declare-fun b!1261785 () Bool)

(assert (=> b!1261785 (= e!718189 (= lt!571670 (getCurrentListMap!4559 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922)))))

(assert (=> b!1261785 (= lt!571670 lt!571669)))

(declare-fun -!2092 (ListLongMap!18973 (_ BitVec 64)) ListLongMap!18973)

(assert (=> b!1261785 (= lt!571670 (-!2092 lt!571669 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!571673 () Unit!41910)

(declare-fun removeNotPresentStillSame!149 (ListLongMap!18973 (_ BitVec 64)) Unit!41910)

(assert (=> b!1261785 (= lt!571673 (removeNotPresentStillSame!149 lt!571669 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261786 () Bool)

(assert (=> b!1261786 (= e!718192 (and e!718195 mapRes!50356))))

(declare-fun condMapEmpty!50356 () Bool)

(declare-fun mapDefault!50356 () ValueCell!15419)

(assert (=> b!1261786 (= condMapEmpty!50356 (= (arr!39686 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15419)) mapDefault!50356)))))

(declare-fun b!1261787 () Bool)

(declare-fun res!840739 () Bool)

(assert (=> b!1261787 (=> (not res!840739) (not e!718191))))

(declare-datatypes ((List!28303 0))(
  ( (Nil!28300) (Cons!28299 (h!29508 (_ BitVec 64)) (t!41797 List!28303)) )
))
(declare-fun arrayNoDuplicates!0 (array!82271 (_ BitVec 32) List!28303) Bool)

(assert (=> b!1261787 (= res!840739 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28300))))

(declare-fun b!1261788 () Bool)

(declare-fun res!840740 () Bool)

(assert (=> b!1261788 (=> (not res!840740) (not e!718191))))

(assert (=> b!1261788 (= res!840740 (and (= (size!40224 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40225 _keys!1118) (size!40224 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261789 () Bool)

(assert (=> b!1261789 (= e!718190 tp_is_empty!32365)))

(declare-fun b!1261790 () Bool)

(declare-fun res!840735 () Bool)

(assert (=> b!1261790 (=> (not res!840735) (not e!718191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82271 (_ BitVec 32)) Bool)

(assert (=> b!1261790 (= res!840735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!105948 res!840738) b!1261788))

(assert (= (and b!1261788 res!840740) b!1261790))

(assert (= (and b!1261790 res!840735) b!1261787))

(assert (= (and b!1261787 res!840739) b!1261782))

(assert (= (and b!1261782 (not res!840736)) b!1261784))

(assert (= (and b!1261784 (not res!840737)) b!1261785))

(assert (= (and b!1261786 condMapEmpty!50356) mapIsEmpty!50356))

(assert (= (and b!1261786 (not condMapEmpty!50356)) mapNonEmpty!50356))

(get-info :version)

(assert (= (and mapNonEmpty!50356 ((_ is ValueCellFull!15419) mapValue!50356)) b!1261789))

(assert (= (and b!1261786 ((_ is ValueCellFull!15419) mapDefault!50356)) b!1261783))

(assert (= start!105948 b!1261786))

(declare-fun m!1161875 () Bool)

(assert (=> b!1261785 m!1161875))

(declare-fun m!1161877 () Bool)

(assert (=> b!1261785 m!1161877))

(declare-fun m!1161879 () Bool)

(assert (=> b!1261785 m!1161879))

(declare-fun m!1161881 () Bool)

(assert (=> mapNonEmpty!50356 m!1161881))

(declare-fun m!1161883 () Bool)

(assert (=> start!105948 m!1161883))

(declare-fun m!1161885 () Bool)

(assert (=> start!105948 m!1161885))

(declare-fun m!1161887 () Bool)

(assert (=> start!105948 m!1161887))

(declare-fun m!1161889 () Bool)

(assert (=> b!1261782 m!1161889))

(declare-fun m!1161891 () Bool)

(assert (=> b!1261782 m!1161891))

(declare-fun m!1161893 () Bool)

(assert (=> b!1261782 m!1161893))

(declare-fun m!1161895 () Bool)

(assert (=> b!1261784 m!1161895))

(declare-fun m!1161897 () Bool)

(assert (=> b!1261784 m!1161897))

(declare-fun m!1161899 () Bool)

(assert (=> b!1261787 m!1161899))

(declare-fun m!1161901 () Bool)

(assert (=> b!1261790 m!1161901))

(check-sat (not b!1261785) (not b!1261782) (not mapNonEmpty!50356) (not b_next!27463) (not b!1261790) (not b!1261787) (not b!1261784) b_and!45371 tp_is_empty!32365 (not start!105948))
(check-sat b_and!45371 (not b_next!27463))
(get-model)

(declare-fun bm!61978 () Bool)

(declare-fun call!61981 () Bool)

(assert (=> bm!61978 (= call!61981 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1261853 () Bool)

(declare-fun e!718245 () Bool)

(declare-fun e!718244 () Bool)

(assert (=> b!1261853 (= e!718245 e!718244)))

(declare-fun lt!571719 () (_ BitVec 64))

(assert (=> b!1261853 (= lt!571719 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571718 () Unit!41910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82271 (_ BitVec 64) (_ BitVec 32)) Unit!41910)

(assert (=> b!1261853 (= lt!571718 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!571719 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1261853 (arrayContainsKey!0 _keys!1118 lt!571719 #b00000000000000000000000000000000)))

(declare-fun lt!571717 () Unit!41910)

(assert (=> b!1261853 (= lt!571717 lt!571718)))

(declare-fun res!840782 () Bool)

(declare-datatypes ((SeekEntryResult!9973 0))(
  ( (MissingZero!9973 (index!42263 (_ BitVec 32))) (Found!9973 (index!42264 (_ BitVec 32))) (Intermediate!9973 (undefined!10785 Bool) (index!42265 (_ BitVec 32)) (x!111205 (_ BitVec 32))) (Undefined!9973) (MissingVacant!9973 (index!42266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82271 (_ BitVec 32)) SeekEntryResult!9973)

(assert (=> b!1261853 (= res!840782 (= (seekEntryOrOpen!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9973 #b00000000000000000000000000000000)))))

(assert (=> b!1261853 (=> (not res!840782) (not e!718244))))

(declare-fun b!1261854 () Bool)

(declare-fun e!718246 () Bool)

(assert (=> b!1261854 (= e!718246 e!718245)))

(declare-fun c!122698 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1261854 (= c!122698 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261855 () Bool)

(assert (=> b!1261855 (= e!718245 call!61981)))

(declare-fun b!1261856 () Bool)

(assert (=> b!1261856 (= e!718244 call!61981)))

(declare-fun d!138353 () Bool)

(declare-fun res!840781 () Bool)

(assert (=> d!138353 (=> res!840781 e!718246)))

(assert (=> d!138353 (= res!840781 (bvsge #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(assert (=> d!138353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718246)))

(assert (= (and d!138353 (not res!840781)) b!1261854))

(assert (= (and b!1261854 c!122698) b!1261853))

(assert (= (and b!1261854 (not c!122698)) b!1261855))

(assert (= (and b!1261853 res!840782) b!1261856))

(assert (= (or b!1261856 b!1261855) bm!61978))

(declare-fun m!1161959 () Bool)

(assert (=> bm!61978 m!1161959))

(declare-fun m!1161961 () Bool)

(assert (=> b!1261853 m!1161961))

(declare-fun m!1161963 () Bool)

(assert (=> b!1261853 m!1161963))

(declare-fun m!1161965 () Bool)

(assert (=> b!1261853 m!1161965))

(assert (=> b!1261853 m!1161961))

(declare-fun m!1161967 () Bool)

(assert (=> b!1261853 m!1161967))

(assert (=> b!1261854 m!1161961))

(assert (=> b!1261854 m!1161961))

(declare-fun m!1161969 () Bool)

(assert (=> b!1261854 m!1161969))

(assert (=> b!1261790 d!138353))

(declare-fun bm!61993 () Bool)

(declare-fun call!61998 () ListLongMap!18973)

(declare-fun call!61999 () ListLongMap!18973)

(assert (=> bm!61993 (= call!61998 call!61999)))

(declare-fun b!1261899 () Bool)

(declare-fun e!718285 () Bool)

(assert (=> b!1261899 (= e!718285 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261900 () Bool)

(declare-fun res!840805 () Bool)

(declare-fun e!718274 () Bool)

(assert (=> b!1261900 (=> (not res!840805) (not e!718274))))

(declare-fun e!718282 () Bool)

(assert (=> b!1261900 (= res!840805 e!718282)))

(declare-fun res!840809 () Bool)

(assert (=> b!1261900 (=> res!840809 e!718282)))

(declare-fun e!718281 () Bool)

(assert (=> b!1261900 (= res!840809 (not e!718281))))

(declare-fun res!840803 () Bool)

(assert (=> b!1261900 (=> (not res!840803) (not e!718281))))

(assert (=> b!1261900 (= res!840803 (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun b!1261901 () Bool)

(declare-fun e!718283 () Unit!41910)

(declare-fun lt!571779 () Unit!41910)

(assert (=> b!1261901 (= e!718283 lt!571779)))

(declare-fun lt!571782 () ListLongMap!18973)

(assert (=> b!1261901 (= lt!571782 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571777 () (_ BitVec 64))

(assert (=> b!1261901 (= lt!571777 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571769 () (_ BitVec 64))

(assert (=> b!1261901 (= lt!571769 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571778 () Unit!41910)

(declare-fun addStillContains!1086 (ListLongMap!18973 (_ BitVec 64) V!48519 (_ BitVec 64)) Unit!41910)

(assert (=> b!1261901 (= lt!571778 (addStillContains!1086 lt!571782 lt!571777 zeroValue!871 lt!571769))))

(declare-fun +!4278 (ListLongMap!18973 tuple2!21100) ListLongMap!18973)

(assert (=> b!1261901 (contains!7556 (+!4278 lt!571782 (tuple2!21101 lt!571777 zeroValue!871)) lt!571769)))

(declare-fun lt!571774 () Unit!41910)

(assert (=> b!1261901 (= lt!571774 lt!571778)))

(declare-fun lt!571771 () ListLongMap!18973)

(assert (=> b!1261901 (= lt!571771 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571767 () (_ BitVec 64))

(assert (=> b!1261901 (= lt!571767 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571772 () (_ BitVec 64))

(assert (=> b!1261901 (= lt!571772 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571768 () Unit!41910)

(declare-fun addApplyDifferent!529 (ListLongMap!18973 (_ BitVec 64) V!48519 (_ BitVec 64)) Unit!41910)

(assert (=> b!1261901 (= lt!571768 (addApplyDifferent!529 lt!571771 lt!571767 minValueAfter!43 lt!571772))))

(declare-fun apply!989 (ListLongMap!18973 (_ BitVec 64)) V!48519)

(assert (=> b!1261901 (= (apply!989 (+!4278 lt!571771 (tuple2!21101 lt!571767 minValueAfter!43)) lt!571772) (apply!989 lt!571771 lt!571772))))

(declare-fun lt!571773 () Unit!41910)

(assert (=> b!1261901 (= lt!571773 lt!571768)))

(declare-fun lt!571766 () ListLongMap!18973)

(assert (=> b!1261901 (= lt!571766 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571781 () (_ BitVec 64))

(assert (=> b!1261901 (= lt!571781 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571764 () (_ BitVec 64))

(assert (=> b!1261901 (= lt!571764 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571775 () Unit!41910)

(assert (=> b!1261901 (= lt!571775 (addApplyDifferent!529 lt!571766 lt!571781 zeroValue!871 lt!571764))))

(assert (=> b!1261901 (= (apply!989 (+!4278 lt!571766 (tuple2!21101 lt!571781 zeroValue!871)) lt!571764) (apply!989 lt!571766 lt!571764))))

(declare-fun lt!571784 () Unit!41910)

(assert (=> b!1261901 (= lt!571784 lt!571775)))

(declare-fun lt!571770 () ListLongMap!18973)

(assert (=> b!1261901 (= lt!571770 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571785 () (_ BitVec 64))

(assert (=> b!1261901 (= lt!571785 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571776 () (_ BitVec 64))

(assert (=> b!1261901 (= lt!571776 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261901 (= lt!571779 (addApplyDifferent!529 lt!571770 lt!571785 minValueAfter!43 lt!571776))))

(assert (=> b!1261901 (= (apply!989 (+!4278 lt!571770 (tuple2!21101 lt!571785 minValueAfter!43)) lt!571776) (apply!989 lt!571770 lt!571776))))

(declare-fun b!1261902 () Bool)

(declare-fun e!718275 () ListLongMap!18973)

(assert (=> b!1261902 (= e!718275 call!61998)))

(declare-fun b!1261903 () Bool)

(declare-fun e!718276 () ListLongMap!18973)

(declare-fun call!61997 () ListLongMap!18973)

(assert (=> b!1261903 (= e!718276 call!61997)))

(declare-fun b!1261904 () Bool)

(declare-fun c!122714 () Bool)

(assert (=> b!1261904 (= c!122714 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1261904 (= e!718276 e!718275)))

(declare-fun b!1261905 () Bool)

(assert (=> b!1261905 (= e!718281 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61994 () Bool)

(declare-fun call!62001 () ListLongMap!18973)

(assert (=> bm!61994 (= call!61997 call!62001)))

(declare-fun b!1261906 () Bool)

(declare-fun e!718279 () ListLongMap!18973)

(assert (=> b!1261906 (= e!718279 (+!4278 call!62001 (tuple2!21101 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun bm!61995 () Bool)

(declare-fun call!62000 () ListLongMap!18973)

(declare-fun c!122713 () Bool)

(declare-fun c!122716 () Bool)

(assert (=> bm!61995 (= call!62001 (+!4278 (ite c!122713 call!62000 (ite c!122716 call!61999 call!61998)) (ite (or c!122713 c!122716) (tuple2!21101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21101 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1261907 () Bool)

(declare-fun e!718273 () Bool)

(declare-fun lt!571765 () ListLongMap!18973)

(assert (=> b!1261907 (= e!718273 (= (apply!989 lt!571765 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1261908 () Bool)

(declare-fun e!718277 () Bool)

(declare-fun call!62002 () Bool)

(assert (=> b!1261908 (= e!718277 (not call!62002))))

(declare-fun b!1261909 () Bool)

(declare-fun e!718284 () Bool)

(assert (=> b!1261909 (= e!718284 e!718273)))

(declare-fun res!840806 () Bool)

(declare-fun call!61996 () Bool)

(assert (=> b!1261909 (= res!840806 call!61996)))

(assert (=> b!1261909 (=> (not res!840806) (not e!718273))))

(declare-fun b!1261910 () Bool)

(declare-fun Unit!41916 () Unit!41910)

(assert (=> b!1261910 (= e!718283 Unit!41916)))

(declare-fun bm!61997 () Bool)

(assert (=> bm!61997 (= call!62000 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261911 () Bool)

(declare-fun e!718280 () Bool)

(assert (=> b!1261911 (= e!718282 e!718280)))

(declare-fun res!840808 () Bool)

(assert (=> b!1261911 (=> (not res!840808) (not e!718280))))

(assert (=> b!1261911 (= res!840808 (contains!7556 lt!571765 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun b!1261912 () Bool)

(assert (=> b!1261912 (= e!718279 e!718276)))

(assert (=> b!1261912 (= c!122716 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261913 () Bool)

(declare-fun get!20270 (ValueCell!15419 V!48519) V!48519)

(declare-fun dynLambda!3419 (Int (_ BitVec 64)) V!48519)

(assert (=> b!1261913 (= e!718280 (= (apply!989 lt!571765 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)) (get!20270 (select (arr!39686 _values!914) #b00000000000000000000000000000000) (dynLambda!3419 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1261913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40224 _values!914)))))

(assert (=> b!1261913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun bm!61998 () Bool)

(assert (=> bm!61998 (= call!61999 call!62000)))

(declare-fun b!1261914 () Bool)

(assert (=> b!1261914 (= e!718274 e!718284)))

(declare-fun c!122711 () Bool)

(assert (=> b!1261914 (= c!122711 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261915 () Bool)

(declare-fun res!840802 () Bool)

(assert (=> b!1261915 (=> (not res!840802) (not e!718274))))

(assert (=> b!1261915 (= res!840802 e!718277)))

(declare-fun c!122715 () Bool)

(assert (=> b!1261915 (= c!122715 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1261916 () Bool)

(assert (=> b!1261916 (= e!718275 call!61997)))

(declare-fun b!1261917 () Bool)

(declare-fun e!718278 () Bool)

(assert (=> b!1261917 (= e!718278 (= (apply!989 lt!571765 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1261918 () Bool)

(assert (=> b!1261918 (= e!718284 (not call!61996))))

(declare-fun b!1261919 () Bool)

(assert (=> b!1261919 (= e!718277 e!718278)))

(declare-fun res!840801 () Bool)

(assert (=> b!1261919 (= res!840801 call!62002)))

(assert (=> b!1261919 (=> (not res!840801) (not e!718278))))

(declare-fun bm!61999 () Bool)

(assert (=> bm!61999 (= call!62002 (contains!7556 lt!571765 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61996 () Bool)

(assert (=> bm!61996 (= call!61996 (contains!7556 lt!571765 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!138355 () Bool)

(assert (=> d!138355 e!718274))

(declare-fun res!840807 () Bool)

(assert (=> d!138355 (=> (not res!840807) (not e!718274))))

(assert (=> d!138355 (= res!840807 (or (bvsge #b00000000000000000000000000000000 (size!40225 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))))

(declare-fun lt!571780 () ListLongMap!18973)

(assert (=> d!138355 (= lt!571765 lt!571780)))

(declare-fun lt!571783 () Unit!41910)

(assert (=> d!138355 (= lt!571783 e!718283)))

(declare-fun c!122712 () Bool)

(assert (=> d!138355 (= c!122712 e!718285)))

(declare-fun res!840804 () Bool)

(assert (=> d!138355 (=> (not res!840804) (not e!718285))))

(assert (=> d!138355 (= res!840804 (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(assert (=> d!138355 (= lt!571780 e!718279)))

(assert (=> d!138355 (= c!122713 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138355 (validMask!0 mask!1466)))

(assert (=> d!138355 (= (getCurrentListMap!4559 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571765)))

(assert (= (and d!138355 c!122713) b!1261906))

(assert (= (and d!138355 (not c!122713)) b!1261912))

(assert (= (and b!1261912 c!122716) b!1261903))

(assert (= (and b!1261912 (not c!122716)) b!1261904))

(assert (= (and b!1261904 c!122714) b!1261916))

(assert (= (and b!1261904 (not c!122714)) b!1261902))

(assert (= (or b!1261916 b!1261902) bm!61993))

(assert (= (or b!1261903 bm!61993) bm!61998))

(assert (= (or b!1261903 b!1261916) bm!61994))

(assert (= (or b!1261906 bm!61998) bm!61997))

(assert (= (or b!1261906 bm!61994) bm!61995))

(assert (= (and d!138355 res!840804) b!1261899))

(assert (= (and d!138355 c!122712) b!1261901))

(assert (= (and d!138355 (not c!122712)) b!1261910))

(assert (= (and d!138355 res!840807) b!1261900))

(assert (= (and b!1261900 res!840803) b!1261905))

(assert (= (and b!1261900 (not res!840809)) b!1261911))

(assert (= (and b!1261911 res!840808) b!1261913))

(assert (= (and b!1261900 res!840805) b!1261915))

(assert (= (and b!1261915 c!122715) b!1261919))

(assert (= (and b!1261915 (not c!122715)) b!1261908))

(assert (= (and b!1261919 res!840801) b!1261917))

(assert (= (or b!1261919 b!1261908) bm!61999))

(assert (= (and b!1261915 res!840802) b!1261914))

(assert (= (and b!1261914 c!122711) b!1261909))

(assert (= (and b!1261914 (not c!122711)) b!1261918))

(assert (= (and b!1261909 res!840806) b!1261907))

(assert (= (or b!1261909 b!1261918) bm!61996))

(declare-fun b_lambda!22817 () Bool)

(assert (=> (not b_lambda!22817) (not b!1261913)))

(declare-fun t!41803 () Bool)

(declare-fun tb!11311 () Bool)

(assert (=> (and start!105948 (= defaultEntry!922 defaultEntry!922) t!41803) tb!11311))

(declare-fun result!23357 () Bool)

(assert (=> tb!11311 (= result!23357 tp_is_empty!32365)))

(assert (=> b!1261913 t!41803))

(declare-fun b_and!45377 () Bool)

(assert (= b_and!45371 (and (=> t!41803 result!23357) b_and!45377)))

(declare-fun m!1161971 () Bool)

(assert (=> b!1261913 m!1161971))

(declare-fun m!1161973 () Bool)

(assert (=> b!1261913 m!1161973))

(declare-fun m!1161975 () Bool)

(assert (=> b!1261913 m!1161975))

(assert (=> b!1261913 m!1161961))

(declare-fun m!1161977 () Bool)

(assert (=> b!1261913 m!1161977))

(assert (=> b!1261913 m!1161973))

(assert (=> b!1261913 m!1161971))

(assert (=> b!1261913 m!1161961))

(declare-fun m!1161979 () Bool)

(assert (=> bm!61995 m!1161979))

(assert (=> b!1261905 m!1161961))

(assert (=> b!1261905 m!1161961))

(assert (=> b!1261905 m!1161969))

(declare-fun m!1161981 () Bool)

(assert (=> bm!61996 m!1161981))

(declare-fun m!1161983 () Bool)

(assert (=> b!1261917 m!1161983))

(declare-fun m!1161985 () Bool)

(assert (=> b!1261901 m!1161985))

(declare-fun m!1161987 () Bool)

(assert (=> b!1261901 m!1161987))

(assert (=> b!1261901 m!1161985))

(declare-fun m!1161989 () Bool)

(assert (=> b!1261901 m!1161989))

(declare-fun m!1161991 () Bool)

(assert (=> b!1261901 m!1161991))

(declare-fun m!1161993 () Bool)

(assert (=> b!1261901 m!1161993))

(assert (=> b!1261901 m!1161993))

(declare-fun m!1161995 () Bool)

(assert (=> b!1261901 m!1161995))

(declare-fun m!1161997 () Bool)

(assert (=> b!1261901 m!1161997))

(declare-fun m!1161999 () Bool)

(assert (=> b!1261901 m!1161999))

(assert (=> b!1261901 m!1161989))

(declare-fun m!1162001 () Bool)

(assert (=> b!1261901 m!1162001))

(assert (=> b!1261901 m!1161961))

(declare-fun m!1162003 () Bool)

(assert (=> b!1261901 m!1162003))

(declare-fun m!1162005 () Bool)

(assert (=> b!1261901 m!1162005))

(assert (=> b!1261901 m!1162003))

(assert (=> b!1261901 m!1161891))

(declare-fun m!1162007 () Bool)

(assert (=> b!1261901 m!1162007))

(declare-fun m!1162009 () Bool)

(assert (=> b!1261901 m!1162009))

(declare-fun m!1162011 () Bool)

(assert (=> b!1261901 m!1162011))

(declare-fun m!1162013 () Bool)

(assert (=> b!1261901 m!1162013))

(declare-fun m!1162015 () Bool)

(assert (=> b!1261906 m!1162015))

(declare-fun m!1162017 () Bool)

(assert (=> b!1261907 m!1162017))

(assert (=> b!1261899 m!1161961))

(assert (=> b!1261899 m!1161961))

(assert (=> b!1261899 m!1161969))

(declare-fun m!1162019 () Bool)

(assert (=> bm!61999 m!1162019))

(assert (=> b!1261911 m!1161961))

(assert (=> b!1261911 m!1161961))

(declare-fun m!1162021 () Bool)

(assert (=> b!1261911 m!1162021))

(assert (=> d!138355 m!1161883))

(assert (=> bm!61997 m!1161891))

(assert (=> b!1261785 d!138355))

(declare-fun d!138357 () Bool)

(declare-fun lt!571788 () ListLongMap!18973)

(assert (=> d!138357 (not (contains!7556 lt!571788 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!144 (List!28302 (_ BitVec 64)) List!28302)

(assert (=> d!138357 (= lt!571788 (ListLongMap!18974 (removeStrictlySorted!144 (toList!9502 lt!571669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138357 (= (-!2092 lt!571669 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571788)))

(declare-fun bs!35688 () Bool)

(assert (= bs!35688 d!138357))

(declare-fun m!1162023 () Bool)

(assert (=> bs!35688 m!1162023))

(declare-fun m!1162025 () Bool)

(assert (=> bs!35688 m!1162025))

(assert (=> b!1261785 d!138357))

(declare-fun d!138359 () Bool)

(assert (=> d!138359 (= (-!2092 lt!571669 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571669)))

(declare-fun lt!571791 () Unit!41910)

(declare-fun choose!1878 (ListLongMap!18973 (_ BitVec 64)) Unit!41910)

(assert (=> d!138359 (= lt!571791 (choose!1878 lt!571669 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138359 (not (contains!7556 lt!571669 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138359 (= (removeNotPresentStillSame!149 lt!571669 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571791)))

(declare-fun bs!35689 () Bool)

(assert (= bs!35689 d!138359))

(assert (=> bs!35689 m!1161877))

(declare-fun m!1162027 () Bool)

(assert (=> bs!35689 m!1162027))

(assert (=> bs!35689 m!1161895))

(assert (=> b!1261785 d!138359))

(declare-fun d!138361 () Bool)

(declare-fun e!718290 () Bool)

(assert (=> d!138361 e!718290))

(declare-fun res!840812 () Bool)

(assert (=> d!138361 (=> res!840812 e!718290)))

(declare-fun lt!571801 () Bool)

(assert (=> d!138361 (= res!840812 (not lt!571801))))

(declare-fun lt!571800 () Bool)

(assert (=> d!138361 (= lt!571801 lt!571800)))

(declare-fun lt!571802 () Unit!41910)

(declare-fun e!718291 () Unit!41910)

(assert (=> d!138361 (= lt!571802 e!718291)))

(declare-fun c!122719 () Bool)

(assert (=> d!138361 (= c!122719 lt!571800)))

(declare-fun containsKey!621 (List!28302 (_ BitVec 64)) Bool)

(assert (=> d!138361 (= lt!571800 (containsKey!621 (toList!9502 lt!571669) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138361 (= (contains!7556 lt!571669 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571801)))

(declare-fun b!1261928 () Bool)

(declare-fun lt!571803 () Unit!41910)

(assert (=> b!1261928 (= e!718291 lt!571803)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!431 (List!28302 (_ BitVec 64)) Unit!41910)

(assert (=> b!1261928 (= lt!571803 (lemmaContainsKeyImpliesGetValueByKeyDefined!431 (toList!9502 lt!571669) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!714 0))(
  ( (Some!713 (v!18952 V!48519)) (None!712) )
))
(declare-fun isDefined!474 (Option!714) Bool)

(declare-fun getValueByKey!663 (List!28302 (_ BitVec 64)) Option!714)

(assert (=> b!1261928 (isDefined!474 (getValueByKey!663 (toList!9502 lt!571669) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261929 () Bool)

(declare-fun Unit!41917 () Unit!41910)

(assert (=> b!1261929 (= e!718291 Unit!41917)))

(declare-fun b!1261930 () Bool)

(assert (=> b!1261930 (= e!718290 (isDefined!474 (getValueByKey!663 (toList!9502 lt!571669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138361 c!122719) b!1261928))

(assert (= (and d!138361 (not c!122719)) b!1261929))

(assert (= (and d!138361 (not res!840812)) b!1261930))

(declare-fun m!1162029 () Bool)

(assert (=> d!138361 m!1162029))

(declare-fun m!1162031 () Bool)

(assert (=> b!1261928 m!1162031))

(declare-fun m!1162033 () Bool)

(assert (=> b!1261928 m!1162033))

(assert (=> b!1261928 m!1162033))

(declare-fun m!1162035 () Bool)

(assert (=> b!1261928 m!1162035))

(assert (=> b!1261930 m!1162033))

(assert (=> b!1261930 m!1162033))

(assert (=> b!1261930 m!1162035))

(assert (=> b!1261784 d!138361))

(declare-fun bm!62000 () Bool)

(declare-fun call!62005 () ListLongMap!18973)

(declare-fun call!62006 () ListLongMap!18973)

(assert (=> bm!62000 (= call!62005 call!62006)))

(declare-fun b!1261931 () Bool)

(declare-fun e!718304 () Bool)

(assert (=> b!1261931 (= e!718304 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261932 () Bool)

(declare-fun res!840817 () Bool)

(declare-fun e!718293 () Bool)

(assert (=> b!1261932 (=> (not res!840817) (not e!718293))))

(declare-fun e!718301 () Bool)

(assert (=> b!1261932 (= res!840817 e!718301)))

(declare-fun res!840821 () Bool)

(assert (=> b!1261932 (=> res!840821 e!718301)))

(declare-fun e!718300 () Bool)

(assert (=> b!1261932 (= res!840821 (not e!718300))))

(declare-fun res!840815 () Bool)

(assert (=> b!1261932 (=> (not res!840815) (not e!718300))))

(assert (=> b!1261932 (= res!840815 (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun b!1261933 () Bool)

(declare-fun e!718302 () Unit!41910)

(declare-fun lt!571819 () Unit!41910)

(assert (=> b!1261933 (= e!718302 lt!571819)))

(declare-fun lt!571822 () ListLongMap!18973)

(assert (=> b!1261933 (= lt!571822 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571817 () (_ BitVec 64))

(assert (=> b!1261933 (= lt!571817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571809 () (_ BitVec 64))

(assert (=> b!1261933 (= lt!571809 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571818 () Unit!41910)

(assert (=> b!1261933 (= lt!571818 (addStillContains!1086 lt!571822 lt!571817 zeroValue!871 lt!571809))))

(assert (=> b!1261933 (contains!7556 (+!4278 lt!571822 (tuple2!21101 lt!571817 zeroValue!871)) lt!571809)))

(declare-fun lt!571814 () Unit!41910)

(assert (=> b!1261933 (= lt!571814 lt!571818)))

(declare-fun lt!571811 () ListLongMap!18973)

(assert (=> b!1261933 (= lt!571811 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571807 () (_ BitVec 64))

(assert (=> b!1261933 (= lt!571807 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571812 () (_ BitVec 64))

(assert (=> b!1261933 (= lt!571812 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571808 () Unit!41910)

(assert (=> b!1261933 (= lt!571808 (addApplyDifferent!529 lt!571811 lt!571807 minValueBefore!43 lt!571812))))

(assert (=> b!1261933 (= (apply!989 (+!4278 lt!571811 (tuple2!21101 lt!571807 minValueBefore!43)) lt!571812) (apply!989 lt!571811 lt!571812))))

(declare-fun lt!571813 () Unit!41910)

(assert (=> b!1261933 (= lt!571813 lt!571808)))

(declare-fun lt!571806 () ListLongMap!18973)

(assert (=> b!1261933 (= lt!571806 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571821 () (_ BitVec 64))

(assert (=> b!1261933 (= lt!571821 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571804 () (_ BitVec 64))

(assert (=> b!1261933 (= lt!571804 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571815 () Unit!41910)

(assert (=> b!1261933 (= lt!571815 (addApplyDifferent!529 lt!571806 lt!571821 zeroValue!871 lt!571804))))

(assert (=> b!1261933 (= (apply!989 (+!4278 lt!571806 (tuple2!21101 lt!571821 zeroValue!871)) lt!571804) (apply!989 lt!571806 lt!571804))))

(declare-fun lt!571824 () Unit!41910)

(assert (=> b!1261933 (= lt!571824 lt!571815)))

(declare-fun lt!571810 () ListLongMap!18973)

(assert (=> b!1261933 (= lt!571810 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571825 () (_ BitVec 64))

(assert (=> b!1261933 (= lt!571825 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571816 () (_ BitVec 64))

(assert (=> b!1261933 (= lt!571816 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261933 (= lt!571819 (addApplyDifferent!529 lt!571810 lt!571825 minValueBefore!43 lt!571816))))

(assert (=> b!1261933 (= (apply!989 (+!4278 lt!571810 (tuple2!21101 lt!571825 minValueBefore!43)) lt!571816) (apply!989 lt!571810 lt!571816))))

(declare-fun b!1261934 () Bool)

(declare-fun e!718294 () ListLongMap!18973)

(assert (=> b!1261934 (= e!718294 call!62005)))

(declare-fun b!1261935 () Bool)

(declare-fun e!718295 () ListLongMap!18973)

(declare-fun call!62004 () ListLongMap!18973)

(assert (=> b!1261935 (= e!718295 call!62004)))

(declare-fun b!1261936 () Bool)

(declare-fun c!122723 () Bool)

(assert (=> b!1261936 (= c!122723 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1261936 (= e!718295 e!718294)))

(declare-fun b!1261937 () Bool)

(assert (=> b!1261937 (= e!718300 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62001 () Bool)

(declare-fun call!62008 () ListLongMap!18973)

(assert (=> bm!62001 (= call!62004 call!62008)))

(declare-fun b!1261938 () Bool)

(declare-fun e!718298 () ListLongMap!18973)

(assert (=> b!1261938 (= e!718298 (+!4278 call!62008 (tuple2!21101 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun c!122722 () Bool)

(declare-fun c!122725 () Bool)

(declare-fun call!62007 () ListLongMap!18973)

(declare-fun bm!62002 () Bool)

(assert (=> bm!62002 (= call!62008 (+!4278 (ite c!122722 call!62007 (ite c!122725 call!62006 call!62005)) (ite (or c!122722 c!122725) (tuple2!21101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21101 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1261939 () Bool)

(declare-fun e!718292 () Bool)

(declare-fun lt!571805 () ListLongMap!18973)

(assert (=> b!1261939 (= e!718292 (= (apply!989 lt!571805 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1261940 () Bool)

(declare-fun e!718296 () Bool)

(declare-fun call!62009 () Bool)

(assert (=> b!1261940 (= e!718296 (not call!62009))))

(declare-fun b!1261941 () Bool)

(declare-fun e!718303 () Bool)

(assert (=> b!1261941 (= e!718303 e!718292)))

(declare-fun res!840818 () Bool)

(declare-fun call!62003 () Bool)

(assert (=> b!1261941 (= res!840818 call!62003)))

(assert (=> b!1261941 (=> (not res!840818) (not e!718292))))

(declare-fun b!1261942 () Bool)

(declare-fun Unit!41918 () Unit!41910)

(assert (=> b!1261942 (= e!718302 Unit!41918)))

(declare-fun bm!62004 () Bool)

(assert (=> bm!62004 (= call!62007 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261943 () Bool)

(declare-fun e!718299 () Bool)

(assert (=> b!1261943 (= e!718301 e!718299)))

(declare-fun res!840820 () Bool)

(assert (=> b!1261943 (=> (not res!840820) (not e!718299))))

(assert (=> b!1261943 (= res!840820 (contains!7556 lt!571805 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261943 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun b!1261944 () Bool)

(assert (=> b!1261944 (= e!718298 e!718295)))

(assert (=> b!1261944 (= c!122725 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261945 () Bool)

(assert (=> b!1261945 (= e!718299 (= (apply!989 lt!571805 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)) (get!20270 (select (arr!39686 _values!914) #b00000000000000000000000000000000) (dynLambda!3419 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1261945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40224 _values!914)))))

(assert (=> b!1261945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun bm!62005 () Bool)

(assert (=> bm!62005 (= call!62006 call!62007)))

(declare-fun b!1261946 () Bool)

(assert (=> b!1261946 (= e!718293 e!718303)))

(declare-fun c!122720 () Bool)

(assert (=> b!1261946 (= c!122720 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261947 () Bool)

(declare-fun res!840814 () Bool)

(assert (=> b!1261947 (=> (not res!840814) (not e!718293))))

(assert (=> b!1261947 (= res!840814 e!718296)))

(declare-fun c!122724 () Bool)

(assert (=> b!1261947 (= c!122724 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1261948 () Bool)

(assert (=> b!1261948 (= e!718294 call!62004)))

(declare-fun b!1261949 () Bool)

(declare-fun e!718297 () Bool)

(assert (=> b!1261949 (= e!718297 (= (apply!989 lt!571805 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1261950 () Bool)

(assert (=> b!1261950 (= e!718303 (not call!62003))))

(declare-fun b!1261951 () Bool)

(assert (=> b!1261951 (= e!718296 e!718297)))

(declare-fun res!840813 () Bool)

(assert (=> b!1261951 (= res!840813 call!62009)))

(assert (=> b!1261951 (=> (not res!840813) (not e!718297))))

(declare-fun bm!62006 () Bool)

(assert (=> bm!62006 (= call!62009 (contains!7556 lt!571805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62003 () Bool)

(assert (=> bm!62003 (= call!62003 (contains!7556 lt!571805 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!138363 () Bool)

(assert (=> d!138363 e!718293))

(declare-fun res!840819 () Bool)

(assert (=> d!138363 (=> (not res!840819) (not e!718293))))

(assert (=> d!138363 (= res!840819 (or (bvsge #b00000000000000000000000000000000 (size!40225 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))))

(declare-fun lt!571820 () ListLongMap!18973)

(assert (=> d!138363 (= lt!571805 lt!571820)))

(declare-fun lt!571823 () Unit!41910)

(assert (=> d!138363 (= lt!571823 e!718302)))

(declare-fun c!122721 () Bool)

(assert (=> d!138363 (= c!122721 e!718304)))

(declare-fun res!840816 () Bool)

(assert (=> d!138363 (=> (not res!840816) (not e!718304))))

(assert (=> d!138363 (= res!840816 (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(assert (=> d!138363 (= lt!571820 e!718298)))

(assert (=> d!138363 (= c!122722 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138363 (validMask!0 mask!1466)))

(assert (=> d!138363 (= (getCurrentListMap!4559 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571805)))

(assert (= (and d!138363 c!122722) b!1261938))

(assert (= (and d!138363 (not c!122722)) b!1261944))

(assert (= (and b!1261944 c!122725) b!1261935))

(assert (= (and b!1261944 (not c!122725)) b!1261936))

(assert (= (and b!1261936 c!122723) b!1261948))

(assert (= (and b!1261936 (not c!122723)) b!1261934))

(assert (= (or b!1261948 b!1261934) bm!62000))

(assert (= (or b!1261935 bm!62000) bm!62005))

(assert (= (or b!1261935 b!1261948) bm!62001))

(assert (= (or b!1261938 bm!62005) bm!62004))

(assert (= (or b!1261938 bm!62001) bm!62002))

(assert (= (and d!138363 res!840816) b!1261931))

(assert (= (and d!138363 c!122721) b!1261933))

(assert (= (and d!138363 (not c!122721)) b!1261942))

(assert (= (and d!138363 res!840819) b!1261932))

(assert (= (and b!1261932 res!840815) b!1261937))

(assert (= (and b!1261932 (not res!840821)) b!1261943))

(assert (= (and b!1261943 res!840820) b!1261945))

(assert (= (and b!1261932 res!840817) b!1261947))

(assert (= (and b!1261947 c!122724) b!1261951))

(assert (= (and b!1261947 (not c!122724)) b!1261940))

(assert (= (and b!1261951 res!840813) b!1261949))

(assert (= (or b!1261951 b!1261940) bm!62006))

(assert (= (and b!1261947 res!840814) b!1261946))

(assert (= (and b!1261946 c!122720) b!1261941))

(assert (= (and b!1261946 (not c!122720)) b!1261950))

(assert (= (and b!1261941 res!840818) b!1261939))

(assert (= (or b!1261941 b!1261950) bm!62003))

(declare-fun b_lambda!22819 () Bool)

(assert (=> (not b_lambda!22819) (not b!1261945)))

(assert (=> b!1261945 t!41803))

(declare-fun b_and!45379 () Bool)

(assert (= b_and!45377 (and (=> t!41803 result!23357) b_and!45379)))

(assert (=> b!1261945 m!1161971))

(assert (=> b!1261945 m!1161973))

(assert (=> b!1261945 m!1161975))

(assert (=> b!1261945 m!1161961))

(declare-fun m!1162037 () Bool)

(assert (=> b!1261945 m!1162037))

(assert (=> b!1261945 m!1161973))

(assert (=> b!1261945 m!1161971))

(assert (=> b!1261945 m!1161961))

(declare-fun m!1162039 () Bool)

(assert (=> bm!62002 m!1162039))

(assert (=> b!1261937 m!1161961))

(assert (=> b!1261937 m!1161961))

(assert (=> b!1261937 m!1161969))

(declare-fun m!1162041 () Bool)

(assert (=> bm!62003 m!1162041))

(declare-fun m!1162043 () Bool)

(assert (=> b!1261949 m!1162043))

(declare-fun m!1162045 () Bool)

(assert (=> b!1261933 m!1162045))

(declare-fun m!1162047 () Bool)

(assert (=> b!1261933 m!1162047))

(assert (=> b!1261933 m!1162045))

(declare-fun m!1162049 () Bool)

(assert (=> b!1261933 m!1162049))

(declare-fun m!1162051 () Bool)

(assert (=> b!1261933 m!1162051))

(declare-fun m!1162053 () Bool)

(assert (=> b!1261933 m!1162053))

(assert (=> b!1261933 m!1162053))

(declare-fun m!1162055 () Bool)

(assert (=> b!1261933 m!1162055))

(declare-fun m!1162057 () Bool)

(assert (=> b!1261933 m!1162057))

(declare-fun m!1162059 () Bool)

(assert (=> b!1261933 m!1162059))

(assert (=> b!1261933 m!1162049))

(declare-fun m!1162061 () Bool)

(assert (=> b!1261933 m!1162061))

(assert (=> b!1261933 m!1161961))

(declare-fun m!1162063 () Bool)

(assert (=> b!1261933 m!1162063))

(declare-fun m!1162065 () Bool)

(assert (=> b!1261933 m!1162065))

(assert (=> b!1261933 m!1162063))

(assert (=> b!1261933 m!1161893))

(declare-fun m!1162067 () Bool)

(assert (=> b!1261933 m!1162067))

(declare-fun m!1162069 () Bool)

(assert (=> b!1261933 m!1162069))

(declare-fun m!1162071 () Bool)

(assert (=> b!1261933 m!1162071))

(declare-fun m!1162073 () Bool)

(assert (=> b!1261933 m!1162073))

(declare-fun m!1162075 () Bool)

(assert (=> b!1261938 m!1162075))

(declare-fun m!1162077 () Bool)

(assert (=> b!1261939 m!1162077))

(assert (=> b!1261931 m!1161961))

(assert (=> b!1261931 m!1161961))

(assert (=> b!1261931 m!1161969))

(declare-fun m!1162079 () Bool)

(assert (=> bm!62006 m!1162079))

(assert (=> b!1261943 m!1161961))

(assert (=> b!1261943 m!1161961))

(declare-fun m!1162081 () Bool)

(assert (=> b!1261943 m!1162081))

(assert (=> d!138363 m!1161883))

(assert (=> bm!62004 m!1161893))

(assert (=> b!1261784 d!138363))

(declare-fun d!138365 () Bool)

(assert (=> d!138365 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105948 d!138365))

(declare-fun d!138367 () Bool)

(assert (=> d!138367 (= (array_inv!30361 _keys!1118) (bvsge (size!40225 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105948 d!138367))

(declare-fun d!138369 () Bool)

(assert (=> d!138369 (= (array_inv!30362 _values!914) (bvsge (size!40224 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105948 d!138369))

(declare-fun d!138371 () Bool)

(assert (=> d!138371 (= (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571828 () Unit!41910)

(declare-fun choose!1879 (array!82271 array!82269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48519 V!48519 V!48519 V!48519 (_ BitVec 32) Int) Unit!41910)

(assert (=> d!138371 (= lt!571828 (choose!1879 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138371 (validMask!0 mask!1466)))

(assert (=> d!138371 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1171 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571828)))

(declare-fun bs!35690 () Bool)

(assert (= bs!35690 d!138371))

(assert (=> bs!35690 m!1161893))

(assert (=> bs!35690 m!1161891))

(declare-fun m!1162083 () Bool)

(assert (=> bs!35690 m!1162083))

(assert (=> bs!35690 m!1161883))

(assert (=> b!1261782 d!138371))

(declare-fun b!1261976 () Bool)

(declare-fun e!718324 () ListLongMap!18973)

(assert (=> b!1261976 (= e!718324 (ListLongMap!18974 Nil!28299))))

(declare-fun call!62012 () ListLongMap!18973)

(declare-fun bm!62009 () Bool)

(assert (=> bm!62009 (= call!62012 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun d!138373 () Bool)

(declare-fun e!718321 () Bool)

(assert (=> d!138373 e!718321))

(declare-fun res!840831 () Bool)

(assert (=> d!138373 (=> (not res!840831) (not e!718321))))

(declare-fun lt!571844 () ListLongMap!18973)

(assert (=> d!138373 (= res!840831 (not (contains!7556 lt!571844 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138373 (= lt!571844 e!718324)))

(declare-fun c!122736 () Bool)

(assert (=> d!138373 (= c!122736 (bvsge #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(assert (=> d!138373 (validMask!0 mask!1466)))

(assert (=> d!138373 (= (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571844)))

(declare-fun b!1261977 () Bool)

(declare-fun e!718323 () Bool)

(assert (=> b!1261977 (= e!718323 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261977 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1261978 () Bool)

(declare-fun e!718320 () Bool)

(declare-fun e!718322 () Bool)

(assert (=> b!1261978 (= e!718320 e!718322)))

(declare-fun c!122735 () Bool)

(assert (=> b!1261978 (= c!122735 (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun b!1261979 () Bool)

(assert (=> b!1261979 (= e!718322 (= lt!571844 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1261980 () Bool)

(declare-fun e!718319 () ListLongMap!18973)

(assert (=> b!1261980 (= e!718324 e!718319)))

(declare-fun c!122734 () Bool)

(assert (=> b!1261980 (= c!122734 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261981 () Bool)

(assert (=> b!1261981 (= e!718321 e!718320)))

(declare-fun c!122737 () Bool)

(assert (=> b!1261981 (= c!122737 e!718323)))

(declare-fun res!840832 () Bool)

(assert (=> b!1261981 (=> (not res!840832) (not e!718323))))

(assert (=> b!1261981 (= res!840832 (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun b!1261982 () Bool)

(declare-fun isEmpty!1044 (ListLongMap!18973) Bool)

(assert (=> b!1261982 (= e!718322 (isEmpty!1044 lt!571844))))

(declare-fun b!1261983 () Bool)

(declare-fun res!840830 () Bool)

(assert (=> b!1261983 (=> (not res!840830) (not e!718321))))

(assert (=> b!1261983 (= res!840830 (not (contains!7556 lt!571844 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261984 () Bool)

(declare-fun lt!571849 () Unit!41910)

(declare-fun lt!571847 () Unit!41910)

(assert (=> b!1261984 (= lt!571849 lt!571847)))

(declare-fun lt!571848 () ListLongMap!18973)

(declare-fun lt!571846 () V!48519)

(declare-fun lt!571845 () (_ BitVec 64))

(declare-fun lt!571843 () (_ BitVec 64))

(assert (=> b!1261984 (not (contains!7556 (+!4278 lt!571848 (tuple2!21101 lt!571843 lt!571846)) lt!571845))))

(declare-fun addStillNotContains!325 (ListLongMap!18973 (_ BitVec 64) V!48519 (_ BitVec 64)) Unit!41910)

(assert (=> b!1261984 (= lt!571847 (addStillNotContains!325 lt!571848 lt!571843 lt!571846 lt!571845))))

(assert (=> b!1261984 (= lt!571845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1261984 (= lt!571846 (get!20270 (select (arr!39686 _values!914) #b00000000000000000000000000000000) (dynLambda!3419 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261984 (= lt!571843 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261984 (= lt!571848 call!62012)))

(assert (=> b!1261984 (= e!718319 (+!4278 call!62012 (tuple2!21101 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000) (get!20270 (select (arr!39686 _values!914) #b00000000000000000000000000000000) (dynLambda!3419 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1261985 () Bool)

(assert (=> b!1261985 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(assert (=> b!1261985 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40224 _values!914)))))

(declare-fun e!718325 () Bool)

(assert (=> b!1261985 (= e!718325 (= (apply!989 lt!571844 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)) (get!20270 (select (arr!39686 _values!914) #b00000000000000000000000000000000) (dynLambda!3419 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261986 () Bool)

(assert (=> b!1261986 (= e!718319 call!62012)))

(declare-fun b!1261987 () Bool)

(assert (=> b!1261987 (= e!718320 e!718325)))

(assert (=> b!1261987 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun res!840833 () Bool)

(assert (=> b!1261987 (= res!840833 (contains!7556 lt!571844 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261987 (=> (not res!840833) (not e!718325))))

(assert (= (and d!138373 c!122736) b!1261976))

(assert (= (and d!138373 (not c!122736)) b!1261980))

(assert (= (and b!1261980 c!122734) b!1261984))

(assert (= (and b!1261980 (not c!122734)) b!1261986))

(assert (= (or b!1261984 b!1261986) bm!62009))

(assert (= (and d!138373 res!840831) b!1261983))

(assert (= (and b!1261983 res!840830) b!1261981))

(assert (= (and b!1261981 res!840832) b!1261977))

(assert (= (and b!1261981 c!122737) b!1261987))

(assert (= (and b!1261981 (not c!122737)) b!1261978))

(assert (= (and b!1261987 res!840833) b!1261985))

(assert (= (and b!1261978 c!122735) b!1261979))

(assert (= (and b!1261978 (not c!122735)) b!1261982))

(declare-fun b_lambda!22821 () Bool)

(assert (=> (not b_lambda!22821) (not b!1261984)))

(assert (=> b!1261984 t!41803))

(declare-fun b_and!45381 () Bool)

(assert (= b_and!45379 (and (=> t!41803 result!23357) b_and!45381)))

(declare-fun b_lambda!22823 () Bool)

(assert (=> (not b_lambda!22823) (not b!1261985)))

(assert (=> b!1261985 t!41803))

(declare-fun b_and!45383 () Bool)

(assert (= b_and!45381 (and (=> t!41803 result!23357) b_and!45383)))

(declare-fun m!1162085 () Bool)

(assert (=> b!1261979 m!1162085))

(assert (=> b!1261980 m!1161961))

(assert (=> b!1261980 m!1161961))

(assert (=> b!1261980 m!1161969))

(assert (=> b!1261977 m!1161961))

(assert (=> b!1261977 m!1161961))

(assert (=> b!1261977 m!1161969))

(assert (=> b!1261984 m!1161971))

(assert (=> b!1261984 m!1161973))

(assert (=> b!1261984 m!1161975))

(declare-fun m!1162087 () Bool)

(assert (=> b!1261984 m!1162087))

(declare-fun m!1162089 () Bool)

(assert (=> b!1261984 m!1162089))

(assert (=> b!1261984 m!1161973))

(declare-fun m!1162091 () Bool)

(assert (=> b!1261984 m!1162091))

(assert (=> b!1261984 m!1162087))

(assert (=> b!1261984 m!1161961))

(declare-fun m!1162093 () Bool)

(assert (=> b!1261984 m!1162093))

(assert (=> b!1261984 m!1161971))

(declare-fun m!1162095 () Bool)

(assert (=> b!1261983 m!1162095))

(assert (=> bm!62009 m!1162085))

(assert (=> b!1261987 m!1161961))

(assert (=> b!1261987 m!1161961))

(declare-fun m!1162097 () Bool)

(assert (=> b!1261987 m!1162097))

(assert (=> b!1261985 m!1161971))

(assert (=> b!1261985 m!1161973))

(assert (=> b!1261985 m!1161975))

(assert (=> b!1261985 m!1161961))

(declare-fun m!1162099 () Bool)

(assert (=> b!1261985 m!1162099))

(assert (=> b!1261985 m!1161973))

(assert (=> b!1261985 m!1161971))

(assert (=> b!1261985 m!1161961))

(declare-fun m!1162101 () Bool)

(assert (=> d!138373 m!1162101))

(assert (=> d!138373 m!1161883))

(declare-fun m!1162103 () Bool)

(assert (=> b!1261982 m!1162103))

(assert (=> b!1261782 d!138373))

(declare-fun b!1261988 () Bool)

(declare-fun e!718331 () ListLongMap!18973)

(assert (=> b!1261988 (= e!718331 (ListLongMap!18974 Nil!28299))))

(declare-fun bm!62010 () Bool)

(declare-fun call!62013 () ListLongMap!18973)

(assert (=> bm!62010 (= call!62013 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun d!138375 () Bool)

(declare-fun e!718328 () Bool)

(assert (=> d!138375 e!718328))

(declare-fun res!840835 () Bool)

(assert (=> d!138375 (=> (not res!840835) (not e!718328))))

(declare-fun lt!571851 () ListLongMap!18973)

(assert (=> d!138375 (= res!840835 (not (contains!7556 lt!571851 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138375 (= lt!571851 e!718331)))

(declare-fun c!122740 () Bool)

(assert (=> d!138375 (= c!122740 (bvsge #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(assert (=> d!138375 (validMask!0 mask!1466)))

(assert (=> d!138375 (= (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571851)))

(declare-fun b!1261989 () Bool)

(declare-fun e!718330 () Bool)

(assert (=> b!1261989 (= e!718330 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261989 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1261990 () Bool)

(declare-fun e!718327 () Bool)

(declare-fun e!718329 () Bool)

(assert (=> b!1261990 (= e!718327 e!718329)))

(declare-fun c!122739 () Bool)

(assert (=> b!1261990 (= c!122739 (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun b!1261991 () Bool)

(assert (=> b!1261991 (= e!718329 (= lt!571851 (getCurrentListMapNoExtraKeys!5871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1261992 () Bool)

(declare-fun e!718326 () ListLongMap!18973)

(assert (=> b!1261992 (= e!718331 e!718326)))

(declare-fun c!122738 () Bool)

(assert (=> b!1261992 (= c!122738 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261993 () Bool)

(assert (=> b!1261993 (= e!718328 e!718327)))

(declare-fun c!122741 () Bool)

(assert (=> b!1261993 (= c!122741 e!718330)))

(declare-fun res!840836 () Bool)

(assert (=> b!1261993 (=> (not res!840836) (not e!718330))))

(assert (=> b!1261993 (= res!840836 (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun b!1261994 () Bool)

(assert (=> b!1261994 (= e!718329 (isEmpty!1044 lt!571851))))

(declare-fun b!1261995 () Bool)

(declare-fun res!840834 () Bool)

(assert (=> b!1261995 (=> (not res!840834) (not e!718328))))

(assert (=> b!1261995 (= res!840834 (not (contains!7556 lt!571851 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261996 () Bool)

(declare-fun lt!571856 () Unit!41910)

(declare-fun lt!571854 () Unit!41910)

(assert (=> b!1261996 (= lt!571856 lt!571854)))

(declare-fun lt!571850 () (_ BitVec 64))

(declare-fun lt!571852 () (_ BitVec 64))

(declare-fun lt!571853 () V!48519)

(declare-fun lt!571855 () ListLongMap!18973)

(assert (=> b!1261996 (not (contains!7556 (+!4278 lt!571855 (tuple2!21101 lt!571850 lt!571853)) lt!571852))))

(assert (=> b!1261996 (= lt!571854 (addStillNotContains!325 lt!571855 lt!571850 lt!571853 lt!571852))))

(assert (=> b!1261996 (= lt!571852 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1261996 (= lt!571853 (get!20270 (select (arr!39686 _values!914) #b00000000000000000000000000000000) (dynLambda!3419 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261996 (= lt!571850 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261996 (= lt!571855 call!62013)))

(assert (=> b!1261996 (= e!718326 (+!4278 call!62013 (tuple2!21101 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000) (get!20270 (select (arr!39686 _values!914) #b00000000000000000000000000000000) (dynLambda!3419 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1261997 () Bool)

(assert (=> b!1261997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(assert (=> b!1261997 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40224 _values!914)))))

(declare-fun e!718332 () Bool)

(assert (=> b!1261997 (= e!718332 (= (apply!989 lt!571851 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)) (get!20270 (select (arr!39686 _values!914) #b00000000000000000000000000000000) (dynLambda!3419 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261998 () Bool)

(assert (=> b!1261998 (= e!718326 call!62013)))

(declare-fun b!1261999 () Bool)

(assert (=> b!1261999 (= e!718327 e!718332)))

(assert (=> b!1261999 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(declare-fun res!840837 () Bool)

(assert (=> b!1261999 (= res!840837 (contains!7556 lt!571851 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261999 (=> (not res!840837) (not e!718332))))

(assert (= (and d!138375 c!122740) b!1261988))

(assert (= (and d!138375 (not c!122740)) b!1261992))

(assert (= (and b!1261992 c!122738) b!1261996))

(assert (= (and b!1261992 (not c!122738)) b!1261998))

(assert (= (or b!1261996 b!1261998) bm!62010))

(assert (= (and d!138375 res!840835) b!1261995))

(assert (= (and b!1261995 res!840834) b!1261993))

(assert (= (and b!1261993 res!840836) b!1261989))

(assert (= (and b!1261993 c!122741) b!1261999))

(assert (= (and b!1261993 (not c!122741)) b!1261990))

(assert (= (and b!1261999 res!840837) b!1261997))

(assert (= (and b!1261990 c!122739) b!1261991))

(assert (= (and b!1261990 (not c!122739)) b!1261994))

(declare-fun b_lambda!22825 () Bool)

(assert (=> (not b_lambda!22825) (not b!1261996)))

(assert (=> b!1261996 t!41803))

(declare-fun b_and!45385 () Bool)

(assert (= b_and!45383 (and (=> t!41803 result!23357) b_and!45385)))

(declare-fun b_lambda!22827 () Bool)

(assert (=> (not b_lambda!22827) (not b!1261997)))

(assert (=> b!1261997 t!41803))

(declare-fun b_and!45387 () Bool)

(assert (= b_and!45385 (and (=> t!41803 result!23357) b_and!45387)))

(declare-fun m!1162105 () Bool)

(assert (=> b!1261991 m!1162105))

(assert (=> b!1261992 m!1161961))

(assert (=> b!1261992 m!1161961))

(assert (=> b!1261992 m!1161969))

(assert (=> b!1261989 m!1161961))

(assert (=> b!1261989 m!1161961))

(assert (=> b!1261989 m!1161969))

(assert (=> b!1261996 m!1161971))

(assert (=> b!1261996 m!1161973))

(assert (=> b!1261996 m!1161975))

(declare-fun m!1162107 () Bool)

(assert (=> b!1261996 m!1162107))

(declare-fun m!1162109 () Bool)

(assert (=> b!1261996 m!1162109))

(assert (=> b!1261996 m!1161973))

(declare-fun m!1162111 () Bool)

(assert (=> b!1261996 m!1162111))

(assert (=> b!1261996 m!1162107))

(assert (=> b!1261996 m!1161961))

(declare-fun m!1162113 () Bool)

(assert (=> b!1261996 m!1162113))

(assert (=> b!1261996 m!1161971))

(declare-fun m!1162115 () Bool)

(assert (=> b!1261995 m!1162115))

(assert (=> bm!62010 m!1162105))

(assert (=> b!1261999 m!1161961))

(assert (=> b!1261999 m!1161961))

(declare-fun m!1162117 () Bool)

(assert (=> b!1261999 m!1162117))

(assert (=> b!1261997 m!1161971))

(assert (=> b!1261997 m!1161973))

(assert (=> b!1261997 m!1161975))

(assert (=> b!1261997 m!1161961))

(declare-fun m!1162119 () Bool)

(assert (=> b!1261997 m!1162119))

(assert (=> b!1261997 m!1161973))

(assert (=> b!1261997 m!1161971))

(assert (=> b!1261997 m!1161961))

(declare-fun m!1162121 () Bool)

(assert (=> d!138375 m!1162121))

(assert (=> d!138375 m!1161883))

(declare-fun m!1162123 () Bool)

(assert (=> b!1261994 m!1162123))

(assert (=> b!1261782 d!138375))

(declare-fun d!138377 () Bool)

(declare-fun res!840845 () Bool)

(declare-fun e!718341 () Bool)

(assert (=> d!138377 (=> res!840845 e!718341)))

(assert (=> d!138377 (= res!840845 (bvsge #b00000000000000000000000000000000 (size!40225 _keys!1118)))))

(assert (=> d!138377 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28300) e!718341)))

(declare-fun b!1262010 () Bool)

(declare-fun e!718344 () Bool)

(assert (=> b!1262010 (= e!718341 e!718344)))

(declare-fun res!840844 () Bool)

(assert (=> b!1262010 (=> (not res!840844) (not e!718344))))

(declare-fun e!718343 () Bool)

(assert (=> b!1262010 (= res!840844 (not e!718343))))

(declare-fun res!840846 () Bool)

(assert (=> b!1262010 (=> (not res!840846) (not e!718343))))

(assert (=> b!1262010 (= res!840846 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262011 () Bool)

(declare-fun e!718342 () Bool)

(assert (=> b!1262011 (= e!718344 e!718342)))

(declare-fun c!122744 () Bool)

(assert (=> b!1262011 (= c!122744 (validKeyInArray!0 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262012 () Bool)

(declare-fun call!62016 () Bool)

(assert (=> b!1262012 (= e!718342 call!62016)))

(declare-fun bm!62013 () Bool)

(assert (=> bm!62013 (= call!62016 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122744 (Cons!28299 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000) Nil!28300) Nil!28300)))))

(declare-fun b!1262013 () Bool)

(assert (=> b!1262013 (= e!718342 call!62016)))

(declare-fun b!1262014 () Bool)

(declare-fun contains!7558 (List!28303 (_ BitVec 64)) Bool)

(assert (=> b!1262014 (= e!718343 (contains!7558 Nil!28300 (select (arr!39687 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138377 (not res!840845)) b!1262010))

(assert (= (and b!1262010 res!840846) b!1262014))

(assert (= (and b!1262010 res!840844) b!1262011))

(assert (= (and b!1262011 c!122744) b!1262013))

(assert (= (and b!1262011 (not c!122744)) b!1262012))

(assert (= (or b!1262013 b!1262012) bm!62013))

(assert (=> b!1262010 m!1161961))

(assert (=> b!1262010 m!1161961))

(assert (=> b!1262010 m!1161969))

(assert (=> b!1262011 m!1161961))

(assert (=> b!1262011 m!1161961))

(assert (=> b!1262011 m!1161969))

(assert (=> bm!62013 m!1161961))

(declare-fun m!1162125 () Bool)

(assert (=> bm!62013 m!1162125))

(assert (=> b!1262014 m!1161961))

(assert (=> b!1262014 m!1161961))

(declare-fun m!1162127 () Bool)

(assert (=> b!1262014 m!1162127))

(assert (=> b!1261787 d!138377))

(declare-fun b!1262022 () Bool)

(declare-fun e!718349 () Bool)

(assert (=> b!1262022 (= e!718349 tp_is_empty!32365)))

(declare-fun b!1262021 () Bool)

(declare-fun e!718350 () Bool)

(assert (=> b!1262021 (= e!718350 tp_is_empty!32365)))

(declare-fun mapIsEmpty!50365 () Bool)

(declare-fun mapRes!50365 () Bool)

(assert (=> mapIsEmpty!50365 mapRes!50365))

(declare-fun mapNonEmpty!50365 () Bool)

(declare-fun tp!95942 () Bool)

(assert (=> mapNonEmpty!50365 (= mapRes!50365 (and tp!95942 e!718350))))

(declare-fun mapRest!50365 () (Array (_ BitVec 32) ValueCell!15419))

(declare-fun mapValue!50365 () ValueCell!15419)

(declare-fun mapKey!50365 () (_ BitVec 32))

(assert (=> mapNonEmpty!50365 (= mapRest!50356 (store mapRest!50365 mapKey!50365 mapValue!50365))))

(declare-fun condMapEmpty!50365 () Bool)

(declare-fun mapDefault!50365 () ValueCell!15419)

(assert (=> mapNonEmpty!50356 (= condMapEmpty!50365 (= mapRest!50356 ((as const (Array (_ BitVec 32) ValueCell!15419)) mapDefault!50365)))))

(assert (=> mapNonEmpty!50356 (= tp!95927 (and e!718349 mapRes!50365))))

(assert (= (and mapNonEmpty!50356 condMapEmpty!50365) mapIsEmpty!50365))

(assert (= (and mapNonEmpty!50356 (not condMapEmpty!50365)) mapNonEmpty!50365))

(assert (= (and mapNonEmpty!50365 ((_ is ValueCellFull!15419) mapValue!50365)) b!1262021))

(assert (= (and mapNonEmpty!50356 ((_ is ValueCellFull!15419) mapDefault!50365)) b!1262022))

(declare-fun m!1162129 () Bool)

(assert (=> mapNonEmpty!50365 m!1162129))

(declare-fun b_lambda!22829 () Bool)

(assert (= b_lambda!22819 (or (and start!105948 b_free!27463) b_lambda!22829)))

(declare-fun b_lambda!22831 () Bool)

(assert (= b_lambda!22821 (or (and start!105948 b_free!27463) b_lambda!22831)))

(declare-fun b_lambda!22833 () Bool)

(assert (= b_lambda!22823 (or (and start!105948 b_free!27463) b_lambda!22833)))

(declare-fun b_lambda!22835 () Bool)

(assert (= b_lambda!22827 (or (and start!105948 b_free!27463) b_lambda!22835)))

(declare-fun b_lambda!22837 () Bool)

(assert (= b_lambda!22825 (or (and start!105948 b_free!27463) b_lambda!22837)))

(declare-fun b_lambda!22839 () Bool)

(assert (= b_lambda!22817 (or (and start!105948 b_free!27463) b_lambda!22839)))

(check-sat (not d!138359) (not b!1261995) (not bm!62004) (not b!1261997) (not bm!62013) (not b!1261979) (not b!1262011) (not b!1262010) (not b_lambda!22839) (not d!138357) (not b!1261987) (not b!1261996) (not bm!62003) (not b!1261853) (not b!1261937) b_and!45387 (not bm!61995) (not d!138371) (not b!1261989) (not bm!62006) (not b!1261907) (not b_next!27463) (not b!1261984) (not b!1261911) (not bm!61997) (not b!1261939) (not b_lambda!22831) (not b!1261933) (not b!1261899) (not bm!61996) (not b!1261901) (not b!1261943) (not b!1261985) (not bm!61999) (not bm!62009) (not b!1261938) (not b!1261928) (not b!1261931) (not b!1261906) (not b_lambda!22835) (not mapNonEmpty!50365) (not b!1261999) (not b_lambda!22837) (not b!1261991) (not bm!62002) (not b!1261917) (not b_lambda!22829) (not d!138355) (not b!1261977) (not b!1261930) (not b!1262014) (not b!1261905) (not d!138361) (not b!1261980) (not d!138375) tp_is_empty!32365 (not b!1261945) (not b!1261992) (not b!1261982) (not bm!62010) (not b_lambda!22833) (not d!138363) (not b!1261949) (not d!138373) (not b!1261994) (not bm!61978) (not b!1261854) (not b!1261913) (not b!1261983))
(check-sat b_and!45387 (not b_next!27463))
