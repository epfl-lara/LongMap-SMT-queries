; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106040 () Bool)

(assert start!106040)

(declare-fun b_free!27379 () Bool)

(declare-fun b_next!27379 () Bool)

(assert (=> start!106040 (= b_free!27379 (not b_next!27379))))

(declare-fun tp!95665 () Bool)

(declare-fun b_and!45277 () Bool)

(assert (=> start!106040 (= tp!95665 b_and!45277)))

(declare-fun b!1261832 () Bool)

(declare-fun e!718154 () Bool)

(declare-fun tp_is_empty!32281 () Bool)

(assert (=> b!1261832 (= e!718154 tp_is_empty!32281)))

(declare-fun b!1261833 () Bool)

(declare-fun e!718156 () Bool)

(declare-fun e!718157 () Bool)

(assert (=> b!1261833 (= e!718156 e!718157)))

(declare-fun res!840590 () Bool)

(assert (=> b!1261833 (=> res!840590 e!718157)))

(declare-datatypes ((V!48407 0))(
  ( (V!48408 (val!16203 Int)) )
))
(declare-datatypes ((tuple2!20978 0))(
  ( (tuple2!20979 (_1!10500 (_ BitVec 64)) (_2!10500 V!48407)) )
))
(declare-datatypes ((List!28199 0))(
  ( (Nil!28196) (Cons!28195 (h!29413 tuple2!20978) (t!41688 List!28199)) )
))
(declare-datatypes ((ListLongMap!18859 0))(
  ( (ListLongMap!18860 (toList!9445 List!28199)) )
))
(declare-fun lt!571696 () ListLongMap!18859)

(declare-fun lt!571701 () ListLongMap!18859)

(declare-fun -!2111 (ListLongMap!18859 (_ BitVec 64)) ListLongMap!18859)

