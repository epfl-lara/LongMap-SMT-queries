; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105954 () Bool)

(assert start!105954)

(declare-fun b_free!27465 () Bool)

(declare-fun b_next!27465 () Bool)

(assert (=> start!105954 (= b_free!27465 (not b_next!27465))))

(declare-fun tp!95933 () Bool)

(declare-fun b_and!45391 () Bool)

(assert (=> start!105954 (= tp!95933 b_and!45391)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun e!718257 () Bool)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48521 0))(
  ( (V!48522 (val!16246 Int)) )
))
(declare-fun zeroValue!871 () V!48521)

(declare-datatypes ((array!82352 0))(
  ( (array!82353 (arr!39727 (Array (_ BitVec 32) (_ BitVec 64))) (size!40263 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82352)

(declare-datatypes ((ValueCell!15420 0))(
  ( (ValueCellFull!15420 (v!18951 V!48521)) (EmptyCell!15420) )
))
(declare-datatypes ((array!82354 0))(
  ( (array!82355 (arr!39728 (Array (_ BitVec 32) ValueCell!15420)) (size!40264 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82354)

(declare-fun b!1261891 () Bool)

(declare-fun minValueAfter!43 () V!48521)

(declare-datatypes ((tuple2!21026 0))(
  ( (tuple2!21027 (_1!10524 (_ BitVec 64)) (_2!10524 V!48521)) )
))
(declare-datatypes ((List!28221 0))(
  ( (Nil!28218) (Cons!28217 (h!29426 tuple2!21026) (t!41724 List!28221)) )
))
(declare-datatypes ((ListLongMap!18899 0))(
  ( (ListLongMap!18900 (toList!9465 List!28221)) )
))
(declare-fun lt!571868 () ListLongMap!18899)

(declare-fun getCurrentListMap!4635 (array!82352 array!82354 (_ BitVec 32) (_ BitVec 32) V!48521 V!48521 (_ BitVec 32) Int) ListLongMap!18899)

(assert (=> b!1261891 (= e!718257 (= lt!571868 (getCurrentListMap!4635 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922)))))

(declare-fun lt!571867 () ListLongMap!18899)

(assert (=> b!1261891 (= lt!571868 lt!571867)))

(declare-fun -!2141 (ListLongMap!18899 (_ BitVec 64)) ListLongMap!18899)

(assert (=> b!1261891 (= lt!571868 (-!2141 lt!571867 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!42069 0))(
  ( (Unit!42070) )
))
(declare-fun lt!571870 () Unit!42069)

(declare-fun removeNotPresentStillSame!150 (ListLongMap!18899 (_ BitVec 64)) Unit!42069)

(assert (=> b!1261891 (= lt!571870 (removeNotPresentStillSame!150 lt!571867 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!50359 () Bool)

(declare-fun mapRes!50359 () Bool)

(declare-fun tp!95932 () Bool)

(declare-fun e!718260 () Bool)

(assert (=> mapNonEmpty!50359 (= mapRes!50359 (and tp!95932 e!718260))))

(declare-fun mapKey!50359 () (_ BitVec 32))

(declare-fun mapValue!50359 () ValueCell!15420)

(declare-fun mapRest!50359 () (Array (_ BitVec 32) ValueCell!15420))

(assert (=> mapNonEmpty!50359 (= (arr!39728 _values!914) (store mapRest!50359 mapKey!50359 mapValue!50359))))

(declare-fun mapIsEmpty!50359 () Bool)

(assert (=> mapIsEmpty!50359 mapRes!50359))

(declare-fun b!1261892 () Bool)

(declare-fun res!840797 () Bool)

(declare-fun e!718259 () Bool)

(assert (=> b!1261892 (=> (not res!840797) (not e!718259))))

(declare-datatypes ((List!28222 0))(
  ( (Nil!28219) (Cons!28218 (h!29427 (_ BitVec 64)) (t!41725 List!28222)) )
))
(declare-fun arrayNoDuplicates!0 (array!82352 (_ BitVec 32) List!28222) Bool)

(assert (=> b!1261892 (= res!840797 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28219))))

(declare-fun b!1261893 () Bool)

(declare-fun e!718255 () Bool)

(declare-fun e!718256 () Bool)

(assert (=> b!1261893 (= e!718255 (and e!718256 mapRes!50359))))

(declare-fun condMapEmpty!50359 () Bool)

(declare-fun mapDefault!50359 () ValueCell!15420)

(assert (=> b!1261893 (= condMapEmpty!50359 (= (arr!39728 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15420)) mapDefault!50359)))))

(declare-fun b!1261894 () Bool)

(declare-fun tp_is_empty!32367 () Bool)

(assert (=> b!1261894 (= e!718256 tp_is_empty!32367)))

(declare-fun b!1261895 () Bool)

(declare-fun res!840798 () Bool)

(assert (=> b!1261895 (=> (not res!840798) (not e!718259))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1261895 (= res!840798 (and (= (size!40264 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40263 _keys!1118) (size!40264 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261896 () Bool)

(declare-fun res!840794 () Bool)

(assert (=> b!1261896 (=> (not res!840794) (not e!718259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82352 (_ BitVec 32)) Bool)

(assert (=> b!1261896 (= res!840794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261897 () Bool)

(declare-fun e!718258 () Bool)

(assert (=> b!1261897 (= e!718259 (not e!718258))))

(declare-fun res!840796 () Bool)

(assert (=> b!1261897 (=> res!840796 e!718258)))

(assert (=> b!1261897 (= res!840796 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!571869 () ListLongMap!18899)

(declare-fun lt!571871 () ListLongMap!18899)

(assert (=> b!1261897 (= lt!571869 lt!571871)))

(declare-fun lt!571866 () Unit!42069)

(declare-fun minValueBefore!43 () V!48521)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1173 (array!82352 array!82354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48521 V!48521 V!48521 V!48521 (_ BitVec 32) Int) Unit!42069)

(assert (=> b!1261897 (= lt!571866 (lemmaNoChangeToArrayThenSameMapNoExtras!1173 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5831 (array!82352 array!82354 (_ BitVec 32) (_ BitVec 32) V!48521 V!48521 (_ BitVec 32) Int) ListLongMap!18899)

(assert (=> b!1261897 (= lt!571871 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1261897 (= lt!571869 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!840795 () Bool)

(assert (=> start!105954 (=> (not res!840795) (not e!718259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105954 (= res!840795 (validMask!0 mask!1466))))

(assert (=> start!105954 e!718259))

(assert (=> start!105954 true))

(assert (=> start!105954 tp!95933))

(assert (=> start!105954 tp_is_empty!32367))

(declare-fun array_inv!30243 (array!82352) Bool)

(assert (=> start!105954 (array_inv!30243 _keys!1118)))

(declare-fun array_inv!30244 (array!82354) Bool)

(assert (=> start!105954 (and (array_inv!30244 _values!914) e!718255)))

(declare-fun b!1261898 () Bool)

(assert (=> b!1261898 (= e!718260 tp_is_empty!32367)))

(declare-fun b!1261899 () Bool)

(assert (=> b!1261899 (= e!718258 e!718257)))

(declare-fun res!840793 () Bool)

(assert (=> b!1261899 (=> res!840793 e!718257)))

(declare-fun contains!7586 (ListLongMap!18899 (_ BitVec 64)) Bool)

(assert (=> b!1261899 (= res!840793 (contains!7586 lt!571867 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1261899 (= lt!571867 (getCurrentListMap!4635 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105954 res!840795) b!1261895))

(assert (= (and b!1261895 res!840798) b!1261896))

(assert (= (and b!1261896 res!840794) b!1261892))

(assert (= (and b!1261892 res!840797) b!1261897))

(assert (= (and b!1261897 (not res!840796)) b!1261899))

(assert (= (and b!1261899 (not res!840793)) b!1261891))

(assert (= (and b!1261893 condMapEmpty!50359) mapIsEmpty!50359))

(assert (= (and b!1261893 (not condMapEmpty!50359)) mapNonEmpty!50359))

(get-info :version)

(assert (= (and mapNonEmpty!50359 ((_ is ValueCellFull!15420) mapValue!50359)) b!1261898))

(assert (= (and b!1261893 ((_ is ValueCellFull!15420) mapDefault!50359)) b!1261894))

(assert (= start!105954 b!1261893))

(declare-fun m!1162423 () Bool)

(assert (=> start!105954 m!1162423))

(declare-fun m!1162425 () Bool)

(assert (=> start!105954 m!1162425))

(declare-fun m!1162427 () Bool)

(assert (=> start!105954 m!1162427))

(declare-fun m!1162429 () Bool)

(assert (=> b!1261897 m!1162429))

(declare-fun m!1162431 () Bool)

(assert (=> b!1261897 m!1162431))

(declare-fun m!1162433 () Bool)

(assert (=> b!1261897 m!1162433))

(declare-fun m!1162435 () Bool)

(assert (=> mapNonEmpty!50359 m!1162435))

(declare-fun m!1162437 () Bool)

(assert (=> b!1261899 m!1162437))

(declare-fun m!1162439 () Bool)

(assert (=> b!1261899 m!1162439))

(declare-fun m!1162441 () Bool)

(assert (=> b!1261896 m!1162441))

(declare-fun m!1162443 () Bool)

(assert (=> b!1261892 m!1162443))

(declare-fun m!1162445 () Bool)

(assert (=> b!1261891 m!1162445))

(declare-fun m!1162447 () Bool)

(assert (=> b!1261891 m!1162447))

(declare-fun m!1162449 () Bool)

(assert (=> b!1261891 m!1162449))

(check-sat (not start!105954) b_and!45391 (not b!1261897) (not b!1261899) (not b_next!27465) (not mapNonEmpty!50359) (not b!1261892) (not b!1261891) (not b!1261896) tp_is_empty!32367)
(check-sat b_and!45391 (not b_next!27465))
(get-model)

(declare-fun call!62013 () ListLongMap!18899)

(declare-fun call!62012 () ListLongMap!18899)

(declare-fun c!122729 () Bool)

(declare-fun call!62016 () ListLongMap!18899)

(declare-fun bm!62009 () Bool)

(declare-fun c!122728 () Bool)

(declare-fun call!62015 () ListLongMap!18899)

(declare-fun +!4242 (ListLongMap!18899 tuple2!21026) ListLongMap!18899)

(assert (=> bm!62009 (= call!62015 (+!4242 (ite c!122729 call!62016 (ite c!122728 call!62013 call!62012)) (ite (or c!122729 c!122728) (tuple2!21027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21027 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43))))))

(declare-fun b!1261969 () Bool)

(declare-fun e!718321 () ListLongMap!18899)

(assert (=> b!1261969 (= e!718321 call!62012)))

(declare-fun b!1261970 () Bool)

(declare-fun e!718309 () Bool)

(declare-fun call!62017 () Bool)

(assert (=> b!1261970 (= e!718309 (not call!62017))))

(declare-fun bm!62010 () Bool)

(declare-fun call!62018 () Bool)

(declare-fun lt!571951 () ListLongMap!18899)

(assert (=> bm!62010 (= call!62018 (contains!7586 lt!571951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261971 () Bool)

(declare-fun e!718313 () Bool)

(declare-fun apply!996 (ListLongMap!18899 (_ BitVec 64)) V!48521)

(assert (=> b!1261971 (= e!718313 (= (apply!996 lt!571951 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1261972 () Bool)

(declare-fun call!62014 () ListLongMap!18899)

(assert (=> b!1261972 (= e!718321 call!62014)))

(declare-fun bm!62011 () Bool)

(assert (=> bm!62011 (= call!62012 call!62013)))

(declare-fun b!1261973 () Bool)

(declare-fun e!718320 () ListLongMap!18899)

(assert (=> b!1261973 (= e!718320 (+!4242 call!62015 (tuple2!21027 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!43)))))

(declare-fun b!1261975 () Bool)

(declare-fun e!718316 () Unit!42069)

(declare-fun Unit!42071 () Unit!42069)

(assert (=> b!1261975 (= e!718316 Unit!42071)))

(declare-fun b!1261976 () Bool)

(declare-fun e!718317 () Bool)

(assert (=> b!1261976 (= e!718309 e!718317)))

(declare-fun res!840837 () Bool)

(assert (=> b!1261976 (= res!840837 call!62017)))

(assert (=> b!1261976 (=> (not res!840837) (not e!718317))))

(declare-fun b!1261977 () Bool)

(declare-fun e!718319 () ListLongMap!18899)

(assert (=> b!1261977 (= e!718320 e!718319)))

(assert (=> b!1261977 (= c!122728 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261978 () Bool)

(declare-fun lt!571949 () Unit!42069)

(assert (=> b!1261978 (= e!718316 lt!571949)))

(declare-fun lt!571938 () ListLongMap!18899)

(assert (=> b!1261978 (= lt!571938 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571948 () (_ BitVec 64))

(assert (=> b!1261978 (= lt!571948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571945 () (_ BitVec 64))

(assert (=> b!1261978 (= lt!571945 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571940 () Unit!42069)

(declare-fun addStillContains!1086 (ListLongMap!18899 (_ BitVec 64) V!48521 (_ BitVec 64)) Unit!42069)

(assert (=> b!1261978 (= lt!571940 (addStillContains!1086 lt!571938 lt!571948 zeroValue!871 lt!571945))))

(assert (=> b!1261978 (contains!7586 (+!4242 lt!571938 (tuple2!21027 lt!571948 zeroValue!871)) lt!571945)))

(declare-fun lt!571937 () Unit!42069)

(assert (=> b!1261978 (= lt!571937 lt!571940)))

(declare-fun lt!571952 () ListLongMap!18899)

(assert (=> b!1261978 (= lt!571952 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571942 () (_ BitVec 64))

(assert (=> b!1261978 (= lt!571942 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571950 () (_ BitVec 64))

(assert (=> b!1261978 (= lt!571950 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571947 () Unit!42069)

(declare-fun addApplyDifferent!540 (ListLongMap!18899 (_ BitVec 64) V!48521 (_ BitVec 64)) Unit!42069)

(assert (=> b!1261978 (= lt!571947 (addApplyDifferent!540 lt!571952 lt!571942 minValueAfter!43 lt!571950))))

(assert (=> b!1261978 (= (apply!996 (+!4242 lt!571952 (tuple2!21027 lt!571942 minValueAfter!43)) lt!571950) (apply!996 lt!571952 lt!571950))))

(declare-fun lt!571946 () Unit!42069)

(assert (=> b!1261978 (= lt!571946 lt!571947)))

(declare-fun lt!571944 () ListLongMap!18899)

(assert (=> b!1261978 (= lt!571944 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571934 () (_ BitVec 64))

(assert (=> b!1261978 (= lt!571934 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571941 () (_ BitVec 64))

(assert (=> b!1261978 (= lt!571941 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571954 () Unit!42069)

(assert (=> b!1261978 (= lt!571954 (addApplyDifferent!540 lt!571944 lt!571934 zeroValue!871 lt!571941))))

(assert (=> b!1261978 (= (apply!996 (+!4242 lt!571944 (tuple2!21027 lt!571934 zeroValue!871)) lt!571941) (apply!996 lt!571944 lt!571941))))

(declare-fun lt!571935 () Unit!42069)

(assert (=> b!1261978 (= lt!571935 lt!571954)))

(declare-fun lt!571953 () ListLongMap!18899)

(assert (=> b!1261978 (= lt!571953 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571955 () (_ BitVec 64))

(assert (=> b!1261978 (= lt!571955 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!571943 () (_ BitVec 64))

(assert (=> b!1261978 (= lt!571943 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1261978 (= lt!571949 (addApplyDifferent!540 lt!571953 lt!571955 minValueAfter!43 lt!571943))))

(assert (=> b!1261978 (= (apply!996 (+!4242 lt!571953 (tuple2!21027 lt!571955 minValueAfter!43)) lt!571943) (apply!996 lt!571953 lt!571943))))

(declare-fun b!1261979 () Bool)

(assert (=> b!1261979 (= e!718317 (= (apply!996 lt!571951 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!43))))

(declare-fun b!1261980 () Bool)

(declare-fun res!840840 () Bool)

(declare-fun e!718315 () Bool)

(assert (=> b!1261980 (=> (not res!840840) (not e!718315))))

(declare-fun e!718314 () Bool)

(assert (=> b!1261980 (= res!840840 e!718314)))

(declare-fun res!840842 () Bool)

(assert (=> b!1261980 (=> res!840842 e!718314)))

(declare-fun e!718312 () Bool)

(assert (=> b!1261980 (= res!840842 (not e!718312))))

(declare-fun res!840841 () Bool)

(assert (=> b!1261980 (=> (not res!840841) (not e!718312))))

(assert (=> b!1261980 (= res!840841 (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun b!1261981 () Bool)

(declare-fun res!840838 () Bool)

(assert (=> b!1261981 (=> (not res!840838) (not e!718315))))

(declare-fun e!718310 () Bool)

(assert (=> b!1261981 (= res!840838 e!718310)))

(declare-fun c!122731 () Bool)

(assert (=> b!1261981 (= c!122731 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62012 () Bool)

(assert (=> bm!62012 (= call!62013 call!62016)))

(declare-fun bm!62013 () Bool)

(assert (=> bm!62013 (= call!62016 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261982 () Bool)

(assert (=> b!1261982 (= e!718315 e!718309)))

(declare-fun c!122726 () Bool)

(assert (=> b!1261982 (= c!122726 (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261983 () Bool)

(declare-fun e!718318 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1261983 (= e!718318 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62014 () Bool)

(assert (=> bm!62014 (= call!62014 call!62015)))

(declare-fun bm!62015 () Bool)

(assert (=> bm!62015 (= call!62017 (contains!7586 lt!571951 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1261984 () Bool)

(declare-fun e!718311 () Bool)

(declare-fun get!20269 (ValueCell!15420 V!48521) V!48521)

(declare-fun dynLambda!3394 (Int (_ BitVec 64)) V!48521)

(assert (=> b!1261984 (= e!718311 (= (apply!996 lt!571951 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)) (get!20269 (select (arr!39728 _values!914) #b00000000000000000000000000000000) (dynLambda!3394 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1261984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _values!914)))))

(assert (=> b!1261984 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun b!1261985 () Bool)

(declare-fun c!122730 () Bool)

(assert (=> b!1261985 (= c!122730 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1261985 (= e!718319 e!718321)))

(declare-fun b!1261986 () Bool)

(assert (=> b!1261986 (= e!718314 e!718311)))

(declare-fun res!840835 () Bool)

(assert (=> b!1261986 (=> (not res!840835) (not e!718311))))

(assert (=> b!1261986 (= res!840835 (contains!7586 lt!571951 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1261986 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun b!1261987 () Bool)

(assert (=> b!1261987 (= e!718310 e!718313)))

(declare-fun res!840836 () Bool)

(assert (=> b!1261987 (= res!840836 call!62018)))

(assert (=> b!1261987 (=> (not res!840836) (not e!718313))))

(declare-fun b!1261988 () Bool)

(assert (=> b!1261988 (= e!718310 (not call!62018))))

(declare-fun b!1261989 () Bool)

(assert (=> b!1261989 (= e!718319 call!62014)))

(declare-fun d!138485 () Bool)

(assert (=> d!138485 e!718315))

(declare-fun res!840843 () Bool)

(assert (=> d!138485 (=> (not res!840843) (not e!718315))))

(assert (=> d!138485 (= res!840843 (or (bvsge #b00000000000000000000000000000000 (size!40263 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))))

(declare-fun lt!571936 () ListLongMap!18899)

(assert (=> d!138485 (= lt!571951 lt!571936)))

(declare-fun lt!571939 () Unit!42069)

(assert (=> d!138485 (= lt!571939 e!718316)))

(declare-fun c!122727 () Bool)

(assert (=> d!138485 (= c!122727 e!718318)))

(declare-fun res!840839 () Bool)

(assert (=> d!138485 (=> (not res!840839) (not e!718318))))

(assert (=> d!138485 (= res!840839 (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(assert (=> d!138485 (= lt!571936 e!718320)))

(assert (=> d!138485 (= c!122729 (and (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138485 (validMask!0 mask!1466)))

(assert (=> d!138485 (= (getCurrentListMap!4635 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571951)))

(declare-fun b!1261974 () Bool)

(assert (=> b!1261974 (= e!718312 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138485 c!122729) b!1261973))

(assert (= (and d!138485 (not c!122729)) b!1261977))

(assert (= (and b!1261977 c!122728) b!1261989))

(assert (= (and b!1261977 (not c!122728)) b!1261985))

(assert (= (and b!1261985 c!122730) b!1261972))

(assert (= (and b!1261985 (not c!122730)) b!1261969))

(assert (= (or b!1261972 b!1261969) bm!62011))

(assert (= (or b!1261989 bm!62011) bm!62012))

(assert (= (or b!1261989 b!1261972) bm!62014))

(assert (= (or b!1261973 bm!62012) bm!62013))

(assert (= (or b!1261973 bm!62014) bm!62009))

(assert (= (and d!138485 res!840839) b!1261983))

(assert (= (and d!138485 c!122727) b!1261978))

(assert (= (and d!138485 (not c!122727)) b!1261975))

(assert (= (and d!138485 res!840843) b!1261980))

(assert (= (and b!1261980 res!840841) b!1261974))

(assert (= (and b!1261980 (not res!840842)) b!1261986))

(assert (= (and b!1261986 res!840835) b!1261984))

(assert (= (and b!1261980 res!840840) b!1261981))

(assert (= (and b!1261981 c!122731) b!1261987))

(assert (= (and b!1261981 (not c!122731)) b!1261988))

(assert (= (and b!1261987 res!840836) b!1261971))

(assert (= (or b!1261987 b!1261988) bm!62010))

(assert (= (and b!1261981 res!840838) b!1261982))

(assert (= (and b!1261982 c!122726) b!1261976))

(assert (= (and b!1261982 (not c!122726)) b!1261970))

(assert (= (and b!1261976 res!840837) b!1261979))

(assert (= (or b!1261976 b!1261970) bm!62015))

(declare-fun b_lambda!22827 () Bool)

(assert (=> (not b_lambda!22827) (not b!1261984)))

(declare-fun t!41727 () Bool)

(declare-fun tb!11319 () Bool)

(assert (=> (and start!105954 (= defaultEntry!922 defaultEntry!922) t!41727) tb!11319))

(declare-fun result!23365 () Bool)

(assert (=> tb!11319 (= result!23365 tp_is_empty!32367)))

(assert (=> b!1261984 t!41727))

(declare-fun b_and!45395 () Bool)

(assert (= b_and!45391 (and (=> t!41727 result!23365) b_and!45395)))

(declare-fun m!1162479 () Bool)

(assert (=> bm!62015 m!1162479))

(declare-fun m!1162481 () Bool)

(assert (=> b!1261978 m!1162481))

(declare-fun m!1162483 () Bool)

(assert (=> b!1261978 m!1162483))

(declare-fun m!1162485 () Bool)

(assert (=> b!1261978 m!1162485))

(declare-fun m!1162487 () Bool)

(assert (=> b!1261978 m!1162487))

(declare-fun m!1162489 () Bool)

(assert (=> b!1261978 m!1162489))

(declare-fun m!1162491 () Bool)

(assert (=> b!1261978 m!1162491))

(assert (=> b!1261978 m!1162485))

(declare-fun m!1162493 () Bool)

(assert (=> b!1261978 m!1162493))

(assert (=> b!1261978 m!1162431))

(declare-fun m!1162495 () Bool)

(assert (=> b!1261978 m!1162495))

(declare-fun m!1162497 () Bool)

(assert (=> b!1261978 m!1162497))

(declare-fun m!1162499 () Bool)

(assert (=> b!1261978 m!1162499))

(declare-fun m!1162501 () Bool)

(assert (=> b!1261978 m!1162501))

(declare-fun m!1162503 () Bool)

(assert (=> b!1261978 m!1162503))

(declare-fun m!1162505 () Bool)

(assert (=> b!1261978 m!1162505))

(assert (=> b!1261978 m!1162487))

(assert (=> b!1261978 m!1162481))

(declare-fun m!1162507 () Bool)

(assert (=> b!1261978 m!1162507))

(assert (=> b!1261978 m!1162503))

(declare-fun m!1162509 () Bool)

(assert (=> b!1261978 m!1162509))

(declare-fun m!1162511 () Bool)

(assert (=> b!1261978 m!1162511))

(declare-fun m!1162513 () Bool)

(assert (=> b!1261979 m!1162513))

(declare-fun m!1162515 () Bool)

(assert (=> b!1261984 m!1162515))

(assert (=> b!1261984 m!1162497))

(declare-fun m!1162517 () Bool)

(assert (=> b!1261984 m!1162517))

(declare-fun m!1162519 () Bool)

(assert (=> b!1261984 m!1162519))

(assert (=> b!1261984 m!1162497))

(assert (=> b!1261984 m!1162515))

(assert (=> b!1261984 m!1162519))

(declare-fun m!1162521 () Bool)

(assert (=> b!1261984 m!1162521))

(assert (=> b!1261974 m!1162497))

(assert (=> b!1261974 m!1162497))

(declare-fun m!1162523 () Bool)

(assert (=> b!1261974 m!1162523))

(declare-fun m!1162525 () Bool)

(assert (=> bm!62010 m!1162525))

(assert (=> bm!62013 m!1162431))

(declare-fun m!1162527 () Bool)

(assert (=> b!1261973 m!1162527))

(assert (=> d!138485 m!1162423))

(declare-fun m!1162529 () Bool)

(assert (=> b!1261971 m!1162529))

(declare-fun m!1162531 () Bool)

(assert (=> bm!62009 m!1162531))

(assert (=> b!1261986 m!1162497))

(assert (=> b!1261986 m!1162497))

(declare-fun m!1162533 () Bool)

(assert (=> b!1261986 m!1162533))

(assert (=> b!1261983 m!1162497))

(assert (=> b!1261983 m!1162497))

(assert (=> b!1261983 m!1162523))

(assert (=> b!1261891 d!138485))

(declare-fun d!138487 () Bool)

(declare-fun lt!571958 () ListLongMap!18899)

(assert (=> d!138487 (not (contains!7586 lt!571958 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!144 (List!28221 (_ BitVec 64)) List!28221)

(assert (=> d!138487 (= lt!571958 (ListLongMap!18900 (removeStrictlySorted!144 (toList!9465 lt!571867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138487 (= (-!2141 lt!571867 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571958)))

(declare-fun bs!35716 () Bool)

(assert (= bs!35716 d!138487))

(declare-fun m!1162535 () Bool)

(assert (=> bs!35716 m!1162535))

(declare-fun m!1162537 () Bool)

(assert (=> bs!35716 m!1162537))

(assert (=> b!1261891 d!138487))

(declare-fun d!138489 () Bool)

(assert (=> d!138489 (= (-!2141 lt!571867 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571867)))

(declare-fun lt!571961 () Unit!42069)

(declare-fun choose!1869 (ListLongMap!18899 (_ BitVec 64)) Unit!42069)

(assert (=> d!138489 (= lt!571961 (choose!1869 lt!571867 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138489 (not (contains!7586 lt!571867 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138489 (= (removeNotPresentStillSame!150 lt!571867 #b1000000000000000000000000000000000000000000000000000000000000000) lt!571961)))

(declare-fun bs!35717 () Bool)

(assert (= bs!35717 d!138489))

(assert (=> bs!35717 m!1162447))

(declare-fun m!1162539 () Bool)

(assert (=> bs!35717 m!1162539))

(assert (=> bs!35717 m!1162437))

(assert (=> b!1261891 d!138489))

(declare-fun d!138491 () Bool)

(assert (=> d!138491 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105954 d!138491))

(declare-fun d!138493 () Bool)

(assert (=> d!138493 (= (array_inv!30243 _keys!1118) (bvsge (size!40263 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105954 d!138493))

(declare-fun d!138495 () Bool)

(assert (=> d!138495 (= (array_inv!30244 _values!914) (bvsge (size!40264 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105954 d!138495))

(declare-fun bm!62018 () Bool)

(declare-fun call!62021 () Bool)

(assert (=> bm!62018 (= call!62021 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1262000 () Bool)

(declare-fun e!718330 () Bool)

(declare-fun e!718329 () Bool)

(assert (=> b!1262000 (= e!718330 e!718329)))

(declare-fun c!122734 () Bool)

(assert (=> b!1262000 (= c!122734 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138497 () Bool)

(declare-fun res!840848 () Bool)

(assert (=> d!138497 (=> res!840848 e!718330)))

(assert (=> d!138497 (= res!840848 (bvsge #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(assert (=> d!138497 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!718330)))

(declare-fun b!1262001 () Bool)

(assert (=> b!1262001 (= e!718329 call!62021)))

(declare-fun b!1262002 () Bool)

(declare-fun e!718328 () Bool)

(assert (=> b!1262002 (= e!718329 e!718328)))

(declare-fun lt!571968 () (_ BitVec 64))

(assert (=> b!1262002 (= lt!571968 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!571970 () Unit!42069)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82352 (_ BitVec 64) (_ BitVec 32)) Unit!42069)

(assert (=> b!1262002 (= lt!571970 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!571968 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1262002 (arrayContainsKey!0 _keys!1118 lt!571968 #b00000000000000000000000000000000)))

(declare-fun lt!571969 () Unit!42069)

(assert (=> b!1262002 (= lt!571969 lt!571970)))

(declare-fun res!840849 () Bool)

(declare-datatypes ((SeekEntryResult!9974 0))(
  ( (MissingZero!9974 (index!42267 (_ BitVec 32))) (Found!9974 (index!42268 (_ BitVec 32))) (Intermediate!9974 (undefined!10786 Bool) (index!42269 (_ BitVec 32)) (x!111209 (_ BitVec 32))) (Undefined!9974) (MissingVacant!9974 (index!42270 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82352 (_ BitVec 32)) SeekEntryResult!9974)

(assert (=> b!1262002 (= res!840849 (= (seekEntryOrOpen!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9974 #b00000000000000000000000000000000)))))

(assert (=> b!1262002 (=> (not res!840849) (not e!718328))))

(declare-fun b!1262003 () Bool)

(assert (=> b!1262003 (= e!718328 call!62021)))

(assert (= (and d!138497 (not res!840848)) b!1262000))

(assert (= (and b!1262000 c!122734) b!1262002))

(assert (= (and b!1262000 (not c!122734)) b!1262001))

(assert (= (and b!1262002 res!840849) b!1262003))

(assert (= (or b!1262003 b!1262001) bm!62018))

(declare-fun m!1162541 () Bool)

(assert (=> bm!62018 m!1162541))

(assert (=> b!1262000 m!1162497))

(assert (=> b!1262000 m!1162497))

(assert (=> b!1262000 m!1162523))

(assert (=> b!1262002 m!1162497))

(declare-fun m!1162543 () Bool)

(assert (=> b!1262002 m!1162543))

(declare-fun m!1162545 () Bool)

(assert (=> b!1262002 m!1162545))

(assert (=> b!1262002 m!1162497))

(declare-fun m!1162547 () Bool)

(assert (=> b!1262002 m!1162547))

(assert (=> b!1261896 d!138497))

(declare-fun d!138499 () Bool)

(assert (=> d!138499 (= (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!571973 () Unit!42069)

(declare-fun choose!1870 (array!82352 array!82354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48521 V!48521 V!48521 V!48521 (_ BitVec 32) Int) Unit!42069)

(assert (=> d!138499 (= lt!571973 (choose!1870 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138499 (validMask!0 mask!1466)))

(assert (=> d!138499 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1173 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571973)))

(declare-fun bs!35718 () Bool)

(assert (= bs!35718 d!138499))

(assert (=> bs!35718 m!1162433))

(assert (=> bs!35718 m!1162431))

(declare-fun m!1162549 () Bool)

(assert (=> bs!35718 m!1162549))

(assert (=> bs!35718 m!1162423))

(assert (=> b!1261897 d!138499))

(declare-fun d!138501 () Bool)

(declare-fun e!718350 () Bool)

(assert (=> d!138501 e!718350))

(declare-fun res!840858 () Bool)

(assert (=> d!138501 (=> (not res!840858) (not e!718350))))

(declare-fun lt!571991 () ListLongMap!18899)

(assert (=> d!138501 (= res!840858 (not (contains!7586 lt!571991 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718351 () ListLongMap!18899)

(assert (=> d!138501 (= lt!571991 e!718351)))

(declare-fun c!122744 () Bool)

(assert (=> d!138501 (= c!122744 (bvsge #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(assert (=> d!138501 (validMask!0 mask!1466)))

(assert (=> d!138501 (= (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571991)))

(declare-fun b!1262028 () Bool)

(declare-fun e!718348 () Bool)

(declare-fun e!718346 () Bool)

(assert (=> b!1262028 (= e!718348 e!718346)))

(assert (=> b!1262028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun res!840860 () Bool)

(assert (=> b!1262028 (= res!840860 (contains!7586 lt!571991 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262028 (=> (not res!840860) (not e!718346))))

(declare-fun b!1262029 () Bool)

(declare-fun e!718349 () Bool)

(declare-fun isEmpty!1038 (ListLongMap!18899) Bool)

(assert (=> b!1262029 (= e!718349 (isEmpty!1038 lt!571991))))

(declare-fun b!1262030 () Bool)

(assert (=> b!1262030 (= e!718348 e!718349)))

(declare-fun c!122746 () Bool)

(assert (=> b!1262030 (= c!122746 (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun b!1262031 () Bool)

(assert (=> b!1262031 (= e!718351 (ListLongMap!18900 Nil!28218))))

(declare-fun b!1262032 () Bool)

(declare-fun lt!571993 () Unit!42069)

(declare-fun lt!571994 () Unit!42069)

(assert (=> b!1262032 (= lt!571993 lt!571994)))

(declare-fun lt!571989 () V!48521)

(declare-fun lt!571990 () (_ BitVec 64))

(declare-fun lt!571988 () (_ BitVec 64))

(declare-fun lt!571992 () ListLongMap!18899)

(assert (=> b!1262032 (not (contains!7586 (+!4242 lt!571992 (tuple2!21027 lt!571988 lt!571989)) lt!571990))))

(declare-fun addStillNotContains!324 (ListLongMap!18899 (_ BitVec 64) V!48521 (_ BitVec 64)) Unit!42069)

(assert (=> b!1262032 (= lt!571994 (addStillNotContains!324 lt!571992 lt!571988 lt!571989 lt!571990))))

(assert (=> b!1262032 (= lt!571990 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262032 (= lt!571989 (get!20269 (select (arr!39728 _values!914) #b00000000000000000000000000000000) (dynLambda!3394 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262032 (= lt!571988 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62024 () ListLongMap!18899)

(assert (=> b!1262032 (= lt!571992 call!62024)))

(declare-fun e!718347 () ListLongMap!18899)

(assert (=> b!1262032 (= e!718347 (+!4242 call!62024 (tuple2!21027 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000) (get!20269 (select (arr!39728 _values!914) #b00000000000000000000000000000000) (dynLambda!3394 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!62021 () Bool)

(assert (=> bm!62021 (= call!62024 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262033 () Bool)

(assert (=> b!1262033 (= e!718349 (= lt!571991 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262034 () Bool)

(assert (=> b!1262034 (= e!718347 call!62024)))

(declare-fun b!1262035 () Bool)

(assert (=> b!1262035 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(assert (=> b!1262035 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _values!914)))))

(assert (=> b!1262035 (= e!718346 (= (apply!996 lt!571991 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)) (get!20269 (select (arr!39728 _values!914) #b00000000000000000000000000000000) (dynLambda!3394 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262036 () Bool)

(assert (=> b!1262036 (= e!718350 e!718348)))

(declare-fun c!122745 () Bool)

(declare-fun e!718345 () Bool)

(assert (=> b!1262036 (= c!122745 e!718345)))

(declare-fun res!840859 () Bool)

(assert (=> b!1262036 (=> (not res!840859) (not e!718345))))

(assert (=> b!1262036 (= res!840859 (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun b!1262037 () Bool)

(assert (=> b!1262037 (= e!718345 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262037 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262038 () Bool)

(assert (=> b!1262038 (= e!718351 e!718347)))

(declare-fun c!122743 () Bool)

(assert (=> b!1262038 (= c!122743 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262039 () Bool)

(declare-fun res!840861 () Bool)

(assert (=> b!1262039 (=> (not res!840861) (not e!718350))))

(assert (=> b!1262039 (= res!840861 (not (contains!7586 lt!571991 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138501 c!122744) b!1262031))

(assert (= (and d!138501 (not c!122744)) b!1262038))

(assert (= (and b!1262038 c!122743) b!1262032))

(assert (= (and b!1262038 (not c!122743)) b!1262034))

(assert (= (or b!1262032 b!1262034) bm!62021))

(assert (= (and d!138501 res!840858) b!1262039))

(assert (= (and b!1262039 res!840861) b!1262036))

(assert (= (and b!1262036 res!840859) b!1262037))

(assert (= (and b!1262036 c!122745) b!1262028))

(assert (= (and b!1262036 (not c!122745)) b!1262030))

(assert (= (and b!1262028 res!840860) b!1262035))

(assert (= (and b!1262030 c!122746) b!1262033))

(assert (= (and b!1262030 (not c!122746)) b!1262029))

(declare-fun b_lambda!22829 () Bool)

(assert (=> (not b_lambda!22829) (not b!1262032)))

(assert (=> b!1262032 t!41727))

(declare-fun b_and!45397 () Bool)

(assert (= b_and!45395 (and (=> t!41727 result!23365) b_and!45397)))

(declare-fun b_lambda!22831 () Bool)

(assert (=> (not b_lambda!22831) (not b!1262035)))

(assert (=> b!1262035 t!41727))

(declare-fun b_and!45399 () Bool)

(assert (= b_and!45397 (and (=> t!41727 result!23365) b_and!45399)))

(assert (=> b!1262037 m!1162497))

(assert (=> b!1262037 m!1162497))

(assert (=> b!1262037 m!1162523))

(declare-fun m!1162551 () Bool)

(assert (=> bm!62021 m!1162551))

(declare-fun m!1162553 () Bool)

(assert (=> b!1262039 m!1162553))

(assert (=> b!1262035 m!1162497))

(declare-fun m!1162555 () Bool)

(assert (=> b!1262035 m!1162555))

(assert (=> b!1262035 m!1162497))

(assert (=> b!1262035 m!1162515))

(assert (=> b!1262035 m!1162519))

(assert (=> b!1262035 m!1162521))

(assert (=> b!1262035 m!1162519))

(assert (=> b!1262035 m!1162515))

(assert (=> b!1262028 m!1162497))

(assert (=> b!1262028 m!1162497))

(declare-fun m!1162557 () Bool)

(assert (=> b!1262028 m!1162557))

(declare-fun m!1162559 () Bool)

(assert (=> b!1262029 m!1162559))

(assert (=> b!1262032 m!1162497))

(assert (=> b!1262032 m!1162519))

(declare-fun m!1162561 () Bool)

(assert (=> b!1262032 m!1162561))

(assert (=> b!1262032 m!1162515))

(declare-fun m!1162563 () Bool)

(assert (=> b!1262032 m!1162563))

(assert (=> b!1262032 m!1162561))

(declare-fun m!1162565 () Bool)

(assert (=> b!1262032 m!1162565))

(declare-fun m!1162567 () Bool)

(assert (=> b!1262032 m!1162567))

(assert (=> b!1262032 m!1162515))

(assert (=> b!1262032 m!1162519))

(assert (=> b!1262032 m!1162521))

(declare-fun m!1162569 () Bool)

(assert (=> d!138501 m!1162569))

(assert (=> d!138501 m!1162423))

(assert (=> b!1262033 m!1162551))

(assert (=> b!1262038 m!1162497))

(assert (=> b!1262038 m!1162497))

(assert (=> b!1262038 m!1162523))

(assert (=> b!1261897 d!138501))

(declare-fun d!138503 () Bool)

(declare-fun e!718357 () Bool)

(assert (=> d!138503 e!718357))

(declare-fun res!840862 () Bool)

(assert (=> d!138503 (=> (not res!840862) (not e!718357))))

(declare-fun lt!571998 () ListLongMap!18899)

(assert (=> d!138503 (= res!840862 (not (contains!7586 lt!571998 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718358 () ListLongMap!18899)

(assert (=> d!138503 (= lt!571998 e!718358)))

(declare-fun c!122748 () Bool)

(assert (=> d!138503 (= c!122748 (bvsge #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(assert (=> d!138503 (validMask!0 mask!1466)))

(assert (=> d!138503 (= (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!571998)))

(declare-fun b!1262040 () Bool)

(declare-fun e!718355 () Bool)

(declare-fun e!718353 () Bool)

(assert (=> b!1262040 (= e!718355 e!718353)))

(assert (=> b!1262040 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun res!840864 () Bool)

(assert (=> b!1262040 (= res!840864 (contains!7586 lt!571998 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262040 (=> (not res!840864) (not e!718353))))

(declare-fun b!1262041 () Bool)

(declare-fun e!718356 () Bool)

(assert (=> b!1262041 (= e!718356 (isEmpty!1038 lt!571998))))

(declare-fun b!1262042 () Bool)

(assert (=> b!1262042 (= e!718355 e!718356)))

(declare-fun c!122750 () Bool)

(assert (=> b!1262042 (= c!122750 (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun b!1262043 () Bool)

(assert (=> b!1262043 (= e!718358 (ListLongMap!18900 Nil!28218))))

(declare-fun b!1262044 () Bool)

(declare-fun lt!572000 () Unit!42069)

(declare-fun lt!572001 () Unit!42069)

(assert (=> b!1262044 (= lt!572000 lt!572001)))

(declare-fun lt!571996 () V!48521)

(declare-fun lt!571995 () (_ BitVec 64))

(declare-fun lt!571997 () (_ BitVec 64))

(declare-fun lt!571999 () ListLongMap!18899)

(assert (=> b!1262044 (not (contains!7586 (+!4242 lt!571999 (tuple2!21027 lt!571995 lt!571996)) lt!571997))))

(assert (=> b!1262044 (= lt!572001 (addStillNotContains!324 lt!571999 lt!571995 lt!571996 lt!571997))))

(assert (=> b!1262044 (= lt!571997 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1262044 (= lt!571996 (get!20269 (select (arr!39728 _values!914) #b00000000000000000000000000000000) (dynLambda!3394 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1262044 (= lt!571995 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!62025 () ListLongMap!18899)

(assert (=> b!1262044 (= lt!571999 call!62025)))

(declare-fun e!718354 () ListLongMap!18899)

(assert (=> b!1262044 (= e!718354 (+!4242 call!62025 (tuple2!21027 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000) (get!20269 (select (arr!39728 _values!914) #b00000000000000000000000000000000) (dynLambda!3394 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!62022 () Bool)

(assert (=> bm!62022 (= call!62025 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1262045 () Bool)

(assert (=> b!1262045 (= e!718356 (= lt!571998 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1262046 () Bool)

(assert (=> b!1262046 (= e!718354 call!62025)))

(declare-fun b!1262047 () Bool)

(assert (=> b!1262047 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(assert (=> b!1262047 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _values!914)))))

(assert (=> b!1262047 (= e!718353 (= (apply!996 lt!571998 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)) (get!20269 (select (arr!39728 _values!914) #b00000000000000000000000000000000) (dynLambda!3394 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1262048 () Bool)

(assert (=> b!1262048 (= e!718357 e!718355)))

(declare-fun c!122749 () Bool)

(declare-fun e!718352 () Bool)

(assert (=> b!1262048 (= c!122749 e!718352)))

(declare-fun res!840863 () Bool)

(assert (=> b!1262048 (=> (not res!840863) (not e!718352))))

(assert (=> b!1262048 (= res!840863 (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun b!1262049 () Bool)

(assert (=> b!1262049 (= e!718352 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262049 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1262050 () Bool)

(assert (=> b!1262050 (= e!718358 e!718354)))

(declare-fun c!122747 () Bool)

(assert (=> b!1262050 (= c!122747 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262051 () Bool)

(declare-fun res!840865 () Bool)

(assert (=> b!1262051 (=> (not res!840865) (not e!718357))))

(assert (=> b!1262051 (= res!840865 (not (contains!7586 lt!571998 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138503 c!122748) b!1262043))

(assert (= (and d!138503 (not c!122748)) b!1262050))

(assert (= (and b!1262050 c!122747) b!1262044))

(assert (= (and b!1262050 (not c!122747)) b!1262046))

(assert (= (or b!1262044 b!1262046) bm!62022))

(assert (= (and d!138503 res!840862) b!1262051))

(assert (= (and b!1262051 res!840865) b!1262048))

(assert (= (and b!1262048 res!840863) b!1262049))

(assert (= (and b!1262048 c!122749) b!1262040))

(assert (= (and b!1262048 (not c!122749)) b!1262042))

(assert (= (and b!1262040 res!840864) b!1262047))

(assert (= (and b!1262042 c!122750) b!1262045))

(assert (= (and b!1262042 (not c!122750)) b!1262041))

(declare-fun b_lambda!22833 () Bool)

(assert (=> (not b_lambda!22833) (not b!1262044)))

(assert (=> b!1262044 t!41727))

(declare-fun b_and!45401 () Bool)

(assert (= b_and!45399 (and (=> t!41727 result!23365) b_and!45401)))

(declare-fun b_lambda!22835 () Bool)

(assert (=> (not b_lambda!22835) (not b!1262047)))

(assert (=> b!1262047 t!41727))

(declare-fun b_and!45403 () Bool)

(assert (= b_and!45401 (and (=> t!41727 result!23365) b_and!45403)))

(assert (=> b!1262049 m!1162497))

(assert (=> b!1262049 m!1162497))

(assert (=> b!1262049 m!1162523))

(declare-fun m!1162571 () Bool)

(assert (=> bm!62022 m!1162571))

(declare-fun m!1162573 () Bool)

(assert (=> b!1262051 m!1162573))

(assert (=> b!1262047 m!1162497))

(declare-fun m!1162575 () Bool)

(assert (=> b!1262047 m!1162575))

(assert (=> b!1262047 m!1162497))

(assert (=> b!1262047 m!1162515))

(assert (=> b!1262047 m!1162519))

(assert (=> b!1262047 m!1162521))

(assert (=> b!1262047 m!1162519))

(assert (=> b!1262047 m!1162515))

(assert (=> b!1262040 m!1162497))

(assert (=> b!1262040 m!1162497))

(declare-fun m!1162577 () Bool)

(assert (=> b!1262040 m!1162577))

(declare-fun m!1162579 () Bool)

(assert (=> b!1262041 m!1162579))

(assert (=> b!1262044 m!1162497))

(assert (=> b!1262044 m!1162519))

(declare-fun m!1162581 () Bool)

(assert (=> b!1262044 m!1162581))

(assert (=> b!1262044 m!1162515))

(declare-fun m!1162583 () Bool)

(assert (=> b!1262044 m!1162583))

(assert (=> b!1262044 m!1162581))

(declare-fun m!1162585 () Bool)

(assert (=> b!1262044 m!1162585))

(declare-fun m!1162587 () Bool)

(assert (=> b!1262044 m!1162587))

(assert (=> b!1262044 m!1162515))

(assert (=> b!1262044 m!1162519))

(assert (=> b!1262044 m!1162521))

(declare-fun m!1162589 () Bool)

(assert (=> d!138503 m!1162589))

(assert (=> d!138503 m!1162423))

(assert (=> b!1262045 m!1162571))

(assert (=> b!1262050 m!1162497))

(assert (=> b!1262050 m!1162497))

(assert (=> b!1262050 m!1162523))

(assert (=> b!1261897 d!138503))

(declare-fun b!1262062 () Bool)

(declare-fun e!718368 () Bool)

(declare-fun e!718369 () Bool)

(assert (=> b!1262062 (= e!718368 e!718369)))

(declare-fun c!122753 () Bool)

(assert (=> b!1262062 (= c!122753 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62025 () Bool)

(declare-fun call!62028 () Bool)

(assert (=> bm!62025 (= call!62028 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122753 (Cons!28218 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000) Nil!28219) Nil!28219)))))

(declare-fun b!1262063 () Bool)

(declare-fun e!718367 () Bool)

(assert (=> b!1262063 (= e!718367 e!718368)))

(declare-fun res!840873 () Bool)

(assert (=> b!1262063 (=> (not res!840873) (not e!718368))))

(declare-fun e!718370 () Bool)

(assert (=> b!1262063 (= res!840873 (not e!718370))))

(declare-fun res!840874 () Bool)

(assert (=> b!1262063 (=> (not res!840874) (not e!718370))))

(assert (=> b!1262063 (= res!840874 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138505 () Bool)

(declare-fun res!840872 () Bool)

(assert (=> d!138505 (=> res!840872 e!718367)))

(assert (=> d!138505 (= res!840872 (bvsge #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(assert (=> d!138505 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28219) e!718367)))

(declare-fun b!1262064 () Bool)

(declare-fun contains!7587 (List!28222 (_ BitVec 64)) Bool)

(assert (=> b!1262064 (= e!718370 (contains!7587 Nil!28219 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1262065 () Bool)

(assert (=> b!1262065 (= e!718369 call!62028)))

(declare-fun b!1262066 () Bool)

(assert (=> b!1262066 (= e!718369 call!62028)))

(assert (= (and d!138505 (not res!840872)) b!1262063))

(assert (= (and b!1262063 res!840874) b!1262064))

(assert (= (and b!1262063 res!840873) b!1262062))

(assert (= (and b!1262062 c!122753) b!1262066))

(assert (= (and b!1262062 (not c!122753)) b!1262065))

(assert (= (or b!1262066 b!1262065) bm!62025))

(assert (=> b!1262062 m!1162497))

(assert (=> b!1262062 m!1162497))

(assert (=> b!1262062 m!1162523))

(assert (=> bm!62025 m!1162497))

(declare-fun m!1162591 () Bool)

(assert (=> bm!62025 m!1162591))

(assert (=> b!1262063 m!1162497))

(assert (=> b!1262063 m!1162497))

(assert (=> b!1262063 m!1162523))

(assert (=> b!1262064 m!1162497))

(assert (=> b!1262064 m!1162497))

(declare-fun m!1162593 () Bool)

(assert (=> b!1262064 m!1162593))

(assert (=> b!1261892 d!138505))

(declare-fun d!138507 () Bool)

(declare-fun e!718375 () Bool)

(assert (=> d!138507 e!718375))

(declare-fun res!840877 () Bool)

(assert (=> d!138507 (=> res!840877 e!718375)))

(declare-fun lt!572010 () Bool)

(assert (=> d!138507 (= res!840877 (not lt!572010))))

(declare-fun lt!572013 () Bool)

(assert (=> d!138507 (= lt!572010 lt!572013)))

(declare-fun lt!572011 () Unit!42069)

(declare-fun e!718376 () Unit!42069)

(assert (=> d!138507 (= lt!572011 e!718376)))

(declare-fun c!122756 () Bool)

(assert (=> d!138507 (= c!122756 lt!572013)))

(declare-fun containsKey!623 (List!28221 (_ BitVec 64)) Bool)

(assert (=> d!138507 (= lt!572013 (containsKey!623 (toList!9465 lt!571867) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138507 (= (contains!7586 lt!571867 #b1000000000000000000000000000000000000000000000000000000000000000) lt!572010)))

(declare-fun b!1262073 () Bool)

(declare-fun lt!572012 () Unit!42069)

(assert (=> b!1262073 (= e!718376 lt!572012)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!432 (List!28221 (_ BitVec 64)) Unit!42069)

(assert (=> b!1262073 (= lt!572012 (lemmaContainsKeyImpliesGetValueByKeyDefined!432 (toList!9465 lt!571867) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!712 0))(
  ( (Some!711 (v!18953 V!48521)) (None!710) )
))
(declare-fun isDefined!471 (Option!712) Bool)

(declare-fun getValueByKey!661 (List!28221 (_ BitVec 64)) Option!712)

(assert (=> b!1262073 (isDefined!471 (getValueByKey!661 (toList!9465 lt!571867) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262074 () Bool)

(declare-fun Unit!42072 () Unit!42069)

(assert (=> b!1262074 (= e!718376 Unit!42072)))

(declare-fun b!1262075 () Bool)

(assert (=> b!1262075 (= e!718375 (isDefined!471 (getValueByKey!661 (toList!9465 lt!571867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138507 c!122756) b!1262073))

(assert (= (and d!138507 (not c!122756)) b!1262074))

(assert (= (and d!138507 (not res!840877)) b!1262075))

(declare-fun m!1162595 () Bool)

(assert (=> d!138507 m!1162595))

(declare-fun m!1162597 () Bool)

(assert (=> b!1262073 m!1162597))

(declare-fun m!1162599 () Bool)

(assert (=> b!1262073 m!1162599))

(assert (=> b!1262073 m!1162599))

(declare-fun m!1162601 () Bool)

(assert (=> b!1262073 m!1162601))

(assert (=> b!1262075 m!1162599))

(assert (=> b!1262075 m!1162599))

(assert (=> b!1262075 m!1162601))

(assert (=> b!1261899 d!138507))

(declare-fun call!62029 () ListLongMap!18899)

(declare-fun c!122759 () Bool)

(declare-fun call!62033 () ListLongMap!18899)

(declare-fun bm!62026 () Bool)

(declare-fun call!62032 () ListLongMap!18899)

(declare-fun c!122760 () Bool)

(declare-fun call!62030 () ListLongMap!18899)

(assert (=> bm!62026 (= call!62032 (+!4242 (ite c!122760 call!62033 (ite c!122759 call!62030 call!62029)) (ite (or c!122760 c!122759) (tuple2!21027 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!21027 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1262076 () Bool)

(declare-fun e!718389 () ListLongMap!18899)

(assert (=> b!1262076 (= e!718389 call!62029)))

(declare-fun b!1262077 () Bool)

(declare-fun e!718377 () Bool)

(declare-fun call!62034 () Bool)

(assert (=> b!1262077 (= e!718377 (not call!62034))))

(declare-fun bm!62027 () Bool)

(declare-fun call!62035 () Bool)

(declare-fun lt!572031 () ListLongMap!18899)

(assert (=> bm!62027 (= call!62035 (contains!7586 lt!572031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1262078 () Bool)

(declare-fun e!718381 () Bool)

(assert (=> b!1262078 (= e!718381 (= (apply!996 lt!572031 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1262079 () Bool)

(declare-fun call!62031 () ListLongMap!18899)

(assert (=> b!1262079 (= e!718389 call!62031)))

(declare-fun bm!62028 () Bool)

(assert (=> bm!62028 (= call!62029 call!62030)))

(declare-fun b!1262080 () Bool)

(declare-fun e!718388 () ListLongMap!18899)

(assert (=> b!1262080 (= e!718388 (+!4242 call!62032 (tuple2!21027 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1262082 () Bool)

(declare-fun e!718384 () Unit!42069)

(declare-fun Unit!42073 () Unit!42069)

(assert (=> b!1262082 (= e!718384 Unit!42073)))

(declare-fun b!1262083 () Bool)

(declare-fun e!718385 () Bool)

(assert (=> b!1262083 (= e!718377 e!718385)))

(declare-fun res!840880 () Bool)

(assert (=> b!1262083 (= res!840880 call!62034)))

(assert (=> b!1262083 (=> (not res!840880) (not e!718385))))

(declare-fun b!1262084 () Bool)

(declare-fun e!718387 () ListLongMap!18899)

(assert (=> b!1262084 (= e!718388 e!718387)))

(assert (=> b!1262084 (= c!122759 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262085 () Bool)

(declare-fun lt!572029 () Unit!42069)

(assert (=> b!1262085 (= e!718384 lt!572029)))

(declare-fun lt!572018 () ListLongMap!18899)

(assert (=> b!1262085 (= lt!572018 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572028 () (_ BitVec 64))

(assert (=> b!1262085 (= lt!572028 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572025 () (_ BitVec 64))

(assert (=> b!1262085 (= lt!572025 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572020 () Unit!42069)

(assert (=> b!1262085 (= lt!572020 (addStillContains!1086 lt!572018 lt!572028 zeroValue!871 lt!572025))))

(assert (=> b!1262085 (contains!7586 (+!4242 lt!572018 (tuple2!21027 lt!572028 zeroValue!871)) lt!572025)))

(declare-fun lt!572017 () Unit!42069)

(assert (=> b!1262085 (= lt!572017 lt!572020)))

(declare-fun lt!572032 () ListLongMap!18899)

(assert (=> b!1262085 (= lt!572032 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572022 () (_ BitVec 64))

(assert (=> b!1262085 (= lt!572022 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572030 () (_ BitVec 64))

(assert (=> b!1262085 (= lt!572030 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572027 () Unit!42069)

(assert (=> b!1262085 (= lt!572027 (addApplyDifferent!540 lt!572032 lt!572022 minValueBefore!43 lt!572030))))

(assert (=> b!1262085 (= (apply!996 (+!4242 lt!572032 (tuple2!21027 lt!572022 minValueBefore!43)) lt!572030) (apply!996 lt!572032 lt!572030))))

(declare-fun lt!572026 () Unit!42069)

(assert (=> b!1262085 (= lt!572026 lt!572027)))

(declare-fun lt!572024 () ListLongMap!18899)

(assert (=> b!1262085 (= lt!572024 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572014 () (_ BitVec 64))

(assert (=> b!1262085 (= lt!572014 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572021 () (_ BitVec 64))

(assert (=> b!1262085 (= lt!572021 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!572034 () Unit!42069)

(assert (=> b!1262085 (= lt!572034 (addApplyDifferent!540 lt!572024 lt!572014 zeroValue!871 lt!572021))))

(assert (=> b!1262085 (= (apply!996 (+!4242 lt!572024 (tuple2!21027 lt!572014 zeroValue!871)) lt!572021) (apply!996 lt!572024 lt!572021))))

(declare-fun lt!572015 () Unit!42069)

(assert (=> b!1262085 (= lt!572015 lt!572034)))

(declare-fun lt!572033 () ListLongMap!18899)

(assert (=> b!1262085 (= lt!572033 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!572035 () (_ BitVec 64))

(assert (=> b!1262085 (= lt!572035 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!572023 () (_ BitVec 64))

(assert (=> b!1262085 (= lt!572023 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1262085 (= lt!572029 (addApplyDifferent!540 lt!572033 lt!572035 minValueBefore!43 lt!572023))))

(assert (=> b!1262085 (= (apply!996 (+!4242 lt!572033 (tuple2!21027 lt!572035 minValueBefore!43)) lt!572023) (apply!996 lt!572033 lt!572023))))

(declare-fun b!1262086 () Bool)

(assert (=> b!1262086 (= e!718385 (= (apply!996 lt!572031 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1262087 () Bool)

(declare-fun res!840883 () Bool)

(declare-fun e!718383 () Bool)

(assert (=> b!1262087 (=> (not res!840883) (not e!718383))))

(declare-fun e!718382 () Bool)

(assert (=> b!1262087 (= res!840883 e!718382)))

(declare-fun res!840885 () Bool)

(assert (=> b!1262087 (=> res!840885 e!718382)))

(declare-fun e!718380 () Bool)

(assert (=> b!1262087 (= res!840885 (not e!718380))))

(declare-fun res!840884 () Bool)

(assert (=> b!1262087 (=> (not res!840884) (not e!718380))))

(assert (=> b!1262087 (= res!840884 (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun b!1262088 () Bool)

(declare-fun res!840881 () Bool)

(assert (=> b!1262088 (=> (not res!840881) (not e!718383))))

(declare-fun e!718378 () Bool)

(assert (=> b!1262088 (= res!840881 e!718378)))

(declare-fun c!122762 () Bool)

(assert (=> b!1262088 (= c!122762 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!62029 () Bool)

(assert (=> bm!62029 (= call!62030 call!62033)))

(declare-fun bm!62030 () Bool)

(assert (=> bm!62030 (= call!62033 (getCurrentListMapNoExtraKeys!5831 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262089 () Bool)

(assert (=> b!1262089 (= e!718383 e!718377)))

(declare-fun c!122757 () Bool)

(assert (=> b!1262089 (= c!122757 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262090 () Bool)

(declare-fun e!718386 () Bool)

(assert (=> b!1262090 (= e!718386 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!62031 () Bool)

(assert (=> bm!62031 (= call!62031 call!62032)))

(declare-fun bm!62032 () Bool)

(assert (=> bm!62032 (= call!62034 (contains!7586 lt!572031 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!718379 () Bool)

(declare-fun b!1262091 () Bool)

(assert (=> b!1262091 (= e!718379 (= (apply!996 lt!572031 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)) (get!20269 (select (arr!39728 _values!914) #b00000000000000000000000000000000) (dynLambda!3394 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1262091 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40264 _values!914)))))

(assert (=> b!1262091 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun b!1262092 () Bool)

(declare-fun c!122761 () Bool)

(assert (=> b!1262092 (= c!122761 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1262092 (= e!718387 e!718389)))

(declare-fun b!1262093 () Bool)

(assert (=> b!1262093 (= e!718382 e!718379)))

(declare-fun res!840878 () Bool)

(assert (=> b!1262093 (=> (not res!840878) (not e!718379))))

(assert (=> b!1262093 (= res!840878 (contains!7586 lt!572031 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1262093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(declare-fun b!1262094 () Bool)

(assert (=> b!1262094 (= e!718378 e!718381)))

(declare-fun res!840879 () Bool)

(assert (=> b!1262094 (= res!840879 call!62035)))

(assert (=> b!1262094 (=> (not res!840879) (not e!718381))))

(declare-fun b!1262095 () Bool)

(assert (=> b!1262095 (= e!718378 (not call!62035))))

(declare-fun b!1262096 () Bool)

(assert (=> b!1262096 (= e!718387 call!62031)))

(declare-fun d!138509 () Bool)

(assert (=> d!138509 e!718383))

(declare-fun res!840886 () Bool)

(assert (=> d!138509 (=> (not res!840886) (not e!718383))))

(assert (=> d!138509 (= res!840886 (or (bvsge #b00000000000000000000000000000000 (size!40263 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))))

(declare-fun lt!572016 () ListLongMap!18899)

(assert (=> d!138509 (= lt!572031 lt!572016)))

(declare-fun lt!572019 () Unit!42069)

(assert (=> d!138509 (= lt!572019 e!718384)))

(declare-fun c!122758 () Bool)

(assert (=> d!138509 (= c!122758 e!718386)))

(declare-fun res!840882 () Bool)

(assert (=> d!138509 (=> (not res!840882) (not e!718386))))

(assert (=> d!138509 (= res!840882 (bvslt #b00000000000000000000000000000000 (size!40263 _keys!1118)))))

(assert (=> d!138509 (= lt!572016 e!718388)))

(assert (=> d!138509 (= c!122760 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138509 (validMask!0 mask!1466)))

(assert (=> d!138509 (= (getCurrentListMap!4635 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!572031)))

(declare-fun b!1262081 () Bool)

(assert (=> b!1262081 (= e!718380 (validKeyInArray!0 (select (arr!39727 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138509 c!122760) b!1262080))

(assert (= (and d!138509 (not c!122760)) b!1262084))

(assert (= (and b!1262084 c!122759) b!1262096))

(assert (= (and b!1262084 (not c!122759)) b!1262092))

(assert (= (and b!1262092 c!122761) b!1262079))

(assert (= (and b!1262092 (not c!122761)) b!1262076))

(assert (= (or b!1262079 b!1262076) bm!62028))

(assert (= (or b!1262096 bm!62028) bm!62029))

(assert (= (or b!1262096 b!1262079) bm!62031))

(assert (= (or b!1262080 bm!62029) bm!62030))

(assert (= (or b!1262080 bm!62031) bm!62026))

(assert (= (and d!138509 res!840882) b!1262090))

(assert (= (and d!138509 c!122758) b!1262085))

(assert (= (and d!138509 (not c!122758)) b!1262082))

(assert (= (and d!138509 res!840886) b!1262087))

(assert (= (and b!1262087 res!840884) b!1262081))

(assert (= (and b!1262087 (not res!840885)) b!1262093))

(assert (= (and b!1262093 res!840878) b!1262091))

(assert (= (and b!1262087 res!840883) b!1262088))

(assert (= (and b!1262088 c!122762) b!1262094))

(assert (= (and b!1262088 (not c!122762)) b!1262095))

(assert (= (and b!1262094 res!840879) b!1262078))

(assert (= (or b!1262094 b!1262095) bm!62027))

(assert (= (and b!1262088 res!840881) b!1262089))

(assert (= (and b!1262089 c!122757) b!1262083))

(assert (= (and b!1262089 (not c!122757)) b!1262077))

(assert (= (and b!1262083 res!840880) b!1262086))

(assert (= (or b!1262083 b!1262077) bm!62032))

(declare-fun b_lambda!22837 () Bool)

(assert (=> (not b_lambda!22837) (not b!1262091)))

(assert (=> b!1262091 t!41727))

(declare-fun b_and!45405 () Bool)

(assert (= b_and!45403 (and (=> t!41727 result!23365) b_and!45405)))

(declare-fun m!1162603 () Bool)

(assert (=> bm!62032 m!1162603))

(declare-fun m!1162605 () Bool)

(assert (=> b!1262085 m!1162605))

(declare-fun m!1162607 () Bool)

(assert (=> b!1262085 m!1162607))

(declare-fun m!1162609 () Bool)

(assert (=> b!1262085 m!1162609))

(declare-fun m!1162611 () Bool)

(assert (=> b!1262085 m!1162611))

(declare-fun m!1162613 () Bool)

(assert (=> b!1262085 m!1162613))

(declare-fun m!1162615 () Bool)

(assert (=> b!1262085 m!1162615))

(assert (=> b!1262085 m!1162609))

(declare-fun m!1162617 () Bool)

(assert (=> b!1262085 m!1162617))

(assert (=> b!1262085 m!1162433))

(declare-fun m!1162619 () Bool)

(assert (=> b!1262085 m!1162619))

(assert (=> b!1262085 m!1162497))

(declare-fun m!1162621 () Bool)

(assert (=> b!1262085 m!1162621))

(declare-fun m!1162623 () Bool)

(assert (=> b!1262085 m!1162623))

(declare-fun m!1162625 () Bool)

(assert (=> b!1262085 m!1162625))

(declare-fun m!1162627 () Bool)

(assert (=> b!1262085 m!1162627))

(assert (=> b!1262085 m!1162611))

(assert (=> b!1262085 m!1162605))

(declare-fun m!1162629 () Bool)

(assert (=> b!1262085 m!1162629))

(assert (=> b!1262085 m!1162625))

(declare-fun m!1162631 () Bool)

(assert (=> b!1262085 m!1162631))

(declare-fun m!1162633 () Bool)

(assert (=> b!1262085 m!1162633))

(declare-fun m!1162635 () Bool)

(assert (=> b!1262086 m!1162635))

(assert (=> b!1262091 m!1162515))

(assert (=> b!1262091 m!1162497))

(declare-fun m!1162637 () Bool)

(assert (=> b!1262091 m!1162637))

(assert (=> b!1262091 m!1162519))

(assert (=> b!1262091 m!1162497))

(assert (=> b!1262091 m!1162515))

(assert (=> b!1262091 m!1162519))

(assert (=> b!1262091 m!1162521))

(assert (=> b!1262081 m!1162497))

(assert (=> b!1262081 m!1162497))

(assert (=> b!1262081 m!1162523))

(declare-fun m!1162639 () Bool)

(assert (=> bm!62027 m!1162639))

(assert (=> bm!62030 m!1162433))

(declare-fun m!1162641 () Bool)

(assert (=> b!1262080 m!1162641))

(assert (=> d!138509 m!1162423))

(declare-fun m!1162643 () Bool)

(assert (=> b!1262078 m!1162643))

(declare-fun m!1162645 () Bool)

(assert (=> bm!62026 m!1162645))

(assert (=> b!1262093 m!1162497))

(assert (=> b!1262093 m!1162497))

(declare-fun m!1162647 () Bool)

(assert (=> b!1262093 m!1162647))

(assert (=> b!1262090 m!1162497))

(assert (=> b!1262090 m!1162497))

(assert (=> b!1262090 m!1162523))

(assert (=> b!1261899 d!138509))

(declare-fun mapIsEmpty!50365 () Bool)

(declare-fun mapRes!50365 () Bool)

(assert (=> mapIsEmpty!50365 mapRes!50365))

(declare-fun condMapEmpty!50365 () Bool)

(declare-fun mapDefault!50365 () ValueCell!15420)

(assert (=> mapNonEmpty!50359 (= condMapEmpty!50365 (= mapRest!50359 ((as const (Array (_ BitVec 32) ValueCell!15420)) mapDefault!50365)))))

(declare-fun e!718395 () Bool)

(assert (=> mapNonEmpty!50359 (= tp!95932 (and e!718395 mapRes!50365))))

(declare-fun mapNonEmpty!50365 () Bool)

(declare-fun tp!95942 () Bool)

(declare-fun e!718394 () Bool)

(assert (=> mapNonEmpty!50365 (= mapRes!50365 (and tp!95942 e!718394))))

(declare-fun mapValue!50365 () ValueCell!15420)

(declare-fun mapKey!50365 () (_ BitVec 32))

(declare-fun mapRest!50365 () (Array (_ BitVec 32) ValueCell!15420))

(assert (=> mapNonEmpty!50365 (= mapRest!50359 (store mapRest!50365 mapKey!50365 mapValue!50365))))

(declare-fun b!1262104 () Bool)

(assert (=> b!1262104 (= e!718395 tp_is_empty!32367)))

(declare-fun b!1262103 () Bool)

(assert (=> b!1262103 (= e!718394 tp_is_empty!32367)))

(assert (= (and mapNonEmpty!50359 condMapEmpty!50365) mapIsEmpty!50365))

(assert (= (and mapNonEmpty!50359 (not condMapEmpty!50365)) mapNonEmpty!50365))

(assert (= (and mapNonEmpty!50365 ((_ is ValueCellFull!15420) mapValue!50365)) b!1262103))

(assert (= (and mapNonEmpty!50359 ((_ is ValueCellFull!15420) mapDefault!50365)) b!1262104))

(declare-fun m!1162649 () Bool)

(assert (=> mapNonEmpty!50365 m!1162649))

(declare-fun b_lambda!22839 () Bool)

(assert (= b_lambda!22833 (or (and start!105954 b_free!27465) b_lambda!22839)))

(declare-fun b_lambda!22841 () Bool)

(assert (= b_lambda!22827 (or (and start!105954 b_free!27465) b_lambda!22841)))

(declare-fun b_lambda!22843 () Bool)

(assert (= b_lambda!22837 (or (and start!105954 b_free!27465) b_lambda!22843)))

(declare-fun b_lambda!22845 () Bool)

(assert (= b_lambda!22835 (or (and start!105954 b_free!27465) b_lambda!22845)))

(declare-fun b_lambda!22847 () Bool)

(assert (= b_lambda!22831 (or (and start!105954 b_free!27465) b_lambda!22847)))

(declare-fun b_lambda!22849 () Bool)

(assert (= b_lambda!22829 (or (and start!105954 b_free!27465) b_lambda!22849)))

(check-sat (not b!1261974) (not bm!62018) (not b!1262040) (not b_next!27465) (not bm!62010) (not d!138489) (not b!1262035) (not b!1262044) b_and!45405 (not b!1262038) (not d!138485) (not b!1262051) (not b!1262062) (not b!1262078) (not b_lambda!22849) (not bm!62009) (not bm!62015) (not bm!62022) (not b!1262002) (not b!1262039) (not d!138503) (not d!138509) (not b!1261979) (not b!1261978) (not b_lambda!22847) (not b!1262050) (not b!1261971) (not b!1262028) (not b!1262049) (not b!1262033) (not bm!62013) (not bm!62027) (not b_lambda!22841) (not d!138501) (not b!1262064) (not d!138487) (not b!1262073) (not b!1262091) (not b!1262041) (not bm!62025) (not b_lambda!22839) (not b!1262032) (not b!1262037) (not d!138499) (not b!1262093) (not b!1261984) (not bm!62021) (not bm!62030) (not b!1262000) (not b!1261983) (not b!1262047) (not d!138507) (not b_lambda!22845) (not b!1261973) (not mapNonEmpty!50365) (not b!1262075) (not b!1262029) (not b!1262080) (not b!1261986) (not b!1262085) (not bm!62026) (not b!1262090) (not b!1262081) (not b_lambda!22843) (not b!1262086) tp_is_empty!32367 (not b!1262063) (not bm!62032) (not b!1262045))
(check-sat b_and!45405 (not b_next!27465))
