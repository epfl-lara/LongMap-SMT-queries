; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106144 () Bool)

(assert start!106144)

(declare-fun b_free!27519 () Bool)

(declare-fun b_next!27519 () Bool)

(assert (=> start!106144 (= b_free!27519 (not b_next!27519))))

(declare-fun tp!96115 () Bool)

(declare-fun b_and!45527 () Bool)

(assert (=> start!106144 (= tp!96115 b_and!45527)))

(declare-fun b!1263813 () Bool)

(declare-fun res!841747 () Bool)

(declare-fun e!719564 () Bool)

(assert (=> b!1263813 (=> (not res!841747) (not e!719564))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82468 0))(
  ( (array!82469 (arr!39778 (Array (_ BitVec 32) (_ BitVec 64))) (size!40314 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82468)

(declare-datatypes ((V!48593 0))(
  ( (V!48594 (val!16273 Int)) )
))
(declare-datatypes ((ValueCell!15447 0))(
  ( (ValueCellFull!15447 (v!18985 V!48593)) (EmptyCell!15447) )
))
(declare-datatypes ((array!82470 0))(
  ( (array!82471 (arr!39779 (Array (_ BitVec 32) ValueCell!15447)) (size!40315 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82470)

(assert (=> b!1263813 (= res!841747 (and (= (size!40315 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40314 _keys!1118) (size!40315 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!922 () Int)

(declare-fun e!719568 () Bool)

(declare-datatypes ((tuple2!21070 0))(
  ( (tuple2!21071 (_1!10546 (_ BitVec 64)) (_2!10546 V!48593)) )
))
(declare-datatypes ((List!28261 0))(
  ( (Nil!28258) (Cons!28257 (h!29466 tuple2!21070) (t!41778 List!28261)) )
))
(declare-datatypes ((ListLongMap!18943 0))(
  ( (ListLongMap!18944 (toList!9487 List!28261)) )
))
(declare-fun lt!573253 () ListLongMap!18943)

(declare-fun minValueBefore!43 () V!48593)

(declare-fun zeroValue!871 () V!48593)

(declare-fun b!1263814 () Bool)

(declare-fun getCurrentListMap!4654 (array!82468 array!82470 (_ BitVec 32) (_ BitVec 32) V!48593 V!48593 (_ BitVec 32) Int) ListLongMap!18943)

(declare-fun +!4257 (ListLongMap!18943 tuple2!21070) ListLongMap!18943)

(assert (=> b!1263814 (= e!719568 (= (getCurrentListMap!4654 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4257 (+!4257 lt!573253 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263815 () Bool)

(declare-fun e!719569 () Bool)

(declare-fun tp_is_empty!32421 () Bool)

(assert (=> b!1263815 (= e!719569 tp_is_empty!32421)))

(declare-fun b!1263816 () Bool)

(declare-fun e!719570 () Bool)

(assert (=> b!1263816 (= e!719564 (not e!719570))))

(declare-fun res!841746 () Bool)

(assert (=> b!1263816 (=> res!841746 e!719570)))

(assert (=> b!1263816 (= res!841746 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!719567 () Bool)

(assert (=> b!1263816 e!719567))

(declare-fun res!841748 () Bool)

(assert (=> b!1263816 (=> (not res!841748) (not e!719567))))

(declare-fun lt!573251 () ListLongMap!18943)

(assert (=> b!1263816 (= res!841748 (= lt!573253 lt!573251))))

(declare-fun minValueAfter!43 () V!48593)

(declare-datatypes ((Unit!42126 0))(
  ( (Unit!42127) )
))
(declare-fun lt!573252 () Unit!42126)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1192 (array!82468 array!82470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48593 V!48593 V!48593 V!48593 (_ BitVec 32) Int) Unit!42126)

(assert (=> b!1263816 (= lt!573252 (lemmaNoChangeToArrayThenSameMapNoExtras!1192 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5850 (array!82468 array!82470 (_ BitVec 32) (_ BitVec 32) V!48593 V!48593 (_ BitVec 32) Int) ListLongMap!18943)

(assert (=> b!1263816 (= lt!573251 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1263816 (= lt!573253 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!841750 () Bool)

(assert (=> start!106144 (=> (not res!841750) (not e!719564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106144 (= res!841750 (validMask!0 mask!1466))))

(assert (=> start!106144 e!719564))

(assert (=> start!106144 true))

(assert (=> start!106144 tp!96115))

(assert (=> start!106144 tp_is_empty!32421))

(declare-fun array_inv!30273 (array!82468) Bool)

(assert (=> start!106144 (array_inv!30273 _keys!1118)))

(declare-fun e!719566 () Bool)

(declare-fun array_inv!30274 (array!82470) Bool)

(assert (=> start!106144 (and (array_inv!30274 _values!914) e!719566)))

(declare-fun b!1263817 () Bool)

(declare-fun res!841751 () Bool)

(assert (=> b!1263817 (=> (not res!841751) (not e!719564))))

(declare-datatypes ((List!28262 0))(
  ( (Nil!28259) (Cons!28258 (h!29467 (_ BitVec 64)) (t!41779 List!28262)) )
))
(declare-fun arrayNoDuplicates!0 (array!82468 (_ BitVec 32) List!28262) Bool)

(assert (=> b!1263817 (= res!841751 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28259))))

(declare-fun mapNonEmpty!50461 () Bool)

(declare-fun mapRes!50461 () Bool)

(declare-fun tp!96116 () Bool)

(declare-fun e!719565 () Bool)

(assert (=> mapNonEmpty!50461 (= mapRes!50461 (and tp!96116 e!719565))))

(declare-fun mapRest!50461 () (Array (_ BitVec 32) ValueCell!15447))

(declare-fun mapValue!50461 () ValueCell!15447)

(declare-fun mapKey!50461 () (_ BitVec 32))

(assert (=> mapNonEmpty!50461 (= (arr!39779 _values!914) (store mapRest!50461 mapKey!50461 mapValue!50461))))

(declare-fun mapIsEmpty!50461 () Bool)

(assert (=> mapIsEmpty!50461 mapRes!50461))

(declare-fun b!1263818 () Bool)

(assert (=> b!1263818 (= e!719567 e!719568)))

(declare-fun res!841752 () Bool)

(assert (=> b!1263818 (=> res!841752 e!719568)))

(assert (=> b!1263818 (= res!841752 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263819 () Bool)

(assert (=> b!1263819 (= e!719566 (and e!719569 mapRes!50461))))

(declare-fun condMapEmpty!50461 () Bool)

(declare-fun mapDefault!50461 () ValueCell!15447)

(assert (=> b!1263819 (= condMapEmpty!50461 (= (arr!39779 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15447)) mapDefault!50461)))))

(declare-fun b!1263820 () Bool)

(assert (=> b!1263820 (= e!719565 tp_is_empty!32421)))

(declare-fun b!1263821 () Bool)

(assert (=> b!1263821 (= e!719570 (= (getCurrentListMap!4654 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) (+!4257 lt!573251 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun b!1263822 () Bool)

(declare-fun res!841749 () Bool)

(assert (=> b!1263822 (=> (not res!841749) (not e!719564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82468 (_ BitVec 32)) Bool)

(assert (=> b!1263822 (= res!841749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(assert (= (and start!106144 res!841750) b!1263813))

(assert (= (and b!1263813 res!841747) b!1263822))

(assert (= (and b!1263822 res!841749) b!1263817))

(assert (= (and b!1263817 res!841751) b!1263816))

(assert (= (and b!1263816 res!841748) b!1263818))

(assert (= (and b!1263818 (not res!841752)) b!1263814))

(assert (= (and b!1263816 (not res!841746)) b!1263821))

(assert (= (and b!1263819 condMapEmpty!50461) mapIsEmpty!50461))

(assert (= (and b!1263819 (not condMapEmpty!50461)) mapNonEmpty!50461))

(get-info :version)

(assert (= (and mapNonEmpty!50461 ((_ is ValueCellFull!15447) mapValue!50461)) b!1263820))

(assert (= (and b!1263819 ((_ is ValueCellFull!15447) mapDefault!50461)) b!1263815))

(assert (= start!106144 b!1263819))

(declare-fun m!1164301 () Bool)

(assert (=> b!1263814 m!1164301))

(declare-fun m!1164303 () Bool)

(assert (=> b!1263814 m!1164303))

(assert (=> b!1263814 m!1164303))

(declare-fun m!1164305 () Bool)

(assert (=> b!1263814 m!1164305))

(declare-fun m!1164307 () Bool)

(assert (=> mapNonEmpty!50461 m!1164307))

(declare-fun m!1164309 () Bool)

(assert (=> b!1263817 m!1164309))

(declare-fun m!1164311 () Bool)

(assert (=> start!106144 m!1164311))

(declare-fun m!1164313 () Bool)

(assert (=> start!106144 m!1164313))

(declare-fun m!1164315 () Bool)

(assert (=> start!106144 m!1164315))

(declare-fun m!1164317 () Bool)

(assert (=> b!1263822 m!1164317))

(declare-fun m!1164319 () Bool)

(assert (=> b!1263816 m!1164319))

(declare-fun m!1164321 () Bool)

(assert (=> b!1263816 m!1164321))

(declare-fun m!1164323 () Bool)

(assert (=> b!1263816 m!1164323))

(declare-fun m!1164325 () Bool)

(assert (=> b!1263821 m!1164325))

(declare-fun m!1164327 () Bool)

(assert (=> b!1263821 m!1164327))

(check-sat b_and!45527 (not b!1263817) (not b!1263822) (not start!106144) tp_is_empty!32421 (not b!1263816) (not b_next!27519) (not b!1263821) (not mapNonEmpty!50461) (not b!1263814))
(check-sat b_and!45527 (not b_next!27519))
(get-model)

(declare-fun b!1263895 () Bool)

(declare-fun e!719625 () Bool)

(declare-fun e!719632 () Bool)

(assert (=> b!1263895 (= e!719625 e!719632)))

(declare-fun c!123056 () Bool)

(assert (=> b!1263895 (= c!123056 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263896 () Bool)

(declare-fun e!719622 () Bool)

(assert (=> b!1263896 (= e!719632 e!719622)))

(declare-fun res!841795 () Bool)

(declare-fun call!62271 () Bool)

(assert (=> b!1263896 (= res!841795 call!62271)))

(assert (=> b!1263896 (=> (not res!841795) (not e!719622))))

(declare-fun c!123057 () Bool)

(declare-fun call!62272 () ListLongMap!18943)

(declare-fun call!62277 () ListLongMap!18943)

(declare-fun call!62273 () ListLongMap!18943)

(declare-fun bm!62268 () Bool)

(declare-fun c!123055 () Bool)

(declare-fun call!62274 () ListLongMap!18943)

(assert (=> bm!62268 (= call!62273 (+!4257 (ite c!123057 call!62272 (ite c!123055 call!62277 call!62274)) (ite (or c!123057 c!123055) (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1263897 () Bool)

(declare-fun e!719623 () ListLongMap!18943)

(assert (=> b!1263897 (= e!719623 call!62274)))

(declare-fun b!1263898 () Bool)

(declare-fun e!719634 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1263898 (= e!719634 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62269 () Bool)

(declare-fun call!62276 () ListLongMap!18943)

(assert (=> bm!62269 (= call!62276 call!62273)))

(declare-fun b!1263899 () Bool)

(declare-fun e!719629 () ListLongMap!18943)

(assert (=> b!1263899 (= e!719629 (+!4257 call!62273 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1263900 () Bool)

(declare-fun lt!573313 () ListLongMap!18943)

(declare-fun apply!1003 (ListLongMap!18943 (_ BitVec 64)) V!48593)

(assert (=> b!1263900 (= e!719622 (= (apply!1003 lt!573313 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1263901 () Bool)

(declare-fun e!719630 () Bool)

(declare-fun get!20294 (ValueCell!15447 V!48593) V!48593)

(declare-fun dynLambda!3401 (Int (_ BitVec 64)) V!48593)

(assert (=> b!1263901 (= e!719630 (= (apply!1003 lt!573313 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)) (get!20294 (select (arr!39779 _values!914) #b00000000000000000000000000000000) (dynLambda!3401 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263901 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40315 _values!914)))))

(assert (=> b!1263901 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun b!1263902 () Bool)

(declare-fun e!719627 () Bool)

(declare-fun e!719633 () Bool)

(assert (=> b!1263902 (= e!719627 e!719633)))

(declare-fun res!841796 () Bool)

(declare-fun call!62275 () Bool)

(assert (=> b!1263902 (= res!841796 call!62275)))

(assert (=> b!1263902 (=> (not res!841796) (not e!719633))))

(declare-fun b!1263903 () Bool)

(declare-fun e!719628 () Bool)

(assert (=> b!1263903 (= e!719628 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263904 () Bool)

(assert (=> b!1263904 (= e!719632 (not call!62271))))

(declare-fun b!1263905 () Bool)

(assert (=> b!1263905 (= e!719633 (= (apply!1003 lt!573313 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62270 () Bool)

(declare-fun contains!7609 (ListLongMap!18943 (_ BitVec 64)) Bool)

(assert (=> bm!62270 (= call!62275 (contains!7609 lt!573313 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263906 () Bool)

(assert (=> b!1263906 (= e!719623 call!62276)))

(declare-fun b!1263907 () Bool)

(assert (=> b!1263907 (= e!719627 (not call!62275))))

(declare-fun b!1263908 () Bool)

(declare-fun e!719626 () ListLongMap!18943)

(assert (=> b!1263908 (= e!719626 call!62276)))

(declare-fun bm!62271 () Bool)

(assert (=> bm!62271 (= call!62271 (contains!7609 lt!573313 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62272 () Bool)

(assert (=> bm!62272 (= call!62274 call!62277)))

(declare-fun b!1263909 () Bool)

(declare-fun e!719624 () Bool)

(assert (=> b!1263909 (= e!719624 e!719630)))

(declare-fun res!841794 () Bool)

(assert (=> b!1263909 (=> (not res!841794) (not e!719630))))

(assert (=> b!1263909 (= res!841794 (contains!7609 lt!573313 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263909 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun bm!62273 () Bool)

(assert (=> bm!62273 (= call!62277 call!62272)))

(declare-fun b!1263910 () Bool)

(declare-fun e!719631 () Unit!42126)

(declare-fun Unit!42128 () Unit!42126)

(assert (=> b!1263910 (= e!719631 Unit!42128)))

(declare-fun b!1263911 () Bool)

(declare-fun c!123054 () Bool)

(assert (=> b!1263911 (= c!123054 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263911 (= e!719626 e!719623)))

(declare-fun b!1263912 () Bool)

(declare-fun res!841797 () Bool)

(assert (=> b!1263912 (=> (not res!841797) (not e!719625))))

(assert (=> b!1263912 (= res!841797 e!719624)))

(declare-fun res!841792 () Bool)

(assert (=> b!1263912 (=> res!841792 e!719624)))

(assert (=> b!1263912 (= res!841792 (not e!719634))))

(declare-fun res!841800 () Bool)

(assert (=> b!1263912 (=> (not res!841800) (not e!719634))))

(assert (=> b!1263912 (= res!841800 (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun bm!62274 () Bool)

(assert (=> bm!62274 (= call!62272 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263913 () Bool)

(assert (=> b!1263913 (= e!719629 e!719626)))

(assert (=> b!1263913 (= c!123055 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263914 () Bool)

(declare-fun lt!573319 () Unit!42126)

(assert (=> b!1263914 (= e!719631 lt!573319)))

(declare-fun lt!573320 () ListLongMap!18943)

(assert (=> b!1263914 (= lt!573320 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573311 () (_ BitVec 64))

(assert (=> b!1263914 (= lt!573311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573308 () (_ BitVec 64))

(assert (=> b!1263914 (= lt!573308 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573323 () Unit!42126)

(declare-fun addStillContains!1093 (ListLongMap!18943 (_ BitVec 64) V!48593 (_ BitVec 64)) Unit!42126)

(assert (=> b!1263914 (= lt!573323 (addStillContains!1093 lt!573320 lt!573311 zeroValue!871 lt!573308))))

(assert (=> b!1263914 (contains!7609 (+!4257 lt!573320 (tuple2!21071 lt!573311 zeroValue!871)) lt!573308)))

(declare-fun lt!573312 () Unit!42126)

(assert (=> b!1263914 (= lt!573312 lt!573323)))

(declare-fun lt!573314 () ListLongMap!18943)

(assert (=> b!1263914 (= lt!573314 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573318 () (_ BitVec 64))

(assert (=> b!1263914 (= lt!573318 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573325 () (_ BitVec 64))

(assert (=> b!1263914 (= lt!573325 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573321 () Unit!42126)

(declare-fun addApplyDifferent!547 (ListLongMap!18943 (_ BitVec 64) V!48593 (_ BitVec 64)) Unit!42126)

(assert (=> b!1263914 (= lt!573321 (addApplyDifferent!547 lt!573314 lt!573318 minValueBefore!43 lt!573325))))

(assert (=> b!1263914 (= (apply!1003 (+!4257 lt!573314 (tuple2!21071 lt!573318 minValueBefore!43)) lt!573325) (apply!1003 lt!573314 lt!573325))))

(declare-fun lt!573309 () Unit!42126)

(assert (=> b!1263914 (= lt!573309 lt!573321)))

(declare-fun lt!573316 () ListLongMap!18943)

(assert (=> b!1263914 (= lt!573316 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573322 () (_ BitVec 64))

(assert (=> b!1263914 (= lt!573322 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573328 () (_ BitVec 64))

(assert (=> b!1263914 (= lt!573328 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573307 () Unit!42126)

(assert (=> b!1263914 (= lt!573307 (addApplyDifferent!547 lt!573316 lt!573322 zeroValue!871 lt!573328))))

(assert (=> b!1263914 (= (apply!1003 (+!4257 lt!573316 (tuple2!21071 lt!573322 zeroValue!871)) lt!573328) (apply!1003 lt!573316 lt!573328))))

(declare-fun lt!573326 () Unit!42126)

(assert (=> b!1263914 (= lt!573326 lt!573307)))

(declare-fun lt!573317 () ListLongMap!18943)

(assert (=> b!1263914 (= lt!573317 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573310 () (_ BitVec 64))

(assert (=> b!1263914 (= lt!573310 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573324 () (_ BitVec 64))

(assert (=> b!1263914 (= lt!573324 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263914 (= lt!573319 (addApplyDifferent!547 lt!573317 lt!573310 minValueBefore!43 lt!573324))))

(assert (=> b!1263914 (= (apply!1003 (+!4257 lt!573317 (tuple2!21071 lt!573310 minValueBefore!43)) lt!573324) (apply!1003 lt!573317 lt!573324))))

(declare-fun d!138667 () Bool)

(assert (=> d!138667 e!719625))

(declare-fun res!841799 () Bool)

(assert (=> d!138667 (=> (not res!841799) (not e!719625))))

(assert (=> d!138667 (= res!841799 (or (bvsge #b00000000000000000000000000000000 (size!40314 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))))

(declare-fun lt!573327 () ListLongMap!18943)

(assert (=> d!138667 (= lt!573313 lt!573327)))

(declare-fun lt!573315 () Unit!42126)

(assert (=> d!138667 (= lt!573315 e!719631)))

(declare-fun c!123059 () Bool)

(assert (=> d!138667 (= c!123059 e!719628)))

(declare-fun res!841793 () Bool)

(assert (=> d!138667 (=> (not res!841793) (not e!719628))))

(assert (=> d!138667 (= res!841793 (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(assert (=> d!138667 (= lt!573327 e!719629)))

(assert (=> d!138667 (= c!123057 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138667 (validMask!0 mask!1466)))

(assert (=> d!138667 (= (getCurrentListMap!4654 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573313)))

(declare-fun b!1263915 () Bool)

(declare-fun res!841798 () Bool)

(assert (=> b!1263915 (=> (not res!841798) (not e!719625))))

(assert (=> b!1263915 (= res!841798 e!719627)))

(declare-fun c!123058 () Bool)

(assert (=> b!1263915 (= c!123058 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!138667 c!123057) b!1263899))

(assert (= (and d!138667 (not c!123057)) b!1263913))

(assert (= (and b!1263913 c!123055) b!1263908))

(assert (= (and b!1263913 (not c!123055)) b!1263911))

(assert (= (and b!1263911 c!123054) b!1263906))

(assert (= (and b!1263911 (not c!123054)) b!1263897))

(assert (= (or b!1263906 b!1263897) bm!62272))

(assert (= (or b!1263908 bm!62272) bm!62273))

(assert (= (or b!1263908 b!1263906) bm!62269))

(assert (= (or b!1263899 bm!62273) bm!62274))

(assert (= (or b!1263899 bm!62269) bm!62268))

(assert (= (and d!138667 res!841793) b!1263903))

(assert (= (and d!138667 c!123059) b!1263914))

(assert (= (and d!138667 (not c!123059)) b!1263910))

(assert (= (and d!138667 res!841799) b!1263912))

(assert (= (and b!1263912 res!841800) b!1263898))

(assert (= (and b!1263912 (not res!841792)) b!1263909))

(assert (= (and b!1263909 res!841794) b!1263901))

(assert (= (and b!1263912 res!841797) b!1263915))

(assert (= (and b!1263915 c!123058) b!1263902))

(assert (= (and b!1263915 (not c!123058)) b!1263907))

(assert (= (and b!1263902 res!841796) b!1263905))

(assert (= (or b!1263902 b!1263907) bm!62270))

(assert (= (and b!1263915 res!841798) b!1263895))

(assert (= (and b!1263895 c!123056) b!1263896))

(assert (= (and b!1263895 (not c!123056)) b!1263904))

(assert (= (and b!1263896 res!841795) b!1263900))

(assert (= (or b!1263896 b!1263904) bm!62271))

(declare-fun b_lambda!22991 () Bool)

(assert (=> (not b_lambda!22991) (not b!1263901)))

(declare-fun t!41782 () Bool)

(declare-fun tb!11333 () Bool)

(assert (=> (and start!106144 (= defaultEntry!922 defaultEntry!922) t!41782) tb!11333))

(declare-fun result!23407 () Bool)

(assert (=> tb!11333 (= result!23407 tp_is_empty!32421)))

(assert (=> b!1263901 t!41782))

(declare-fun b_and!45531 () Bool)

(assert (= b_and!45527 (and (=> t!41782 result!23407) b_and!45531)))

(declare-fun m!1164357 () Bool)

(assert (=> bm!62271 m!1164357))

(declare-fun m!1164359 () Bool)

(assert (=> bm!62268 m!1164359))

(declare-fun m!1164361 () Bool)

(assert (=> bm!62270 m!1164361))

(declare-fun m!1164363 () Bool)

(assert (=> b!1263909 m!1164363))

(assert (=> b!1263909 m!1164363))

(declare-fun m!1164365 () Bool)

(assert (=> b!1263909 m!1164365))

(assert (=> b!1263903 m!1164363))

(assert (=> b!1263903 m!1164363))

(declare-fun m!1164367 () Bool)

(assert (=> b!1263903 m!1164367))

(assert (=> b!1263901 m!1164363))

(assert (=> b!1263901 m!1164363))

(declare-fun m!1164369 () Bool)

(assert (=> b!1263901 m!1164369))

(declare-fun m!1164371 () Bool)

(assert (=> b!1263901 m!1164371))

(declare-fun m!1164373 () Bool)

(assert (=> b!1263901 m!1164373))

(declare-fun m!1164375 () Bool)

(assert (=> b!1263901 m!1164375))

(assert (=> b!1263901 m!1164371))

(assert (=> b!1263901 m!1164373))

(declare-fun m!1164377 () Bool)

(assert (=> b!1263900 m!1164377))

(assert (=> d!138667 m!1164311))

(declare-fun m!1164379 () Bool)

(assert (=> b!1263905 m!1164379))

(assert (=> bm!62274 m!1164323))

(assert (=> b!1263898 m!1164363))

(assert (=> b!1263898 m!1164363))

(assert (=> b!1263898 m!1164367))

(declare-fun m!1164381 () Bool)

(assert (=> b!1263899 m!1164381))

(assert (=> b!1263914 m!1164363))

(declare-fun m!1164383 () Bool)

(assert (=> b!1263914 m!1164383))

(declare-fun m!1164385 () Bool)

(assert (=> b!1263914 m!1164385))

(declare-fun m!1164387 () Bool)

(assert (=> b!1263914 m!1164387))

(declare-fun m!1164389 () Bool)

(assert (=> b!1263914 m!1164389))

(declare-fun m!1164391 () Bool)

(assert (=> b!1263914 m!1164391))

(assert (=> b!1263914 m!1164389))

(declare-fun m!1164393 () Bool)

(assert (=> b!1263914 m!1164393))

(declare-fun m!1164395 () Bool)

(assert (=> b!1263914 m!1164395))

(declare-fun m!1164397 () Bool)

(assert (=> b!1263914 m!1164397))

(declare-fun m!1164399 () Bool)

(assert (=> b!1263914 m!1164399))

(declare-fun m!1164401 () Bool)

(assert (=> b!1263914 m!1164401))

(assert (=> b!1263914 m!1164323))

(declare-fun m!1164403 () Bool)

(assert (=> b!1263914 m!1164403))

(assert (=> b!1263914 m!1164385))

(declare-fun m!1164405 () Bool)

(assert (=> b!1263914 m!1164405))

(assert (=> b!1263914 m!1164401))

(declare-fun m!1164407 () Bool)

(assert (=> b!1263914 m!1164407))

(declare-fun m!1164409 () Bool)

(assert (=> b!1263914 m!1164409))

(assert (=> b!1263914 m!1164405))

(declare-fun m!1164411 () Bool)

(assert (=> b!1263914 m!1164411))

(assert (=> b!1263814 d!138667))

(declare-fun d!138669 () Bool)

(declare-fun e!719637 () Bool)

(assert (=> d!138669 e!719637))

(declare-fun res!841806 () Bool)

(assert (=> d!138669 (=> (not res!841806) (not e!719637))))

(declare-fun lt!573340 () ListLongMap!18943)

(assert (=> d!138669 (= res!841806 (contains!7609 lt!573340 (_1!10546 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!573338 () List!28261)

(assert (=> d!138669 (= lt!573340 (ListLongMap!18944 lt!573338))))

(declare-fun lt!573337 () Unit!42126)

(declare-fun lt!573339 () Unit!42126)

(assert (=> d!138669 (= lt!573337 lt!573339)))

(declare-datatypes ((Option!719 0))(
  ( (Some!718 (v!18987 V!48593)) (None!717) )
))
(declare-fun getValueByKey!668 (List!28261 (_ BitVec 64)) Option!719)

(assert (=> d!138669 (= (getValueByKey!668 lt!573338 (_1!10546 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!718 (_2!10546 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lemmaContainsTupThenGetReturnValue!337 (List!28261 (_ BitVec 64) V!48593) Unit!42126)

(assert (=> d!138669 (= lt!573339 (lemmaContainsTupThenGetReturnValue!337 lt!573338 (_1!10546 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10546 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun insertStrictlySorted!451 (List!28261 (_ BitVec 64) V!48593) List!28261)

(assert (=> d!138669 (= lt!573338 (insertStrictlySorted!451 (toList!9487 (+!4257 lt!573253 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (_1!10546 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) (_2!10546 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(assert (=> d!138669 (= (+!4257 (+!4257 lt!573253 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)) lt!573340)))

(declare-fun b!1263922 () Bool)

(declare-fun res!841805 () Bool)

(assert (=> b!1263922 (=> (not res!841805) (not e!719637))))

(assert (=> b!1263922 (= res!841805 (= (getValueByKey!668 (toList!9487 lt!573340) (_1!10546 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))) (Some!718 (_2!10546 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))))

(declare-fun b!1263923 () Bool)

(declare-fun contains!7610 (List!28261 tuple2!21070) Bool)

(assert (=> b!1263923 (= e!719637 (contains!7610 (toList!9487 lt!573340) (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(assert (= (and d!138669 res!841806) b!1263922))

(assert (= (and b!1263922 res!841805) b!1263923))

(declare-fun m!1164413 () Bool)

(assert (=> d!138669 m!1164413))

(declare-fun m!1164415 () Bool)

(assert (=> d!138669 m!1164415))

(declare-fun m!1164417 () Bool)

(assert (=> d!138669 m!1164417))

(declare-fun m!1164419 () Bool)

(assert (=> d!138669 m!1164419))

(declare-fun m!1164421 () Bool)

(assert (=> b!1263922 m!1164421))

(declare-fun m!1164423 () Bool)

(assert (=> b!1263923 m!1164423))

(assert (=> b!1263814 d!138669))

(declare-fun d!138671 () Bool)

(declare-fun e!719638 () Bool)

(assert (=> d!138671 e!719638))

(declare-fun res!841808 () Bool)

(assert (=> d!138671 (=> (not res!841808) (not e!719638))))

(declare-fun lt!573344 () ListLongMap!18943)

(assert (=> d!138671 (= res!841808 (contains!7609 lt!573344 (_1!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun lt!573342 () List!28261)

(assert (=> d!138671 (= lt!573344 (ListLongMap!18944 lt!573342))))

(declare-fun lt!573341 () Unit!42126)

(declare-fun lt!573343 () Unit!42126)

(assert (=> d!138671 (= lt!573341 lt!573343)))

(assert (=> d!138671 (= (getValueByKey!668 lt!573342 (_1!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!718 (_2!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138671 (= lt!573343 (lemmaContainsTupThenGetReturnValue!337 lt!573342 (_1!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138671 (= lt!573342 (insertStrictlySorted!451 (toList!9487 lt!573253) (_1!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138671 (= (+!4257 lt!573253 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) lt!573344)))

(declare-fun b!1263924 () Bool)

(declare-fun res!841807 () Bool)

(assert (=> b!1263924 (=> (not res!841807) (not e!719638))))

(assert (=> b!1263924 (= res!841807 (= (getValueByKey!668 (toList!9487 lt!573344) (_1!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!718 (_2!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))))

(declare-fun b!1263925 () Bool)

(assert (=> b!1263925 (= e!719638 (contains!7610 (toList!9487 lt!573344) (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))

(assert (= (and d!138671 res!841808) b!1263924))

(assert (= (and b!1263924 res!841807) b!1263925))

(declare-fun m!1164425 () Bool)

(assert (=> d!138671 m!1164425))

(declare-fun m!1164427 () Bool)

(assert (=> d!138671 m!1164427))

(declare-fun m!1164429 () Bool)

(assert (=> d!138671 m!1164429))

(declare-fun m!1164431 () Bool)

(assert (=> d!138671 m!1164431))

(declare-fun m!1164433 () Bool)

(assert (=> b!1263924 m!1164433))

(declare-fun m!1164435 () Bool)

(assert (=> b!1263925 m!1164435))

(assert (=> b!1263814 d!138671))

(declare-fun d!138673 () Bool)

(assert (=> d!138673 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!106144 d!138673))

(declare-fun d!138675 () Bool)

(assert (=> d!138675 (= (array_inv!30273 _keys!1118) (bvsge (size!40314 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!106144 d!138675))

(declare-fun d!138677 () Bool)

(assert (=> d!138677 (= (array_inv!30274 _values!914) (bvsge (size!40315 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!106144 d!138677))

(declare-fun b!1263926 () Bool)

(declare-fun e!719642 () Bool)

(declare-fun e!719649 () Bool)

(assert (=> b!1263926 (= e!719642 e!719649)))

(declare-fun c!123062 () Bool)

(assert (=> b!1263926 (= c!123062 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263927 () Bool)

(declare-fun e!719639 () Bool)

(assert (=> b!1263927 (= e!719649 e!719639)))

(declare-fun res!841812 () Bool)

(declare-fun call!62278 () Bool)

(assert (=> b!1263927 (= res!841812 call!62278)))

(assert (=> b!1263927 (=> (not res!841812) (not e!719639))))

(declare-fun call!62280 () ListLongMap!18943)

(declare-fun call!62284 () ListLongMap!18943)

(declare-fun c!123061 () Bool)

(declare-fun bm!62275 () Bool)

(declare-fun call!62279 () ListLongMap!18943)

(declare-fun call!62281 () ListLongMap!18943)

(declare-fun c!123063 () Bool)

(assert (=> bm!62275 (= call!62280 (+!4257 (ite c!123063 call!62279 (ite c!123061 call!62284 call!62281)) (ite (or c!123063 c!123061) (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1263928 () Bool)

(declare-fun e!719640 () ListLongMap!18943)

(assert (=> b!1263928 (= e!719640 call!62281)))

(declare-fun b!1263929 () Bool)

(declare-fun e!719651 () Bool)

(assert (=> b!1263929 (= e!719651 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62276 () Bool)

(declare-fun call!62283 () ListLongMap!18943)

(assert (=> bm!62276 (= call!62283 call!62280)))

(declare-fun b!1263930 () Bool)

(declare-fun e!719646 () ListLongMap!18943)

(assert (=> b!1263930 (= e!719646 (+!4257 call!62280 (tuple2!21071 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1263931 () Bool)

(declare-fun lt!573351 () ListLongMap!18943)

(assert (=> b!1263931 (= e!719639 (= (apply!1003 lt!573351 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun e!719647 () Bool)

(declare-fun b!1263932 () Bool)

(assert (=> b!1263932 (= e!719647 (= (apply!1003 lt!573351 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)) (get!20294 (select (arr!39779 _values!914) #b00000000000000000000000000000000) (dynLambda!3401 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1263932 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40315 _values!914)))))

(assert (=> b!1263932 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun b!1263933 () Bool)

(declare-fun e!719644 () Bool)

(declare-fun e!719650 () Bool)

(assert (=> b!1263933 (= e!719644 e!719650)))

(declare-fun res!841813 () Bool)

(declare-fun call!62282 () Bool)

(assert (=> b!1263933 (= res!841813 call!62282)))

(assert (=> b!1263933 (=> (not res!841813) (not e!719650))))

(declare-fun b!1263934 () Bool)

(declare-fun e!719645 () Bool)

(assert (=> b!1263934 (= e!719645 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263935 () Bool)

(assert (=> b!1263935 (= e!719649 (not call!62278))))

(declare-fun b!1263936 () Bool)

(assert (=> b!1263936 (= e!719650 (= (apply!1003 lt!573351 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!62277 () Bool)

(assert (=> bm!62277 (= call!62282 (contains!7609 lt!573351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1263937 () Bool)

(assert (=> b!1263937 (= e!719640 call!62283)))

(declare-fun b!1263938 () Bool)

(assert (=> b!1263938 (= e!719644 (not call!62282))))

(declare-fun b!1263939 () Bool)

(declare-fun e!719643 () ListLongMap!18943)

(assert (=> b!1263939 (= e!719643 call!62283)))

(declare-fun bm!62278 () Bool)

(assert (=> bm!62278 (= call!62278 (contains!7609 lt!573351 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!62279 () Bool)

(assert (=> bm!62279 (= call!62281 call!62284)))

(declare-fun b!1263940 () Bool)

(declare-fun e!719641 () Bool)

(assert (=> b!1263940 (= e!719641 e!719647)))

(declare-fun res!841811 () Bool)

(assert (=> b!1263940 (=> (not res!841811) (not e!719647))))

(assert (=> b!1263940 (= res!841811 (contains!7609 lt!573351 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1263940 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun bm!62280 () Bool)

(assert (=> bm!62280 (= call!62284 call!62279)))

(declare-fun b!1263941 () Bool)

(declare-fun e!719648 () Unit!42126)

(declare-fun Unit!42129 () Unit!42126)

(assert (=> b!1263941 (= e!719648 Unit!42129)))

(declare-fun b!1263942 () Bool)

(declare-fun c!123060 () Bool)

(assert (=> b!1263942 (= c!123060 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1263942 (= e!719643 e!719640)))

(declare-fun b!1263943 () Bool)

(declare-fun res!841814 () Bool)

(assert (=> b!1263943 (=> (not res!841814) (not e!719642))))

(assert (=> b!1263943 (= res!841814 e!719641)))

(declare-fun res!841809 () Bool)

(assert (=> b!1263943 (=> res!841809 e!719641)))

(assert (=> b!1263943 (= res!841809 (not e!719651))))

(declare-fun res!841817 () Bool)

(assert (=> b!1263943 (=> (not res!841817) (not e!719651))))

(assert (=> b!1263943 (= res!841817 (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun bm!62281 () Bool)

(assert (=> bm!62281 (= call!62279 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1263944 () Bool)

(assert (=> b!1263944 (= e!719646 e!719643)))

(assert (=> b!1263944 (= c!123061 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263945 () Bool)

(declare-fun lt!573357 () Unit!42126)

(assert (=> b!1263945 (= e!719648 lt!573357)))

(declare-fun lt!573358 () ListLongMap!18943)

(assert (=> b!1263945 (= lt!573358 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573349 () (_ BitVec 64))

(assert (=> b!1263945 (= lt!573349 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573346 () (_ BitVec 64))

(assert (=> b!1263945 (= lt!573346 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573361 () Unit!42126)

(assert (=> b!1263945 (= lt!573361 (addStillContains!1093 lt!573358 lt!573349 zeroValue!871 lt!573346))))

(assert (=> b!1263945 (contains!7609 (+!4257 lt!573358 (tuple2!21071 lt!573349 zeroValue!871)) lt!573346)))

(declare-fun lt!573350 () Unit!42126)

(assert (=> b!1263945 (= lt!573350 lt!573361)))

(declare-fun lt!573352 () ListLongMap!18943)

(assert (=> b!1263945 (= lt!573352 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573356 () (_ BitVec 64))

(assert (=> b!1263945 (= lt!573356 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573363 () (_ BitVec 64))

(assert (=> b!1263945 (= lt!573363 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573359 () Unit!42126)

(assert (=> b!1263945 (= lt!573359 (addApplyDifferent!547 lt!573352 lt!573356 minValueAfter!43 lt!573363))))

(assert (=> b!1263945 (= (apply!1003 (+!4257 lt!573352 (tuple2!21071 lt!573356 minValueAfter!43)) lt!573363) (apply!1003 lt!573352 lt!573363))))

(declare-fun lt!573347 () Unit!42126)

(assert (=> b!1263945 (= lt!573347 lt!573359)))

(declare-fun lt!573354 () ListLongMap!18943)

(assert (=> b!1263945 (= lt!573354 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573360 () (_ BitVec 64))

(assert (=> b!1263945 (= lt!573360 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573366 () (_ BitVec 64))

(assert (=> b!1263945 (= lt!573366 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573345 () Unit!42126)

(assert (=> b!1263945 (= lt!573345 (addApplyDifferent!547 lt!573354 lt!573360 zeroValue!871 lt!573366))))

(assert (=> b!1263945 (= (apply!1003 (+!4257 lt!573354 (tuple2!21071 lt!573360 zeroValue!871)) lt!573366) (apply!1003 lt!573354 lt!573366))))

(declare-fun lt!573364 () Unit!42126)

(assert (=> b!1263945 (= lt!573364 lt!573345)))

(declare-fun lt!573355 () ListLongMap!18943)

(assert (=> b!1263945 (= lt!573355 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573348 () (_ BitVec 64))

(assert (=> b!1263945 (= lt!573348 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!573362 () (_ BitVec 64))

(assert (=> b!1263945 (= lt!573362 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1263945 (= lt!573357 (addApplyDifferent!547 lt!573355 lt!573348 minValueAfter!43 lt!573362))))

(assert (=> b!1263945 (= (apply!1003 (+!4257 lt!573355 (tuple2!21071 lt!573348 minValueAfter!43)) lt!573362) (apply!1003 lt!573355 lt!573362))))

(declare-fun d!138679 () Bool)

(assert (=> d!138679 e!719642))

(declare-fun res!841816 () Bool)

(assert (=> d!138679 (=> (not res!841816) (not e!719642))))

(assert (=> d!138679 (= res!841816 (or (bvsge #b00000000000000000000000000000000 (size!40314 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))))

(declare-fun lt!573365 () ListLongMap!18943)

(assert (=> d!138679 (= lt!573351 lt!573365)))

(declare-fun lt!573353 () Unit!42126)

(assert (=> d!138679 (= lt!573353 e!719648)))

(declare-fun c!123065 () Bool)

(assert (=> d!138679 (= c!123065 e!719645)))

(declare-fun res!841810 () Bool)

(assert (=> d!138679 (=> (not res!841810) (not e!719645))))

(assert (=> d!138679 (= res!841810 (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(assert (=> d!138679 (= lt!573365 e!719646)))

(assert (=> d!138679 (= c!123063 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138679 (validMask!0 mask!1466)))

(assert (=> d!138679 (= (getCurrentListMap!4654 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573351)))

(declare-fun b!1263946 () Bool)

(declare-fun res!841815 () Bool)

(assert (=> b!1263946 (=> (not res!841815) (not e!719642))))

(assert (=> b!1263946 (= res!841815 e!719644)))

(declare-fun c!123064 () Bool)

(assert (=> b!1263946 (= c!123064 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!138679 c!123063) b!1263930))

(assert (= (and d!138679 (not c!123063)) b!1263944))

(assert (= (and b!1263944 c!123061) b!1263939))

(assert (= (and b!1263944 (not c!123061)) b!1263942))

(assert (= (and b!1263942 c!123060) b!1263937))

(assert (= (and b!1263942 (not c!123060)) b!1263928))

(assert (= (or b!1263937 b!1263928) bm!62279))

(assert (= (or b!1263939 bm!62279) bm!62280))

(assert (= (or b!1263939 b!1263937) bm!62276))

(assert (= (or b!1263930 bm!62280) bm!62281))

(assert (= (or b!1263930 bm!62276) bm!62275))

(assert (= (and d!138679 res!841810) b!1263934))

(assert (= (and d!138679 c!123065) b!1263945))

(assert (= (and d!138679 (not c!123065)) b!1263941))

(assert (= (and d!138679 res!841816) b!1263943))

(assert (= (and b!1263943 res!841817) b!1263929))

(assert (= (and b!1263943 (not res!841809)) b!1263940))

(assert (= (and b!1263940 res!841811) b!1263932))

(assert (= (and b!1263943 res!841814) b!1263946))

(assert (= (and b!1263946 c!123064) b!1263933))

(assert (= (and b!1263946 (not c!123064)) b!1263938))

(assert (= (and b!1263933 res!841813) b!1263936))

(assert (= (or b!1263933 b!1263938) bm!62277))

(assert (= (and b!1263946 res!841815) b!1263926))

(assert (= (and b!1263926 c!123062) b!1263927))

(assert (= (and b!1263926 (not c!123062)) b!1263935))

(assert (= (and b!1263927 res!841812) b!1263931))

(assert (= (or b!1263927 b!1263935) bm!62278))

(declare-fun b_lambda!22993 () Bool)

(assert (=> (not b_lambda!22993) (not b!1263932)))

(assert (=> b!1263932 t!41782))

(declare-fun b_and!45533 () Bool)

(assert (= b_and!45531 (and (=> t!41782 result!23407) b_and!45533)))

(declare-fun m!1164437 () Bool)

(assert (=> bm!62278 m!1164437))

(declare-fun m!1164439 () Bool)

(assert (=> bm!62275 m!1164439))

(declare-fun m!1164441 () Bool)

(assert (=> bm!62277 m!1164441))

(assert (=> b!1263940 m!1164363))

(assert (=> b!1263940 m!1164363))

(declare-fun m!1164443 () Bool)

(assert (=> b!1263940 m!1164443))

(assert (=> b!1263934 m!1164363))

(assert (=> b!1263934 m!1164363))

(assert (=> b!1263934 m!1164367))

(assert (=> b!1263932 m!1164363))

(assert (=> b!1263932 m!1164363))

(declare-fun m!1164445 () Bool)

(assert (=> b!1263932 m!1164445))

(assert (=> b!1263932 m!1164371))

(assert (=> b!1263932 m!1164373))

(assert (=> b!1263932 m!1164375))

(assert (=> b!1263932 m!1164371))

(assert (=> b!1263932 m!1164373))

(declare-fun m!1164447 () Bool)

(assert (=> b!1263931 m!1164447))

(assert (=> d!138679 m!1164311))

(declare-fun m!1164449 () Bool)

(assert (=> b!1263936 m!1164449))

(assert (=> bm!62281 m!1164321))

(assert (=> b!1263929 m!1164363))

(assert (=> b!1263929 m!1164363))

(assert (=> b!1263929 m!1164367))

(declare-fun m!1164451 () Bool)

(assert (=> b!1263930 m!1164451))

(assert (=> b!1263945 m!1164363))

(declare-fun m!1164453 () Bool)

(assert (=> b!1263945 m!1164453))

(declare-fun m!1164455 () Bool)

(assert (=> b!1263945 m!1164455))

(declare-fun m!1164457 () Bool)

(assert (=> b!1263945 m!1164457))

(declare-fun m!1164459 () Bool)

(assert (=> b!1263945 m!1164459))

(declare-fun m!1164461 () Bool)

(assert (=> b!1263945 m!1164461))

(assert (=> b!1263945 m!1164459))

(declare-fun m!1164463 () Bool)

(assert (=> b!1263945 m!1164463))

(declare-fun m!1164465 () Bool)

(assert (=> b!1263945 m!1164465))

(declare-fun m!1164467 () Bool)

(assert (=> b!1263945 m!1164467))

(declare-fun m!1164469 () Bool)

(assert (=> b!1263945 m!1164469))

(declare-fun m!1164471 () Bool)

(assert (=> b!1263945 m!1164471))

(assert (=> b!1263945 m!1164321))

(declare-fun m!1164473 () Bool)

(assert (=> b!1263945 m!1164473))

(assert (=> b!1263945 m!1164455))

(declare-fun m!1164475 () Bool)

(assert (=> b!1263945 m!1164475))

(assert (=> b!1263945 m!1164471))

(declare-fun m!1164477 () Bool)

(assert (=> b!1263945 m!1164477))

(declare-fun m!1164479 () Bool)

(assert (=> b!1263945 m!1164479))

(assert (=> b!1263945 m!1164475))

(declare-fun m!1164481 () Bool)

(assert (=> b!1263945 m!1164481))

(assert (=> b!1263821 d!138679))

(declare-fun d!138681 () Bool)

(declare-fun e!719652 () Bool)

(assert (=> d!138681 e!719652))

(declare-fun res!841819 () Bool)

(assert (=> d!138681 (=> (not res!841819) (not e!719652))))

(declare-fun lt!573370 () ListLongMap!18943)

(assert (=> d!138681 (= res!841819 (contains!7609 lt!573370 (_1!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(declare-fun lt!573368 () List!28261)

(assert (=> d!138681 (= lt!573370 (ListLongMap!18944 lt!573368))))

(declare-fun lt!573367 () Unit!42126)

(declare-fun lt!573369 () Unit!42126)

(assert (=> d!138681 (= lt!573367 lt!573369)))

(assert (=> d!138681 (= (getValueByKey!668 lt!573368 (_1!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!718 (_2!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138681 (= lt!573369 (lemmaContainsTupThenGetReturnValue!337 lt!573368 (_1!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138681 (= lt!573368 (insertStrictlySorted!451 (toList!9487 lt!573251) (_1!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) (_2!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))))))

(assert (=> d!138681 (= (+!4257 lt!573251 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)) lt!573370)))

(declare-fun b!1263947 () Bool)

(declare-fun res!841818 () Bool)

(assert (=> b!1263947 (=> (not res!841818) (not e!719652))))

(assert (=> b!1263947 (= res!841818 (= (getValueByKey!668 (toList!9487 lt!573370) (_1!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871))) (Some!718 (_2!10546 (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))))

(declare-fun b!1263948 () Bool)

(assert (=> b!1263948 (= e!719652 (contains!7610 (toList!9487 lt!573370) (tuple2!21071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871)))))

(assert (= (and d!138681 res!841819) b!1263947))

(assert (= (and b!1263947 res!841818) b!1263948))

(declare-fun m!1164483 () Bool)

(assert (=> d!138681 m!1164483))

(declare-fun m!1164485 () Bool)

(assert (=> d!138681 m!1164485))

(declare-fun m!1164487 () Bool)

(assert (=> d!138681 m!1164487))

(declare-fun m!1164489 () Bool)

(assert (=> d!138681 m!1164489))

(declare-fun m!1164491 () Bool)

(assert (=> b!1263947 m!1164491))

(declare-fun m!1164493 () Bool)

(assert (=> b!1263948 m!1164493))

(assert (=> b!1263821 d!138681))

(declare-fun b!1263957 () Bool)

(declare-fun e!719660 () Bool)

(declare-fun e!719661 () Bool)

(assert (=> b!1263957 (= e!719660 e!719661)))

(declare-fun c!123068 () Bool)

(assert (=> b!1263957 (= c!123068 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138683 () Bool)

(declare-fun res!841825 () Bool)

(assert (=> d!138683 (=> res!841825 e!719660)))

(assert (=> d!138683 (= res!841825 (bvsge #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(assert (=> d!138683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!719660)))

(declare-fun b!1263958 () Bool)

(declare-fun e!719659 () Bool)

(declare-fun call!62287 () Bool)

(assert (=> b!1263958 (= e!719659 call!62287)))

(declare-fun b!1263959 () Bool)

(assert (=> b!1263959 (= e!719661 call!62287)))

(declare-fun bm!62284 () Bool)

(assert (=> bm!62284 (= call!62287 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1263960 () Bool)

(assert (=> b!1263960 (= e!719661 e!719659)))

(declare-fun lt!573378 () (_ BitVec 64))

(assert (=> b!1263960 (= lt!573378 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!573377 () Unit!42126)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82468 (_ BitVec 64) (_ BitVec 32)) Unit!42126)

(assert (=> b!1263960 (= lt!573377 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!573378 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82468 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1263960 (arrayContainsKey!0 _keys!1118 lt!573378 #b00000000000000000000000000000000)))

(declare-fun lt!573379 () Unit!42126)

(assert (=> b!1263960 (= lt!573379 lt!573377)))

(declare-fun res!841824 () Bool)

(declare-datatypes ((SeekEntryResult!9981 0))(
  ( (MissingZero!9981 (index!42295 (_ BitVec 32))) (Found!9981 (index!42296 (_ BitVec 32))) (Intermediate!9981 (undefined!10793 Bool) (index!42297 (_ BitVec 32)) (x!111365 (_ BitVec 32))) (Undefined!9981) (MissingVacant!9981 (index!42298 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82468 (_ BitVec 32)) SeekEntryResult!9981)

(assert (=> b!1263960 (= res!841824 (= (seekEntryOrOpen!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9981 #b00000000000000000000000000000000)))))

(assert (=> b!1263960 (=> (not res!841824) (not e!719659))))

(assert (= (and d!138683 (not res!841825)) b!1263957))

(assert (= (and b!1263957 c!123068) b!1263960))

(assert (= (and b!1263957 (not c!123068)) b!1263959))

(assert (= (and b!1263960 res!841824) b!1263958))

(assert (= (or b!1263958 b!1263959) bm!62284))

(assert (=> b!1263957 m!1164363))

(assert (=> b!1263957 m!1164363))

(assert (=> b!1263957 m!1164367))

(declare-fun m!1164495 () Bool)

(assert (=> bm!62284 m!1164495))

(assert (=> b!1263960 m!1164363))

(declare-fun m!1164497 () Bool)

(assert (=> b!1263960 m!1164497))

(declare-fun m!1164499 () Bool)

(assert (=> b!1263960 m!1164499))

(assert (=> b!1263960 m!1164363))

(declare-fun m!1164501 () Bool)

(assert (=> b!1263960 m!1164501))

(assert (=> b!1263822 d!138683))

(declare-fun b!1263971 () Bool)

(declare-fun e!719670 () Bool)

(declare-fun call!62290 () Bool)

(assert (=> b!1263971 (= e!719670 call!62290)))

(declare-fun b!1263972 () Bool)

(declare-fun e!719673 () Bool)

(declare-fun e!719671 () Bool)

(assert (=> b!1263972 (= e!719673 e!719671)))

(declare-fun res!841832 () Bool)

(assert (=> b!1263972 (=> (not res!841832) (not e!719671))))

(declare-fun e!719672 () Bool)

(assert (=> b!1263972 (= res!841832 (not e!719672))))

(declare-fun res!841833 () Bool)

(assert (=> b!1263972 (=> (not res!841833) (not e!719672))))

(assert (=> b!1263972 (= res!841833 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263973 () Bool)

(declare-fun contains!7611 (List!28262 (_ BitVec 64)) Bool)

(assert (=> b!1263973 (= e!719672 (contains!7611 Nil!28259 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1263974 () Bool)

(assert (=> b!1263974 (= e!719671 e!719670)))

(declare-fun c!123071 () Bool)

(assert (=> b!1263974 (= c!123071 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62287 () Bool)

(assert (=> bm!62287 (= call!62290 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!123071 (Cons!28258 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000) Nil!28259) Nil!28259)))))

(declare-fun b!1263975 () Bool)

(assert (=> b!1263975 (= e!719670 call!62290)))

(declare-fun d!138685 () Bool)

(declare-fun res!841834 () Bool)

(assert (=> d!138685 (=> res!841834 e!719673)))

(assert (=> d!138685 (= res!841834 (bvsge #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(assert (=> d!138685 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28259) e!719673)))

(assert (= (and d!138685 (not res!841834)) b!1263972))

(assert (= (and b!1263972 res!841833) b!1263973))

(assert (= (and b!1263972 res!841832) b!1263974))

(assert (= (and b!1263974 c!123071) b!1263975))

(assert (= (and b!1263974 (not c!123071)) b!1263971))

(assert (= (or b!1263975 b!1263971) bm!62287))

(assert (=> b!1263972 m!1164363))

(assert (=> b!1263972 m!1164363))

(assert (=> b!1263972 m!1164367))

(assert (=> b!1263973 m!1164363))

(assert (=> b!1263973 m!1164363))

(declare-fun m!1164503 () Bool)

(assert (=> b!1263973 m!1164503))

(assert (=> b!1263974 m!1164363))

(assert (=> b!1263974 m!1164363))

(assert (=> b!1263974 m!1164367))

(assert (=> bm!62287 m!1164363))

(declare-fun m!1164505 () Bool)

(assert (=> bm!62287 m!1164505))

(assert (=> b!1263817 d!138685))

(declare-fun d!138687 () Bool)

(assert (=> d!138687 (= (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!573382 () Unit!42126)

(declare-fun choose!1878 (array!82468 array!82470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48593 V!48593 V!48593 V!48593 (_ BitVec 32) Int) Unit!42126)

(assert (=> d!138687 (= lt!573382 (choose!1878 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138687 (validMask!0 mask!1466)))

(assert (=> d!138687 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1192 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573382)))

(declare-fun bs!35754 () Bool)

(assert (= bs!35754 d!138687))

(assert (=> bs!35754 m!1164323))

(assert (=> bs!35754 m!1164321))

(declare-fun m!1164507 () Bool)

(assert (=> bs!35754 m!1164507))

(assert (=> bs!35754 m!1164311))

(assert (=> b!1263816 d!138687))

(declare-fun b!1264000 () Bool)

(declare-fun e!719688 () Bool)

(declare-fun e!719694 () Bool)

(assert (=> b!1264000 (= e!719688 e!719694)))

(declare-fun c!123083 () Bool)

(declare-fun e!719690 () Bool)

(assert (=> b!1264000 (= c!123083 e!719690)))

(declare-fun res!841845 () Bool)

(assert (=> b!1264000 (=> (not res!841845) (not e!719690))))

(assert (=> b!1264000 (= res!841845 (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun b!1264001 () Bool)

(declare-fun lt!573400 () Unit!42126)

(declare-fun lt!573401 () Unit!42126)

(assert (=> b!1264001 (= lt!573400 lt!573401)))

(declare-fun lt!573398 () (_ BitVec 64))

(declare-fun lt!573402 () V!48593)

(declare-fun lt!573397 () ListLongMap!18943)

(declare-fun lt!573403 () (_ BitVec 64))

(assert (=> b!1264001 (not (contains!7609 (+!4257 lt!573397 (tuple2!21071 lt!573403 lt!573402)) lt!573398))))

(declare-fun addStillNotContains!331 (ListLongMap!18943 (_ BitVec 64) V!48593 (_ BitVec 64)) Unit!42126)

(assert (=> b!1264001 (= lt!573401 (addStillNotContains!331 lt!573397 lt!573403 lt!573402 lt!573398))))

(assert (=> b!1264001 (= lt!573398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264001 (= lt!573402 (get!20294 (select (arr!39779 _values!914) #b00000000000000000000000000000000) (dynLambda!3401 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264001 (= lt!573403 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62293 () ListLongMap!18943)

(assert (=> b!1264001 (= lt!573397 call!62293)))

(declare-fun e!719692 () ListLongMap!18943)

(assert (=> b!1264001 (= e!719692 (+!4257 call!62293 (tuple2!21071 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000) (get!20294 (select (arr!39779 _values!914) #b00000000000000000000000000000000) (dynLambda!3401 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264002 () Bool)

(assert (=> b!1264002 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(assert (=> b!1264002 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40315 _values!914)))))

(declare-fun e!719689 () Bool)

(declare-fun lt!573399 () ListLongMap!18943)

(assert (=> b!1264002 (= e!719689 (= (apply!1003 lt!573399 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)) (get!20294 (select (arr!39779 _values!914) #b00000000000000000000000000000000) (dynLambda!3401 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1264003 () Bool)

(declare-fun e!719691 () ListLongMap!18943)

(assert (=> b!1264003 (= e!719691 (ListLongMap!18944 Nil!28258))))

(declare-fun bm!62290 () Bool)

(assert (=> bm!62290 (= call!62293 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264004 () Bool)

(assert (=> b!1264004 (= e!719691 e!719692)))

(declare-fun c!123082 () Bool)

(assert (=> b!1264004 (= c!123082 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264005 () Bool)

(declare-fun e!719693 () Bool)

(assert (=> b!1264005 (= e!719694 e!719693)))

(declare-fun c!123081 () Bool)

(assert (=> b!1264005 (= c!123081 (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun b!1264006 () Bool)

(assert (=> b!1264006 (= e!719693 (= lt!573399 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1264007 () Bool)

(assert (=> b!1264007 (= e!719694 e!719689)))

(assert (=> b!1264007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun res!841846 () Bool)

(assert (=> b!1264007 (= res!841846 (contains!7609 lt!573399 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264007 (=> (not res!841846) (not e!719689))))

(declare-fun b!1264008 () Bool)

(declare-fun res!841844 () Bool)

(assert (=> b!1264008 (=> (not res!841844) (not e!719688))))

(assert (=> b!1264008 (= res!841844 (not (contains!7609 lt!573399 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1264009 () Bool)

(assert (=> b!1264009 (= e!719690 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264009 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138689 () Bool)

(assert (=> d!138689 e!719688))

(declare-fun res!841843 () Bool)

(assert (=> d!138689 (=> (not res!841843) (not e!719688))))

(assert (=> d!138689 (= res!841843 (not (contains!7609 lt!573399 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138689 (= lt!573399 e!719691)))

(declare-fun c!123080 () Bool)

(assert (=> d!138689 (= c!123080 (bvsge #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(assert (=> d!138689 (validMask!0 mask!1466)))

(assert (=> d!138689 (= (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573399)))

(declare-fun b!1264010 () Bool)

(assert (=> b!1264010 (= e!719692 call!62293)))

(declare-fun b!1264011 () Bool)

(declare-fun isEmpty!1045 (ListLongMap!18943) Bool)

(assert (=> b!1264011 (= e!719693 (isEmpty!1045 lt!573399))))

(assert (= (and d!138689 c!123080) b!1264003))

(assert (= (and d!138689 (not c!123080)) b!1264004))

(assert (= (and b!1264004 c!123082) b!1264001))

(assert (= (and b!1264004 (not c!123082)) b!1264010))

(assert (= (or b!1264001 b!1264010) bm!62290))

(assert (= (and d!138689 res!841843) b!1264008))

(assert (= (and b!1264008 res!841844) b!1264000))

(assert (= (and b!1264000 res!841845) b!1264009))

(assert (= (and b!1264000 c!123083) b!1264007))

(assert (= (and b!1264000 (not c!123083)) b!1264005))

(assert (= (and b!1264007 res!841846) b!1264002))

(assert (= (and b!1264005 c!123081) b!1264006))

(assert (= (and b!1264005 (not c!123081)) b!1264011))

(declare-fun b_lambda!22995 () Bool)

(assert (=> (not b_lambda!22995) (not b!1264001)))

(assert (=> b!1264001 t!41782))

(declare-fun b_and!45535 () Bool)

(assert (= b_and!45533 (and (=> t!41782 result!23407) b_and!45535)))

(declare-fun b_lambda!22997 () Bool)

(assert (=> (not b_lambda!22997) (not b!1264002)))

(assert (=> b!1264002 t!41782))

(declare-fun b_and!45537 () Bool)

(assert (= b_and!45535 (and (=> t!41782 result!23407) b_and!45537)))

(assert (=> b!1264002 m!1164371))

(assert (=> b!1264002 m!1164373))

(assert (=> b!1264002 m!1164375))

(assert (=> b!1264002 m!1164371))

(assert (=> b!1264002 m!1164373))

(assert (=> b!1264002 m!1164363))

(declare-fun m!1164509 () Bool)

(assert (=> b!1264002 m!1164509))

(assert (=> b!1264002 m!1164363))

(declare-fun m!1164511 () Bool)

(assert (=> b!1264011 m!1164511))

(declare-fun m!1164513 () Bool)

(assert (=> b!1264006 m!1164513))

(assert (=> b!1264004 m!1164363))

(assert (=> b!1264004 m!1164363))

(assert (=> b!1264004 m!1164367))

(assert (=> b!1264009 m!1164363))

(assert (=> b!1264009 m!1164363))

(assert (=> b!1264009 m!1164367))

(assert (=> b!1264007 m!1164363))

(assert (=> b!1264007 m!1164363))

(declare-fun m!1164515 () Bool)

(assert (=> b!1264007 m!1164515))

(declare-fun m!1164517 () Bool)

(assert (=> b!1264008 m!1164517))

(assert (=> bm!62290 m!1164513))

(declare-fun m!1164519 () Bool)

(assert (=> d!138689 m!1164519))

(assert (=> d!138689 m!1164311))

(declare-fun m!1164521 () Bool)

(assert (=> b!1264001 m!1164521))

(assert (=> b!1264001 m!1164371))

(assert (=> b!1264001 m!1164373))

(assert (=> b!1264001 m!1164375))

(declare-fun m!1164523 () Bool)

(assert (=> b!1264001 m!1164523))

(declare-fun m!1164525 () Bool)

(assert (=> b!1264001 m!1164525))

(assert (=> b!1264001 m!1164373))

(assert (=> b!1264001 m!1164363))

(declare-fun m!1164527 () Bool)

(assert (=> b!1264001 m!1164527))

(assert (=> b!1264001 m!1164371))

(assert (=> b!1264001 m!1164523))

(assert (=> b!1263816 d!138689))

(declare-fun b!1264012 () Bool)

(declare-fun e!719695 () Bool)

(declare-fun e!719701 () Bool)

(assert (=> b!1264012 (= e!719695 e!719701)))

(declare-fun c!123087 () Bool)

(declare-fun e!719697 () Bool)

(assert (=> b!1264012 (= c!123087 e!719697)))

(declare-fun res!841849 () Bool)

(assert (=> b!1264012 (=> (not res!841849) (not e!719697))))

(assert (=> b!1264012 (= res!841849 (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun b!1264013 () Bool)

(declare-fun lt!573407 () Unit!42126)

(declare-fun lt!573408 () Unit!42126)

(assert (=> b!1264013 (= lt!573407 lt!573408)))

(declare-fun lt!573409 () V!48593)

(declare-fun lt!573405 () (_ BitVec 64))

(declare-fun lt!573410 () (_ BitVec 64))

(declare-fun lt!573404 () ListLongMap!18943)

(assert (=> b!1264013 (not (contains!7609 (+!4257 lt!573404 (tuple2!21071 lt!573410 lt!573409)) lt!573405))))

(assert (=> b!1264013 (= lt!573408 (addStillNotContains!331 lt!573404 lt!573410 lt!573409 lt!573405))))

(assert (=> b!1264013 (= lt!573405 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1264013 (= lt!573409 (get!20294 (select (arr!39779 _values!914) #b00000000000000000000000000000000) (dynLambda!3401 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1264013 (= lt!573410 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62294 () ListLongMap!18943)

(assert (=> b!1264013 (= lt!573404 call!62294)))

(declare-fun e!719699 () ListLongMap!18943)

(assert (=> b!1264013 (= e!719699 (+!4257 call!62294 (tuple2!21071 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000) (get!20294 (select (arr!39779 _values!914) #b00000000000000000000000000000000) (dynLambda!3401 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1264014 () Bool)

(assert (=> b!1264014 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(assert (=> b!1264014 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40315 _values!914)))))

(declare-fun e!719696 () Bool)

(declare-fun lt!573406 () ListLongMap!18943)

(assert (=> b!1264014 (= e!719696 (= (apply!1003 lt!573406 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)) (get!20294 (select (arr!39779 _values!914) #b00000000000000000000000000000000) (dynLambda!3401 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1264015 () Bool)

(declare-fun e!719698 () ListLongMap!18943)

(assert (=> b!1264015 (= e!719698 (ListLongMap!18944 Nil!28258))))

(declare-fun bm!62291 () Bool)

(assert (=> bm!62291 (= call!62294 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1264016 () Bool)

(assert (=> b!1264016 (= e!719698 e!719699)))

(declare-fun c!123086 () Bool)

(assert (=> b!1264016 (= c!123086 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1264017 () Bool)

(declare-fun e!719700 () Bool)

(assert (=> b!1264017 (= e!719701 e!719700)))

(declare-fun c!123085 () Bool)

(assert (=> b!1264017 (= c!123085 (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun b!1264018 () Bool)

(assert (=> b!1264018 (= e!719700 (= lt!573406 (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1264019 () Bool)

(assert (=> b!1264019 (= e!719701 e!719696)))

(assert (=> b!1264019 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(declare-fun res!841850 () Bool)

(assert (=> b!1264019 (= res!841850 (contains!7609 lt!573406 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264019 (=> (not res!841850) (not e!719696))))

(declare-fun b!1264020 () Bool)

(declare-fun res!841848 () Bool)

(assert (=> b!1264020 (=> (not res!841848) (not e!719695))))

(assert (=> b!1264020 (= res!841848 (not (contains!7609 lt!573406 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1264021 () Bool)

(assert (=> b!1264021 (= e!719697 (validKeyInArray!0 (select (arr!39778 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1264021 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!138691 () Bool)

(assert (=> d!138691 e!719695))

(declare-fun res!841847 () Bool)

(assert (=> d!138691 (=> (not res!841847) (not e!719695))))

(assert (=> d!138691 (= res!841847 (not (contains!7609 lt!573406 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138691 (= lt!573406 e!719698)))

(declare-fun c!123084 () Bool)

(assert (=> d!138691 (= c!123084 (bvsge #b00000000000000000000000000000000 (size!40314 _keys!1118)))))

(assert (=> d!138691 (validMask!0 mask!1466)))

(assert (=> d!138691 (= (getCurrentListMapNoExtraKeys!5850 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!573406)))

(declare-fun b!1264022 () Bool)

(assert (=> b!1264022 (= e!719699 call!62294)))

(declare-fun b!1264023 () Bool)

(assert (=> b!1264023 (= e!719700 (isEmpty!1045 lt!573406))))

(assert (= (and d!138691 c!123084) b!1264015))

(assert (= (and d!138691 (not c!123084)) b!1264016))

(assert (= (and b!1264016 c!123086) b!1264013))

(assert (= (and b!1264016 (not c!123086)) b!1264022))

(assert (= (or b!1264013 b!1264022) bm!62291))

(assert (= (and d!138691 res!841847) b!1264020))

(assert (= (and b!1264020 res!841848) b!1264012))

(assert (= (and b!1264012 res!841849) b!1264021))

(assert (= (and b!1264012 c!123087) b!1264019))

(assert (= (and b!1264012 (not c!123087)) b!1264017))

(assert (= (and b!1264019 res!841850) b!1264014))

(assert (= (and b!1264017 c!123085) b!1264018))

(assert (= (and b!1264017 (not c!123085)) b!1264023))

(declare-fun b_lambda!22999 () Bool)

(assert (=> (not b_lambda!22999) (not b!1264013)))

(assert (=> b!1264013 t!41782))

(declare-fun b_and!45539 () Bool)

(assert (= b_and!45537 (and (=> t!41782 result!23407) b_and!45539)))

(declare-fun b_lambda!23001 () Bool)

(assert (=> (not b_lambda!23001) (not b!1264014)))

(assert (=> b!1264014 t!41782))

(declare-fun b_and!45541 () Bool)

(assert (= b_and!45539 (and (=> t!41782 result!23407) b_and!45541)))

(assert (=> b!1264014 m!1164371))

(assert (=> b!1264014 m!1164373))

(assert (=> b!1264014 m!1164375))

(assert (=> b!1264014 m!1164371))

(assert (=> b!1264014 m!1164373))

(assert (=> b!1264014 m!1164363))

(declare-fun m!1164529 () Bool)

(assert (=> b!1264014 m!1164529))

(assert (=> b!1264014 m!1164363))

(declare-fun m!1164531 () Bool)

(assert (=> b!1264023 m!1164531))

(declare-fun m!1164533 () Bool)

(assert (=> b!1264018 m!1164533))

(assert (=> b!1264016 m!1164363))

(assert (=> b!1264016 m!1164363))

(assert (=> b!1264016 m!1164367))

(assert (=> b!1264021 m!1164363))

(assert (=> b!1264021 m!1164363))

(assert (=> b!1264021 m!1164367))

(assert (=> b!1264019 m!1164363))

(assert (=> b!1264019 m!1164363))

(declare-fun m!1164535 () Bool)

(assert (=> b!1264019 m!1164535))

(declare-fun m!1164537 () Bool)

(assert (=> b!1264020 m!1164537))

(assert (=> bm!62291 m!1164533))

(declare-fun m!1164539 () Bool)

(assert (=> d!138691 m!1164539))

(assert (=> d!138691 m!1164311))

(declare-fun m!1164541 () Bool)

(assert (=> b!1264013 m!1164541))

(assert (=> b!1264013 m!1164371))

(assert (=> b!1264013 m!1164373))

(assert (=> b!1264013 m!1164375))

(declare-fun m!1164543 () Bool)

(assert (=> b!1264013 m!1164543))

(declare-fun m!1164545 () Bool)

(assert (=> b!1264013 m!1164545))

(assert (=> b!1264013 m!1164373))

(assert (=> b!1264013 m!1164363))

(declare-fun m!1164547 () Bool)

(assert (=> b!1264013 m!1164547))

(assert (=> b!1264013 m!1164371))

(assert (=> b!1264013 m!1164543))

(assert (=> b!1263816 d!138691))

(declare-fun mapNonEmpty!50467 () Bool)

(declare-fun mapRes!50467 () Bool)

(declare-fun tp!96125 () Bool)

(declare-fun e!719706 () Bool)

(assert (=> mapNonEmpty!50467 (= mapRes!50467 (and tp!96125 e!719706))))

(declare-fun mapKey!50467 () (_ BitVec 32))

(declare-fun mapValue!50467 () ValueCell!15447)

(declare-fun mapRest!50467 () (Array (_ BitVec 32) ValueCell!15447))

(assert (=> mapNonEmpty!50467 (= mapRest!50461 (store mapRest!50467 mapKey!50467 mapValue!50467))))

(declare-fun b!1264031 () Bool)

(declare-fun e!719707 () Bool)

(assert (=> b!1264031 (= e!719707 tp_is_empty!32421)))

(declare-fun condMapEmpty!50467 () Bool)

(declare-fun mapDefault!50467 () ValueCell!15447)

(assert (=> mapNonEmpty!50461 (= condMapEmpty!50467 (= mapRest!50461 ((as const (Array (_ BitVec 32) ValueCell!15447)) mapDefault!50467)))))

(assert (=> mapNonEmpty!50461 (= tp!96116 (and e!719707 mapRes!50467))))

(declare-fun b!1264030 () Bool)

(assert (=> b!1264030 (= e!719706 tp_is_empty!32421)))

(declare-fun mapIsEmpty!50467 () Bool)

(assert (=> mapIsEmpty!50467 mapRes!50467))

(assert (= (and mapNonEmpty!50461 condMapEmpty!50467) mapIsEmpty!50467))

(assert (= (and mapNonEmpty!50461 (not condMapEmpty!50467)) mapNonEmpty!50467))

(assert (= (and mapNonEmpty!50467 ((_ is ValueCellFull!15447) mapValue!50467)) b!1264030))

(assert (= (and mapNonEmpty!50461 ((_ is ValueCellFull!15447) mapDefault!50467)) b!1264031))

(declare-fun m!1164549 () Bool)

(assert (=> mapNonEmpty!50467 m!1164549))

(declare-fun b_lambda!23003 () Bool)

(assert (= b_lambda!23001 (or (and start!106144 b_free!27519) b_lambda!23003)))

(declare-fun b_lambda!23005 () Bool)

(assert (= b_lambda!22993 (or (and start!106144 b_free!27519) b_lambda!23005)))

(declare-fun b_lambda!23007 () Bool)

(assert (= b_lambda!22991 (or (and start!106144 b_free!27519) b_lambda!23007)))

(declare-fun b_lambda!23009 () Bool)

(assert (= b_lambda!22999 (or (and start!106144 b_free!27519) b_lambda!23009)))

(declare-fun b_lambda!23011 () Bool)

(assert (= b_lambda!22995 (or (and start!106144 b_free!27519) b_lambda!23011)))

(declare-fun b_lambda!23013 () Bool)

(assert (= b_lambda!22997 (or (and start!106144 b_free!27519) b_lambda!23013)))

(check-sat (not b!1263898) (not mapNonEmpty!50467) (not b!1263909) (not b!1264001) (not b!1264007) (not b!1263948) (not b!1263940) (not bm!62274) (not b!1264018) (not b!1264004) (not bm!62268) (not d!138689) (not b!1263914) (not b!1263929) (not b!1263923) (not b!1263974) (not bm!62270) (not b!1264002) (not b!1263973) (not b!1263960) (not b!1264011) (not b!1263947) (not d!138679) (not b_lambda!23009) (not b!1263932) (not b!1263945) (not b!1264008) (not b!1264009) (not b!1263903) (not bm!62278) (not bm!62281) (not b!1263936) (not b!1264021) (not b!1263972) (not b!1263925) (not bm!62291) (not b!1263922) b_and!45541 (not b!1264006) (not b_lambda!23007) (not b!1264013) (not bm!62277) (not b!1264014) (not b!1263924) (not d!138667) (not d!138681) (not b_lambda!23011) (not b!1263957) (not b!1263905) (not b_lambda!23003) (not b!1264023) (not bm!62287) (not d!138669) (not b!1263900) (not b_lambda!23013) (not bm!62275) tp_is_empty!32421 (not d!138691) (not b!1263901) (not b!1264016) (not d!138671) (not b!1263934) (not b!1264019) (not b!1263930) (not b!1263931) (not bm!62284) (not d!138687) (not b_lambda!23005) (not b_next!27519) (not bm!62271) (not b!1263899) (not bm!62290) (not b!1264020))
(check-sat b_and!45541 (not b_next!27519))