(assert (=> b!1261833 (= res!840590 (not (= (-!2111 lt!571696 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571701)))))

(declare-fun lt!571697 () ListLongMap!18859)

(declare-fun lt!571702 () ListLongMap!18859)

(assert (=> b!1261833 (= (-!2111 lt!571697 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571702)))

(declare-datatypes ((Unit!42026 0))(
  ( (Unit!42027) )
))
(declare-fun lt!571695 () Unit!42026)

(declare-fun minValueBefore!43 () V!48407)

(declare-fun addThenRemoveForNewKeyIsSame!365 (ListLongMap!18859 (_ BitVec 64) V!48407) Unit!42026)

(assert (=> b!1261833 (= lt!571695 (addThenRemoveForNewKeyIsSame!365 lt!571702 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!718152 () Bool)

(assert (=> b!1261833 e!718152))

(declare-fun res!840592 () Bool)

(assert (=> b!1261833 (=> (not res!840592) (not e!718152))))

(assert (=> b!1261833 (= res!840592 (= lt!571696 lt!571697))))

(declare-fun +!4283 (ListLongMap!18859 tuple2!20978) ListLongMap!18859)

(assert (=> b!1261833 (= lt!571697 (+!4283 lt!571702 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!571698 () ListLongMap!18859)

(declare-fun lt!571700 () tuple2!20978)

(assert (=> b!1261833 (= lt!571702 (+!4283 lt!571698 lt!571700))))

(declare-fun zeroValue!871 () V!48407)

(assert (=> b!1261833 (= lt!571700 (tuple2!20979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48407)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15377 0))(
  ( (ValueCellFull!15377 (v!18902 V!48407)) (EmptyCell!15377) )
))
(declare-datatypes ((array!82227 0))(
  ( (array!82228 (arr!39663 (Array (_ BitVec 32) ValueCell!15377)) (size!40200 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82227)

(declare-datatypes ((array!82229 0))(
  ( (array!82230 (arr!39664 (Array (_ BitVec 32) (_ BitVec 64))) (size!40201 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82229)

(declare-fun getCurrentListMap!4623 (array!82229 array!82227 (_ BitVec 32) (_ BitVec 32) V!48407 V!48407 (_ BitVec 32) Int) ListLongMap!18859)

(assert (=> b!1261833 (= lt!571701 (getCurrentListMap!4623 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261833 (= lt!571696 (getCurrentListMap!4623 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261834 () Bool)

(assert (=> b!1261834 (= e!718157 (bvsle #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun b!1261835 () Bool)

(declare-fun e!718151 () Bool)

(declare-fun e!718155 () Bool)

(declare-fun mapRes!50221 () Bool)

(assert (=> b!1261835 (= e!718151 (and e!718155 mapRes!50221))))

(declare-fun condMapEmpty!50221 () Bool)

(declare-fun mapDefault!50221 () ValueCell!15377)

(assert (=> b!1261835 (= condMapEmpty!50221 (= (arr!39663 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15377)) mapDefault!50221)))))

(declare-fun res!840593 () Bool)

(declare-fun e!718153 () Bool)

(assert (=> start!106040 (=> (not res!840593) (not e!718153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106040 (= res!840593 (validMask!0 mask!1466))))

(assert (=> start!106040 e!718153))

(assert (=> start!106040 true))

(assert (=> start!106040 tp!95665))

(assert (=> start!106040 tp_is_empty!32281))

(declare-fun array_inv!30339 (array!82229) Bool)

(assert (=> start!106040 (array_inv!30339 _keys!1118)))

(declare-fun array_inv!30340 (array!82227) Bool)

(assert (=> start!106040 (and (array_inv!30340 _values!914) e!718151)))

(declare-fun mapIsEmpty!50221 () Bool)

(assert (=> mapIsEmpty!50221 mapRes!50221))

(declare-fun b!1261836 () Bool)

(assert (=> b!1261836 (= e!718153 (not e!718156))))

(declare-fun res!840589 () Bool)

(assert (=> b!1261836 (=> res!840589 e!718156)))

(assert (=> b!1261836 (= res!840589 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!571699 () ListLongMap!18859)

(assert (=> b!1261836 (= lt!571698 lt!571699)))

(declare-fun lt!571703 () Unit!42026)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1166 (array!82229 array!82227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48407 V!48407 V!48407 V!48407 (_ BitVec 32) Int) Unit!42026)

(assert (=> b!1261836 (= lt!571703 (lemmaNoChangeToArrayThenSameMapNoExtras!1166 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5852 (array!82229 array!82227 (_ BitVec 32) (_ BitVec 32) V!48407 V!48407 (_ BitVec 32) Int) ListLongMap!18859)

(assert (=> b!1261836 (= lt!571699 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261836 (= lt!571698 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261837 () Bool)

(declare-fun res!840588 () Bool)

(assert (=> b!1261837 (=> (not res!840588) (not e!718153))))

(declare-datatypes ((List!28200 0))(
  ( (Nil!28197) (Cons!28196 (h!29414 (_ BitVec 64)) (t!41689 List!28200)) )
))
(declare-fun arrayNoDuplicates!0 (array!82229 (_ BitVec 32) List!28200) Bool)

(assert (=> b!1261837 (= res!840588 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28197))))

(declare-fun b!1261838 () Bool)

(assert (=> b!1261838 (= e!718155 tp_is_empty!32281)))

(declare-fun b!1261839 () Bool)

(declare-fun res!840591 () Bool)

(assert (=> b!1261839 (=> (not res!840591) (not e!718153))))

(assert (=> b!1261839 (= res!840591 (and (= (size!40200 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40201 _keys!1118) (size!40200 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261840 () Bool)

(assert (=> b!1261840 (= e!718152 (= lt!571701 (+!4283 lt!571699 lt!571700)))))

(declare-fun mapNonEmpty!50221 () Bool)

(declare-fun tp!95666 () Bool)

(assert (=> mapNonEmpty!50221 (= mapRes!50221 (and tp!95666 e!718154))))

(declare-fun mapRest!50221 () (Array (_ BitVec 32) ValueCell!15377))

(declare-fun mapValue!50221 () ValueCell!15377)

(declare-fun mapKey!50221 () (_ BitVec 32))

(assert (=> mapNonEmpty!50221 (= (arr!39663 _values!914) (store mapRest!50221 mapKey!50221 mapValue!50221))))

(declare-fun b!1261841 () Bool)

(declare-fun res!840594 () Bool)

(assert (=> b!1261841 (=> (not res!840594) (not e!718153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82229 (_ BitVec 32)) Bool)

(assert (=> b!1261841 (= res!840594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!106040 res!840593) b!1261839))

(assert (= (and b!1261839 res!840591) b!1261841))

(assert (= (and b!1261841 res!840594) b!1261837))

(assert (= (and b!1261837 res!840588) b!1261836))

(assert (= (and b!1261836 (not res!840589)) b!1261833))

(assert (= (and b!1261833 res!840592) b!1261840))

(assert (= (and b!1261833 (not res!840590)) b!1261834))

(assert (= (and b!1261835 condMapEmpty!50221) mapIsEmpty!50221))

(assert (= (and b!1261835 (not condMapEmpty!50221)) mapNonEmpty!50221))

(get-info :version)

(assert (= (and mapNonEmpty!50221 ((_ is ValueCellFull!15377) mapValue!50221)) b!1261832))

(assert (= (and b!1261835 ((_ is ValueCellFull!15377) mapDefault!50221)) b!1261838))

(assert (= start!106040 b!1261835))

(declare-fun m!1162865 () Bool)

(assert (=> mapNonEmpty!50221 m!1162865))

(declare-fun m!1162867 () Bool)

(assert (=> start!106040 m!1162867))

(declare-fun m!1162869 () Bool)

(assert (=> start!106040 m!1162869))

(declare-fun m!1162871 () Bool)

(assert (=> start!106040 m!1162871))

(declare-fun m!1162873 () Bool)

(assert (=> b!1261833 m!1162873))

(declare-fun m!1162875 () Bool)

(assert (=> b!1261833 m!1162875))

(declare-fun m!1162877 () Bool)

(assert (=> b!1261833 m!1162877))

(declare-fun m!1162879 () Bool)

(assert (=> b!1261833 m!1162879))

(declare-fun m!1162881 () Bool)

(assert (=> b!1261833 m!1162881))

(declare-fun m!1162883 () Bool)

(assert (=> b!1261833 m!1162883))

(declare-fun m!1162885 () Bool)

(assert (=> b!1261833 m!1162885))

(declare-fun m!1162887 () Bool)

(assert (=> b!1261837 m!1162887))

(declare-fun m!1162889 () Bool)

(assert (=> b!1261841 m!1162889))

(declare-fun m!1162891 () Bool)

(assert (=> b!1261840 m!1162891))

(declare-fun m!1162893 () Bool)

(assert (=> b!1261836 m!1162893))

(declare-fun m!1162895 () Bool)

(assert (=> b!1261836 m!1162895))

(declare-fun m!1162897 () Bool)

(assert (=> b!1261836 m!1162897))

(check-sat tp_is_empty!32281 (not start!106040) b_and!45277 (not b!1261833) (not b_next!27379) (not b!1261840) (not b!1261837) (not b!1261836) (not b!1261841) (not mapNonEmpty!50221))
(check-sat b_and!45277 (not b_next!27379))
(get-model)

(declare-fun d!138839 () Bool)

(declare-fun e!718208 () Bool)

(assert (=> d!138839 e!718208))

(declare-fun res!840641 () Bool)

(assert (=> d!138839 (=> (not res!840641) (not e!718208))))

(declare-fun lt!571769 () ListLongMap!18859)

(declare-fun contains!7604 (ListLongMap!18859 (_ BitVec 64)) Bool)

(assert (=> d!138839 (= res!840641 (contains!7604 lt!571769 (_1!10500 lt!571700)))))

(declare-fun lt!571767 () List!28199)

(assert (=> d!138839 (= lt!571769 (ListLongMap!18860 lt!571767))))

(declare-fun lt!571766 () Unit!42026)

(declare-fun lt!571768 () Unit!42026)

(assert (=> d!138839 (= lt!571766 lt!571768)))

(declare-datatypes ((Option!706 0))(
  ( (Some!705 (v!18905 V!48407)) (None!704) )
))
(declare-fun getValueByKey!655 (List!28199 (_ BitVec 64)) Option!706)

(assert (=> d!138839 (= (getValueByKey!655 lt!571767 (_1!10500 lt!571700)) (Some!705 (_2!10500 lt!571700)))))

(declare-fun lemmaContainsTupThenGetReturnValue!333 (List!28199 (_ BitVec 64) V!48407) Unit!42026)

(assert (=> d!138839 (= lt!571768 (lemmaContainsTupThenGetReturnValue!333 lt!571767 (_1!10500 lt!571700) (_2!10500 lt!571700)))))

(declare-fun insertStrictlySorted!447 (List!28199 (_ BitVec 64) V!48407) List!28199)

(assert (=> d!138839 (= lt!571767 (insertStrictlySorted!447 (toList!9445 lt!571699) (_1!10500 lt!571700) (_2!10500 lt!571700)))))

(assert (=> d!138839 (= (+!4283 lt!571699 lt!571700) lt!571769)))

(declare-fun b!1261906 () Bool)

(declare-fun res!840642 () Bool)

(assert (=> b!1261906 (=> (not res!840642) (not e!718208))))

(assert (=> b!1261906 (= res!840642 (= (getValueByKey!655 (toList!9445 lt!571769) (_1!10500 lt!571700)) (Some!705 (_2!10500 lt!571700))))))

(declare-fun b!1261907 () Bool)

(declare-fun contains!7605 (List!28199 tuple2!20978) Bool)

(assert (=> b!1261907 (= e!718208 (contains!7605 (toList!9445 lt!571769) lt!571700))))

(assert (= (and d!138839 res!840641) b!1261906))

(assert (= (and b!1261906 res!840642) b!1261907))

(declare-fun m!1162967 () Bool)

(assert (=> d!138839 m!1162967))

(declare-fun m!1162969 () Bool)

(assert (=> d!138839 m!1162969))

(declare-fun m!1162971 () Bool)

(assert (=> d!138839 m!1162971))

(declare-fun m!1162973 () Bool)

(assert (=> d!138839 m!1162973))

(declare-fun m!1162975 () Bool)

(assert (=> b!1261906 m!1162975))

(declare-fun m!1162977 () Bool)

(assert (=> b!1261907 m!1162977))

(assert (=> b!1261840 d!138839))

(declare-fun b!1261918 () Bool)

(declare-fun e!718219 () Bool)

(declare-fun e!718218 () Bool)

(assert (=> b!1261918 (= e!718219 e!718218)))

(declare-fun c!123005 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1261918 (= c!123005 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138841 () Bool)

(declare-fun res!840649 () Bool)

(declare-fun e!718220 () Bool)

(assert (=> d!138841 (=> res!840649 e!718220)))

(assert (=> d!138841 (= res!840649 (bvsge #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(assert (=> d!138841 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28197) e!718220)))

(declare-fun b!1261919 () Bool)

(declare-fun call!61986 () Bool)

(assert (=> b!1261919 (= e!718218 call!61986)))

(declare-fun b!1261920 () Bool)

(declare-fun e!718217 () Bool)

(declare-fun contains!7606 (List!28200 (_ BitVec 64)) Bool)

(assert (=> b!1261920 (= e!718217 (contains!7606 Nil!28197 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61983 () Bool)

(assert (=> bm!61983 (= call!61986 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123005 (Cons!28196 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000) Nil!28197) Nil!28197)))))

(declare-fun b!1261921 () Bool)

(assert (=> b!1261921 (= e!718220 e!718219)))

(declare-fun res!840650 () Bool)

(assert (=> b!1261921 (=> (not res!840650) (not e!718219))))

(assert (=> b!1261921 (= res!840650 (not e!718217))))

(declare-fun res!840651 () Bool)

(assert (=> b!1261921 (=> (not res!840651) (not e!718217))))

(assert (=> b!1261921 (= res!840651 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261922 () Bool)

(assert (=> b!1261922 (= e!718218 call!61986)))

(assert (= (and d!138841 (not res!840649)) b!1261921))

(assert (= (and b!1261921 res!840651) b!1261920))

(assert (= (and b!1261921 res!840650) b!1261918))

(assert (= (and b!1261918 c!123005) b!1261919))

(assert (= (and b!1261918 (not c!123005)) b!1261922))

(assert (= (or b!1261919 b!1261922) bm!61983))

(declare-fun m!1162979 () Bool)

(assert (=> b!1261918 m!1162979))

(assert (=> b!1261918 m!1162979))

(declare-fun m!1162981 () Bool)

(assert (=> b!1261918 m!1162981))

(assert (=> b!1261920 m!1162979))

(assert (=> b!1261920 m!1162979))

(declare-fun m!1162983 () Bool)

(assert (=> b!1261920 m!1162983))

(assert (=> bm!61983 m!1162979))

(declare-fun m!1162985 () Bool)

(assert (=> bm!61983 m!1162985))

(assert (=> b!1261921 m!1162979))

(assert (=> b!1261921 m!1162979))

(assert (=> b!1261921 m!1162981))

(assert (=> b!1261837 d!138841))

(declare-fun b!1261931 () Bool)

(declare-fun e!718227 () Bool)

(declare-fun e!718228 () Bool)

(assert (=> b!1261931 (= e!718227 e!718228)))

(declare-fun c!123008 () Bool)

(assert (=> b!1261931 (= c!123008 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138843 () Bool)

(declare-fun res!840657 () Bool)

(assert (=> d!138843 (=> res!840657 e!718227)))

(assert (=> d!138843 (= res!840657 (bvsge #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(assert (=> d!138843 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718227)))

(declare-fun b!1261932 () Bool)

(declare-fun e!718229 () Bool)

(declare-fun call!61989 () Bool)

(assert (=> b!1261932 (= e!718229 call!61989)))

(declare-fun b!1261933 () Bool)

(assert (=> b!1261933 (= e!718228 call!61989)))

(declare-fun b!1261934 () Bool)

(assert (=> b!1261934 (= e!718228 e!718229)))

(declare-fun lt!571778 () (_ BitVec 64))

(assert (=> b!1261934 (= lt!571778 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571777 () Unit!42026)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82229 (_ BitVec 64) (_ BitVec 32)) Unit!42026)

(assert (=> b!1261934 (= lt!571777 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!571778 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1261934 (arrayContainsKey!0 _keys!1118 lt!571778 #b00000000000000000000000000000000)))

(declare-fun lt!571776 () Unit!42026)

(assert (=> b!1261934 (= lt!571776 lt!571777)))

(declare-fun res!840656 () Bool)

(declare-datatypes ((SeekEntryResult!9927 0))(
  ( (MissingZero!9927 (index!42079 (_ BitVec 32))) (Found!9927 (index!42080 (_ BitVec 32))) (Intermediate!9927 (undefined!10739 Bool) (index!42081 (_ BitVec 32)) (x!111039 (_ BitVec 32))) (Undefined!9927) (MissingVacant!9927 (index!42082 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82229 (_ BitVec 32)) SeekEntryResult!9927)

(assert (=> b!1261934 (= res!840656 (= (seekEntryOrOpen!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9927 #b00000000000000000000000000000000)))))

(assert (=> b!1261934 (=> (not res!840656) (not e!718229))))

(declare-fun bm!61986 () Bool)

(assert (=> bm!61986 (= call!61989 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(assert (= (and d!138843 (not res!840657)) b!1261931))

(assert (= (and b!1261931 c!123008) b!1261934))

(assert (= (and b!1261931 (not c!123008)) b!1261933))

(assert (= (and b!1261934 res!840656) b!1261932))

(assert (= (or b!1261932 b!1261933) bm!61986))

(assert (=> b!1261931 m!1162979))

(assert (=> b!1261931 m!1162979))

(assert (=> b!1261931 m!1162981))

(assert (=> b!1261934 m!1162979))

(declare-fun m!1162987 () Bool)

(assert (=> b!1261934 m!1162987))

(declare-fun m!1162989 () Bool)

(assert (=> b!1261934 m!1162989))

(assert (=> b!1261934 m!1162979))

(declare-fun m!1162991 () Bool)

(assert (=> b!1261934 m!1162991))

(declare-fun m!1162993 () Bool)

(assert (=> bm!61986 m!1162993))

(assert (=> b!1261841 d!138843))

(declare-fun d!138845 () Bool)

(declare-fun lt!571781 () ListLongMap!18859)

(assert (=> d!138845 (not (contains!7604 lt!571781 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!142 (List!28199 (_ BitVec 64)) List!28199)

(assert (=> d!138845 (= lt!571781 (ListLongMap!18860 (removeStrictlySorted!142 (toList!9445 lt!571696) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138845 (= (-!2111 lt!571696 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571781)))

(declare-fun bs!35685 () Bool)

(assert (= bs!35685 d!138845))

(declare-fun m!1162995 () Bool)

(assert (=> bs!35685 m!1162995))

(declare-fun m!1162997 () Bool)

(assert (=> bs!35685 m!1162997))

(assert (=> b!1261833 d!138845))

(declare-fun d!138847 () Bool)

(assert (=> d!138847 (= (-!2111 (+!4283 lt!571702 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!571702)))

(declare-fun lt!571784 () Unit!42026)

(declare-fun choose!1870 (ListLongMap!18859 (_ BitVec 64) V!48407) Unit!42026)

(assert (=> d!138847 (= lt!571784 (choose!1870 lt!571702 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!138847 (not (contains!7604 lt!571702 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138847 (= (addThenRemoveForNewKeyIsSame!365 lt!571702 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!571784)))

(declare-fun bs!35686 () Bool)

(assert (= bs!35686 d!138847))

(assert (=> bs!35686 m!1162883))

(assert (=> bs!35686 m!1162883))

(declare-fun m!1162999 () Bool)

(assert (=> bs!35686 m!1162999))

(declare-fun m!1163001 () Bool)

(assert (=> bs!35686 m!1163001))

(declare-fun m!1163003 () Bool)

(assert (=> bs!35686 m!1163003))

(assert (=> b!1261833 d!138847))

(declare-fun b!1261977 () Bool)

(declare-fun e!718267 () Unit!42026)

(declare-fun lt!571830 () Unit!42026)

(assert (=> b!1261977 (= e!718267 lt!571830)))

(declare-fun lt!571836 () ListLongMap!18859)

(assert (=> b!1261977 (= lt!571836 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571844 () (_ BitVec 64))

(assert (=> b!1261977 (= lt!571844 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571837 () (_ BitVec 64))

(assert (=> b!1261977 (= lt!571837 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571835 () Unit!42026)

(declare-fun addStillContains!1092 (ListLongMap!18859 (_ BitVec 64) V!48407 (_ BitVec 64)) Unit!42026)

(assert (=> b!1261977 (= lt!571835 (addStillContains!1092 lt!571836 lt!571844 zeroValue!871 lt!571837))))

(assert (=> b!1261977 (contains!7604 (+!4283 lt!571836 (tuple2!20979 lt!571844 zeroValue!871)) lt!571837)))

(declare-fun lt!571834 () Unit!42026)

(assert (=> b!1261977 (= lt!571834 lt!571835)))

(declare-fun lt!571829 () ListLongMap!18859)

(assert (=> b!1261977 (= lt!571829 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571832 () (_ BitVec 64))

(assert (=> b!1261977 (= lt!571832 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571848 () (_ BitVec 64))

(assert (=> b!1261977 (= lt!571848 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571841 () Unit!42026)

(declare-fun addApplyDifferent!534 (ListLongMap!18859 (_ BitVec 64) V!48407 (_ BitVec 64)) Unit!42026)

(assert (=> b!1261977 (= lt!571841 (addApplyDifferent!534 lt!571829 lt!571832 minValueAfter!43 lt!571848))))

(declare-fun apply!1002 (ListLongMap!18859 (_ BitVec 64)) V!48407)

(assert (=> b!1261977 (= (apply!1002 (+!4283 lt!571829 (tuple2!20979 lt!571832 minValueAfter!43)) lt!571848) (apply!1002 lt!571829 lt!571848))))

(declare-fun lt!571839 () Unit!42026)

(assert (=> b!1261977 (= lt!571839 lt!571841)))

(declare-fun lt!571843 () ListLongMap!18859)

(assert (=> b!1261977 (= lt!571843 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571850 () (_ BitVec 64))

(assert (=> b!1261977 (= lt!571850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571838 () (_ BitVec 64))

(assert (=> b!1261977 (= lt!571838 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571849 () Unit!42026)

(assert (=> b!1261977 (= lt!571849 (addApplyDifferent!534 lt!571843 lt!571850 zeroValue!871 lt!571838))))

(assert (=> b!1261977 (= (apply!1002 (+!4283 lt!571843 (tuple2!20979 lt!571850 zeroValue!871)) lt!571838) (apply!1002 lt!571843 lt!571838))))

(declare-fun lt!571845 () Unit!42026)

(assert (=> b!1261977 (= lt!571845 lt!571849)))

(declare-fun lt!571846 () ListLongMap!18859)

(assert (=> b!1261977 (= lt!571846 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571831 () (_ BitVec 64))

(assert (=> b!1261977 (= lt!571831 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571842 () (_ BitVec 64))

(assert (=> b!1261977 (= lt!571842 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261977 (= lt!571830 (addApplyDifferent!534 lt!571846 lt!571831 minValueAfter!43 lt!571842))))

(assert (=> b!1261977 (= (apply!1002 (+!4283 lt!571846 (tuple2!20979 lt!571831 minValueAfter!43)) lt!571842) (apply!1002 lt!571846 lt!571842))))

(declare-fun d!138849 () Bool)

(declare-fun e!718268 () Bool)

(assert (=> d!138849 e!718268))

(declare-fun res!840684 () Bool)

(assert (=> d!138849 (=> (not res!840684) (not e!718268))))

(assert (=> d!138849 (= res!840684 (or (bvsge #b00000000000000000000000000000000 (size!40201 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))))

(declare-fun lt!571847 () ListLongMap!18859)

(declare-fun lt!571833 () ListLongMap!18859)

(assert (=> d!138849 (= lt!571847 lt!571833)))

(declare-fun lt!571840 () Unit!42026)

(assert (=> d!138849 (= lt!571840 e!718267)))

(declare-fun c!123024 () Bool)

(declare-fun e!718262 () Bool)

(assert (=> d!138849 (= c!123024 e!718262)))

(declare-fun res!840678 () Bool)

(assert (=> d!138849 (=> (not res!840678) (not e!718262))))

(assert (=> d!138849 (= res!840678 (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun e!718264 () ListLongMap!18859)

(assert (=> d!138849 (= lt!571833 e!718264)))

(declare-fun c!123023 () Bool)

(assert (=> d!138849 (= c!123023 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138849 (validMask!0 mask!1466)))

(assert (=> d!138849 (= (getCurrentListMap!4623 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571847)))

(declare-fun b!1261978 () Bool)

(declare-fun call!62008 () ListLongMap!18859)

(assert (=> b!1261978 (= e!718264 (+!4283 call!62008 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1261979 () Bool)

(declare-fun e!718265 () Bool)

(assert (=> b!1261979 (= e!718265 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261980 () Bool)

(declare-fun e!718257 () Bool)

(declare-fun call!62006 () Bool)

(assert (=> b!1261980 (= e!718257 (not call!62006))))

(declare-fun b!1261981 () Bool)

(declare-fun e!718261 () Bool)

(declare-fun call!62007 () Bool)

(assert (=> b!1261981 (= e!718261 (not call!62007))))

(declare-fun call!62009 () ListLongMap!18859)

(declare-fun call!62004 () ListLongMap!18859)

(declare-fun call!62010 () ListLongMap!18859)

(declare-fun c!123021 () Bool)

(declare-fun bm!62001 () Bool)

(assert (=> bm!62001 (= call!62008 (+!4283 (ite c!123023 call!62010 (ite c!123021 call!62009 call!62004)) (ite (or c!123023 c!123021) (tuple2!20979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1261982 () Bool)

(declare-fun e!718263 () ListLongMap!18859)

(declare-fun call!62005 () ListLongMap!18859)

(assert (=> b!1261982 (= e!718263 call!62005)))

(declare-fun bm!62002 () Bool)

(assert (=> bm!62002 (= call!62005 call!62008)))

(declare-fun bm!62003 () Bool)

(assert (=> bm!62003 (= call!62006 (contains!7604 lt!571847 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261983 () Bool)

(assert (=> b!1261983 (= e!718263 call!62004)))

(declare-fun bm!62004 () Bool)

(assert (=> bm!62004 (= call!62007 (contains!7604 lt!571847 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261984 () Bool)

(declare-fun e!718258 () Bool)

(declare-fun get!20289 (ValueCell!15377 V!48407) V!48407)

(declare-fun dynLambda!3454 (Int (_ BitVec 64)) V!48407)

(assert (=> b!1261984 (= e!718258 (= (apply!1002 lt!571847 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)) (get!20289 (select (arr!39663 _values!914) #b00000000000000000000000000000000) (dynLambda!3454 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1261984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40200 _values!914)))))

(assert (=> b!1261984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun b!1261985 () Bool)

(declare-fun e!718266 () Bool)

(assert (=> b!1261985 (= e!718261 e!718266)))

(declare-fun res!840680 () Bool)

(assert (=> b!1261985 (= res!840680 call!62007)))

(assert (=> b!1261985 (=> (not res!840680) (not e!718266))))

(declare-fun b!1261986 () Bool)

(assert (=> b!1261986 (= e!718262 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261987 () Bool)

(declare-fun e!718260 () ListLongMap!18859)

(assert (=> b!1261987 (= e!718260 call!62005)))

(declare-fun bm!62005 () Bool)

(assert (=> bm!62005 (= call!62009 call!62010)))

(declare-fun b!1261988 () Bool)

(declare-fun Unit!42032 () Unit!42026)

(assert (=> b!1261988 (= e!718267 Unit!42032)))

(declare-fun b!1261989 () Bool)

(declare-fun e!718259 () Bool)

(assert (=> b!1261989 (= e!718257 e!718259)))

(declare-fun res!840677 () Bool)

(assert (=> b!1261989 (= res!840677 call!62006)))

(assert (=> b!1261989 (=> (not res!840677) (not e!718259))))

(declare-fun b!1261990 () Bool)

(assert (=> b!1261990 (= e!718268 e!718257)))

(declare-fun c!123026 () Bool)

(assert (=> b!1261990 (= c!123026 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261991 () Bool)

(declare-fun c!123022 () Bool)

(assert (=> b!1261991 (= c!123022 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1261991 (= e!718260 e!718263)))

(declare-fun bm!62006 () Bool)

(assert (=> bm!62006 (= call!62010 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261992 () Bool)

(declare-fun res!840682 () Bool)

(assert (=> b!1261992 (=> (not res!840682) (not e!718268))))

(declare-fun e!718256 () Bool)

(assert (=> b!1261992 (= res!840682 e!718256)))

(declare-fun res!840681 () Bool)

(assert (=> b!1261992 (=> res!840681 e!718256)))

(assert (=> b!1261992 (= res!840681 (not e!718265))))

(declare-fun res!840683 () Bool)

(assert (=> b!1261992 (=> (not res!840683) (not e!718265))))

(assert (=> b!1261992 (= res!840683 (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun b!1261993 () Bool)

(assert (=> b!1261993 (= e!718264 e!718260)))

(assert (=> b!1261993 (= c!123021 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261994 () Bool)

(assert (=> b!1261994 (= e!718266 (= (apply!1002 lt!571847 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1261995 () Bool)

(assert (=> b!1261995 (= e!718256 e!718258)))

(declare-fun res!840679 () Bool)

(assert (=> b!1261995 (=> (not res!840679) (not e!718258))))

(assert (=> b!1261995 (= res!840679 (contains!7604 lt!571847 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261995 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun b!1261996 () Bool)

(declare-fun res!840676 () Bool)

(assert (=> b!1261996 (=> (not res!840676) (not e!718268))))

(assert (=> b!1261996 (= res!840676 e!718261)))

(declare-fun c!123025 () Bool)

(assert (=> b!1261996 (= c!123025 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1261997 () Bool)

(assert (=> b!1261997 (= e!718259 (= (apply!1002 lt!571847 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun bm!62007 () Bool)

(assert (=> bm!62007 (= call!62004 call!62009)))

(assert (= (and d!138849 c!123023) b!1261978))

(assert (= (and d!138849 (not c!123023)) b!1261993))

(assert (= (and b!1261993 c!123021) b!1261987))

(assert (= (and b!1261993 (not c!123021)) b!1261991))

(assert (= (and b!1261991 c!123022) b!1261982))

(assert (= (and b!1261991 (not c!123022)) b!1261983))

(assert (= (or b!1261982 b!1261983) bm!62007))

(assert (= (or b!1261987 bm!62007) bm!62005))

(assert (= (or b!1261987 b!1261982) bm!62002))

(assert (= (or b!1261978 bm!62005) bm!62006))

(assert (= (or b!1261978 bm!62002) bm!62001))

(assert (= (and d!138849 res!840678) b!1261986))

(assert (= (and d!138849 c!123024) b!1261977))

(assert (= (and d!138849 (not c!123024)) b!1261988))

(assert (= (and d!138849 res!840684) b!1261992))

(assert (= (and b!1261992 res!840683) b!1261979))

(assert (= (and b!1261992 (not res!840681)) b!1261995))

(assert (= (and b!1261995 res!840679) b!1261984))

(assert (= (and b!1261992 res!840682) b!1261996))

(assert (= (and b!1261996 c!123025) b!1261985))

(assert (= (and b!1261996 (not c!123025)) b!1261981))

(assert (= (and b!1261985 res!840680) b!1261994))

(assert (= (or b!1261985 b!1261981) bm!62004))

(assert (= (and b!1261996 res!840676) b!1261990))

(assert (= (and b!1261990 c!123026) b!1261989))

(assert (= (and b!1261990 (not c!123026)) b!1261980))

(assert (= (and b!1261989 res!840677) b!1261997))

(assert (= (or b!1261989 b!1261980) bm!62003))

(declare-fun b_lambda!22761 () Bool)

(assert (=> (not b_lambda!22761) (not b!1261984)))

(declare-fun t!41695 () Bool)

(declare-fun tb!11305 () Bool)

(assert (=> (and start!106040 (= defaultEntry!922 defaultEntry!922) t!41695) tb!11305))

(declare-fun result!23339 () Bool)

(assert (=> tb!11305 (= result!23339 tp_is_empty!32281)))

(assert (=> b!1261984 t!41695))

(declare-fun b_and!45283 () Bool)

(assert (= b_and!45277 (and (=> t!41695 result!23339) b_and!45283)))

(assert (=> b!1261986 m!1162979))

(assert (=> b!1261986 m!1162979))

(assert (=> b!1261986 m!1162981))

(declare-fun m!1163005 () Bool)

(assert (=> bm!62001 m!1163005))

(assert (=> bm!62006 m!1162895))

(declare-fun m!1163007 () Bool)

(assert (=> b!1261994 m!1163007))

(declare-fun m!1163009 () Bool)

(assert (=> b!1261977 m!1163009))

(declare-fun m!1163011 () Bool)

(assert (=> b!1261977 m!1163011))

(declare-fun m!1163013 () Bool)

(assert (=> b!1261977 m!1163013))

(declare-fun m!1163015 () Bool)

(assert (=> b!1261977 m!1163015))

(declare-fun m!1163017 () Bool)

(assert (=> b!1261977 m!1163017))

(assert (=> b!1261977 m!1163011))

(declare-fun m!1163019 () Bool)

(assert (=> b!1261977 m!1163019))

(declare-fun m!1163021 () Bool)

(assert (=> b!1261977 m!1163021))

(assert (=> b!1261977 m!1162895))

(assert (=> b!1261977 m!1163013))

(declare-fun m!1163023 () Bool)

(assert (=> b!1261977 m!1163023))

(assert (=> b!1261977 m!1162979))

(declare-fun m!1163025 () Bool)

(assert (=> b!1261977 m!1163025))

(declare-fun m!1163027 () Bool)

(assert (=> b!1261977 m!1163027))

(declare-fun m!1163029 () Bool)

(assert (=> b!1261977 m!1163029))

(declare-fun m!1163031 () Bool)

(assert (=> b!1261977 m!1163031))

(declare-fun m!1163033 () Bool)

(assert (=> b!1261977 m!1163033))

(declare-fun m!1163035 () Bool)

(assert (=> b!1261977 m!1163035))

(assert (=> b!1261977 m!1163015))

(declare-fun m!1163037 () Bool)

(assert (=> b!1261977 m!1163037))

(assert (=> b!1261977 m!1163029))

(assert (=> b!1261995 m!1162979))

(assert (=> b!1261995 m!1162979))

(declare-fun m!1163039 () Bool)

(assert (=> b!1261995 m!1163039))

(declare-fun m!1163041 () Bool)

(assert (=> b!1261997 m!1163041))

(declare-fun m!1163043 () Bool)

(assert (=> b!1261978 m!1163043))

(assert (=> b!1261984 m!1162979))

(declare-fun m!1163045 () Bool)

(assert (=> b!1261984 m!1163045))

(assert (=> b!1261984 m!1162979))

(declare-fun m!1163047 () Bool)

(assert (=> b!1261984 m!1163047))

(declare-fun m!1163049 () Bool)

(assert (=> b!1261984 m!1163049))

(assert (=> b!1261984 m!1163047))

(declare-fun m!1163051 () Bool)

(assert (=> b!1261984 m!1163051))

(assert (=> b!1261984 m!1163049))

(declare-fun m!1163053 () Bool)

(assert (=> bm!62003 m!1163053))

(assert (=> d!138849 m!1162867))

(declare-fun m!1163055 () Bool)

(assert (=> bm!62004 m!1163055))

(assert (=> b!1261979 m!1162979))

(assert (=> b!1261979 m!1162979))

(assert (=> b!1261979 m!1162981))

(assert (=> b!1261833 d!138849))

(declare-fun d!138851 () Bool)

(declare-fun e!718269 () Bool)

(assert (=> d!138851 e!718269))

(declare-fun res!840685 () Bool)

(assert (=> d!138851 (=> (not res!840685) (not e!718269))))

(declare-fun lt!571854 () ListLongMap!18859)

(assert (=> d!138851 (= res!840685 (contains!7604 lt!571854 (_1!10500 lt!571700)))))

(declare-fun lt!571852 () List!28199)

(assert (=> d!138851 (= lt!571854 (ListLongMap!18860 lt!571852))))

(declare-fun lt!571851 () Unit!42026)

(declare-fun lt!571853 () Unit!42026)

(assert (=> d!138851 (= lt!571851 lt!571853)))

(assert (=> d!138851 (= (getValueByKey!655 lt!571852 (_1!10500 lt!571700)) (Some!705 (_2!10500 lt!571700)))))

(assert (=> d!138851 (= lt!571853 (lemmaContainsTupThenGetReturnValue!333 lt!571852 (_1!10500 lt!571700) (_2!10500 lt!571700)))))

(assert (=> d!138851 (= lt!571852 (insertStrictlySorted!447 (toList!9445 lt!571698) (_1!10500 lt!571700) (_2!10500 lt!571700)))))

(assert (=> d!138851 (= (+!4283 lt!571698 lt!571700) lt!571854)))

(declare-fun b!1262000 () Bool)

(declare-fun res!840686 () Bool)

(assert (=> b!1262000 (=> (not res!840686) (not e!718269))))

(assert (=> b!1262000 (= res!840686 (= (getValueByKey!655 (toList!9445 lt!571854) (_1!10500 lt!571700)) (Some!705 (_2!10500 lt!571700))))))

(declare-fun b!1262001 () Bool)

(assert (=> b!1262001 (= e!718269 (contains!7605 (toList!9445 lt!571854) lt!571700))))

(assert (= (and d!138851 res!840685) b!1262000))

(assert (= (and b!1262000 res!840686) b!1262001))

(declare-fun m!1163057 () Bool)

(assert (=> d!138851 m!1163057))

(declare-fun m!1163059 () Bool)

(assert (=> d!138851 m!1163059))

(declare-fun m!1163061 () Bool)

(assert (=> d!138851 m!1163061))

(declare-fun m!1163063 () Bool)

(assert (=> d!138851 m!1163063))

(declare-fun m!1163065 () Bool)

(assert (=> b!1262000 m!1163065))

(declare-fun m!1163067 () Bool)

(assert (=> b!1262001 m!1163067))

(assert (=> b!1261833 d!138851))

(declare-fun b!1262002 () Bool)

(declare-fun e!718281 () Unit!42026)

(declare-fun lt!571856 () Unit!42026)

(assert (=> b!1262002 (= e!718281 lt!571856)))

(declare-fun lt!571862 () ListLongMap!18859)

(assert (=> b!1262002 (= lt!571862 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571870 () (_ BitVec 64))

(assert (=> b!1262002 (= lt!571870 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571863 () (_ BitVec 64))

(assert (=> b!1262002 (= lt!571863 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571861 () Unit!42026)

(assert (=> b!1262002 (= lt!571861 (addStillContains!1092 lt!571862 lt!571870 zeroValue!871 lt!571863))))

(assert (=> b!1262002 (contains!7604 (+!4283 lt!571862 (tuple2!20979 lt!571870 zeroValue!871)) lt!571863)))

(declare-fun lt!571860 () Unit!42026)

(assert (=> b!1262002 (= lt!571860 lt!571861)))

(declare-fun lt!571855 () ListLongMap!18859)

(assert (=> b!1262002 (= lt!571855 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571858 () (_ BitVec 64))

(assert (=> b!1262002 (= lt!571858 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571874 () (_ BitVec 64))

(assert (=> b!1262002 (= lt!571874 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571867 () Unit!42026)

(assert (=> b!1262002 (= lt!571867 (addApplyDifferent!534 lt!571855 lt!571858 minValueBefore!43 lt!571874))))

(assert (=> b!1262002 (= (apply!1002 (+!4283 lt!571855 (tuple2!20979 lt!571858 minValueBefore!43)) lt!571874) (apply!1002 lt!571855 lt!571874))))

(declare-fun lt!571865 () Unit!42026)

(assert (=> b!1262002 (= lt!571865 lt!571867)))

(declare-fun lt!571869 () ListLongMap!18859)

(assert (=> b!1262002 (= lt!571869 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571876 () (_ BitVec 64))

(assert (=> b!1262002 (= lt!571876 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571864 () (_ BitVec 64))

(assert (=> b!1262002 (= lt!571864 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571875 () Unit!42026)

(assert (=> b!1262002 (= lt!571875 (addApplyDifferent!534 lt!571869 lt!571876 zeroValue!871 lt!571864))))

(assert (=> b!1262002 (= (apply!1002 (+!4283 lt!571869 (tuple2!20979 lt!571876 zeroValue!871)) lt!571864) (apply!1002 lt!571869 lt!571864))))

(declare-fun lt!571871 () Unit!42026)

(assert (=> b!1262002 (= lt!571871 lt!571875)))

(declare-fun lt!571872 () ListLongMap!18859)

(assert (=> b!1262002 (= lt!571872 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571857 () (_ BitVec 64))

(assert (=> b!1262002 (= lt!571857 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571868 () (_ BitVec 64))

(assert (=> b!1262002 (= lt!571868 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262002 (= lt!571856 (addApplyDifferent!534 lt!571872 lt!571857 minValueBefore!43 lt!571868))))

(assert (=> b!1262002 (= (apply!1002 (+!4283 lt!571872 (tuple2!20979 lt!571857 minValueBefore!43)) lt!571868) (apply!1002 lt!571872 lt!571868))))

(declare-fun d!138853 () Bool)

(declare-fun e!718282 () Bool)

(assert (=> d!138853 e!718282))

(declare-fun res!840695 () Bool)

(assert (=> d!138853 (=> (not res!840695) (not e!718282))))

(assert (=> d!138853 (= res!840695 (or (bvsge #b00000000000000000000000000000000 (size!40201 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))))

(declare-fun lt!571873 () ListLongMap!18859)

(declare-fun lt!571859 () ListLongMap!18859)

(assert (=> d!138853 (= lt!571873 lt!571859)))

(declare-fun lt!571866 () Unit!42026)

(assert (=> d!138853 (= lt!571866 e!718281)))

(declare-fun c!123030 () Bool)

(declare-fun e!718276 () Bool)

(assert (=> d!138853 (= c!123030 e!718276)))

(declare-fun res!840689 () Bool)

(assert (=> d!138853 (=> (not res!840689) (not e!718276))))

(assert (=> d!138853 (= res!840689 (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun e!718278 () ListLongMap!18859)

(assert (=> d!138853 (= lt!571859 e!718278)))

(declare-fun c!123029 () Bool)

(assert (=> d!138853 (= c!123029 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138853 (validMask!0 mask!1466)))

(assert (=> d!138853 (= (getCurrentListMap!4623 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571873)))

(declare-fun b!1262003 () Bool)

(declare-fun call!62015 () ListLongMap!18859)

(assert (=> b!1262003 (= e!718278 (+!4283 call!62015 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1262004 () Bool)

(declare-fun e!718279 () Bool)

(assert (=> b!1262004 (= e!718279 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262005 () Bool)

(declare-fun e!718271 () Bool)

(declare-fun call!62013 () Bool)

(assert (=> b!1262005 (= e!718271 (not call!62013))))

(declare-fun b!1262006 () Bool)

(declare-fun e!718275 () Bool)

(declare-fun call!62014 () Bool)

(assert (=> b!1262006 (= e!718275 (not call!62014))))

(declare-fun c!123027 () Bool)

(declare-fun call!62011 () ListLongMap!18859)

(declare-fun call!62016 () ListLongMap!18859)

(declare-fun bm!62008 () Bool)

(declare-fun call!62017 () ListLongMap!18859)

(assert (=> bm!62008 (= call!62015 (+!4283 (ite c!123029 call!62017 (ite c!123027 call!62016 call!62011)) (ite (or c!123029 c!123027) (tuple2!20979 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1262007 () Bool)

(declare-fun e!718277 () ListLongMap!18859)

(declare-fun call!62012 () ListLongMap!18859)

(assert (=> b!1262007 (= e!718277 call!62012)))

(declare-fun bm!62009 () Bool)

(assert (=> bm!62009 (= call!62012 call!62015)))

(declare-fun bm!62010 () Bool)

(assert (=> bm!62010 (= call!62013 (contains!7604 lt!571873 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262008 () Bool)

(assert (=> b!1262008 (= e!718277 call!62011)))

(declare-fun bm!62011 () Bool)

(assert (=> bm!62011 (= call!62014 (contains!7604 lt!571873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!718272 () Bool)

(declare-fun b!1262009 () Bool)

(assert (=> b!1262009 (= e!718272 (= (apply!1002 lt!571873 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)) (get!20289 (select (arr!39663 _values!914) #b00000000000000000000000000000000) (dynLambda!3454 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262009 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40200 _values!914)))))

(assert (=> b!1262009 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun b!1262010 () Bool)

(declare-fun e!718280 () Bool)

(assert (=> b!1262010 (= e!718275 e!718280)))

(declare-fun res!840691 () Bool)

(assert (=> b!1262010 (= res!840691 call!62014)))

(assert (=> b!1262010 (=> (not res!840691) (not e!718280))))

(declare-fun b!1262011 () Bool)

(assert (=> b!1262011 (= e!718276 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262012 () Bool)

(declare-fun e!718274 () ListLongMap!18859)

(assert (=> b!1262012 (= e!718274 call!62012)))

(declare-fun bm!62012 () Bool)

(assert (=> bm!62012 (= call!62016 call!62017)))

(declare-fun b!1262013 () Bool)

(declare-fun Unit!42033 () Unit!42026)

(assert (=> b!1262013 (= e!718281 Unit!42033)))

(declare-fun b!1262014 () Bool)

(declare-fun e!718273 () Bool)

(assert (=> b!1262014 (= e!718271 e!718273)))

(declare-fun res!840688 () Bool)

(assert (=> b!1262014 (= res!840688 call!62013)))

(assert (=> b!1262014 (=> (not res!840688) (not e!718273))))

(declare-fun b!1262015 () Bool)

(assert (=> b!1262015 (= e!718282 e!718271)))

(declare-fun c!123032 () Bool)

(assert (=> b!1262015 (= c!123032 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262016 () Bool)

(declare-fun c!123028 () Bool)

(assert (=> b!1262016 (= c!123028 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1262016 (= e!718274 e!718277)))

(declare-fun bm!62013 () Bool)

(assert (=> bm!62013 (= call!62017 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262017 () Bool)

(declare-fun res!840693 () Bool)

(assert (=> b!1262017 (=> (not res!840693) (not e!718282))))

(declare-fun e!718270 () Bool)

(assert (=> b!1262017 (= res!840693 e!718270)))

(declare-fun res!840692 () Bool)

(assert (=> b!1262017 (=> res!840692 e!718270)))

(assert (=> b!1262017 (= res!840692 (not e!718279))))

(declare-fun res!840694 () Bool)

(assert (=> b!1262017 (=> (not res!840694) (not e!718279))))

(assert (=> b!1262017 (= res!840694 (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun b!1262018 () Bool)

(assert (=> b!1262018 (= e!718278 e!718274)))

(assert (=> b!1262018 (= c!123027 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262019 () Bool)

(assert (=> b!1262019 (= e!718280 (= (apply!1002 lt!571873 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1262020 () Bool)

(assert (=> b!1262020 (= e!718270 e!718272)))

(declare-fun res!840690 () Bool)

(assert (=> b!1262020 (=> (not res!840690) (not e!718272))))

(assert (=> b!1262020 (= res!840690 (contains!7604 lt!571873 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262020 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun b!1262021 () Bool)

(declare-fun res!840687 () Bool)

(assert (=> b!1262021 (=> (not res!840687) (not e!718282))))

(assert (=> b!1262021 (= res!840687 e!718275)))

(declare-fun c!123031 () Bool)

(assert (=> b!1262021 (= c!123031 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1262022 () Bool)

(assert (=> b!1262022 (= e!718273 (= (apply!1002 lt!571873 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!62014 () Bool)

(assert (=> bm!62014 (= call!62011 call!62016)))

(assert (= (and d!138853 c!123029) b!1262003))

(assert (= (and d!138853 (not c!123029)) b!1262018))

(assert (= (and b!1262018 c!123027) b!1262012))

(assert (= (and b!1262018 (not c!123027)) b!1262016))

(assert (= (and b!1262016 c!123028) b!1262007))

(assert (= (and b!1262016 (not c!123028)) b!1262008))

(assert (= (or b!1262007 b!1262008) bm!62014))

(assert (= (or b!1262012 bm!62014) bm!62012))

(assert (= (or b!1262012 b!1262007) bm!62009))

(assert (= (or b!1262003 bm!62012) bm!62013))

(assert (= (or b!1262003 bm!62009) bm!62008))

(assert (= (and d!138853 res!840689) b!1262011))

(assert (= (and d!138853 c!123030) b!1262002))

(assert (= (and d!138853 (not c!123030)) b!1262013))

(assert (= (and d!138853 res!840695) b!1262017))

(assert (= (and b!1262017 res!840694) b!1262004))

(assert (= (and b!1262017 (not res!840692)) b!1262020))

(assert (= (and b!1262020 res!840690) b!1262009))

(assert (= (and b!1262017 res!840693) b!1262021))

(assert (= (and b!1262021 c!123031) b!1262010))

(assert (= (and b!1262021 (not c!123031)) b!1262006))

(assert (= (and b!1262010 res!840691) b!1262019))

(assert (= (or b!1262010 b!1262006) bm!62011))

(assert (= (and b!1262021 res!840687) b!1262015))

(assert (= (and b!1262015 c!123032) b!1262014))

(assert (= (and b!1262015 (not c!123032)) b!1262005))

(assert (= (and b!1262014 res!840688) b!1262022))

(assert (= (or b!1262014 b!1262005) bm!62010))

(declare-fun b_lambda!22763 () Bool)

(assert (=> (not b_lambda!22763) (not b!1262009)))

(assert (=> b!1262009 t!41695))

(declare-fun b_and!45285 () Bool)

(assert (= b_and!45283 (and (=> t!41695 result!23339) b_and!45285)))

(assert (=> b!1262011 m!1162979))

(assert (=> b!1262011 m!1162979))

(assert (=> b!1262011 m!1162981))

(declare-fun m!1163069 () Bool)

(assert (=> bm!62008 m!1163069))

(assert (=> bm!62013 m!1162897))

(declare-fun m!1163071 () Bool)

(assert (=> b!1262019 m!1163071))

(declare-fun m!1163073 () Bool)

(assert (=> b!1262002 m!1163073))

(declare-fun m!1163075 () Bool)

(assert (=> b!1262002 m!1163075))

(declare-fun m!1163077 () Bool)

(assert (=> b!1262002 m!1163077))

(declare-fun m!1163079 () Bool)

(assert (=> b!1262002 m!1163079))

(declare-fun m!1163081 () Bool)

(assert (=> b!1262002 m!1163081))

(assert (=> b!1262002 m!1163075))

(declare-fun m!1163083 () Bool)

(assert (=> b!1262002 m!1163083))

(declare-fun m!1163085 () Bool)

(assert (=> b!1262002 m!1163085))

(assert (=> b!1262002 m!1162897))

(assert (=> b!1262002 m!1163077))

(declare-fun m!1163087 () Bool)

(assert (=> b!1262002 m!1163087))

(assert (=> b!1262002 m!1162979))

(declare-fun m!1163089 () Bool)

(assert (=> b!1262002 m!1163089))

(declare-fun m!1163091 () Bool)

(assert (=> b!1262002 m!1163091))

(declare-fun m!1163093 () Bool)

(assert (=> b!1262002 m!1163093))

(declare-fun m!1163095 () Bool)

(assert (=> b!1262002 m!1163095))

(declare-fun m!1163097 () Bool)

(assert (=> b!1262002 m!1163097))

(declare-fun m!1163099 () Bool)

(assert (=> b!1262002 m!1163099))

(assert (=> b!1262002 m!1163079))

(declare-fun m!1163101 () Bool)

(assert (=> b!1262002 m!1163101))

(assert (=> b!1262002 m!1163093))

(assert (=> b!1262020 m!1162979))

(assert (=> b!1262020 m!1162979))

(declare-fun m!1163103 () Bool)

(assert (=> b!1262020 m!1163103))

(declare-fun m!1163105 () Bool)

(assert (=> b!1262022 m!1163105))

(declare-fun m!1163107 () Bool)

(assert (=> b!1262003 m!1163107))

(assert (=> b!1262009 m!1162979))

(declare-fun m!1163109 () Bool)

(assert (=> b!1262009 m!1163109))

(assert (=> b!1262009 m!1162979))

(assert (=> b!1262009 m!1163047))

(assert (=> b!1262009 m!1163049))

(assert (=> b!1262009 m!1163047))

(assert (=> b!1262009 m!1163051))

(assert (=> b!1262009 m!1163049))

(declare-fun m!1163111 () Bool)

(assert (=> bm!62010 m!1163111))

(assert (=> d!138853 m!1162867))

(declare-fun m!1163113 () Bool)

(assert (=> bm!62011 m!1163113))

(assert (=> b!1262004 m!1162979))

(assert (=> b!1262004 m!1162979))

(assert (=> b!1262004 m!1162981))

(assert (=> b!1261833 d!138853))

(declare-fun d!138855 () Bool)

(declare-fun lt!571877 () ListLongMap!18859)

(assert (=> d!138855 (not (contains!7604 lt!571877 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138855 (= lt!571877 (ListLongMap!18860 (removeStrictlySorted!142 (toList!9445 lt!571697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138855 (= (-!2111 lt!571697 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571877)))

(declare-fun bs!35687 () Bool)

(assert (= bs!35687 d!138855))

(declare-fun m!1163115 () Bool)

(assert (=> bs!35687 m!1163115))

(declare-fun m!1163117 () Bool)

(assert (=> bs!35687 m!1163117))

(assert (=> b!1261833 d!138855))

(declare-fun d!138857 () Bool)

(declare-fun e!718283 () Bool)

(assert (=> d!138857 e!718283))

(declare-fun res!840696 () Bool)

(assert (=> d!138857 (=> (not res!840696) (not e!718283))))

(declare-fun lt!571881 () ListLongMap!18859)

(assert (=> d!138857 (= res!840696 (contains!7604 lt!571881 (_1!10500 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!571879 () List!28199)

(assert (=> d!138857 (= lt!571881 (ListLongMap!18860 lt!571879))))

(declare-fun lt!571878 () Unit!42026)

(declare-fun lt!571880 () Unit!42026)

(assert (=> d!138857 (= lt!571878 lt!571880)))

(assert (=> d!138857 (= (getValueByKey!655 lt!571879 (_1!10500 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!705 (_2!10500 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138857 (= lt!571880 (lemmaContainsTupThenGetReturnValue!333 lt!571879 (_1!10500 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10500 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138857 (= lt!571879 (insertStrictlySorted!447 (toList!9445 lt!571702) (_1!10500 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10500 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138857 (= (+!4283 lt!571702 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!571881)))

(declare-fun b!1262023 () Bool)

(declare-fun res!840697 () Bool)

(assert (=> b!1262023 (=> (not res!840697) (not e!718283))))

(assert (=> b!1262023 (= res!840697 (= (getValueByKey!655 (toList!9445 lt!571881) (_1!10500 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!705 (_2!10500 (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1262024 () Bool)

(assert (=> b!1262024 (= e!718283 (contains!7605 (toList!9445 lt!571881) (tuple2!20979 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138857 res!840696) b!1262023))

(assert (= (and b!1262023 res!840697) b!1262024))

(declare-fun m!1163119 () Bool)

(assert (=> d!138857 m!1163119))

(declare-fun m!1163121 () Bool)

(assert (=> d!138857 m!1163121))

(declare-fun m!1163123 () Bool)

(assert (=> d!138857 m!1163123))

(declare-fun m!1163125 () Bool)

(assert (=> d!138857 m!1163125))

(declare-fun m!1163127 () Bool)

(assert (=> b!1262023 m!1163127))

(declare-fun m!1163129 () Bool)

(assert (=> b!1262024 m!1163129))

(assert (=> b!1261833 d!138857))

(declare-fun d!138859 () Bool)

(assert (=> d!138859 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106040 d!138859))

(declare-fun d!138861 () Bool)

(assert (=> d!138861 (= (array_inv!30339 _keys!1118) (bvsge (size!40201 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106040 d!138861))

(declare-fun d!138863 () Bool)

(assert (=> d!138863 (= (array_inv!30340 _values!914) (bvsge (size!40200 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106040 d!138863))

(declare-fun d!138865 () Bool)

(assert (=> d!138865 (= (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571884 () Unit!42026)

(declare-fun choose!1871 (array!82229 array!82227 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48407 V!48407 V!48407 V!48407 (_ BitVec 32) Int) Unit!42026)

(assert (=> d!138865 (= lt!571884 (choose!1871 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138865 (validMask!0 mask!1466)))

(assert (=> d!138865 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1166 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571884)))

(declare-fun bs!35688 () Bool)

(assert (= bs!35688 d!138865))

(assert (=> bs!35688 m!1162897))

(assert (=> bs!35688 m!1162895))

(declare-fun m!1163131 () Bool)

(assert (=> bs!35688 m!1163131))

(assert (=> bs!35688 m!1162867))

(assert (=> b!1261836 d!138865))

(declare-fun b!1262049 () Bool)

(declare-fun e!718298 () Bool)

(declare-fun lt!571900 () ListLongMap!18859)

(assert (=> b!1262049 (= e!718298 (= lt!571900 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262050 () Bool)

(declare-fun isEmpty!1039 (ListLongMap!18859) Bool)

(assert (=> b!1262050 (= e!718298 (isEmpty!1039 lt!571900))))

(declare-fun b!1262051 () Bool)

(declare-fun e!718303 () ListLongMap!18859)

(declare-fun call!62020 () ListLongMap!18859)

(assert (=> b!1262051 (= e!718303 call!62020)))

(declare-fun d!138867 () Bool)

(declare-fun e!718304 () Bool)

(assert (=> d!138867 e!718304))

(declare-fun res!840708 () Bool)

(assert (=> d!138867 (=> (not res!840708) (not e!718304))))

(assert (=> d!138867 (= res!840708 (not (contains!7604 lt!571900 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718301 () ListLongMap!18859)

(assert (=> d!138867 (= lt!571900 e!718301)))

(declare-fun c!123041 () Bool)

(assert (=> d!138867 (= c!123041 (bvsge #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(assert (=> d!138867 (validMask!0 mask!1466)))

(assert (=> d!138867 (= (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571900)))

(declare-fun b!1262052 () Bool)

(assert (=> b!1262052 (= e!718301 (ListLongMap!18860 Nil!28196))))

(declare-fun b!1262053 () Bool)

(declare-fun e!718300 () Bool)

(assert (=> b!1262053 (= e!718300 e!718298)))

(declare-fun c!123042 () Bool)

(assert (=> b!1262053 (= c!123042 (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun b!1262054 () Bool)

(declare-fun res!840706 () Bool)

(assert (=> b!1262054 (=> (not res!840706) (not e!718304))))

(assert (=> b!1262054 (= res!840706 (not (contains!7604 lt!571900 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262055 () Bool)

(declare-fun lt!571901 () Unit!42026)

(declare-fun lt!571905 () Unit!42026)

(assert (=> b!1262055 (= lt!571901 lt!571905)))

(declare-fun lt!571904 () (_ BitVec 64))

(declare-fun lt!571899 () (_ BitVec 64))

(declare-fun lt!571903 () V!48407)

(declare-fun lt!571902 () ListLongMap!18859)

(assert (=> b!1262055 (not (contains!7604 (+!4283 lt!571902 (tuple2!20979 lt!571899 lt!571903)) lt!571904))))

(declare-fun addStillNotContains!323 (ListLongMap!18859 (_ BitVec 64) V!48407 (_ BitVec 64)) Unit!42026)

(assert (=> b!1262055 (= lt!571905 (addStillNotContains!323 lt!571902 lt!571899 lt!571903 lt!571904))))

(assert (=> b!1262055 (= lt!571904 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262055 (= lt!571903 (get!20289 (select (arr!39663 _values!914) #b00000000000000000000000000000000) (dynLambda!3454 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262055 (= lt!571899 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262055 (= lt!571902 call!62020)))

(assert (=> b!1262055 (= e!718303 (+!4283 call!62020 (tuple2!20979 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000) (get!20289 (select (arr!39663 _values!914) #b00000000000000000000000000000000) (dynLambda!3454 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262056 () Bool)

(declare-fun e!718299 () Bool)

(assert (=> b!1262056 (= e!718300 e!718299)))

(assert (=> b!1262056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun res!840709 () Bool)

(assert (=> b!1262056 (= res!840709 (contains!7604 lt!571900 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262056 (=> (not res!840709) (not e!718299))))

(declare-fun b!1262057 () Bool)

(declare-fun e!718302 () Bool)

(assert (=> b!1262057 (= e!718302 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262057 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!62017 () Bool)

(assert (=> bm!62017 (= call!62020 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262058 () Bool)

(assert (=> b!1262058 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(assert (=> b!1262058 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40200 _values!914)))))

(assert (=> b!1262058 (= e!718299 (= (apply!1002 lt!571900 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)) (get!20289 (select (arr!39663 _values!914) #b00000000000000000000000000000000) (dynLambda!3454 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262059 () Bool)

(assert (=> b!1262059 (= e!718301 e!718303)))

(declare-fun c!123044 () Bool)

(assert (=> b!1262059 (= c!123044 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262060 () Bool)

(assert (=> b!1262060 (= e!718304 e!718300)))

(declare-fun c!123043 () Bool)

(assert (=> b!1262060 (= c!123043 e!718302)))

(declare-fun res!840707 () Bool)

(assert (=> b!1262060 (=> (not res!840707) (not e!718302))))

(assert (=> b!1262060 (= res!840707 (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(assert (= (and d!138867 c!123041) b!1262052))

(assert (= (and d!138867 (not c!123041)) b!1262059))

(assert (= (and b!1262059 c!123044) b!1262055))

(assert (= (and b!1262059 (not c!123044)) b!1262051))

(assert (= (or b!1262055 b!1262051) bm!62017))

(assert (= (and d!138867 res!840708) b!1262054))

(assert (= (and b!1262054 res!840706) b!1262060))

(assert (= (and b!1262060 res!840707) b!1262057))

(assert (= (and b!1262060 c!123043) b!1262056))

(assert (= (and b!1262060 (not c!123043)) b!1262053))

(assert (= (and b!1262056 res!840709) b!1262058))

(assert (= (and b!1262053 c!123042) b!1262049))

(assert (= (and b!1262053 (not c!123042)) b!1262050))

(declare-fun b_lambda!22765 () Bool)

(assert (=> (not b_lambda!22765) (not b!1262055)))

(assert (=> b!1262055 t!41695))

(declare-fun b_and!45287 () Bool)

(assert (= b_and!45285 (and (=> t!41695 result!23339) b_and!45287)))

(declare-fun b_lambda!22767 () Bool)

(assert (=> (not b_lambda!22767) (not b!1262058)))

(assert (=> b!1262058 t!41695))

(declare-fun b_and!45289 () Bool)

(assert (= b_and!45287 (and (=> t!41695 result!23339) b_and!45289)))

(declare-fun m!1163133 () Bool)

(assert (=> bm!62017 m!1163133))

(assert (=> b!1262055 m!1163049))

(assert (=> b!1262055 m!1163047))

(assert (=> b!1262055 m!1163051))

(declare-fun m!1163135 () Bool)

(assert (=> b!1262055 m!1163135))

(assert (=> b!1262055 m!1163049))

(assert (=> b!1262055 m!1163047))

(declare-fun m!1163137 () Bool)

(assert (=> b!1262055 m!1163137))

(declare-fun m!1163139 () Bool)

(assert (=> b!1262055 m!1163139))

(assert (=> b!1262055 m!1163135))

(declare-fun m!1163141 () Bool)

(assert (=> b!1262055 m!1163141))

(assert (=> b!1262055 m!1162979))

(assert (=> b!1262057 m!1162979))

(assert (=> b!1262057 m!1162979))

(assert (=> b!1262057 m!1162981))

(declare-fun m!1163143 () Bool)

(assert (=> b!1262054 m!1163143))

(assert (=> b!1262059 m!1162979))

(assert (=> b!1262059 m!1162979))

(assert (=> b!1262059 m!1162981))

(assert (=> b!1262058 m!1163049))

(assert (=> b!1262058 m!1163047))

(assert (=> b!1262058 m!1163051))

(assert (=> b!1262058 m!1163049))

(assert (=> b!1262058 m!1162979))

(assert (=> b!1262058 m!1163047))

(assert (=> b!1262058 m!1162979))

(declare-fun m!1163145 () Bool)

(assert (=> b!1262058 m!1163145))

(declare-fun m!1163147 () Bool)

(assert (=> d!138867 m!1163147))

(assert (=> d!138867 m!1162867))

(assert (=> b!1262056 m!1162979))

(assert (=> b!1262056 m!1162979))

(declare-fun m!1163149 () Bool)

(assert (=> b!1262056 m!1163149))

(assert (=> b!1262049 m!1163133))

(declare-fun m!1163151 () Bool)

(assert (=> b!1262050 m!1163151))

(assert (=> b!1261836 d!138867))

(declare-fun e!718305 () Bool)

(declare-fun b!1262061 () Bool)

(declare-fun lt!571907 () ListLongMap!18859)

(assert (=> b!1262061 (= e!718305 (= lt!571907 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262062 () Bool)

(assert (=> b!1262062 (= e!718305 (isEmpty!1039 lt!571907))))

(declare-fun b!1262063 () Bool)

(declare-fun e!718310 () ListLongMap!18859)

(declare-fun call!62021 () ListLongMap!18859)

(assert (=> b!1262063 (= e!718310 call!62021)))

(declare-fun d!138869 () Bool)

(declare-fun e!718311 () Bool)

(assert (=> d!138869 e!718311))

(declare-fun res!840712 () Bool)

(assert (=> d!138869 (=> (not res!840712) (not e!718311))))

(assert (=> d!138869 (= res!840712 (not (contains!7604 lt!571907 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718308 () ListLongMap!18859)

(assert (=> d!138869 (= lt!571907 e!718308)))

(declare-fun c!123045 () Bool)

(assert (=> d!138869 (= c!123045 (bvsge #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(assert (=> d!138869 (validMask!0 mask!1466)))

(assert (=> d!138869 (= (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571907)))

(declare-fun b!1262064 () Bool)

(assert (=> b!1262064 (= e!718308 (ListLongMap!18860 Nil!28196))))

(declare-fun b!1262065 () Bool)

(declare-fun e!718307 () Bool)

(assert (=> b!1262065 (= e!718307 e!718305)))

(declare-fun c!123046 () Bool)

(assert (=> b!1262065 (= c!123046 (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun b!1262066 () Bool)

(declare-fun res!840710 () Bool)

(assert (=> b!1262066 (=> (not res!840710) (not e!718311))))

(assert (=> b!1262066 (= res!840710 (not (contains!7604 lt!571907 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262067 () Bool)

(declare-fun lt!571908 () Unit!42026)

(declare-fun lt!571912 () Unit!42026)

(assert (=> b!1262067 (= lt!571908 lt!571912)))

(declare-fun lt!571911 () (_ BitVec 64))

(declare-fun lt!571909 () ListLongMap!18859)

(declare-fun lt!571910 () V!48407)

(declare-fun lt!571906 () (_ BitVec 64))

(assert (=> b!1262067 (not (contains!7604 (+!4283 lt!571909 (tuple2!20979 lt!571906 lt!571910)) lt!571911))))

(assert (=> b!1262067 (= lt!571912 (addStillNotContains!323 lt!571909 lt!571906 lt!571910 lt!571911))))

(assert (=> b!1262067 (= lt!571911 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262067 (= lt!571910 (get!20289 (select (arr!39663 _values!914) #b00000000000000000000000000000000) (dynLambda!3454 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262067 (= lt!571906 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262067 (= lt!571909 call!62021)))

(assert (=> b!1262067 (= e!718310 (+!4283 call!62021 (tuple2!20979 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000) (get!20289 (select (arr!39663 _values!914) #b00000000000000000000000000000000) (dynLambda!3454 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262068 () Bool)

(declare-fun e!718306 () Bool)

(assert (=> b!1262068 (= e!718307 e!718306)))

(assert (=> b!1262068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(declare-fun res!840713 () Bool)

(assert (=> b!1262068 (= res!840713 (contains!7604 lt!571907 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262068 (=> (not res!840713) (not e!718306))))

(declare-fun b!1262069 () Bool)

(declare-fun e!718309 () Bool)

(assert (=> b!1262069 (= e!718309 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262069 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!62018 () Bool)

(assert (=> bm!62018 (= call!62021 (getCurrentListMapNoExtraKeys!5852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262070 () Bool)

(assert (=> b!1262070 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(assert (=> b!1262070 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40200 _values!914)))))

(assert (=> b!1262070 (= e!718306 (= (apply!1002 lt!571907 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)) (get!20289 (select (arr!39663 _values!914) #b00000000000000000000000000000000) (dynLambda!3454 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262071 () Bool)

(assert (=> b!1262071 (= e!718308 e!718310)))

(declare-fun c!123048 () Bool)

(assert (=> b!1262071 (= c!123048 (validKeyInArray!0 (select (arr!39664 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262072 () Bool)

(assert (=> b!1262072 (= e!718311 e!718307)))

(declare-fun c!123047 () Bool)

(assert (=> b!1262072 (= c!123047 e!718309)))

(declare-fun res!840711 () Bool)

(assert (=> b!1262072 (=> (not res!840711) (not e!718309))))

(assert (=> b!1262072 (= res!840711 (bvslt #b00000000000000000000000000000000 (size!40201 _keys!1118)))))

(assert (= (and d!138869 c!123045) b!1262064))

(assert (= (and d!138869 (not c!123045)) b!1262071))

(assert (= (and b!1262071 c!123048) b!1262067))

(assert (= (and b!1262071 (not c!123048)) b!1262063))

(assert (= (or b!1262067 b!1262063) bm!62018))

(assert (= (and d!138869 res!840712) b!1262066))

(assert (= (and b!1262066 res!840710) b!1262072))

(assert (= (and b!1262072 res!840711) b!1262069))

(assert (= (and b!1262072 c!123047) b!1262068))

(assert (= (and b!1262072 (not c!123047)) b!1262065))

(assert (= (and b!1262068 res!840713) b!1262070))

(assert (= (and b!1262065 c!123046) b!1262061))

(assert (= (and b!1262065 (not c!123046)) b!1262062))

(declare-fun b_lambda!22769 () Bool)

(assert (=> (not b_lambda!22769) (not b!1262067)))

(assert (=> b!1262067 t!41695))

(declare-fun b_and!45291 () Bool)

(assert (= b_and!45289 (and (=> t!41695 result!23339) b_and!45291)))

(declare-fun b_lambda!22771 () Bool)

(assert (=> (not b_lambda!22771) (not b!1262070)))

(assert (=> b!1262070 t!41695))

(declare-fun b_and!45293 () Bool)

(assert (= b_and!45291 (and (=> t!41695 result!23339) b_and!45293)))

(declare-fun m!1163153 () Bool)

(assert (=> bm!62018 m!1163153))

(assert (=> b!1262067 m!1163049))

(assert (=> b!1262067 m!1163047))

(assert (=> b!1262067 m!1163051))

(declare-fun m!1163155 () Bool)

(assert (=> b!1262067 m!1163155))

(assert (=> b!1262067 m!1163049))

(assert (=> b!1262067 m!1163047))

(declare-fun m!1163157 () Bool)

(assert (=> b!1262067 m!1163157))

(declare-fun m!1163159 () Bool)

(assert (=> b!1262067 m!1163159))

(assert (=> b!1262067 m!1163155))

(declare-fun m!1163161 () Bool)

(assert (=> b!1262067 m!1163161))

(assert (=> b!1262067 m!1162979))

(assert (=> b!1262069 m!1162979))

(assert (=> b!1262069 m!1162979))

(assert (=> b!1262069 m!1162981))

(declare-fun m!1163163 () Bool)

(assert (=> b!1262066 m!1163163))

(assert (=> b!1262071 m!1162979))

(assert (=> b!1262071 m!1162979))

(assert (=> b!1262071 m!1162981))

(assert (=> b!1262070 m!1163049))

(assert (=> b!1262070 m!1163047))

(assert (=> b!1262070 m!1163051))

(assert (=> b!1262070 m!1163049))

(assert (=> b!1262070 m!1162979))

(assert (=> b!1262070 m!1163047))

(assert (=> b!1262070 m!1162979))

(declare-fun m!1163165 () Bool)

(assert (=> b!1262070 m!1163165))

(declare-fun m!1163167 () Bool)

(assert (=> d!138869 m!1163167))

(assert (=> d!138869 m!1162867))

(assert (=> b!1262068 m!1162979))

(assert (=> b!1262068 m!1162979))

(declare-fun m!1163169 () Bool)

(assert (=> b!1262068 m!1163169))

(assert (=> b!1262061 m!1163153))

(declare-fun m!1163171 () Bool)

(assert (=> b!1262062 m!1163171))

(assert (=> b!1261836 d!138869))

(declare-fun condMapEmpty!50230 () Bool)

(declare-fun mapDefault!50230 () ValueCell!15377)

(assert (=> mapNonEmpty!50221 (= condMapEmpty!50230 (= mapRest!50221 ((as const (Array (_ BitVec 32) ValueCell!15377)) mapDefault!50230)))))

(declare-fun e!718317 () Bool)

(declare-fun mapRes!50230 () Bool)

(assert (=> mapNonEmpty!50221 (= tp!95666 (and e!718317 mapRes!50230))))

(declare-fun mapNonEmpty!50230 () Bool)

(declare-fun tp!95681 () Bool)

(declare-fun e!718316 () Bool)

(assert (=> mapNonEmpty!50230 (= mapRes!50230 (and tp!95681 e!718316))))

(declare-fun mapRest!50230 () (Array (_ BitVec 32) ValueCell!15377))

(declare-fun mapValue!50230 () ValueCell!15377)

(declare-fun mapKey!50230 () (_ BitVec 32))

(assert (=> mapNonEmpty!50230 (= mapRest!50221 (store mapRest!50230 mapKey!50230 mapValue!50230))))

(declare-fun b!1262079 () Bool)

(assert (=> b!1262079 (= e!718316 tp_is_empty!32281)))

(declare-fun mapIsEmpty!50230 () Bool)

(assert (=> mapIsEmpty!50230 mapRes!50230))

(declare-fun b!1262080 () Bool)

(assert (=> b!1262080 (= e!718317 tp_is_empty!32281)))

(assert (= (and mapNonEmpty!50221 condMapEmpty!50230) mapIsEmpty!50230))

(assert (= (and mapNonEmpty!50221 (not condMapEmpty!50230)) mapNonEmpty!50230))

(assert (= (and mapNonEmpty!50230 ((_ is ValueCellFull!15377) mapValue!50230)) b!1262079))

(assert (= (and mapNonEmpty!50221 ((_ is ValueCellFull!15377) mapDefault!50230)) b!1262080))

(declare-fun m!1163173 () Bool)

(assert (=> mapNonEmpty!50230 m!1163173))

(declare-fun b_lambda!22773 () Bool)

(assert (= b_lambda!22769 (or (and start!106040 b_free!27379) b_lambda!22773)))

(declare-fun b_lambda!22775 () Bool)

(assert (= b_lambda!22771 (or (and start!106040 b_free!27379) b_lambda!22775)))

(declare-fun b_lambda!22777 () Bool)

(assert (= b_lambda!22763 (or (and start!106040 b_free!27379) b_lambda!22777)))

(declare-fun b_lambda!22779 () Bool)

(assert (= b_lambda!22765 (or (and start!106040 b_free!27379) b_lambda!22779)))

(declare-fun b_lambda!22781 () Bool)

(assert (= b_lambda!22767 (or (and start!106040 b_free!27379) b_lambda!22781)))

(declare-fun b_lambda!22783 () Bool)

(assert (= b_lambda!22761 (or (and start!106040 b_free!27379) b_lambda!22783)))

(check-sat (not d!138869) (not b!1261907) (not b!1262003) (not bm!61983) (not b!1261979) (not b!1262059) (not bm!62018) tp_is_empty!32281 (not b!1261994) (not d!138847) (not b!1262020) (not b!1262066) (not b!1262001) (not b!1262050) (not bm!62004) (not b!1261920) (not b!1262000) (not bm!62008) (not bm!62017) (not b!1262067) (not b!1262024) (not d!138867) (not d!138851) b_and!45293 (not bm!62001) (not d!138853) (not d!138845) (not bm!62010) (not b_lambda!22775) (not b!1262002) (not b!1262022) (not b!1261921) (not b!1261984) (not b!1262055) (not b!1262056) (not bm!61986) (not b!1261997) (not b!1262071) (not b!1262061) (not b_lambda!22777) (not b!1261986) (not b!1262057) (not b!1261906) (not d!138849) (not d!138855) (not d!138857) (not d!138865) (not b!1262069) (not mapNonEmpty!50230) (not b_next!27379) (not b!1262058) (not b_lambda!22781) (not b!1262062) (not b!1261995) (not b!1262068) (not b!1261918) (not b_lambda!22783) (not b!1261931) (not b!1261977) (not b!1262049) (not bm!62013) (not b!1262054) (not b!1262004) (not bm!62011) (not b!1262023) (not b_lambda!22779) (not b!1262019) (not b!1262009) (not b!1262011) (not bm!62003) (not b!1261978) (not bm!62006) (not b_lambda!22773) (not d!138839) (not b!1261934) (not b!1262070))
(check-sat b_and!45293 (not b_next!27379))
