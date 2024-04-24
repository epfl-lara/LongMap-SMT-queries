; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105964 () Bool)

(assert start!105964)

(declare-fun b_free!27325 () Bool)

(declare-fun b_next!27325 () Bool)

(assert (=> start!105964 (= b_free!27325 (not b_next!27325))))

(declare-fun tp!95501 () Bool)

(declare-fun b_and!45211 () Bool)

(assert (=> start!105964 (= tp!95501 b_and!45211)))

(declare-fun b!1260915 () Bool)

(declare-fun res!840021 () Bool)

(declare-fun e!717464 () Bool)

(assert (=> b!1260915 (=> (not res!840021) (not e!717464))))

(declare-datatypes ((array!82123 0))(
  ( (array!82124 (arr!39612 (Array (_ BitVec 32) (_ BitVec 64))) (size!40149 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82123)

(declare-datatypes ((List!28161 0))(
  ( (Nil!28158) (Cons!28157 (h!29375 (_ BitVec 64)) (t!41648 List!28161)) )
))
(declare-fun arrayNoDuplicates!0 (array!82123 (_ BitVec 32) List!28161) Bool)

(assert (=> b!1260915 (= res!840021 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28158))))

(declare-fun b!1260916 () Bool)

(declare-fun e!717468 () Bool)

(assert (=> b!1260916 (= e!717464 (not e!717468))))

(declare-fun res!840017 () Bool)

(assert (=> b!1260916 (=> res!840017 e!717468)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1260916 (= res!840017 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48335 0))(
  ( (V!48336 (val!16176 Int)) )
))
(declare-datatypes ((tuple2!20934 0))(
  ( (tuple2!20935 (_1!10478 (_ BitVec 64)) (_2!10478 V!48335)) )
))
(declare-datatypes ((List!28162 0))(
  ( (Nil!28159) (Cons!28158 (h!29376 tuple2!20934) (t!41649 List!28162)) )
))
(declare-datatypes ((ListLongMap!18815 0))(
  ( (ListLongMap!18816 (toList!9423 List!28162)) )
))
(declare-fun lt!570747 () ListLongMap!18815)

(declare-fun lt!570745 () ListLongMap!18815)

(assert (=> b!1260916 (= lt!570747 lt!570745)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41982 0))(
  ( (Unit!41983) )
))
(declare-fun lt!570744 () Unit!41982)

(declare-fun minValueAfter!43 () V!48335)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48335)

(declare-datatypes ((ValueCell!15350 0))(
  ( (ValueCellFull!15350 (v!18874 V!48335)) (EmptyCell!15350) )
))
(declare-datatypes ((array!82125 0))(
  ( (array!82126 (arr!39613 (Array (_ BitVec 32) ValueCell!15350)) (size!40150 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82125)

(declare-fun minValueBefore!43 () V!48335)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1147 (array!82123 array!82125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 V!48335 V!48335 (_ BitVec 32) Int) Unit!41982)

(assert (=> b!1260916 (= lt!570744 (lemmaNoChangeToArrayThenSameMapNoExtras!1147 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5833 (array!82123 array!82125 (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 (_ BitVec 32) Int) ListLongMap!18815)

(assert (=> b!1260916 (= lt!570745 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260916 (= lt!570747 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260917 () Bool)

(declare-fun res!840022 () Bool)

(assert (=> b!1260917 (=> (not res!840022) (not e!717464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82123 (_ BitVec 32)) Bool)

(assert (=> b!1260917 (= res!840022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260918 () Bool)

(declare-fun e!717469 () Bool)

(assert (=> b!1260918 (= e!717469 (bvsle #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun b!1260919 () Bool)

(declare-fun e!717462 () Bool)

(declare-fun tp_is_empty!32227 () Bool)

(assert (=> b!1260919 (= e!717462 tp_is_empty!32227)))

(declare-fun mapNonEmpty!50137 () Bool)

(declare-fun mapRes!50137 () Bool)

(declare-fun tp!95500 () Bool)

(declare-fun e!717465 () Bool)

(assert (=> mapNonEmpty!50137 (= mapRes!50137 (and tp!95500 e!717465))))

(declare-fun mapValue!50137 () ValueCell!15350)

(declare-fun mapRest!50137 () (Array (_ BitVec 32) ValueCell!15350))

(declare-fun mapKey!50137 () (_ BitVec 32))

(assert (=> mapNonEmpty!50137 (= (arr!39613 _values!914) (store mapRest!50137 mapKey!50137 mapValue!50137))))

(declare-fun b!1260921 () Bool)

(assert (=> b!1260921 (= e!717468 e!717469)))

(declare-fun res!840016 () Bool)

(assert (=> b!1260921 (=> res!840016 e!717469)))

(declare-fun lt!570739 () ListLongMap!18815)

(declare-fun lt!570740 () ListLongMap!18815)

(declare-fun -!2092 (ListLongMap!18815 (_ BitVec 64)) ListLongMap!18815)

(assert (=> b!1260921 (= res!840016 (not (= (-!2092 lt!570739 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570740)))))

(declare-fun lt!570741 () ListLongMap!18815)

(declare-fun lt!570742 () ListLongMap!18815)

(assert (=> b!1260921 (= (-!2092 lt!570741 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570742)))

(declare-fun lt!570746 () Unit!41982)

(declare-fun addThenRemoveForNewKeyIsSame!346 (ListLongMap!18815 (_ BitVec 64) V!48335) Unit!41982)

(assert (=> b!1260921 (= lt!570746 (addThenRemoveForNewKeyIsSame!346 lt!570742 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun e!717463 () Bool)

(assert (=> b!1260921 e!717463))

(declare-fun res!840020 () Bool)

(assert (=> b!1260921 (=> (not res!840020) (not e!717463))))

(assert (=> b!1260921 (= res!840020 (= lt!570739 lt!570741))))

(declare-fun +!4262 (ListLongMap!18815 tuple2!20934) ListLongMap!18815)

(assert (=> b!1260921 (= lt!570741 (+!4262 lt!570742 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun lt!570743 () tuple2!20934)

(assert (=> b!1260921 (= lt!570742 (+!4262 lt!570747 lt!570743))))

(assert (=> b!1260921 (= lt!570743 (tuple2!20935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))

(declare-fun getCurrentListMap!4604 (array!82123 array!82125 (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 (_ BitVec 32) Int) ListLongMap!18815)

(assert (=> b!1260921 (= lt!570740 (getCurrentListMap!4604 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1260921 (= lt!570739 (getCurrentListMap!4604 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260922 () Bool)

(assert (=> b!1260922 (= e!717465 tp_is_empty!32227)))

(declare-fun mapIsEmpty!50137 () Bool)

(assert (=> mapIsEmpty!50137 mapRes!50137))

(declare-fun b!1260923 () Bool)

(assert (=> b!1260923 (= e!717463 (= lt!570740 (+!4262 lt!570745 lt!570743)))))

(declare-fun b!1260924 () Bool)

(declare-fun e!717467 () Bool)

(assert (=> b!1260924 (= e!717467 (and e!717462 mapRes!50137))))

(declare-fun condMapEmpty!50137 () Bool)

(declare-fun mapDefault!50137 () ValueCell!15350)

(assert (=> b!1260924 (= condMapEmpty!50137 (= (arr!39613 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15350)) mapDefault!50137)))))

(declare-fun res!840018 () Bool)

(assert (=> start!105964 (=> (not res!840018) (not e!717464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105964 (= res!840018 (validMask!0 mask!1466))))

(assert (=> start!105964 e!717464))

(assert (=> start!105964 true))

(assert (=> start!105964 tp!95501))

(assert (=> start!105964 tp_is_empty!32227))

(declare-fun array_inv!30305 (array!82123) Bool)

(assert (=> start!105964 (array_inv!30305 _keys!1118)))

(declare-fun array_inv!30306 (array!82125) Bool)

(assert (=> start!105964 (and (array_inv!30306 _values!914) e!717467)))

(declare-fun b!1260920 () Bool)

(declare-fun res!840019 () Bool)

(assert (=> b!1260920 (=> (not res!840019) (not e!717464))))

(assert (=> b!1260920 (= res!840019 (and (= (size!40150 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40149 _keys!1118) (size!40150 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105964 res!840018) b!1260920))

(assert (= (and b!1260920 res!840019) b!1260917))

(assert (= (and b!1260917 res!840022) b!1260915))

(assert (= (and b!1260915 res!840021) b!1260916))

(assert (= (and b!1260916 (not res!840017)) b!1260921))

(assert (= (and b!1260921 res!840020) b!1260923))

(assert (= (and b!1260921 (not res!840016)) b!1260918))

(assert (= (and b!1260924 condMapEmpty!50137) mapIsEmpty!50137))

(assert (= (and b!1260924 (not condMapEmpty!50137)) mapNonEmpty!50137))

(get-info :version)

(assert (= (and mapNonEmpty!50137 ((_ is ValueCellFull!15350) mapValue!50137)) b!1260922))

(assert (= (and b!1260924 ((_ is ValueCellFull!15350) mapDefault!50137)) b!1260919))

(assert (= start!105964 b!1260924))

(declare-fun m!1161739 () Bool)

(assert (=> b!1260917 m!1161739))

(declare-fun m!1161741 () Bool)

(assert (=> mapNonEmpty!50137 m!1161741))

(declare-fun m!1161743 () Bool)

(assert (=> b!1260916 m!1161743))

(declare-fun m!1161745 () Bool)

(assert (=> b!1260916 m!1161745))

(declare-fun m!1161747 () Bool)

(assert (=> b!1260916 m!1161747))

(declare-fun m!1161749 () Bool)

(assert (=> b!1260921 m!1161749))

(declare-fun m!1161751 () Bool)

(assert (=> b!1260921 m!1161751))

(declare-fun m!1161753 () Bool)

(assert (=> b!1260921 m!1161753))

(declare-fun m!1161755 () Bool)

(assert (=> b!1260921 m!1161755))

(declare-fun m!1161757 () Bool)

(assert (=> b!1260921 m!1161757))

(declare-fun m!1161759 () Bool)

(assert (=> b!1260921 m!1161759))

(declare-fun m!1161761 () Bool)

(assert (=> b!1260921 m!1161761))

(declare-fun m!1161763 () Bool)

(assert (=> b!1260915 m!1161763))

(declare-fun m!1161765 () Bool)

(assert (=> start!105964 m!1161765))

(declare-fun m!1161767 () Bool)

(assert (=> start!105964 m!1161767))

(declare-fun m!1161769 () Bool)

(assert (=> start!105964 m!1161769))

(declare-fun m!1161771 () Bool)

(assert (=> b!1260923 m!1161771))

(check-sat (not b!1260915) (not b!1260917) (not b!1260921) (not b!1260916) tp_is_empty!32227 (not b!1260923) (not start!105964) b_and!45211 (not b_next!27325) (not mapNonEmpty!50137))
(check-sat b_and!45211 (not b_next!27325))
(get-model)

(declare-fun d!138789 () Bool)

(assert (=> d!138789 (= (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570804 () Unit!41982)

(declare-fun choose!1868 (array!82123 array!82125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48335 V!48335 V!48335 V!48335 (_ BitVec 32) Int) Unit!41982)

(assert (=> d!138789 (= lt!570804 (choose!1868 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138789 (validMask!0 mask!1466)))

(assert (=> d!138789 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1147 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570804)))

(declare-fun bs!35654 () Bool)

(assert (= bs!35654 d!138789))

(assert (=> bs!35654 m!1161747))

(assert (=> bs!35654 m!1161745))

(declare-fun m!1161841 () Bool)

(assert (=> bs!35654 m!1161841))

(assert (=> bs!35654 m!1161765))

(assert (=> b!1260916 d!138789))

(declare-fun b!1261009 () Bool)

(declare-fun e!717535 () ListLongMap!18815)

(declare-fun call!61948 () ListLongMap!18815)

(assert (=> b!1261009 (= e!717535 call!61948)))

(declare-fun d!138791 () Bool)

(declare-fun e!717536 () Bool)

(assert (=> d!138791 e!717536))

(declare-fun res!840074 () Bool)

(assert (=> d!138791 (=> (not res!840074) (not e!717536))))

(declare-fun lt!570822 () ListLongMap!18815)

(declare-fun contains!7601 (ListLongMap!18815 (_ BitVec 64)) Bool)

(assert (=> d!138791 (= res!840074 (not (contains!7601 lt!570822 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!717538 () ListLongMap!18815)

(assert (=> d!138791 (= lt!570822 e!717538)))

(declare-fun c!122966 () Bool)

(assert (=> d!138791 (= c!122966 (bvsge #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(assert (=> d!138791 (validMask!0 mask!1466)))

(assert (=> d!138791 (= (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570822)))

(declare-fun b!1261010 () Bool)

(declare-fun e!717537 () Bool)

(declare-fun isEmpty!1038 (ListLongMap!18815) Bool)

(assert (=> b!1261010 (= e!717537 (isEmpty!1038 lt!570822))))

(declare-fun b!1261011 () Bool)

(declare-fun e!717532 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1261011 (= e!717532 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261011 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1261012 () Bool)

(declare-fun e!717534 () Bool)

(assert (=> b!1261012 (= e!717534 e!717537)))

(declare-fun c!122968 () Bool)

(assert (=> b!1261012 (= c!122968 (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun bm!61945 () Bool)

(assert (=> bm!61945 (= call!61948 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1261013 () Bool)

(declare-fun res!840075 () Bool)

(assert (=> b!1261013 (=> (not res!840075) (not e!717536))))

(assert (=> b!1261013 (= res!840075 (not (contains!7601 lt!570822 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261014 () Bool)

(declare-fun e!717533 () Bool)

(assert (=> b!1261014 (= e!717534 e!717533)))

(assert (=> b!1261014 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun res!840076 () Bool)

(assert (=> b!1261014 (= res!840076 (contains!7601 lt!570822 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261014 (=> (not res!840076) (not e!717533))))

(declare-fun b!1261015 () Bool)

(assert (=> b!1261015 (= e!717538 e!717535)))

(declare-fun c!122965 () Bool)

(assert (=> b!1261015 (= c!122965 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261016 () Bool)

(assert (=> b!1261016 (= e!717538 (ListLongMap!18816 Nil!28159))))

(declare-fun b!1261017 () Bool)

(declare-fun lt!570821 () Unit!41982)

(declare-fun lt!570820 () Unit!41982)

(assert (=> b!1261017 (= lt!570821 lt!570820)))

(declare-fun lt!570823 () ListLongMap!18815)

(declare-fun lt!570819 () (_ BitVec 64))

(declare-fun lt!570825 () V!48335)

(declare-fun lt!570824 () (_ BitVec 64))

(assert (=> b!1261017 (not (contains!7601 (+!4262 lt!570823 (tuple2!20935 lt!570824 lt!570825)) lt!570819))))

(declare-fun addStillNotContains!322 (ListLongMap!18815 (_ BitVec 64) V!48335 (_ BitVec 64)) Unit!41982)

(assert (=> b!1261017 (= lt!570820 (addStillNotContains!322 lt!570823 lt!570824 lt!570825 lt!570819))))

(assert (=> b!1261017 (= lt!570819 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20270 (ValueCell!15350 V!48335) V!48335)

(declare-fun dynLambda!3453 (Int (_ BitVec 64)) V!48335)

(assert (=> b!1261017 (= lt!570825 (get!20270 (select (arr!39613 _values!914) #b00000000000000000000000000000000) (dynLambda!3453 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261017 (= lt!570824 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261017 (= lt!570823 call!61948)))

(assert (=> b!1261017 (= e!717535 (+!4262 call!61948 (tuple2!20935 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000) (get!20270 (select (arr!39613 _values!914) #b00000000000000000000000000000000) (dynLambda!3453 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1261018 () Bool)

(assert (=> b!1261018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(assert (=> b!1261018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40150 _values!914)))))

(declare-fun apply!1001 (ListLongMap!18815 (_ BitVec 64)) V!48335)

(assert (=> b!1261018 (= e!717533 (= (apply!1001 lt!570822 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)) (get!20270 (select (arr!39613 _values!914) #b00000000000000000000000000000000) (dynLambda!3453 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261019 () Bool)

(assert (=> b!1261019 (= e!717536 e!717534)))

(declare-fun c!122967 () Bool)

(assert (=> b!1261019 (= c!122967 e!717532)))

(declare-fun res!840073 () Bool)

(assert (=> b!1261019 (=> (not res!840073) (not e!717532))))

(assert (=> b!1261019 (= res!840073 (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun b!1261020 () Bool)

(assert (=> b!1261020 (= e!717537 (= lt!570822 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138791 c!122966) b!1261016))

(assert (= (and d!138791 (not c!122966)) b!1261015))

(assert (= (and b!1261015 c!122965) b!1261017))

(assert (= (and b!1261015 (not c!122965)) b!1261009))

(assert (= (or b!1261017 b!1261009) bm!61945))

(assert (= (and d!138791 res!840074) b!1261013))

(assert (= (and b!1261013 res!840075) b!1261019))

(assert (= (and b!1261019 res!840073) b!1261011))

(assert (= (and b!1261019 c!122967) b!1261014))

(assert (= (and b!1261019 (not c!122967)) b!1261012))

(assert (= (and b!1261014 res!840076) b!1261018))

(assert (= (and b!1261012 c!122968) b!1261020))

(assert (= (and b!1261012 (not c!122968)) b!1261010))

(declare-fun b_lambda!22737 () Bool)

(assert (=> (not b_lambda!22737) (not b!1261017)))

(declare-fun t!41654 () Bool)

(declare-fun tb!11303 () Bool)

(assert (=> (and start!105964 (= defaultEntry!922 defaultEntry!922) t!41654) tb!11303))

(declare-fun result!23333 () Bool)

(assert (=> tb!11303 (= result!23333 tp_is_empty!32227)))

(assert (=> b!1261017 t!41654))

(declare-fun b_and!45217 () Bool)

(assert (= b_and!45211 (and (=> t!41654 result!23333) b_and!45217)))

(declare-fun b_lambda!22739 () Bool)

(assert (=> (not b_lambda!22739) (not b!1261018)))

(assert (=> b!1261018 t!41654))

(declare-fun b_and!45219 () Bool)

(assert (= b_and!45217 (and (=> t!41654 result!23333) b_and!45219)))

(declare-fun m!1161843 () Bool)

(assert (=> b!1261017 m!1161843))

(declare-fun m!1161845 () Bool)

(assert (=> b!1261017 m!1161845))

(declare-fun m!1161847 () Bool)

(assert (=> b!1261017 m!1161847))

(assert (=> b!1261017 m!1161845))

(declare-fun m!1161849 () Bool)

(assert (=> b!1261017 m!1161849))

(assert (=> b!1261017 m!1161847))

(declare-fun m!1161851 () Bool)

(assert (=> b!1261017 m!1161851))

(declare-fun m!1161853 () Bool)

(assert (=> b!1261017 m!1161853))

(declare-fun m!1161855 () Bool)

(assert (=> b!1261017 m!1161855))

(declare-fun m!1161857 () Bool)

(assert (=> b!1261017 m!1161857))

(assert (=> b!1261017 m!1161851))

(declare-fun m!1161859 () Bool)

(assert (=> d!138791 m!1161859))

(assert (=> d!138791 m!1161765))

(assert (=> b!1261014 m!1161843))

(assert (=> b!1261014 m!1161843))

(declare-fun m!1161861 () Bool)

(assert (=> b!1261014 m!1161861))

(assert (=> b!1261015 m!1161843))

(assert (=> b!1261015 m!1161843))

(declare-fun m!1161863 () Bool)

(assert (=> b!1261015 m!1161863))

(assert (=> b!1261011 m!1161843))

(assert (=> b!1261011 m!1161843))

(assert (=> b!1261011 m!1161863))

(assert (=> b!1261018 m!1161843))

(assert (=> b!1261018 m!1161845))

(assert (=> b!1261018 m!1161847))

(assert (=> b!1261018 m!1161845))

(assert (=> b!1261018 m!1161849))

(assert (=> b!1261018 m!1161847))

(assert (=> b!1261018 m!1161843))

(declare-fun m!1161865 () Bool)

(assert (=> b!1261018 m!1161865))

(declare-fun m!1161867 () Bool)

(assert (=> b!1261010 m!1161867))

(declare-fun m!1161869 () Bool)

(assert (=> bm!61945 m!1161869))

(assert (=> b!1261020 m!1161869))

(declare-fun m!1161871 () Bool)

(assert (=> b!1261013 m!1161871))

(assert (=> b!1260916 d!138791))

(declare-fun b!1261023 () Bool)

(declare-fun e!717542 () ListLongMap!18815)

(declare-fun call!61949 () ListLongMap!18815)

(assert (=> b!1261023 (= e!717542 call!61949)))

(declare-fun d!138793 () Bool)

(declare-fun e!717543 () Bool)

(assert (=> d!138793 e!717543))

(declare-fun res!840078 () Bool)

(assert (=> d!138793 (=> (not res!840078) (not e!717543))))

(declare-fun lt!570829 () ListLongMap!18815)

(assert (=> d!138793 (= res!840078 (not (contains!7601 lt!570829 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!717545 () ListLongMap!18815)

(assert (=> d!138793 (= lt!570829 e!717545)))

(declare-fun c!122970 () Bool)

(assert (=> d!138793 (= c!122970 (bvsge #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(assert (=> d!138793 (validMask!0 mask!1466)))

(assert (=> d!138793 (= (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570829)))

(declare-fun b!1261024 () Bool)

(declare-fun e!717544 () Bool)

(assert (=> b!1261024 (= e!717544 (isEmpty!1038 lt!570829))))

(declare-fun b!1261025 () Bool)

(declare-fun e!717539 () Bool)

(assert (=> b!1261025 (= e!717539 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261025 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1261026 () Bool)

(declare-fun e!717541 () Bool)

(assert (=> b!1261026 (= e!717541 e!717544)))

(declare-fun c!122972 () Bool)

(assert (=> b!1261026 (= c!122972 (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun bm!61946 () Bool)

(assert (=> bm!61946 (= call!61949 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1261027 () Bool)

(declare-fun res!840079 () Bool)

(assert (=> b!1261027 (=> (not res!840079) (not e!717543))))

(assert (=> b!1261027 (= res!840079 (not (contains!7601 lt!570829 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1261028 () Bool)

(declare-fun e!717540 () Bool)

(assert (=> b!1261028 (= e!717541 e!717540)))

(assert (=> b!1261028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun res!840080 () Bool)

(assert (=> b!1261028 (= res!840080 (contains!7601 lt!570829 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261028 (=> (not res!840080) (not e!717540))))

(declare-fun b!1261029 () Bool)

(assert (=> b!1261029 (= e!717545 e!717542)))

(declare-fun c!122969 () Bool)

(assert (=> b!1261029 (= c!122969 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261030 () Bool)

(assert (=> b!1261030 (= e!717545 (ListLongMap!18816 Nil!28159))))

(declare-fun b!1261031 () Bool)

(declare-fun lt!570828 () Unit!41982)

(declare-fun lt!570827 () Unit!41982)

(assert (=> b!1261031 (= lt!570828 lt!570827)))

(declare-fun lt!570830 () ListLongMap!18815)

(declare-fun lt!570832 () V!48335)

(declare-fun lt!570826 () (_ BitVec 64))

(declare-fun lt!570831 () (_ BitVec 64))

(assert (=> b!1261031 (not (contains!7601 (+!4262 lt!570830 (tuple2!20935 lt!570831 lt!570832)) lt!570826))))

(assert (=> b!1261031 (= lt!570827 (addStillNotContains!322 lt!570830 lt!570831 lt!570832 lt!570826))))

(assert (=> b!1261031 (= lt!570826 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1261031 (= lt!570832 (get!20270 (select (arr!39613 _values!914) #b00000000000000000000000000000000) (dynLambda!3453 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1261031 (= lt!570831 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261031 (= lt!570830 call!61949)))

(assert (=> b!1261031 (= e!717542 (+!4262 call!61949 (tuple2!20935 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000) (get!20270 (select (arr!39613 _values!914) #b00000000000000000000000000000000) (dynLambda!3453 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1261032 () Bool)

(assert (=> b!1261032 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(assert (=> b!1261032 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40150 _values!914)))))

(assert (=> b!1261032 (= e!717540 (= (apply!1001 lt!570829 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)) (get!20270 (select (arr!39613 _values!914) #b00000000000000000000000000000000) (dynLambda!3453 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1261033 () Bool)

(assert (=> b!1261033 (= e!717543 e!717541)))

(declare-fun c!122971 () Bool)

(assert (=> b!1261033 (= c!122971 e!717539)))

(declare-fun res!840077 () Bool)

(assert (=> b!1261033 (=> (not res!840077) (not e!717539))))

(assert (=> b!1261033 (= res!840077 (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun b!1261034 () Bool)

(assert (=> b!1261034 (= e!717544 (= lt!570829 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(assert (= (and d!138793 c!122970) b!1261030))

(assert (= (and d!138793 (not c!122970)) b!1261029))

(assert (= (and b!1261029 c!122969) b!1261031))

(assert (= (and b!1261029 (not c!122969)) b!1261023))

(assert (= (or b!1261031 b!1261023) bm!61946))

(assert (= (and d!138793 res!840078) b!1261027))

(assert (= (and b!1261027 res!840079) b!1261033))

(assert (= (and b!1261033 res!840077) b!1261025))

(assert (= (and b!1261033 c!122971) b!1261028))

(assert (= (and b!1261033 (not c!122971)) b!1261026))

(assert (= (and b!1261028 res!840080) b!1261032))

(assert (= (and b!1261026 c!122972) b!1261034))

(assert (= (and b!1261026 (not c!122972)) b!1261024))

(declare-fun b_lambda!22741 () Bool)

(assert (=> (not b_lambda!22741) (not b!1261031)))

(assert (=> b!1261031 t!41654))

(declare-fun b_and!45221 () Bool)

(assert (= b_and!45219 (and (=> t!41654 result!23333) b_and!45221)))

(declare-fun b_lambda!22743 () Bool)

(assert (=> (not b_lambda!22743) (not b!1261032)))

(assert (=> b!1261032 t!41654))

(declare-fun b_and!45223 () Bool)

(assert (= b_and!45221 (and (=> t!41654 result!23333) b_and!45223)))

(assert (=> b!1261031 m!1161843))

(assert (=> b!1261031 m!1161845))

(assert (=> b!1261031 m!1161847))

(assert (=> b!1261031 m!1161845))

(assert (=> b!1261031 m!1161849))

(assert (=> b!1261031 m!1161847))

(declare-fun m!1161873 () Bool)

(assert (=> b!1261031 m!1161873))

(declare-fun m!1161875 () Bool)

(assert (=> b!1261031 m!1161875))

(declare-fun m!1161877 () Bool)

(assert (=> b!1261031 m!1161877))

(declare-fun m!1161879 () Bool)

(assert (=> b!1261031 m!1161879))

(assert (=> b!1261031 m!1161873))

(declare-fun m!1161881 () Bool)

(assert (=> d!138793 m!1161881))

(assert (=> d!138793 m!1161765))

(assert (=> b!1261028 m!1161843))

(assert (=> b!1261028 m!1161843))

(declare-fun m!1161883 () Bool)

(assert (=> b!1261028 m!1161883))

(assert (=> b!1261029 m!1161843))

(assert (=> b!1261029 m!1161843))

(assert (=> b!1261029 m!1161863))

(assert (=> b!1261025 m!1161843))

(assert (=> b!1261025 m!1161843))

(assert (=> b!1261025 m!1161863))

(assert (=> b!1261032 m!1161843))

(assert (=> b!1261032 m!1161845))

(assert (=> b!1261032 m!1161847))

(assert (=> b!1261032 m!1161845))

(assert (=> b!1261032 m!1161849))

(assert (=> b!1261032 m!1161847))

(assert (=> b!1261032 m!1161843))

(declare-fun m!1161885 () Bool)

(assert (=> b!1261032 m!1161885))

(declare-fun m!1161887 () Bool)

(assert (=> b!1261024 m!1161887))

(declare-fun m!1161889 () Bool)

(assert (=> bm!61946 m!1161889))

(assert (=> b!1261034 m!1161889))

(declare-fun m!1161891 () Bool)

(assert (=> b!1261027 m!1161891))

(assert (=> b!1260916 d!138793))

(declare-fun d!138795 () Bool)

(declare-fun e!717548 () Bool)

(assert (=> d!138795 e!717548))

(declare-fun res!840086 () Bool)

(assert (=> d!138795 (=> (not res!840086) (not e!717548))))

(declare-fun lt!570841 () ListLongMap!18815)

(assert (=> d!138795 (= res!840086 (contains!7601 lt!570841 (_1!10478 lt!570743)))))

(declare-fun lt!570842 () List!28162)

(assert (=> d!138795 (= lt!570841 (ListLongMap!18816 lt!570842))))

(declare-fun lt!570843 () Unit!41982)

(declare-fun lt!570844 () Unit!41982)

(assert (=> d!138795 (= lt!570843 lt!570844)))

(declare-datatypes ((Option!705 0))(
  ( (Some!704 (v!18877 V!48335)) (None!703) )
))
(declare-fun getValueByKey!654 (List!28162 (_ BitVec 64)) Option!705)

(assert (=> d!138795 (= (getValueByKey!654 lt!570842 (_1!10478 lt!570743)) (Some!704 (_2!10478 lt!570743)))))

(declare-fun lemmaContainsTupThenGetReturnValue!332 (List!28162 (_ BitVec 64) V!48335) Unit!41982)

(assert (=> d!138795 (= lt!570844 (lemmaContainsTupThenGetReturnValue!332 lt!570842 (_1!10478 lt!570743) (_2!10478 lt!570743)))))

(declare-fun insertStrictlySorted!446 (List!28162 (_ BitVec 64) V!48335) List!28162)

(assert (=> d!138795 (= lt!570842 (insertStrictlySorted!446 (toList!9423 lt!570747) (_1!10478 lt!570743) (_2!10478 lt!570743)))))

(assert (=> d!138795 (= (+!4262 lt!570747 lt!570743) lt!570841)))

(declare-fun b!1261039 () Bool)

(declare-fun res!840085 () Bool)

(assert (=> b!1261039 (=> (not res!840085) (not e!717548))))

(assert (=> b!1261039 (= res!840085 (= (getValueByKey!654 (toList!9423 lt!570841) (_1!10478 lt!570743)) (Some!704 (_2!10478 lt!570743))))))

(declare-fun b!1261040 () Bool)

(declare-fun contains!7602 (List!28162 tuple2!20934) Bool)

(assert (=> b!1261040 (= e!717548 (contains!7602 (toList!9423 lt!570841) lt!570743))))

(assert (= (and d!138795 res!840086) b!1261039))

(assert (= (and b!1261039 res!840085) b!1261040))

(declare-fun m!1161893 () Bool)

(assert (=> d!138795 m!1161893))

(declare-fun m!1161895 () Bool)

(assert (=> d!138795 m!1161895))

(declare-fun m!1161897 () Bool)

(assert (=> d!138795 m!1161897))

(declare-fun m!1161899 () Bool)

(assert (=> d!138795 m!1161899))

(declare-fun m!1161901 () Bool)

(assert (=> b!1261039 m!1161901))

(declare-fun m!1161903 () Bool)

(assert (=> b!1261040 m!1161903))

(assert (=> b!1260921 d!138795))

(declare-fun d!138797 () Bool)

(declare-fun e!717549 () Bool)

(assert (=> d!138797 e!717549))

(declare-fun res!840088 () Bool)

(assert (=> d!138797 (=> (not res!840088) (not e!717549))))

(declare-fun lt!570845 () ListLongMap!18815)

(assert (=> d!138797 (= res!840088 (contains!7601 lt!570845 (_1!10478 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!570846 () List!28162)

(assert (=> d!138797 (= lt!570845 (ListLongMap!18816 lt!570846))))

(declare-fun lt!570847 () Unit!41982)

(declare-fun lt!570848 () Unit!41982)

(assert (=> d!138797 (= lt!570847 lt!570848)))

(assert (=> d!138797 (= (getValueByKey!654 lt!570846 (_1!10478 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!704 (_2!10478 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138797 (= lt!570848 (lemmaContainsTupThenGetReturnValue!332 lt!570846 (_1!10478 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10478 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138797 (= lt!570846 (insertStrictlySorted!446 (toList!9423 lt!570742) (_1!10478 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10478 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138797 (= (+!4262 lt!570742 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!570845)))

(declare-fun b!1261041 () Bool)

(declare-fun res!840087 () Bool)

(assert (=> b!1261041 (=> (not res!840087) (not e!717549))))

(assert (=> b!1261041 (= res!840087 (= (getValueByKey!654 (toList!9423 lt!570845) (_1!10478 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!704 (_2!10478 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1261042 () Bool)

(assert (=> b!1261042 (= e!717549 (contains!7602 (toList!9423 lt!570845) (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138797 res!840088) b!1261041))

(assert (= (and b!1261041 res!840087) b!1261042))

(declare-fun m!1161905 () Bool)

(assert (=> d!138797 m!1161905))

(declare-fun m!1161907 () Bool)

(assert (=> d!138797 m!1161907))

(declare-fun m!1161909 () Bool)

(assert (=> d!138797 m!1161909))

(declare-fun m!1161911 () Bool)

(assert (=> d!138797 m!1161911))

(declare-fun m!1161913 () Bool)

(assert (=> b!1261041 m!1161913))

(declare-fun m!1161915 () Bool)

(assert (=> b!1261042 m!1161915))

(assert (=> b!1260921 d!138797))

(declare-fun d!138799 () Bool)

(declare-fun lt!570851 () ListLongMap!18815)

(assert (=> d!138799 (not (contains!7601 lt!570851 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!141 (List!28162 (_ BitVec 64)) List!28162)

(assert (=> d!138799 (= lt!570851 (ListLongMap!18816 (removeStrictlySorted!141 (toList!9423 lt!570741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138799 (= (-!2092 lt!570741 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570851)))

(declare-fun bs!35655 () Bool)

(assert (= bs!35655 d!138799))

(declare-fun m!1161917 () Bool)

(assert (=> bs!35655 m!1161917))

(declare-fun m!1161919 () Bool)

(assert (=> bs!35655 m!1161919))

(assert (=> b!1260921 d!138799))

(declare-fun d!138801 () Bool)

(declare-fun lt!570852 () ListLongMap!18815)

(assert (=> d!138801 (not (contains!7601 lt!570852 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138801 (= lt!570852 (ListLongMap!18816 (removeStrictlySorted!141 (toList!9423 lt!570739) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138801 (= (-!2092 lt!570739 #b1000000000000000000000000000000000000000000000000000000000000000) lt!570852)))

(declare-fun bs!35656 () Bool)

(assert (= bs!35656 d!138801))

(declare-fun m!1161921 () Bool)

(assert (=> bs!35656 m!1161921))

(declare-fun m!1161923 () Bool)

(assert (=> bs!35656 m!1161923))

(assert (=> b!1260921 d!138801))

(declare-fun b!1261085 () Bool)

(declare-fun e!717588 () ListLongMap!18815)

(declare-fun e!717583 () ListLongMap!18815)

(assert (=> b!1261085 (= e!717588 e!717583)))

(declare-fun c!122989 () Bool)

(assert (=> b!1261085 (= c!122989 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261086 () Bool)

(declare-fun e!717581 () Bool)

(declare-fun e!717578 () Bool)

(assert (=> b!1261086 (= e!717581 e!717578)))

(declare-fun res!840113 () Bool)

(assert (=> b!1261086 (=> (not res!840113) (not e!717578))))

(declare-fun lt!570908 () ListLongMap!18815)

(assert (=> b!1261086 (= res!840113 (contains!7601 lt!570908 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun bm!61961 () Bool)

(declare-fun call!61965 () Bool)

(assert (=> bm!61961 (= call!61965 (contains!7601 lt!570908 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61962 () Bool)

(declare-fun call!61970 () ListLongMap!18815)

(declare-fun call!61966 () ListLongMap!18815)

(assert (=> bm!61962 (= call!61970 call!61966)))

(declare-fun bm!61963 () Bool)

(declare-fun call!61968 () Bool)

(assert (=> bm!61963 (= call!61968 (contains!7601 lt!570908 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261087 () Bool)

(declare-fun call!61964 () ListLongMap!18815)

(assert (=> b!1261087 (= e!717588 (+!4262 call!61964 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun d!138803 () Bool)

(declare-fun e!717582 () Bool)

(assert (=> d!138803 e!717582))

(declare-fun res!840109 () Bool)

(assert (=> d!138803 (=> (not res!840109) (not e!717582))))

(assert (=> d!138803 (= res!840109 (or (bvsge #b00000000000000000000000000000000 (size!40149 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))))

(declare-fun lt!570903 () ListLongMap!18815)

(assert (=> d!138803 (= lt!570908 lt!570903)))

(declare-fun lt!570917 () Unit!41982)

(declare-fun e!717577 () Unit!41982)

(assert (=> d!138803 (= lt!570917 e!717577)))

(declare-fun c!122990 () Bool)

(declare-fun e!717580 () Bool)

(assert (=> d!138803 (= c!122990 e!717580)))

(declare-fun res!840110 () Bool)

(assert (=> d!138803 (=> (not res!840110) (not e!717580))))

(assert (=> d!138803 (= res!840110 (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(assert (=> d!138803 (= lt!570903 e!717588)))

(declare-fun c!122988 () Bool)

(assert (=> d!138803 (= c!122988 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138803 (validMask!0 mask!1466)))

(assert (=> d!138803 (= (getCurrentListMap!4604 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570908)))

(declare-fun b!1261088 () Bool)

(declare-fun e!717584 () Bool)

(assert (=> b!1261088 (= e!717584 (not call!61965))))

(declare-fun b!1261089 () Bool)

(declare-fun res!840108 () Bool)

(assert (=> b!1261089 (=> (not res!840108) (not e!717582))))

(assert (=> b!1261089 (= res!840108 e!717584)))

(declare-fun c!122985 () Bool)

(assert (=> b!1261089 (= c!122985 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1261090 () Bool)

(declare-fun e!717579 () Bool)

(declare-fun e!717586 () Bool)

(assert (=> b!1261090 (= e!717579 e!717586)))

(declare-fun res!840111 () Bool)

(assert (=> b!1261090 (= res!840111 call!61968)))

(assert (=> b!1261090 (=> (not res!840111) (not e!717586))))

(declare-fun b!1261091 () Bool)

(assert (=> b!1261091 (= e!717586 (= (apply!1001 lt!570908 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1261092 () Bool)

(assert (=> b!1261092 (= e!717580 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261093 () Bool)

(declare-fun lt!570898 () Unit!41982)

(assert (=> b!1261093 (= e!717577 lt!570898)))

(declare-fun lt!570916 () ListLongMap!18815)

(assert (=> b!1261093 (= lt!570916 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570906 () (_ BitVec 64))

(assert (=> b!1261093 (= lt!570906 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570897 () (_ BitVec 64))

(assert (=> b!1261093 (= lt!570897 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570909 () Unit!41982)

(declare-fun addStillContains!1091 (ListLongMap!18815 (_ BitVec 64) V!48335 (_ BitVec 64)) Unit!41982)

(assert (=> b!1261093 (= lt!570909 (addStillContains!1091 lt!570916 lt!570906 zeroValue!871 lt!570897))))

(assert (=> b!1261093 (contains!7601 (+!4262 lt!570916 (tuple2!20935 lt!570906 zeroValue!871)) lt!570897)))

(declare-fun lt!570913 () Unit!41982)

(assert (=> b!1261093 (= lt!570913 lt!570909)))

(declare-fun lt!570918 () ListLongMap!18815)

(assert (=> b!1261093 (= lt!570918 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570905 () (_ BitVec 64))

(assert (=> b!1261093 (= lt!570905 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570912 () (_ BitVec 64))

(assert (=> b!1261093 (= lt!570912 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570901 () Unit!41982)

(declare-fun addApplyDifferent!533 (ListLongMap!18815 (_ BitVec 64) V!48335 (_ BitVec 64)) Unit!41982)

(assert (=> b!1261093 (= lt!570901 (addApplyDifferent!533 lt!570918 lt!570905 minValueBefore!43 lt!570912))))

(assert (=> b!1261093 (= (apply!1001 (+!4262 lt!570918 (tuple2!20935 lt!570905 minValueBefore!43)) lt!570912) (apply!1001 lt!570918 lt!570912))))

(declare-fun lt!570914 () Unit!41982)

(assert (=> b!1261093 (= lt!570914 lt!570901)))

(declare-fun lt!570904 () ListLongMap!18815)

(assert (=> b!1261093 (= lt!570904 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570910 () (_ BitVec 64))

(assert (=> b!1261093 (= lt!570910 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570902 () (_ BitVec 64))

(assert (=> b!1261093 (= lt!570902 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570911 () Unit!41982)

(assert (=> b!1261093 (= lt!570911 (addApplyDifferent!533 lt!570904 lt!570910 zeroValue!871 lt!570902))))

(assert (=> b!1261093 (= (apply!1001 (+!4262 lt!570904 (tuple2!20935 lt!570910 zeroValue!871)) lt!570902) (apply!1001 lt!570904 lt!570902))))

(declare-fun lt!570915 () Unit!41982)

(assert (=> b!1261093 (= lt!570915 lt!570911)))

(declare-fun lt!570900 () ListLongMap!18815)

(assert (=> b!1261093 (= lt!570900 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570907 () (_ BitVec 64))

(assert (=> b!1261093 (= lt!570907 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570899 () (_ BitVec 64))

(assert (=> b!1261093 (= lt!570899 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261093 (= lt!570898 (addApplyDifferent!533 lt!570900 lt!570907 minValueBefore!43 lt!570899))))

(assert (=> b!1261093 (= (apply!1001 (+!4262 lt!570900 (tuple2!20935 lt!570907 minValueBefore!43)) lt!570899) (apply!1001 lt!570900 lt!570899))))

(declare-fun bm!61964 () Bool)

(declare-fun call!61967 () ListLongMap!18815)

(assert (=> bm!61964 (= call!61967 call!61970)))

(declare-fun bm!61965 () Bool)

(assert (=> bm!61965 (= call!61964 (+!4262 (ite c!122988 call!61966 (ite c!122989 call!61970 call!61967)) (ite (or c!122988 c!122989) (tuple2!20935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1261094 () Bool)

(declare-fun e!717587 () ListLongMap!18815)

(assert (=> b!1261094 (= e!717587 call!61967)))

(declare-fun b!1261095 () Bool)

(declare-fun call!61969 () ListLongMap!18815)

(assert (=> b!1261095 (= e!717587 call!61969)))

(declare-fun b!1261096 () Bool)

(declare-fun c!122987 () Bool)

(assert (=> b!1261096 (= c!122987 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1261096 (= e!717583 e!717587)))

(declare-fun bm!61966 () Bool)

(assert (=> bm!61966 (= call!61969 call!61964)))

(declare-fun b!1261097 () Bool)

(assert (=> b!1261097 (= e!717583 call!61969)))

(declare-fun b!1261098 () Bool)

(declare-fun e!717576 () Bool)

(assert (=> b!1261098 (= e!717576 (= (apply!1001 lt!570908 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!61967 () Bool)

(assert (=> bm!61967 (= call!61966 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261099 () Bool)

(assert (=> b!1261099 (= e!717578 (= (apply!1001 lt!570908 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)) (get!20270 (select (arr!39613 _values!914) #b00000000000000000000000000000000) (dynLambda!3453 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1261099 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40150 _values!914)))))

(assert (=> b!1261099 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun b!1261100 () Bool)

(assert (=> b!1261100 (= e!717584 e!717576)))

(declare-fun res!840112 () Bool)

(assert (=> b!1261100 (= res!840112 call!61965)))

(assert (=> b!1261100 (=> (not res!840112) (not e!717576))))

(declare-fun b!1261101 () Bool)

(assert (=> b!1261101 (= e!717579 (not call!61968))))

(declare-fun b!1261102 () Bool)

(declare-fun res!840115 () Bool)

(assert (=> b!1261102 (=> (not res!840115) (not e!717582))))

(assert (=> b!1261102 (= res!840115 e!717581)))

(declare-fun res!840114 () Bool)

(assert (=> b!1261102 (=> res!840114 e!717581)))

(declare-fun e!717585 () Bool)

(assert (=> b!1261102 (= res!840114 (not e!717585))))

(declare-fun res!840107 () Bool)

(assert (=> b!1261102 (=> (not res!840107) (not e!717585))))

(assert (=> b!1261102 (= res!840107 (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun b!1261103 () Bool)

(assert (=> b!1261103 (= e!717585 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261104 () Bool)

(declare-fun Unit!41986 () Unit!41982)

(assert (=> b!1261104 (= e!717577 Unit!41986)))

(declare-fun b!1261105 () Bool)

(assert (=> b!1261105 (= e!717582 e!717579)))

(declare-fun c!122986 () Bool)

(assert (=> b!1261105 (= c!122986 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!138803 c!122988) b!1261087))

(assert (= (and d!138803 (not c!122988)) b!1261085))

(assert (= (and b!1261085 c!122989) b!1261097))

(assert (= (and b!1261085 (not c!122989)) b!1261096))

(assert (= (and b!1261096 c!122987) b!1261095))

(assert (= (and b!1261096 (not c!122987)) b!1261094))

(assert (= (or b!1261095 b!1261094) bm!61964))

(assert (= (or b!1261097 bm!61964) bm!61962))

(assert (= (or b!1261097 b!1261095) bm!61966))

(assert (= (or b!1261087 bm!61962) bm!61967))

(assert (= (or b!1261087 bm!61966) bm!61965))

(assert (= (and d!138803 res!840110) b!1261092))

(assert (= (and d!138803 c!122990) b!1261093))

(assert (= (and d!138803 (not c!122990)) b!1261104))

(assert (= (and d!138803 res!840109) b!1261102))

(assert (= (and b!1261102 res!840107) b!1261103))

(assert (= (and b!1261102 (not res!840114)) b!1261086))

(assert (= (and b!1261086 res!840113) b!1261099))

(assert (= (and b!1261102 res!840115) b!1261089))

(assert (= (and b!1261089 c!122985) b!1261100))

(assert (= (and b!1261089 (not c!122985)) b!1261088))

(assert (= (and b!1261100 res!840112) b!1261098))

(assert (= (or b!1261100 b!1261088) bm!61961))

(assert (= (and b!1261089 res!840108) b!1261105))

(assert (= (and b!1261105 c!122986) b!1261090))

(assert (= (and b!1261105 (not c!122986)) b!1261101))

(assert (= (and b!1261090 res!840111) b!1261091))

(assert (= (or b!1261090 b!1261101) bm!61963))

(declare-fun b_lambda!22745 () Bool)

(assert (=> (not b_lambda!22745) (not b!1261099)))

(assert (=> b!1261099 t!41654))

(declare-fun b_and!45225 () Bool)

(assert (= b_and!45223 (and (=> t!41654 result!23333) b_and!45225)))

(declare-fun m!1161925 () Bool)

(assert (=> bm!61961 m!1161925))

(declare-fun m!1161927 () Bool)

(assert (=> b!1261093 m!1161927))

(declare-fun m!1161929 () Bool)

(assert (=> b!1261093 m!1161929))

(assert (=> b!1261093 m!1161843))

(declare-fun m!1161931 () Bool)

(assert (=> b!1261093 m!1161931))

(declare-fun m!1161933 () Bool)

(assert (=> b!1261093 m!1161933))

(declare-fun m!1161935 () Bool)

(assert (=> b!1261093 m!1161935))

(assert (=> b!1261093 m!1161935))

(declare-fun m!1161937 () Bool)

(assert (=> b!1261093 m!1161937))

(declare-fun m!1161939 () Bool)

(assert (=> b!1261093 m!1161939))

(declare-fun m!1161941 () Bool)

(assert (=> b!1261093 m!1161941))

(declare-fun m!1161943 () Bool)

(assert (=> b!1261093 m!1161943))

(declare-fun m!1161945 () Bool)

(assert (=> b!1261093 m!1161945))

(declare-fun m!1161947 () Bool)

(assert (=> b!1261093 m!1161947))

(assert (=> b!1261093 m!1161747))

(declare-fun m!1161949 () Bool)

(assert (=> b!1261093 m!1161949))

(declare-fun m!1161951 () Bool)

(assert (=> b!1261093 m!1161951))

(declare-fun m!1161953 () Bool)

(assert (=> b!1261093 m!1161953))

(declare-fun m!1161955 () Bool)

(assert (=> b!1261093 m!1161955))

(assert (=> b!1261093 m!1161949))

(assert (=> b!1261093 m!1161931))

(assert (=> b!1261093 m!1161945))

(declare-fun m!1161957 () Bool)

(assert (=> bm!61965 m!1161957))

(declare-fun m!1161959 () Bool)

(assert (=> b!1261091 m!1161959))

(assert (=> b!1261092 m!1161843))

(assert (=> b!1261092 m!1161843))

(assert (=> b!1261092 m!1161863))

(assert (=> b!1261103 m!1161843))

(assert (=> b!1261103 m!1161843))

(assert (=> b!1261103 m!1161863))

(declare-fun m!1161961 () Bool)

(assert (=> b!1261098 m!1161961))

(assert (=> d!138803 m!1161765))

(assert (=> bm!61967 m!1161747))

(declare-fun m!1161963 () Bool)

(assert (=> b!1261087 m!1161963))

(assert (=> b!1261099 m!1161843))

(assert (=> b!1261099 m!1161843))

(declare-fun m!1161965 () Bool)

(assert (=> b!1261099 m!1161965))

(assert (=> b!1261099 m!1161845))

(assert (=> b!1261099 m!1161847))

(assert (=> b!1261099 m!1161845))

(assert (=> b!1261099 m!1161849))

(assert (=> b!1261099 m!1161847))

(declare-fun m!1161967 () Bool)

(assert (=> bm!61963 m!1161967))

(assert (=> b!1261086 m!1161843))

(assert (=> b!1261086 m!1161843))

(declare-fun m!1161969 () Bool)

(assert (=> b!1261086 m!1161969))

(assert (=> b!1260921 d!138803))

(declare-fun b!1261106 () Bool)

(declare-fun e!717601 () ListLongMap!18815)

(declare-fun e!717596 () ListLongMap!18815)

(assert (=> b!1261106 (= e!717601 e!717596)))

(declare-fun c!122995 () Bool)

(assert (=> b!1261106 (= c!122995 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261107 () Bool)

(declare-fun e!717594 () Bool)

(declare-fun e!717591 () Bool)

(assert (=> b!1261107 (= e!717594 e!717591)))

(declare-fun res!840122 () Bool)

(assert (=> b!1261107 (=> (not res!840122) (not e!717591))))

(declare-fun lt!570930 () ListLongMap!18815)

(assert (=> b!1261107 (= res!840122 (contains!7601 lt!570930 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261107 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun bm!61968 () Bool)

(declare-fun call!61972 () Bool)

(assert (=> bm!61968 (= call!61972 (contains!7601 lt!570930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61969 () Bool)

(declare-fun call!61977 () ListLongMap!18815)

(declare-fun call!61973 () ListLongMap!18815)

(assert (=> bm!61969 (= call!61977 call!61973)))

(declare-fun bm!61970 () Bool)

(declare-fun call!61975 () Bool)

(assert (=> bm!61970 (= call!61975 (contains!7601 lt!570930 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261108 () Bool)

(declare-fun call!61971 () ListLongMap!18815)

(assert (=> b!1261108 (= e!717601 (+!4262 call!61971 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun d!138805 () Bool)

(declare-fun e!717595 () Bool)

(assert (=> d!138805 e!717595))

(declare-fun res!840118 () Bool)

(assert (=> d!138805 (=> (not res!840118) (not e!717595))))

(assert (=> d!138805 (= res!840118 (or (bvsge #b00000000000000000000000000000000 (size!40149 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))))

(declare-fun lt!570925 () ListLongMap!18815)

(assert (=> d!138805 (= lt!570930 lt!570925)))

(declare-fun lt!570939 () Unit!41982)

(declare-fun e!717590 () Unit!41982)

(assert (=> d!138805 (= lt!570939 e!717590)))

(declare-fun c!122996 () Bool)

(declare-fun e!717593 () Bool)

(assert (=> d!138805 (= c!122996 e!717593)))

(declare-fun res!840119 () Bool)

(assert (=> d!138805 (=> (not res!840119) (not e!717593))))

(assert (=> d!138805 (= res!840119 (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(assert (=> d!138805 (= lt!570925 e!717601)))

(declare-fun c!122994 () Bool)

(assert (=> d!138805 (= c!122994 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138805 (validMask!0 mask!1466)))

(assert (=> d!138805 (= (getCurrentListMap!4604 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!570930)))

(declare-fun b!1261109 () Bool)

(declare-fun e!717597 () Bool)

(assert (=> b!1261109 (= e!717597 (not call!61972))))

(declare-fun b!1261110 () Bool)

(declare-fun res!840117 () Bool)

(assert (=> b!1261110 (=> (not res!840117) (not e!717595))))

(assert (=> b!1261110 (= res!840117 e!717597)))

(declare-fun c!122991 () Bool)

(assert (=> b!1261110 (= c!122991 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1261111 () Bool)

(declare-fun e!717592 () Bool)

(declare-fun e!717599 () Bool)

(assert (=> b!1261111 (= e!717592 e!717599)))

(declare-fun res!840120 () Bool)

(assert (=> b!1261111 (= res!840120 call!61975)))

(assert (=> b!1261111 (=> (not res!840120) (not e!717599))))

(declare-fun b!1261112 () Bool)

(assert (=> b!1261112 (= e!717599 (= (apply!1001 lt!570930 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1261113 () Bool)

(assert (=> b!1261113 (= e!717593 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261114 () Bool)

(declare-fun lt!570920 () Unit!41982)

(assert (=> b!1261114 (= e!717590 lt!570920)))

(declare-fun lt!570938 () ListLongMap!18815)

(assert (=> b!1261114 (= lt!570938 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570928 () (_ BitVec 64))

(assert (=> b!1261114 (= lt!570928 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570919 () (_ BitVec 64))

(assert (=> b!1261114 (= lt!570919 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570931 () Unit!41982)

(assert (=> b!1261114 (= lt!570931 (addStillContains!1091 lt!570938 lt!570928 zeroValue!871 lt!570919))))

(assert (=> b!1261114 (contains!7601 (+!4262 lt!570938 (tuple2!20935 lt!570928 zeroValue!871)) lt!570919)))

(declare-fun lt!570935 () Unit!41982)

(assert (=> b!1261114 (= lt!570935 lt!570931)))

(declare-fun lt!570940 () ListLongMap!18815)

(assert (=> b!1261114 (= lt!570940 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570927 () (_ BitVec 64))

(assert (=> b!1261114 (= lt!570927 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570934 () (_ BitVec 64))

(assert (=> b!1261114 (= lt!570934 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570923 () Unit!41982)

(assert (=> b!1261114 (= lt!570923 (addApplyDifferent!533 lt!570940 lt!570927 minValueAfter!43 lt!570934))))

(assert (=> b!1261114 (= (apply!1001 (+!4262 lt!570940 (tuple2!20935 lt!570927 minValueAfter!43)) lt!570934) (apply!1001 lt!570940 lt!570934))))

(declare-fun lt!570936 () Unit!41982)

(assert (=> b!1261114 (= lt!570936 lt!570923)))

(declare-fun lt!570926 () ListLongMap!18815)

(assert (=> b!1261114 (= lt!570926 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570932 () (_ BitVec 64))

(assert (=> b!1261114 (= lt!570932 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570924 () (_ BitVec 64))

(assert (=> b!1261114 (= lt!570924 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570933 () Unit!41982)

(assert (=> b!1261114 (= lt!570933 (addApplyDifferent!533 lt!570926 lt!570932 zeroValue!871 lt!570924))))

(assert (=> b!1261114 (= (apply!1001 (+!4262 lt!570926 (tuple2!20935 lt!570932 zeroValue!871)) lt!570924) (apply!1001 lt!570926 lt!570924))))

(declare-fun lt!570937 () Unit!41982)

(assert (=> b!1261114 (= lt!570937 lt!570933)))

(declare-fun lt!570922 () ListLongMap!18815)

(assert (=> b!1261114 (= lt!570922 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!570929 () (_ BitVec 64))

(assert (=> b!1261114 (= lt!570929 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!570921 () (_ BitVec 64))

(assert (=> b!1261114 (= lt!570921 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261114 (= lt!570920 (addApplyDifferent!533 lt!570922 lt!570929 minValueAfter!43 lt!570921))))

(assert (=> b!1261114 (= (apply!1001 (+!4262 lt!570922 (tuple2!20935 lt!570929 minValueAfter!43)) lt!570921) (apply!1001 lt!570922 lt!570921))))

(declare-fun bm!61971 () Bool)

(declare-fun call!61974 () ListLongMap!18815)

(assert (=> bm!61971 (= call!61974 call!61977)))

(declare-fun bm!61972 () Bool)

(assert (=> bm!61972 (= call!61971 (+!4262 (ite c!122994 call!61973 (ite c!122995 call!61977 call!61974)) (ite (or c!122994 c!122995) (tuple2!20935 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1261115 () Bool)

(declare-fun e!717600 () ListLongMap!18815)

(assert (=> b!1261115 (= e!717600 call!61974)))

(declare-fun b!1261116 () Bool)

(declare-fun call!61976 () ListLongMap!18815)

(assert (=> b!1261116 (= e!717600 call!61976)))

(declare-fun b!1261117 () Bool)

(declare-fun c!122993 () Bool)

(assert (=> b!1261117 (= c!122993 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1261117 (= e!717596 e!717600)))

(declare-fun bm!61973 () Bool)

(assert (=> bm!61973 (= call!61976 call!61971)))

(declare-fun b!1261118 () Bool)

(assert (=> b!1261118 (= e!717596 call!61976)))

(declare-fun b!1261119 () Bool)

(declare-fun e!717589 () Bool)

(assert (=> b!1261119 (= e!717589 (= (apply!1001 lt!570930 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!61974 () Bool)

(assert (=> bm!61974 (= call!61973 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261120 () Bool)

(assert (=> b!1261120 (= e!717591 (= (apply!1001 lt!570930 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)) (get!20270 (select (arr!39613 _values!914) #b00000000000000000000000000000000) (dynLambda!3453 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1261120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40150 _values!914)))))

(assert (=> b!1261120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun b!1261121 () Bool)

(assert (=> b!1261121 (= e!717597 e!717589)))

(declare-fun res!840121 () Bool)

(assert (=> b!1261121 (= res!840121 call!61972)))

(assert (=> b!1261121 (=> (not res!840121) (not e!717589))))

(declare-fun b!1261122 () Bool)

(assert (=> b!1261122 (= e!717592 (not call!61975))))

(declare-fun b!1261123 () Bool)

(declare-fun res!840124 () Bool)

(assert (=> b!1261123 (=> (not res!840124) (not e!717595))))

(assert (=> b!1261123 (= res!840124 e!717594)))

(declare-fun res!840123 () Bool)

(assert (=> b!1261123 (=> res!840123 e!717594)))

(declare-fun e!717598 () Bool)

(assert (=> b!1261123 (= res!840123 (not e!717598))))

(declare-fun res!840116 () Bool)

(assert (=> b!1261123 (=> (not res!840116) (not e!717598))))

(assert (=> b!1261123 (= res!840116 (bvslt #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(declare-fun b!1261124 () Bool)

(assert (=> b!1261124 (= e!717598 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261125 () Bool)

(declare-fun Unit!41987 () Unit!41982)

(assert (=> b!1261125 (= e!717590 Unit!41987)))

(declare-fun b!1261126 () Bool)

(assert (=> b!1261126 (= e!717595 e!717592)))

(declare-fun c!122992 () Bool)

(assert (=> b!1261126 (= c!122992 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!138805 c!122994) b!1261108))

(assert (= (and d!138805 (not c!122994)) b!1261106))

(assert (= (and b!1261106 c!122995) b!1261118))

(assert (= (and b!1261106 (not c!122995)) b!1261117))

(assert (= (and b!1261117 c!122993) b!1261116))

(assert (= (and b!1261117 (not c!122993)) b!1261115))

(assert (= (or b!1261116 b!1261115) bm!61971))

(assert (= (or b!1261118 bm!61971) bm!61969))

(assert (= (or b!1261118 b!1261116) bm!61973))

(assert (= (or b!1261108 bm!61969) bm!61974))

(assert (= (or b!1261108 bm!61973) bm!61972))

(assert (= (and d!138805 res!840119) b!1261113))

(assert (= (and d!138805 c!122996) b!1261114))

(assert (= (and d!138805 (not c!122996)) b!1261125))

(assert (= (and d!138805 res!840118) b!1261123))

(assert (= (and b!1261123 res!840116) b!1261124))

(assert (= (and b!1261123 (not res!840123)) b!1261107))

(assert (= (and b!1261107 res!840122) b!1261120))

(assert (= (and b!1261123 res!840124) b!1261110))

(assert (= (and b!1261110 c!122991) b!1261121))

(assert (= (and b!1261110 (not c!122991)) b!1261109))

(assert (= (and b!1261121 res!840121) b!1261119))

(assert (= (or b!1261121 b!1261109) bm!61968))

(assert (= (and b!1261110 res!840117) b!1261126))

(assert (= (and b!1261126 c!122992) b!1261111))

(assert (= (and b!1261126 (not c!122992)) b!1261122))

(assert (= (and b!1261111 res!840120) b!1261112))

(assert (= (or b!1261111 b!1261122) bm!61970))

(declare-fun b_lambda!22747 () Bool)

(assert (=> (not b_lambda!22747) (not b!1261120)))

(assert (=> b!1261120 t!41654))

(declare-fun b_and!45227 () Bool)

(assert (= b_and!45225 (and (=> t!41654 result!23333) b_and!45227)))

(declare-fun m!1161971 () Bool)

(assert (=> bm!61968 m!1161971))

(declare-fun m!1161973 () Bool)

(assert (=> b!1261114 m!1161973))

(declare-fun m!1161975 () Bool)

(assert (=> b!1261114 m!1161975))

(assert (=> b!1261114 m!1161843))

(declare-fun m!1161977 () Bool)

(assert (=> b!1261114 m!1161977))

(declare-fun m!1161979 () Bool)

(assert (=> b!1261114 m!1161979))

(declare-fun m!1161981 () Bool)

(assert (=> b!1261114 m!1161981))

(assert (=> b!1261114 m!1161981))

(declare-fun m!1161983 () Bool)

(assert (=> b!1261114 m!1161983))

(declare-fun m!1161985 () Bool)

(assert (=> b!1261114 m!1161985))

(declare-fun m!1161987 () Bool)

(assert (=> b!1261114 m!1161987))

(declare-fun m!1161989 () Bool)

(assert (=> b!1261114 m!1161989))

(declare-fun m!1161991 () Bool)

(assert (=> b!1261114 m!1161991))

(declare-fun m!1161993 () Bool)

(assert (=> b!1261114 m!1161993))

(assert (=> b!1261114 m!1161745))

(declare-fun m!1161995 () Bool)

(assert (=> b!1261114 m!1161995))

(declare-fun m!1161997 () Bool)

(assert (=> b!1261114 m!1161997))

(declare-fun m!1161999 () Bool)

(assert (=> b!1261114 m!1161999))

(declare-fun m!1162001 () Bool)

(assert (=> b!1261114 m!1162001))

(assert (=> b!1261114 m!1161995))

(assert (=> b!1261114 m!1161977))

(assert (=> b!1261114 m!1161991))

(declare-fun m!1162003 () Bool)

(assert (=> bm!61972 m!1162003))

(declare-fun m!1162005 () Bool)

(assert (=> b!1261112 m!1162005))

(assert (=> b!1261113 m!1161843))

(assert (=> b!1261113 m!1161843))

(assert (=> b!1261113 m!1161863))

(assert (=> b!1261124 m!1161843))

(assert (=> b!1261124 m!1161843))

(assert (=> b!1261124 m!1161863))

(declare-fun m!1162007 () Bool)

(assert (=> b!1261119 m!1162007))

(assert (=> d!138805 m!1161765))

(assert (=> bm!61974 m!1161745))

(declare-fun m!1162009 () Bool)

(assert (=> b!1261108 m!1162009))

(assert (=> b!1261120 m!1161843))

(assert (=> b!1261120 m!1161843))

(declare-fun m!1162011 () Bool)

(assert (=> b!1261120 m!1162011))

(assert (=> b!1261120 m!1161845))

(assert (=> b!1261120 m!1161847))

(assert (=> b!1261120 m!1161845))

(assert (=> b!1261120 m!1161849))

(assert (=> b!1261120 m!1161847))

(declare-fun m!1162013 () Bool)

(assert (=> bm!61970 m!1162013))

(assert (=> b!1261107 m!1161843))

(assert (=> b!1261107 m!1161843))

(declare-fun m!1162015 () Bool)

(assert (=> b!1261107 m!1162015))

(assert (=> b!1260921 d!138805))

(declare-fun d!138807 () Bool)

(assert (=> d!138807 (= (-!2092 (+!4262 lt!570742 (tuple2!20935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) #b1000000000000000000000000000000000000000000000000000000000000000) lt!570742)))

(declare-fun lt!570943 () Unit!41982)

(declare-fun choose!1869 (ListLongMap!18815 (_ BitVec 64) V!48335) Unit!41982)

(assert (=> d!138807 (= lt!570943 (choose!1869 lt!570742 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(assert (=> d!138807 (not (contains!7601 lt!570742 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138807 (= (addThenRemoveForNewKeyIsSame!346 lt!570742 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43) lt!570943)))

(declare-fun bs!35657 () Bool)

(assert (= bs!35657 d!138807))

(assert (=> bs!35657 m!1161757))

(assert (=> bs!35657 m!1161757))

(declare-fun m!1162017 () Bool)

(assert (=> bs!35657 m!1162017))

(declare-fun m!1162019 () Bool)

(assert (=> bs!35657 m!1162019))

(declare-fun m!1162021 () Bool)

(assert (=> bs!35657 m!1162021))

(assert (=> b!1260921 d!138807))

(declare-fun b!1261135 () Bool)

(declare-fun e!717608 () Bool)

(declare-fun e!717610 () Bool)

(assert (=> b!1261135 (= e!717608 e!717610)))

(declare-fun lt!570952 () (_ BitVec 64))

(assert (=> b!1261135 (= lt!570952 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!570950 () Unit!41982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82123 (_ BitVec 64) (_ BitVec 32)) Unit!41982)

(assert (=> b!1261135 (= lt!570950 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!570952 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1261135 (arrayContainsKey!0 _keys!1118 lt!570952 #b00000000000000000000000000000000)))

(declare-fun lt!570951 () Unit!41982)

(assert (=> b!1261135 (= lt!570951 lt!570950)))

(declare-fun res!840130 () Bool)

(declare-datatypes ((SeekEntryResult!9926 0))(
  ( (MissingZero!9926 (index!42075 (_ BitVec 32))) (Found!9926 (index!42076 (_ BitVec 32))) (Intermediate!9926 (undefined!10738 Bool) (index!42077 (_ BitVec 32)) (x!110955 (_ BitVec 32))) (Undefined!9926) (MissingVacant!9926 (index!42078 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82123 (_ BitVec 32)) SeekEntryResult!9926)

(assert (=> b!1261135 (= res!840130 (= (seekEntryOrOpen!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9926 #b00000000000000000000000000000000)))))

(assert (=> b!1261135 (=> (not res!840130) (not e!717610))))

(declare-fun b!1261136 () Bool)

(declare-fun call!61980 () Bool)

(assert (=> b!1261136 (= e!717610 call!61980)))

(declare-fun bm!61977 () Bool)

(assert (=> bm!61977 (= call!61980 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1261138 () Bool)

(assert (=> b!1261138 (= e!717608 call!61980)))

(declare-fun d!138809 () Bool)

(declare-fun res!840129 () Bool)

(declare-fun e!717609 () Bool)

(assert (=> d!138809 (=> res!840129 e!717609)))

(assert (=> d!138809 (= res!840129 (bvsge #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(assert (=> d!138809 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!717609)))

(declare-fun b!1261137 () Bool)

(assert (=> b!1261137 (= e!717609 e!717608)))

(declare-fun c!122999 () Bool)

(assert (=> b!1261137 (= c!122999 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138809 (not res!840129)) b!1261137))

(assert (= (and b!1261137 c!122999) b!1261135))

(assert (= (and b!1261137 (not c!122999)) b!1261138))

(assert (= (and b!1261135 res!840130) b!1261136))

(assert (= (or b!1261136 b!1261138) bm!61977))

(assert (=> b!1261135 m!1161843))

(declare-fun m!1162023 () Bool)

(assert (=> b!1261135 m!1162023))

(declare-fun m!1162025 () Bool)

(assert (=> b!1261135 m!1162025))

(assert (=> b!1261135 m!1161843))

(declare-fun m!1162027 () Bool)

(assert (=> b!1261135 m!1162027))

(declare-fun m!1162029 () Bool)

(assert (=> bm!61977 m!1162029))

(assert (=> b!1261137 m!1161843))

(assert (=> b!1261137 m!1161843))

(assert (=> b!1261137 m!1161863))

(assert (=> b!1260917 d!138809))

(declare-fun d!138811 () Bool)

(assert (=> d!138811 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105964 d!138811))

(declare-fun d!138813 () Bool)

(assert (=> d!138813 (= (array_inv!30305 _keys!1118) (bvsge (size!40149 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105964 d!138813))

(declare-fun d!138815 () Bool)

(assert (=> d!138815 (= (array_inv!30306 _values!914) (bvsge (size!40150 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105964 d!138815))

(declare-fun d!138817 () Bool)

(declare-fun res!840138 () Bool)

(declare-fun e!717622 () Bool)

(assert (=> d!138817 (=> res!840138 e!717622)))

(assert (=> d!138817 (= res!840138 (bvsge #b00000000000000000000000000000000 (size!40149 _keys!1118)))))

(assert (=> d!138817 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28158) e!717622)))

(declare-fun b!1261149 () Bool)

(declare-fun e!717620 () Bool)

(declare-fun call!61983 () Bool)

(assert (=> b!1261149 (= e!717620 call!61983)))

(declare-fun b!1261150 () Bool)

(declare-fun e!717621 () Bool)

(assert (=> b!1261150 (= e!717621 e!717620)))

(declare-fun c!123002 () Bool)

(assert (=> b!1261150 (= c!123002 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261151 () Bool)

(assert (=> b!1261151 (= e!717620 call!61983)))

(declare-fun b!1261152 () Bool)

(declare-fun e!717619 () Bool)

(declare-fun contains!7603 (List!28161 (_ BitVec 64)) Bool)

(assert (=> b!1261152 (= e!717619 (contains!7603 Nil!28158 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1261153 () Bool)

(assert (=> b!1261153 (= e!717622 e!717621)))

(declare-fun res!840137 () Bool)

(assert (=> b!1261153 (=> (not res!840137) (not e!717621))))

(assert (=> b!1261153 (= res!840137 (not e!717619))))

(declare-fun res!840139 () Bool)

(assert (=> b!1261153 (=> (not res!840139) (not e!717619))))

(assert (=> b!1261153 (= res!840139 (validKeyInArray!0 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61980 () Bool)

(assert (=> bm!61980 (= call!61983 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123002 (Cons!28157 (select (arr!39612 _keys!1118) #b00000000000000000000000000000000) Nil!28158) Nil!28158)))))

(assert (= (and d!138817 (not res!840138)) b!1261153))

(assert (= (and b!1261153 res!840139) b!1261152))

(assert (= (and b!1261153 res!840137) b!1261150))

(assert (= (and b!1261150 c!123002) b!1261151))

(assert (= (and b!1261150 (not c!123002)) b!1261149))

(assert (= (or b!1261151 b!1261149) bm!61980))

(assert (=> b!1261150 m!1161843))

(assert (=> b!1261150 m!1161843))

(assert (=> b!1261150 m!1161863))

(assert (=> b!1261152 m!1161843))

(assert (=> b!1261152 m!1161843))

(declare-fun m!1162031 () Bool)

(assert (=> b!1261152 m!1162031))

(assert (=> b!1261153 m!1161843))

(assert (=> b!1261153 m!1161843))

(assert (=> b!1261153 m!1161863))

(assert (=> bm!61980 m!1161843))

(declare-fun m!1162033 () Bool)

(assert (=> bm!61980 m!1162033))

(assert (=> b!1260915 d!138817))

(declare-fun d!138819 () Bool)

(declare-fun e!717623 () Bool)

(assert (=> d!138819 e!717623))

(declare-fun res!840141 () Bool)

(assert (=> d!138819 (=> (not res!840141) (not e!717623))))

(declare-fun lt!570953 () ListLongMap!18815)

(assert (=> d!138819 (= res!840141 (contains!7601 lt!570953 (_1!10478 lt!570743)))))

(declare-fun lt!570954 () List!28162)

(assert (=> d!138819 (= lt!570953 (ListLongMap!18816 lt!570954))))

(declare-fun lt!570955 () Unit!41982)

(declare-fun lt!570956 () Unit!41982)

(assert (=> d!138819 (= lt!570955 lt!570956)))

(assert (=> d!138819 (= (getValueByKey!654 lt!570954 (_1!10478 lt!570743)) (Some!704 (_2!10478 lt!570743)))))

(assert (=> d!138819 (= lt!570956 (lemmaContainsTupThenGetReturnValue!332 lt!570954 (_1!10478 lt!570743) (_2!10478 lt!570743)))))

(assert (=> d!138819 (= lt!570954 (insertStrictlySorted!446 (toList!9423 lt!570745) (_1!10478 lt!570743) (_2!10478 lt!570743)))))

(assert (=> d!138819 (= (+!4262 lt!570745 lt!570743) lt!570953)))

(declare-fun b!1261154 () Bool)

(declare-fun res!840140 () Bool)

(assert (=> b!1261154 (=> (not res!840140) (not e!717623))))

(assert (=> b!1261154 (= res!840140 (= (getValueByKey!654 (toList!9423 lt!570953) (_1!10478 lt!570743)) (Some!704 (_2!10478 lt!570743))))))

(declare-fun b!1261155 () Bool)

(assert (=> b!1261155 (= e!717623 (contains!7602 (toList!9423 lt!570953) lt!570743))))

(assert (= (and d!138819 res!840141) b!1261154))

(assert (= (and b!1261154 res!840140) b!1261155))

(declare-fun m!1162035 () Bool)

(assert (=> d!138819 m!1162035))

(declare-fun m!1162037 () Bool)

(assert (=> d!138819 m!1162037))

(declare-fun m!1162039 () Bool)

(assert (=> d!138819 m!1162039))

(declare-fun m!1162041 () Bool)

(assert (=> d!138819 m!1162041))

(declare-fun m!1162043 () Bool)

(assert (=> b!1261154 m!1162043))

(declare-fun m!1162045 () Bool)

(assert (=> b!1261155 m!1162045))

(assert (=> b!1260923 d!138819))

(declare-fun mapIsEmpty!50146 () Bool)

(declare-fun mapRes!50146 () Bool)

(assert (=> mapIsEmpty!50146 mapRes!50146))

(declare-fun b!1261162 () Bool)

(declare-fun e!717628 () Bool)

(assert (=> b!1261162 (= e!717628 tp_is_empty!32227)))

(declare-fun b!1261163 () Bool)

(declare-fun e!717629 () Bool)

(assert (=> b!1261163 (= e!717629 tp_is_empty!32227)))

(declare-fun mapNonEmpty!50146 () Bool)

(declare-fun tp!95516 () Bool)

(assert (=> mapNonEmpty!50146 (= mapRes!50146 (and tp!95516 e!717628))))

(declare-fun mapRest!50146 () (Array (_ BitVec 32) ValueCell!15350))

(declare-fun mapKey!50146 () (_ BitVec 32))

(declare-fun mapValue!50146 () ValueCell!15350)

(assert (=> mapNonEmpty!50146 (= mapRest!50137 (store mapRest!50146 mapKey!50146 mapValue!50146))))

(declare-fun condMapEmpty!50146 () Bool)

(declare-fun mapDefault!50146 () ValueCell!15350)

(assert (=> mapNonEmpty!50137 (= condMapEmpty!50146 (= mapRest!50137 ((as const (Array (_ BitVec 32) ValueCell!15350)) mapDefault!50146)))))

(assert (=> mapNonEmpty!50137 (= tp!95500 (and e!717629 mapRes!50146))))

(assert (= (and mapNonEmpty!50137 condMapEmpty!50146) mapIsEmpty!50146))

(assert (= (and mapNonEmpty!50137 (not condMapEmpty!50146)) mapNonEmpty!50146))

(assert (= (and mapNonEmpty!50146 ((_ is ValueCellFull!15350) mapValue!50146)) b!1261162))

(assert (= (and mapNonEmpty!50137 ((_ is ValueCellFull!15350) mapDefault!50146)) b!1261163))

(declare-fun m!1162047 () Bool)

(assert (=> mapNonEmpty!50146 m!1162047))

(declare-fun b_lambda!22749 () Bool)

(assert (= b_lambda!22741 (or (and start!105964 b_free!27325) b_lambda!22749)))

(declare-fun b_lambda!22751 () Bool)

(assert (= b_lambda!22747 (or (and start!105964 b_free!27325) b_lambda!22751)))

(declare-fun b_lambda!22753 () Bool)

(assert (= b_lambda!22745 (or (and start!105964 b_free!27325) b_lambda!22753)))

(declare-fun b_lambda!22755 () Bool)

(assert (= b_lambda!22743 (or (and start!105964 b_free!27325) b_lambda!22755)))

(declare-fun b_lambda!22757 () Bool)

(assert (= b_lambda!22737 (or (and start!105964 b_free!27325) b_lambda!22757)))

(declare-fun b_lambda!22759 () Bool)

(assert (= b_lambda!22739 (or (and start!105964 b_free!27325) b_lambda!22759)))

(check-sat (not d!138795) (not b!1261028) (not b!1261153) (not b!1261099) (not b!1261041) (not b!1261113) (not bm!61961) (not bm!61970) (not b_lambda!22753) (not b!1261017) (not d!138805) (not b!1261027) (not b!1261155) (not b!1261107) (not b!1261098) (not d!138789) (not bm!61945) (not b_lambda!22749) (not b!1261150) (not bm!61946) (not b_lambda!22751) (not b!1261025) (not b!1261093) (not d!138803) b_and!45227 (not b!1261120) (not bm!61980) (not b!1261124) (not b!1261103) (not b!1261018) (not b!1261092) (not b!1261119) (not d!138797) (not b!1261152) (not b!1261015) (not b!1261020) (not b!1261013) (not b!1261010) (not bm!61968) (not d!138799) (not bm!61967) (not b!1261011) tp_is_empty!32227 (not b!1261087) (not bm!61963) (not bm!61977) (not b!1261034) (not bm!61974) (not b!1261014) (not b!1261154) (not b!1261042) (not b!1261112) (not b!1261086) (not b!1261029) (not b!1261114) (not b_lambda!22757) (not b!1261024) (not b!1261031) (not bm!61972) (not d!138807) (not bm!61965) (not b!1261039) (not b!1261137) (not b!1261040) (not b_lambda!22755) (not d!138791) (not b_lambda!22759) (not b!1261032) (not b!1261108) (not d!138793) (not d!138801) (not b!1261091) (not b_next!27325) (not d!138819) (not b!1261135) (not mapNonEmpty!50146))
(check-sat b_and!45227 (not b_next!27325))
