; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106134 () Bool)

(assert start!106134)

(declare-fun b_free!27451 () Bool)

(declare-fun b_next!27451 () Bool)

(assert (=> start!106134 (= b_free!27451 (not b_next!27451))))

(declare-fun tp!95884 () Bool)

(declare-fun b_and!45361 () Bool)

(assert (=> start!106134 (= tp!95884 b_and!45361)))

(declare-fun b!1262788 () Bool)

(declare-fun e!718825 () Bool)

(declare-fun tp_is_empty!32353 () Bool)

(assert (=> b!1262788 (= e!718825 tp_is_empty!32353)))

(declare-fun b!1262789 () Bool)

(declare-fun e!718827 () Bool)

(assert (=> b!1262789 (= e!718827 tp_is_empty!32353)))

(declare-fun b!1262790 () Bool)

(declare-fun res!841118 () Bool)

(declare-fun e!718823 () Bool)

(assert (=> b!1262790 (=> (not res!841118) (not e!718823))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82365 0))(
  ( (array!82366 (arr!39731 (Array (_ BitVec 32) (_ BitVec 64))) (size!40268 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82365)

(declare-datatypes ((V!48503 0))(
  ( (V!48504 (val!16239 Int)) )
))
(declare-datatypes ((ValueCell!15413 0))(
  ( (ValueCellFull!15413 (v!18939 V!48503)) (EmptyCell!15413) )
))
(declare-datatypes ((array!82367 0))(
  ( (array!82368 (arr!39732 (Array (_ BitVec 32) ValueCell!15413)) (size!40269 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82367)

(assert (=> b!1262790 (= res!841118 (and (= (size!40269 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40268 _keys!1118) (size!40269 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50332 () Bool)

(declare-fun mapRes!50332 () Bool)

(declare-fun tp!95885 () Bool)

(assert (=> mapNonEmpty!50332 (= mapRes!50332 (and tp!95885 e!718825))))

(declare-fun mapKey!50332 () (_ BitVec 32))

(declare-fun mapValue!50332 () ValueCell!15413)

(declare-fun mapRest!50332 () (Array (_ BitVec 32) ValueCell!15413))

(assert (=> mapNonEmpty!50332 (= (arr!39732 _values!914) (store mapRest!50332 mapKey!50332 mapValue!50332))))

(declare-fun res!841119 () Bool)

(assert (=> start!106134 (=> (not res!841119) (not e!718823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106134 (= res!841119 (validMask!0 mask!1466))))

(assert (=> start!106134 e!718823))

(assert (=> start!106134 true))

(assert (=> start!106134 tp!95884))

(assert (=> start!106134 tp_is_empty!32353))

(declare-fun array_inv!30397 (array!82365) Bool)

(assert (=> start!106134 (array_inv!30397 _keys!1118)))

(declare-fun e!718824 () Bool)

(declare-fun array_inv!30398 (array!82367) Bool)

(assert (=> start!106134 (and (array_inv!30398 _values!914) e!718824)))

(declare-fun b!1262791 () Bool)

(declare-fun res!841121 () Bool)

(assert (=> b!1262791 (=> (not res!841121) (not e!718823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82365 (_ BitVec 32)) Bool)

(assert (=> b!1262791 (= res!841121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!50332 () Bool)

(assert (=> mapIsEmpty!50332 mapRes!50332))

(declare-fun b!1262792 () Bool)

(assert (=> b!1262792 (= e!718824 (and e!718827 mapRes!50332))))

(declare-fun condMapEmpty!50332 () Bool)

(declare-fun mapDefault!50332 () ValueCell!15413)

(assert (=> b!1262792 (= condMapEmpty!50332 (= (arr!39732 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15413)) mapDefault!50332)))))

(declare-fun b!1262793 () Bool)

(assert (=> b!1262793 (= e!718823 (bvsgt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48503)

(declare-fun zeroValue!871 () V!48503)

(declare-datatypes ((tuple2!21030 0))(
  ( (tuple2!21031 (_1!10526 (_ BitVec 64)) (_2!10526 V!48503)) )
))
(declare-datatypes ((List!28252 0))(
  ( (Nil!28249) (Cons!28248 (h!29466 tuple2!21030) (t!41743 List!28252)) )
))
(declare-datatypes ((ListLongMap!18911 0))(
  ( (ListLongMap!18912 (toList!9471 List!28252)) )
))
(declare-fun lt!572124 () ListLongMap!18911)

(declare-fun getCurrentListMapNoExtraKeys!5877 (array!82365 array!82367 (_ BitVec 32) (_ BitVec 32) V!48503 V!48503 (_ BitVec 32) Int) ListLongMap!18911)

(assert (=> b!1262793 (= lt!572124 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572125 () ListLongMap!18911)

(declare-fun minValueBefore!43 () V!48503)

(assert (=> b!1262793 (= lt!572125 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262794 () Bool)

(declare-fun res!841120 () Bool)

(assert (=> b!1262794 (=> (not res!841120) (not e!718823))))

(declare-datatypes ((List!28253 0))(
  ( (Nil!28250) (Cons!28249 (h!29467 (_ BitVec 64)) (t!41744 List!28253)) )
))
(declare-fun arrayNoDuplicates!0 (array!82365 (_ BitVec 32) List!28253) Bool)

(assert (=> b!1262794 (= res!841120 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28250))))

(assert (= (and start!106134 res!841119) b!1262790))

(assert (= (and b!1262790 res!841118) b!1262791))

(assert (= (and b!1262791 res!841121) b!1262794))

(assert (= (and b!1262794 res!841120) b!1262793))

(assert (= (and b!1262792 condMapEmpty!50332) mapIsEmpty!50332))

(assert (= (and b!1262792 (not condMapEmpty!50332)) mapNonEmpty!50332))

(get-info :version)

(assert (= (and mapNonEmpty!50332 ((_ is ValueCellFull!15413) mapValue!50332)) b!1262788))

(assert (= (and b!1262792 ((_ is ValueCellFull!15413) mapDefault!50332)) b!1262789))

(assert (= start!106134 b!1262792))

(declare-fun m!1163709 () Bool)

(assert (=> start!106134 m!1163709))

(declare-fun m!1163711 () Bool)

(assert (=> start!106134 m!1163711))

(declare-fun m!1163713 () Bool)

(assert (=> start!106134 m!1163713))

(declare-fun m!1163715 () Bool)

(assert (=> b!1262794 m!1163715))

(declare-fun m!1163717 () Bool)

(assert (=> b!1262791 m!1163717))

(declare-fun m!1163719 () Bool)

(assert (=> mapNonEmpty!50332 m!1163719))

(declare-fun m!1163721 () Bool)

(assert (=> b!1262793 m!1163721))

(declare-fun m!1163723 () Bool)

(assert (=> b!1262793 m!1163723))

(check-sat (not b!1262791) b_and!45361 (not b!1262794) (not start!106134) (not b!1262793) (not b_next!27451) (not mapNonEmpty!50332) tp_is_empty!32353)
(check-sat b_and!45361 (not b_next!27451))
(get-model)

(declare-fun d!138895 () Bool)

(declare-fun res!841151 () Bool)

(declare-fun e!718866 () Bool)

(assert (=> d!138895 (=> res!841151 e!718866)))

(assert (=> d!138895 (= res!841151 (bvsge #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> d!138895 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718866)))

(declare-fun b!1262845 () Bool)

(declare-fun e!718865 () Bool)

(declare-fun call!62024 () Bool)

(assert (=> b!1262845 (= e!718865 call!62024)))

(declare-fun bm!62021 () Bool)

(assert (=> bm!62021 (= call!62024 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1262846 () Bool)

(declare-fun e!718864 () Bool)

(assert (=> b!1262846 (= e!718866 e!718864)))

(declare-fun c!123051 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1262846 (= c!123051 (validKeyInArray!0 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262847 () Bool)

(assert (=> b!1262847 (= e!718864 call!62024)))

(declare-fun b!1262848 () Bool)

(assert (=> b!1262848 (= e!718864 e!718865)))

(declare-fun lt!572146 () (_ BitVec 64))

(assert (=> b!1262848 (= lt!572146 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42036 0))(
  ( (Unit!42037) )
))
(declare-fun lt!572145 () Unit!42036)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82365 (_ BitVec 64) (_ BitVec 32)) Unit!42036)

(assert (=> b!1262848 (= lt!572145 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!572146 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1262848 (arrayContainsKey!0 _keys!1118 lt!572146 #b00000000000000000000000000000000)))

(declare-fun lt!572144 () Unit!42036)

(assert (=> b!1262848 (= lt!572144 lt!572145)))

(declare-fun res!841150 () Bool)

(declare-datatypes ((SeekEntryResult!9928 0))(
  ( (MissingZero!9928 (index!42083 (_ BitVec 32))) (Found!9928 (index!42084 (_ BitVec 32))) (Intermediate!9928 (undefined!10740 Bool) (index!42085 (_ BitVec 32)) (x!111147 (_ BitVec 32))) (Undefined!9928) (MissingVacant!9928 (index!42086 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82365 (_ BitVec 32)) SeekEntryResult!9928)

(assert (=> b!1262848 (= res!841150 (= (seekEntryOrOpen!0 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9928 #b00000000000000000000000000000000)))))

(assert (=> b!1262848 (=> (not res!841150) (not e!718865))))

(assert (= (and d!138895 (not res!841151)) b!1262846))

(assert (= (and b!1262846 c!123051) b!1262848))

(assert (= (and b!1262846 (not c!123051)) b!1262847))

(assert (= (and b!1262848 res!841150) b!1262845))

(assert (= (or b!1262845 b!1262847) bm!62021))

(declare-fun m!1163757 () Bool)

(assert (=> bm!62021 m!1163757))

(declare-fun m!1163759 () Bool)

(assert (=> b!1262846 m!1163759))

(assert (=> b!1262846 m!1163759))

(declare-fun m!1163761 () Bool)

(assert (=> b!1262846 m!1163761))

(assert (=> b!1262848 m!1163759))

(declare-fun m!1163763 () Bool)

(assert (=> b!1262848 m!1163763))

(declare-fun m!1163765 () Bool)

(assert (=> b!1262848 m!1163765))

(assert (=> b!1262848 m!1163759))

(declare-fun m!1163767 () Bool)

(assert (=> b!1262848 m!1163767))

(assert (=> b!1262791 d!138895))

(declare-fun b!1262873 () Bool)

(declare-fun e!718883 () ListLongMap!18911)

(declare-fun e!718882 () ListLongMap!18911)

(assert (=> b!1262873 (= e!718883 e!718882)))

(declare-fun c!123062 () Bool)

(assert (=> b!1262873 (= c!123062 (validKeyInArray!0 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262874 () Bool)

(declare-fun e!718886 () Bool)

(declare-fun lt!572162 () ListLongMap!18911)

(declare-fun isEmpty!1040 (ListLongMap!18911) Bool)

(assert (=> b!1262874 (= e!718886 (isEmpty!1040 lt!572162))))

(declare-fun b!1262875 () Bool)

(declare-fun res!841161 () Bool)

(declare-fun e!718885 () Bool)

(assert (=> b!1262875 (=> (not res!841161) (not e!718885))))

(declare-fun contains!7607 (ListLongMap!18911 (_ BitVec 64)) Bool)

(assert (=> b!1262875 (= res!841161 (not (contains!7607 lt!572162 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262876 () Bool)

(declare-fun lt!572164 () Unit!42036)

(declare-fun lt!572165 () Unit!42036)

(assert (=> b!1262876 (= lt!572164 lt!572165)))

(declare-fun lt!572161 () ListLongMap!18911)

(declare-fun lt!572166 () V!48503)

(declare-fun lt!572163 () (_ BitVec 64))

(declare-fun lt!572167 () (_ BitVec 64))

(declare-fun +!4286 (ListLongMap!18911 tuple2!21030) ListLongMap!18911)

(assert (=> b!1262876 (not (contains!7607 (+!4286 lt!572161 (tuple2!21031 lt!572163 lt!572166)) lt!572167))))

(declare-fun addStillNotContains!324 (ListLongMap!18911 (_ BitVec 64) V!48503 (_ BitVec 64)) Unit!42036)

(assert (=> b!1262876 (= lt!572165 (addStillNotContains!324 lt!572161 lt!572163 lt!572166 lt!572167))))

(assert (=> b!1262876 (= lt!572167 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20314 (ValueCell!15413 V!48503) V!48503)

(declare-fun dynLambda!3455 (Int (_ BitVec 64)) V!48503)

(assert (=> b!1262876 (= lt!572166 (get!20314 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3455 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262876 (= lt!572163 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62027 () ListLongMap!18911)

(assert (=> b!1262876 (= lt!572161 call!62027)))

(assert (=> b!1262876 (= e!718882 (+!4286 call!62027 (tuple2!21031 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000) (get!20314 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3455 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262877 () Bool)

(assert (=> b!1262877 (= e!718882 call!62027)))

(declare-fun b!1262878 () Bool)

(assert (=> b!1262878 (= e!718886 (= lt!572162 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262879 () Bool)

(assert (=> b!1262879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> b!1262879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40269 _values!914)))))

(declare-fun e!718881 () Bool)

(declare-fun apply!1003 (ListLongMap!18911 (_ BitVec 64)) V!48503)

(assert (=> b!1262879 (= e!718881 (= (apply!1003 lt!572162 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)) (get!20314 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3455 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262880 () Bool)

(declare-fun e!718887 () Bool)

(assert (=> b!1262880 (= e!718887 (validKeyInArray!0 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262880 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262882 () Bool)

(declare-fun e!718884 () Bool)

(assert (=> b!1262882 (= e!718884 e!718886)))

(declare-fun c!123060 () Bool)

(assert (=> b!1262882 (= c!123060 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun b!1262883 () Bool)

(assert (=> b!1262883 (= e!718885 e!718884)))

(declare-fun c!123063 () Bool)

(assert (=> b!1262883 (= c!123063 e!718887)))

(declare-fun res!841160 () Bool)

(assert (=> b!1262883 (=> (not res!841160) (not e!718887))))

(assert (=> b!1262883 (= res!841160 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun bm!62024 () Bool)

(assert (=> bm!62024 (= call!62027 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262884 () Bool)

(assert (=> b!1262884 (= e!718883 (ListLongMap!18912 Nil!28249))))

(declare-fun b!1262881 () Bool)

(assert (=> b!1262881 (= e!718884 e!718881)))

(assert (=> b!1262881 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun res!841162 () Bool)

(assert (=> b!1262881 (= res!841162 (contains!7607 lt!572162 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262881 (=> (not res!841162) (not e!718881))))

(declare-fun d!138897 () Bool)

(assert (=> d!138897 e!718885))

(declare-fun res!841163 () Bool)

(assert (=> d!138897 (=> (not res!841163) (not e!718885))))

(assert (=> d!138897 (= res!841163 (not (contains!7607 lt!572162 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138897 (= lt!572162 e!718883)))

(declare-fun c!123061 () Bool)

(assert (=> d!138897 (= c!123061 (bvsge #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> d!138897 (validMask!0 mask!1466)))

(assert (=> d!138897 (= (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572162)))

(assert (= (and d!138897 c!123061) b!1262884))

(assert (= (and d!138897 (not c!123061)) b!1262873))

(assert (= (and b!1262873 c!123062) b!1262876))

(assert (= (and b!1262873 (not c!123062)) b!1262877))

(assert (= (or b!1262876 b!1262877) bm!62024))

(assert (= (and d!138897 res!841163) b!1262875))

(assert (= (and b!1262875 res!841161) b!1262883))

(assert (= (and b!1262883 res!841160) b!1262880))

(assert (= (and b!1262883 c!123063) b!1262881))

(assert (= (and b!1262883 (not c!123063)) b!1262882))

(assert (= (and b!1262881 res!841162) b!1262879))

(assert (= (and b!1262882 c!123060) b!1262878))

(assert (= (and b!1262882 (not c!123060)) b!1262874))

(declare-fun b_lambda!22785 () Bool)

(assert (=> (not b_lambda!22785) (not b!1262876)))

(declare-fun t!41749 () Bool)

(declare-fun tb!11307 () Bool)

(assert (=> (and start!106134 (= defaultEntry!922 defaultEntry!922) t!41749) tb!11307))

(declare-fun result!23345 () Bool)

(assert (=> tb!11307 (= result!23345 tp_is_empty!32353)))

(assert (=> b!1262876 t!41749))

(declare-fun b_and!45367 () Bool)

(assert (= b_and!45361 (and (=> t!41749 result!23345) b_and!45367)))

(declare-fun b_lambda!22787 () Bool)

(assert (=> (not b_lambda!22787) (not b!1262879)))

(assert (=> b!1262879 t!41749))

(declare-fun b_and!45369 () Bool)

(assert (= b_and!45367 (and (=> t!41749 result!23345) b_and!45369)))

(assert (=> b!1262879 m!1163759))

(declare-fun m!1163769 () Bool)

(assert (=> b!1262879 m!1163769))

(declare-fun m!1163771 () Bool)

(assert (=> b!1262879 m!1163771))

(assert (=> b!1262879 m!1163771))

(declare-fun m!1163773 () Bool)

(assert (=> b!1262879 m!1163773))

(declare-fun m!1163775 () Bool)

(assert (=> b!1262879 m!1163775))

(assert (=> b!1262879 m!1163773))

(assert (=> b!1262879 m!1163759))

(declare-fun m!1163777 () Bool)

(assert (=> d!138897 m!1163777))

(assert (=> d!138897 m!1163709))

(declare-fun m!1163779 () Bool)

(assert (=> b!1262874 m!1163779))

(assert (=> b!1262873 m!1163759))

(assert (=> b!1262873 m!1163759))

(assert (=> b!1262873 m!1163761))

(declare-fun m!1163781 () Bool)

(assert (=> bm!62024 m!1163781))

(declare-fun m!1163783 () Bool)

(assert (=> b!1262875 m!1163783))

(assert (=> b!1262881 m!1163759))

(assert (=> b!1262881 m!1163759))

(declare-fun m!1163785 () Bool)

(assert (=> b!1262881 m!1163785))

(declare-fun m!1163787 () Bool)

(assert (=> b!1262876 m!1163787))

(assert (=> b!1262876 m!1163773))

(assert (=> b!1262876 m!1163759))

(declare-fun m!1163789 () Bool)

(assert (=> b!1262876 m!1163789))

(declare-fun m!1163791 () Bool)

(assert (=> b!1262876 m!1163791))

(declare-fun m!1163793 () Bool)

(assert (=> b!1262876 m!1163793))

(assert (=> b!1262876 m!1163771))

(assert (=> b!1262876 m!1163791))

(assert (=> b!1262876 m!1163771))

(assert (=> b!1262876 m!1163773))

(assert (=> b!1262876 m!1163775))

(assert (=> b!1262880 m!1163759))

(assert (=> b!1262880 m!1163759))

(assert (=> b!1262880 m!1163761))

(assert (=> b!1262878 m!1163781))

(assert (=> b!1262793 d!138897))

(declare-fun b!1262887 () Bool)

(declare-fun e!718890 () ListLongMap!18911)

(declare-fun e!718889 () ListLongMap!18911)

(assert (=> b!1262887 (= e!718890 e!718889)))

(declare-fun c!123066 () Bool)

(assert (=> b!1262887 (= c!123066 (validKeyInArray!0 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262888 () Bool)

(declare-fun e!718893 () Bool)

(declare-fun lt!572169 () ListLongMap!18911)

(assert (=> b!1262888 (= e!718893 (isEmpty!1040 lt!572169))))

(declare-fun b!1262889 () Bool)

(declare-fun res!841165 () Bool)

(declare-fun e!718892 () Bool)

(assert (=> b!1262889 (=> (not res!841165) (not e!718892))))

(assert (=> b!1262889 (= res!841165 (not (contains!7607 lt!572169 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1262890 () Bool)

(declare-fun lt!572171 () Unit!42036)

(declare-fun lt!572172 () Unit!42036)

(assert (=> b!1262890 (= lt!572171 lt!572172)))

(declare-fun lt!572173 () V!48503)

(declare-fun lt!572170 () (_ BitVec 64))

(declare-fun lt!572174 () (_ BitVec 64))

(declare-fun lt!572168 () ListLongMap!18911)

(assert (=> b!1262890 (not (contains!7607 (+!4286 lt!572168 (tuple2!21031 lt!572170 lt!572173)) lt!572174))))

(assert (=> b!1262890 (= lt!572172 (addStillNotContains!324 lt!572168 lt!572170 lt!572173 lt!572174))))

(assert (=> b!1262890 (= lt!572174 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262890 (= lt!572173 (get!20314 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3455 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262890 (= lt!572170 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62028 () ListLongMap!18911)

(assert (=> b!1262890 (= lt!572168 call!62028)))

(assert (=> b!1262890 (= e!718889 (+!4286 call!62028 (tuple2!21031 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000) (get!20314 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3455 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1262891 () Bool)

(assert (=> b!1262891 (= e!718889 call!62028)))

(declare-fun b!1262892 () Bool)

(assert (=> b!1262892 (= e!718893 (= lt!572169 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262893 () Bool)

(assert (=> b!1262893 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> b!1262893 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40269 _values!914)))))

(declare-fun e!718888 () Bool)

(assert (=> b!1262893 (= e!718888 (= (apply!1003 lt!572169 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)) (get!20314 (select (arr!39732 _values!914) #b00000000000000000000000000000000) (dynLambda!3455 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262894 () Bool)

(declare-fun e!718894 () Bool)

(assert (=> b!1262894 (= e!718894 (validKeyInArray!0 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262894 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262896 () Bool)

(declare-fun e!718891 () Bool)

(assert (=> b!1262896 (= e!718891 e!718893)))

(declare-fun c!123064 () Bool)

(assert (=> b!1262896 (= c!123064 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun b!1262897 () Bool)

(assert (=> b!1262897 (= e!718892 e!718891)))

(declare-fun c!123067 () Bool)

(assert (=> b!1262897 (= c!123067 e!718894)))

(declare-fun res!841164 () Bool)

(assert (=> b!1262897 (=> (not res!841164) (not e!718894))))

(assert (=> b!1262897 (= res!841164 (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun bm!62025 () Bool)

(assert (=> bm!62025 (= call!62028 (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262898 () Bool)

(assert (=> b!1262898 (= e!718890 (ListLongMap!18912 Nil!28249))))

(declare-fun b!1262895 () Bool)

(assert (=> b!1262895 (= e!718891 e!718888)))

(assert (=> b!1262895 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(declare-fun res!841166 () Bool)

(assert (=> b!1262895 (= res!841166 (contains!7607 lt!572169 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262895 (=> (not res!841166) (not e!718888))))

(declare-fun d!138899 () Bool)

(assert (=> d!138899 e!718892))

(declare-fun res!841167 () Bool)

(assert (=> d!138899 (=> (not res!841167) (not e!718892))))

(assert (=> d!138899 (= res!841167 (not (contains!7607 lt!572169 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138899 (= lt!572169 e!718890)))

(declare-fun c!123065 () Bool)

(assert (=> d!138899 (= c!123065 (bvsge #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> d!138899 (validMask!0 mask!1466)))

(assert (=> d!138899 (= (getCurrentListMapNoExtraKeys!5877 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572169)))

(assert (= (and d!138899 c!123065) b!1262898))

(assert (= (and d!138899 (not c!123065)) b!1262887))

(assert (= (and b!1262887 c!123066) b!1262890))

(assert (= (and b!1262887 (not c!123066)) b!1262891))

(assert (= (or b!1262890 b!1262891) bm!62025))

(assert (= (and d!138899 res!841167) b!1262889))

(assert (= (and b!1262889 res!841165) b!1262897))

(assert (= (and b!1262897 res!841164) b!1262894))

(assert (= (and b!1262897 c!123067) b!1262895))

(assert (= (and b!1262897 (not c!123067)) b!1262896))

(assert (= (and b!1262895 res!841166) b!1262893))

(assert (= (and b!1262896 c!123064) b!1262892))

(assert (= (and b!1262896 (not c!123064)) b!1262888))

(declare-fun b_lambda!22789 () Bool)

(assert (=> (not b_lambda!22789) (not b!1262890)))

(assert (=> b!1262890 t!41749))

(declare-fun b_and!45371 () Bool)

(assert (= b_and!45369 (and (=> t!41749 result!23345) b_and!45371)))

(declare-fun b_lambda!22791 () Bool)

(assert (=> (not b_lambda!22791) (not b!1262893)))

(assert (=> b!1262893 t!41749))

(declare-fun b_and!45373 () Bool)

(assert (= b_and!45371 (and (=> t!41749 result!23345) b_and!45373)))

(assert (=> b!1262893 m!1163759))

(declare-fun m!1163795 () Bool)

(assert (=> b!1262893 m!1163795))

(assert (=> b!1262893 m!1163771))

(assert (=> b!1262893 m!1163771))

(assert (=> b!1262893 m!1163773))

(assert (=> b!1262893 m!1163775))

(assert (=> b!1262893 m!1163773))

(assert (=> b!1262893 m!1163759))

(declare-fun m!1163797 () Bool)

(assert (=> d!138899 m!1163797))

(assert (=> d!138899 m!1163709))

(declare-fun m!1163799 () Bool)

(assert (=> b!1262888 m!1163799))

(assert (=> b!1262887 m!1163759))

(assert (=> b!1262887 m!1163759))

(assert (=> b!1262887 m!1163761))

(declare-fun m!1163801 () Bool)

(assert (=> bm!62025 m!1163801))

(declare-fun m!1163803 () Bool)

(assert (=> b!1262889 m!1163803))

(assert (=> b!1262895 m!1163759))

(assert (=> b!1262895 m!1163759))

(declare-fun m!1163805 () Bool)

(assert (=> b!1262895 m!1163805))

(declare-fun m!1163807 () Bool)

(assert (=> b!1262890 m!1163807))

(assert (=> b!1262890 m!1163773))

(assert (=> b!1262890 m!1163759))

(declare-fun m!1163809 () Bool)

(assert (=> b!1262890 m!1163809))

(declare-fun m!1163811 () Bool)

(assert (=> b!1262890 m!1163811))

(declare-fun m!1163813 () Bool)

(assert (=> b!1262890 m!1163813))

(assert (=> b!1262890 m!1163771))

(assert (=> b!1262890 m!1163811))

(assert (=> b!1262890 m!1163771))

(assert (=> b!1262890 m!1163773))

(assert (=> b!1262890 m!1163775))

(assert (=> b!1262894 m!1163759))

(assert (=> b!1262894 m!1163759))

(assert (=> b!1262894 m!1163761))

(assert (=> b!1262892 m!1163801))

(assert (=> b!1262793 d!138899))

(declare-fun b!1262909 () Bool)

(declare-fun e!718905 () Bool)

(declare-fun call!62031 () Bool)

(assert (=> b!1262909 (= e!718905 call!62031)))

(declare-fun bm!62028 () Bool)

(declare-fun c!123070 () Bool)

(assert (=> bm!62028 (= call!62031 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123070 (Cons!28249 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000) Nil!28250) Nil!28250)))))

(declare-fun b!1262910 () Bool)

(declare-fun e!718906 () Bool)

(declare-fun contains!7608 (List!28253 (_ BitVec 64)) Bool)

(assert (=> b!1262910 (= e!718906 (contains!7608 Nil!28250 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138901 () Bool)

(declare-fun res!841176 () Bool)

(declare-fun e!718903 () Bool)

(assert (=> d!138901 (=> res!841176 e!718903)))

(assert (=> d!138901 (= res!841176 (bvsge #b00000000000000000000000000000000 (size!40268 _keys!1118)))))

(assert (=> d!138901 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28250) e!718903)))

(declare-fun b!1262911 () Bool)

(declare-fun e!718904 () Bool)

(assert (=> b!1262911 (= e!718904 e!718905)))

(assert (=> b!1262911 (= c!123070 (validKeyInArray!0 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262912 () Bool)

(assert (=> b!1262912 (= e!718905 call!62031)))

(declare-fun b!1262913 () Bool)

(assert (=> b!1262913 (= e!718903 e!718904)))

(declare-fun res!841174 () Bool)

(assert (=> b!1262913 (=> (not res!841174) (not e!718904))))

(assert (=> b!1262913 (= res!841174 (not e!718906))))

(declare-fun res!841175 () Bool)

(assert (=> b!1262913 (=> (not res!841175) (not e!718906))))

(assert (=> b!1262913 (= res!841175 (validKeyInArray!0 (select (arr!39731 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138901 (not res!841176)) b!1262913))

(assert (= (and b!1262913 res!841175) b!1262910))

(assert (= (and b!1262913 res!841174) b!1262911))

(assert (= (and b!1262911 c!123070) b!1262909))

(assert (= (and b!1262911 (not c!123070)) b!1262912))

(assert (= (or b!1262909 b!1262912) bm!62028))

(assert (=> bm!62028 m!1163759))

(declare-fun m!1163815 () Bool)

(assert (=> bm!62028 m!1163815))

(assert (=> b!1262910 m!1163759))

(assert (=> b!1262910 m!1163759))

(declare-fun m!1163817 () Bool)

(assert (=> b!1262910 m!1163817))

(assert (=> b!1262911 m!1163759))

(assert (=> b!1262911 m!1163759))

(assert (=> b!1262911 m!1163761))

(assert (=> b!1262913 m!1163759))

(assert (=> b!1262913 m!1163759))

(assert (=> b!1262913 m!1163761))

(assert (=> b!1262794 d!138901))

(declare-fun d!138903 () Bool)

(assert (=> d!138903 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106134 d!138903))

(declare-fun d!138905 () Bool)

(assert (=> d!138905 (= (array_inv!30397 _keys!1118) (bvsge (size!40268 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106134 d!138905))

(declare-fun d!138907 () Bool)

(assert (=> d!138907 (= (array_inv!30398 _values!914) (bvsge (size!40269 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106134 d!138907))

(declare-fun b!1262921 () Bool)

(declare-fun e!718912 () Bool)

(assert (=> b!1262921 (= e!718912 tp_is_empty!32353)))

(declare-fun b!1262920 () Bool)

(declare-fun e!718911 () Bool)

(assert (=> b!1262920 (= e!718911 tp_is_empty!32353)))

(declare-fun condMapEmpty!50341 () Bool)

(declare-fun mapDefault!50341 () ValueCell!15413)

(assert (=> mapNonEmpty!50332 (= condMapEmpty!50341 (= mapRest!50332 ((as const (Array (_ BitVec 32) ValueCell!15413)) mapDefault!50341)))))

(declare-fun mapRes!50341 () Bool)

(assert (=> mapNonEmpty!50332 (= tp!95885 (and e!718912 mapRes!50341))))

(declare-fun mapNonEmpty!50341 () Bool)

(declare-fun tp!95900 () Bool)

(assert (=> mapNonEmpty!50341 (= mapRes!50341 (and tp!95900 e!718911))))

(declare-fun mapRest!50341 () (Array (_ BitVec 32) ValueCell!15413))

(declare-fun mapKey!50341 () (_ BitVec 32))

(declare-fun mapValue!50341 () ValueCell!15413)

(assert (=> mapNonEmpty!50341 (= mapRest!50332 (store mapRest!50341 mapKey!50341 mapValue!50341))))

(declare-fun mapIsEmpty!50341 () Bool)

(assert (=> mapIsEmpty!50341 mapRes!50341))

(assert (= (and mapNonEmpty!50332 condMapEmpty!50341) mapIsEmpty!50341))

(assert (= (and mapNonEmpty!50332 (not condMapEmpty!50341)) mapNonEmpty!50341))

(assert (= (and mapNonEmpty!50341 ((_ is ValueCellFull!15413) mapValue!50341)) b!1262920))

(assert (= (and mapNonEmpty!50332 ((_ is ValueCellFull!15413) mapDefault!50341)) b!1262921))

(declare-fun m!1163819 () Bool)

(assert (=> mapNonEmpty!50341 m!1163819))

(declare-fun b_lambda!22793 () Bool)

(assert (= b_lambda!22787 (or (and start!106134 b_free!27451) b_lambda!22793)))

(declare-fun b_lambda!22795 () Bool)

(assert (= b_lambda!22785 (or (and start!106134 b_free!27451) b_lambda!22795)))

(declare-fun b_lambda!22797 () Bool)

(assert (= b_lambda!22789 (or (and start!106134 b_free!27451) b_lambda!22797)))

(declare-fun b_lambda!22799 () Bool)

(assert (= b_lambda!22791 (or (and start!106134 b_free!27451) b_lambda!22799)))

(check-sat (not bm!62025) (not b_lambda!22799) (not mapNonEmpty!50341) (not bm!62024) (not b!1262894) (not b_lambda!22795) (not b!1262881) (not b!1262846) (not b!1262848) (not b!1262889) (not b!1262875) (not b!1262910) (not b!1262876) (not b!1262887) (not b!1262913) (not d!138897) (not b!1262888) (not b!1262890) (not b!1262878) (not b!1262873) (not b!1262893) (not bm!62021) (not b_lambda!22797) (not b!1262895) (not d!138899) (not b_next!27451) tp_is_empty!32353 b_and!45373 (not b!1262911) (not b!1262880) (not b!1262874) (not bm!62028) (not b_lambda!22793) (not b!1262879) (not b!1262892))
(check-sat b_and!45373 (not b_next!27451))
