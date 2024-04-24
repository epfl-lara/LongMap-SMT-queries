; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105888 () Bool)

(assert start!105888)

(declare-fun b_free!27265 () Bool)

(declare-fun b_next!27265 () Bool)

(assert (=> start!105888 (= b_free!27265 (not b_next!27265))))

(declare-fun tp!95317 () Bool)

(declare-fun b_and!45141 () Bool)

(assert (=> start!105888 (= tp!95317 b_and!45141)))

(declare-fun b!1259962 () Bool)

(declare-fun e!716743 () Bool)

(declare-fun e!716747 () Bool)

(declare-fun mapRes!50044 () Bool)

(assert (=> b!1259962 (= e!716743 (and e!716747 mapRes!50044))))

(declare-fun condMapEmpty!50044 () Bool)

(declare-datatypes ((V!48255 0))(
  ( (V!48256 (val!16146 Int)) )
))
(declare-datatypes ((ValueCell!15320 0))(
  ( (ValueCellFull!15320 (v!18844 V!48255)) (EmptyCell!15320) )
))
(declare-datatypes ((array!82007 0))(
  ( (array!82008 (arr!39555 (Array (_ BitVec 32) ValueCell!15320)) (size!40092 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82007)

(declare-fun mapDefault!50044 () ValueCell!15320)

(assert (=> b!1259962 (= condMapEmpty!50044 (= (arr!39555 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15320)) mapDefault!50044)))))

(declare-fun b!1259963 () Bool)

(declare-fun e!716748 () Bool)

(declare-fun tp_is_empty!32167 () Bool)

(assert (=> b!1259963 (= e!716748 tp_is_empty!32167)))

(declare-fun b!1259964 () Bool)

(assert (=> b!1259964 (= e!716747 tp_is_empty!32167)))

(declare-fun b!1259965 () Bool)

(declare-fun res!839426 () Bool)

(declare-fun e!716746 () Bool)

(assert (=> b!1259965 (=> (not res!839426) (not e!716746))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82009 0))(
  ( (array!82010 (arr!39556 (Array (_ BitVec 32) (_ BitVec 64))) (size!40093 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82009)

(assert (=> b!1259965 (= res!839426 (and (= (size!40092 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40093 _keys!1118) (size!40092 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1259966 () Bool)

(declare-fun res!839427 () Bool)

(assert (=> b!1259966 (=> (not res!839427) (not e!716746))))

(declare-datatypes ((List!28113 0))(
  ( (Nil!28110) (Cons!28109 (h!29327 (_ BitVec 64)) (t!41598 List!28113)) )
))
(declare-fun arrayNoDuplicates!0 (array!82009 (_ BitVec 32) List!28113) Bool)

(assert (=> b!1259966 (= res!839427 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28110))))

(declare-fun b!1259967 () Bool)

(declare-fun res!839425 () Bool)

(assert (=> b!1259967 (=> (not res!839425) (not e!716746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82009 (_ BitVec 32)) Bool)

(assert (=> b!1259967 (= res!839425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50044 () Bool)

(declare-fun tp!95318 () Bool)

(assert (=> mapNonEmpty!50044 (= mapRes!50044 (and tp!95318 e!716748))))

(declare-fun mapKey!50044 () (_ BitVec 32))

(declare-fun mapRest!50044 () (Array (_ BitVec 32) ValueCell!15320))

(declare-fun mapValue!50044 () ValueCell!15320)

(assert (=> mapNonEmpty!50044 (= (arr!39555 _values!914) (store mapRest!50044 mapKey!50044 mapValue!50044))))

(declare-fun res!839424 () Bool)

(assert (=> start!105888 (=> (not res!839424) (not e!716746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105888 (= res!839424 (validMask!0 mask!1466))))

(assert (=> start!105888 e!716746))

(assert (=> start!105888 true))

(assert (=> start!105888 tp!95317))

(assert (=> start!105888 tp_is_empty!32167))

(declare-fun array_inv!30265 (array!82009) Bool)

(assert (=> start!105888 (array_inv!30265 _keys!1118)))

(declare-fun array_inv!30266 (array!82007) Bool)

(assert (=> start!105888 (and (array_inv!30266 _values!914) e!716743)))

(declare-fun mapIsEmpty!50044 () Bool)

(assert (=> mapIsEmpty!50044 mapRes!50044))

(declare-fun b!1259968 () Bool)

(declare-fun e!716745 () Bool)

(assert (=> b!1259968 (= e!716746 (not e!716745))))

(declare-fun res!839423 () Bool)

(assert (=> b!1259968 (=> res!839423 e!716745)))

(assert (=> b!1259968 (= res!839423 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20884 0))(
  ( (tuple2!20885 (_1!10453 (_ BitVec 64)) (_2!10453 V!48255)) )
))
(declare-datatypes ((List!28114 0))(
  ( (Nil!28111) (Cons!28110 (h!29328 tuple2!20884) (t!41599 List!28114)) )
))
(declare-datatypes ((ListLongMap!18765 0))(
  ( (ListLongMap!18766 (toList!9398 List!28114)) )
))
(declare-fun lt!569795 () ListLongMap!18765)

(declare-fun lt!569798 () ListLongMap!18765)

(assert (=> b!1259968 (= lt!569795 lt!569798)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48255)

(declare-fun zeroValue!871 () V!48255)

(declare-fun minValueBefore!43 () V!48255)

(declare-datatypes ((Unit!41935 0))(
  ( (Unit!41936) )
))
(declare-fun lt!569796 () Unit!41935)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1126 (array!82009 array!82007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48255 V!48255 V!48255 V!48255 (_ BitVec 32) Int) Unit!41935)

(assert (=> b!1259968 (= lt!569796 (lemmaNoChangeToArrayThenSameMapNoExtras!1126 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5812 (array!82009 array!82007 (_ BitVec 32) (_ BitVec 32) V!48255 V!48255 (_ BitVec 32) Int) ListLongMap!18765)

(assert (=> b!1259968 (= lt!569798 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1259968 (= lt!569795 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1259969 () Bool)

(assert (=> b!1259969 (= e!716745 (bvsle #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(declare-fun lt!569797 () ListLongMap!18765)

(declare-fun getCurrentListMap!4584 (array!82009 array!82007 (_ BitVec 32) (_ BitVec 32) V!48255 V!48255 (_ BitVec 32) Int) ListLongMap!18765)

(assert (=> b!1259969 (= lt!569797 (getCurrentListMap!4584 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105888 res!839424) b!1259965))

(assert (= (and b!1259965 res!839426) b!1259967))

(assert (= (and b!1259967 res!839425) b!1259966))

(assert (= (and b!1259966 res!839427) b!1259968))

(assert (= (and b!1259968 (not res!839423)) b!1259969))

(assert (= (and b!1259962 condMapEmpty!50044) mapIsEmpty!50044))

(assert (= (and b!1259962 (not condMapEmpty!50044)) mapNonEmpty!50044))

(get-info :version)

(assert (= (and mapNonEmpty!50044 ((_ is ValueCellFull!15320) mapValue!50044)) b!1259963))

(assert (= (and b!1259962 ((_ is ValueCellFull!15320) mapDefault!50044)) b!1259964))

(assert (= start!105888 b!1259962))

(declare-fun m!1160661 () Bool)

(assert (=> b!1259969 m!1160661))

(declare-fun m!1160663 () Bool)

(assert (=> b!1259967 m!1160663))

(declare-fun m!1160665 () Bool)

(assert (=> b!1259968 m!1160665))

(declare-fun m!1160667 () Bool)

(assert (=> b!1259968 m!1160667))

(declare-fun m!1160669 () Bool)

(assert (=> b!1259968 m!1160669))

(declare-fun m!1160671 () Bool)

(assert (=> start!105888 m!1160671))

(declare-fun m!1160673 () Bool)

(assert (=> start!105888 m!1160673))

(declare-fun m!1160675 () Bool)

(assert (=> start!105888 m!1160675))

(declare-fun m!1160677 () Bool)

(assert (=> b!1259966 m!1160677))

(declare-fun m!1160679 () Bool)

(assert (=> mapNonEmpty!50044 m!1160679))

(check-sat (not b!1259967) (not b!1259968) (not start!105888) (not b!1259969) (not b!1259966) (not mapNonEmpty!50044) (not b_next!27265) tp_is_empty!32167 b_and!45141)
(check-sat b_and!45141 (not b_next!27265))
(get-model)

(declare-fun c!122931 () Bool)

(declare-fun c!122933 () Bool)

(declare-fun call!61931 () ListLongMap!18765)

(declare-fun call!61929 () ListLongMap!18765)

(declare-fun call!61933 () ListLongMap!18765)

(declare-fun call!61932 () ListLongMap!18765)

(declare-fun bm!61926 () Bool)

(declare-fun +!4241 (ListLongMap!18765 tuple2!20884) ListLongMap!18765)

(assert (=> bm!61926 (= call!61933 (+!4241 (ite c!122931 call!61929 (ite c!122933 call!61931 call!61932)) (ite (or c!122931 c!122933) (tuple2!20885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20885 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1260060 () Bool)

(declare-fun e!716817 () ListLongMap!18765)

(declare-fun e!716812 () ListLongMap!18765)

(assert (=> b!1260060 (= e!716817 e!716812)))

(assert (=> b!1260060 (= c!122933 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260061 () Bool)

(declare-fun e!716823 () Bool)

(declare-fun call!61934 () Bool)

(assert (=> b!1260061 (= e!716823 (not call!61934))))

(declare-fun b!1260062 () Bool)

(declare-fun e!716822 () Bool)

(declare-fun e!716814 () Bool)

(assert (=> b!1260062 (= e!716822 e!716814)))

(declare-fun res!839479 () Bool)

(assert (=> b!1260062 (=> (not res!839479) (not e!716814))))

(declare-fun lt!569870 () ListLongMap!18765)

(declare-fun contains!7596 (ListLongMap!18765 (_ BitVec 64)) Bool)

(assert (=> b!1260062 (= res!839479 (contains!7596 lt!569870 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260062 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(declare-fun b!1260063 () Bool)

(declare-fun e!716821 () ListLongMap!18765)

(declare-fun call!61935 () ListLongMap!18765)

(assert (=> b!1260063 (= e!716821 call!61935)))

(declare-fun b!1260064 () Bool)

(assert (=> b!1260064 (= e!716817 (+!4241 call!61933 (tuple2!20885 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1260065 () Bool)

(declare-fun e!716816 () Unit!41935)

(declare-fun lt!569875 () Unit!41935)

(assert (=> b!1260065 (= e!716816 lt!569875)))

(declare-fun lt!569886 () ListLongMap!18765)

(assert (=> b!1260065 (= lt!569886 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569874 () (_ BitVec 64))

(assert (=> b!1260065 (= lt!569874 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569873 () (_ BitVec 64))

(assert (=> b!1260065 (= lt!569873 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569883 () Unit!41935)

(declare-fun addStillContains!1090 (ListLongMap!18765 (_ BitVec 64) V!48255 (_ BitVec 64)) Unit!41935)

(assert (=> b!1260065 (= lt!569883 (addStillContains!1090 lt!569886 lt!569874 zeroValue!871 lt!569873))))

(assert (=> b!1260065 (contains!7596 (+!4241 lt!569886 (tuple2!20885 lt!569874 zeroValue!871)) lt!569873)))

(declare-fun lt!569880 () Unit!41935)

(assert (=> b!1260065 (= lt!569880 lt!569883)))

(declare-fun lt!569869 () ListLongMap!18765)

(assert (=> b!1260065 (= lt!569869 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569871 () (_ BitVec 64))

(assert (=> b!1260065 (= lt!569871 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569868 () (_ BitVec 64))

(assert (=> b!1260065 (= lt!569868 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569882 () Unit!41935)

(declare-fun addApplyDifferent!532 (ListLongMap!18765 (_ BitVec 64) V!48255 (_ BitVec 64)) Unit!41935)

(assert (=> b!1260065 (= lt!569882 (addApplyDifferent!532 lt!569869 lt!569871 minValueBefore!43 lt!569868))))

(declare-fun apply!1000 (ListLongMap!18765 (_ BitVec 64)) V!48255)

(assert (=> b!1260065 (= (apply!1000 (+!4241 lt!569869 (tuple2!20885 lt!569871 minValueBefore!43)) lt!569868) (apply!1000 lt!569869 lt!569868))))

(declare-fun lt!569888 () Unit!41935)

(assert (=> b!1260065 (= lt!569888 lt!569882)))

(declare-fun lt!569884 () ListLongMap!18765)

(assert (=> b!1260065 (= lt!569884 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569887 () (_ BitVec 64))

(assert (=> b!1260065 (= lt!569887 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569879 () (_ BitVec 64))

(assert (=> b!1260065 (= lt!569879 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569872 () Unit!41935)

(assert (=> b!1260065 (= lt!569872 (addApplyDifferent!532 lt!569884 lt!569887 zeroValue!871 lt!569879))))

(assert (=> b!1260065 (= (apply!1000 (+!4241 lt!569884 (tuple2!20885 lt!569887 zeroValue!871)) lt!569879) (apply!1000 lt!569884 lt!569879))))

(declare-fun lt!569878 () Unit!41935)

(assert (=> b!1260065 (= lt!569878 lt!569872)))

(declare-fun lt!569881 () ListLongMap!18765)

(assert (=> b!1260065 (= lt!569881 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569885 () (_ BitVec 64))

(assert (=> b!1260065 (= lt!569885 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569876 () (_ BitVec 64))

(assert (=> b!1260065 (= lt!569876 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1260065 (= lt!569875 (addApplyDifferent!532 lt!569881 lt!569885 minValueBefore!43 lt!569876))))

(assert (=> b!1260065 (= (apply!1000 (+!4241 lt!569881 (tuple2!20885 lt!569885 minValueBefore!43)) lt!569876) (apply!1000 lt!569881 lt!569876))))

(declare-fun bm!61927 () Bool)

(assert (=> bm!61927 (= call!61929 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1260066 () Bool)

(declare-fun get!20249 (ValueCell!15320 V!48255) V!48255)

(declare-fun dynLambda!3452 (Int (_ BitVec 64)) V!48255)

(assert (=> b!1260066 (= e!716814 (= (apply!1000 lt!569870 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)) (get!20249 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3452 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1260066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _values!914)))))

(assert (=> b!1260066 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(declare-fun b!1260067 () Bool)

(declare-fun e!716819 () Bool)

(declare-fun call!61930 () Bool)

(assert (=> b!1260067 (= e!716819 (not call!61930))))

(declare-fun b!1260068 () Bool)

(declare-fun res!839480 () Bool)

(declare-fun e!716820 () Bool)

(assert (=> b!1260068 (=> (not res!839480) (not e!716820))))

(assert (=> b!1260068 (= res!839480 e!716822)))

(declare-fun res!839478 () Bool)

(assert (=> b!1260068 (=> res!839478 e!716822)))

(declare-fun e!716815 () Bool)

(assert (=> b!1260068 (= res!839478 (not e!716815))))

(declare-fun res!839482 () Bool)

(assert (=> b!1260068 (=> (not res!839482) (not e!716815))))

(assert (=> b!1260068 (= res!839482 (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(declare-fun bm!61928 () Bool)

(assert (=> bm!61928 (= call!61930 (contains!7596 lt!569870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1260069 () Bool)

(declare-fun e!716813 () Bool)

(assert (=> b!1260069 (= e!716813 (= (apply!1000 lt!569870 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1260070 () Bool)

(declare-fun res!839481 () Bool)

(assert (=> b!1260070 (=> (not res!839481) (not e!716820))))

(assert (=> b!1260070 (= res!839481 e!716819)))

(declare-fun c!122934 () Bool)

(assert (=> b!1260070 (= c!122934 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1260071 () Bool)

(assert (=> b!1260071 (= e!716821 call!61932)))

(declare-fun b!1260072 () Bool)

(declare-fun c!122930 () Bool)

(assert (=> b!1260072 (= c!122930 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1260072 (= e!716812 e!716821)))

(declare-fun b!1260073 () Bool)

(assert (=> b!1260073 (= e!716823 e!716813)))

(declare-fun res!839477 () Bool)

(assert (=> b!1260073 (= res!839477 call!61934)))

(assert (=> b!1260073 (=> (not res!839477) (not e!716813))))

(declare-fun b!1260074 () Bool)

(assert (=> b!1260074 (= e!716820 e!716823)))

(declare-fun c!122929 () Bool)

(assert (=> b!1260074 (= c!122929 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260075 () Bool)

(declare-fun e!716811 () Bool)

(assert (=> b!1260075 (= e!716811 (= (apply!1000 lt!569870 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun bm!61929 () Bool)

(assert (=> bm!61929 (= call!61931 call!61929)))

(declare-fun bm!61930 () Bool)

(assert (=> bm!61930 (= call!61934 (contains!7596 lt!569870 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!138751 () Bool)

(assert (=> d!138751 e!716820))

(declare-fun res!839483 () Bool)

(assert (=> d!138751 (=> (not res!839483) (not e!716820))))

(assert (=> d!138751 (= res!839483 (or (bvsge #b00000000000000000000000000000000 (size!40093 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))))

(declare-fun lt!569867 () ListLongMap!18765)

(assert (=> d!138751 (= lt!569870 lt!569867)))

(declare-fun lt!569877 () Unit!41935)

(assert (=> d!138751 (= lt!569877 e!716816)))

(declare-fun c!122932 () Bool)

(declare-fun e!716818 () Bool)

(assert (=> d!138751 (= c!122932 e!716818)))

(declare-fun res!839476 () Bool)

(assert (=> d!138751 (=> (not res!839476) (not e!716818))))

(assert (=> d!138751 (= res!839476 (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(assert (=> d!138751 (= lt!569867 e!716817)))

(assert (=> d!138751 (= c!122931 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138751 (validMask!0 mask!1466)))

(assert (=> d!138751 (= (getCurrentListMap!4584 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569870)))

(declare-fun bm!61931 () Bool)

(assert (=> bm!61931 (= call!61935 call!61933)))

(declare-fun b!1260076 () Bool)

(assert (=> b!1260076 (= e!716819 e!716811)))

(declare-fun res!839484 () Bool)

(assert (=> b!1260076 (= res!839484 call!61930)))

(assert (=> b!1260076 (=> (not res!839484) (not e!716811))))

(declare-fun b!1260077 () Bool)

(declare-fun Unit!41941 () Unit!41935)

(assert (=> b!1260077 (= e!716816 Unit!41941)))

(declare-fun bm!61932 () Bool)

(assert (=> bm!61932 (= call!61932 call!61931)))

(declare-fun b!1260078 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1260078 (= e!716818 (validKeyInArray!0 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260079 () Bool)

(assert (=> b!1260079 (= e!716812 call!61935)))

(declare-fun b!1260080 () Bool)

(assert (=> b!1260080 (= e!716815 (validKeyInArray!0 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138751 c!122931) b!1260064))

(assert (= (and d!138751 (not c!122931)) b!1260060))

(assert (= (and b!1260060 c!122933) b!1260079))

(assert (= (and b!1260060 (not c!122933)) b!1260072))

(assert (= (and b!1260072 c!122930) b!1260063))

(assert (= (and b!1260072 (not c!122930)) b!1260071))

(assert (= (or b!1260063 b!1260071) bm!61932))

(assert (= (or b!1260079 bm!61932) bm!61929))

(assert (= (or b!1260079 b!1260063) bm!61931))

(assert (= (or b!1260064 bm!61929) bm!61927))

(assert (= (or b!1260064 bm!61931) bm!61926))

(assert (= (and d!138751 res!839476) b!1260078))

(assert (= (and d!138751 c!122932) b!1260065))

(assert (= (and d!138751 (not c!122932)) b!1260077))

(assert (= (and d!138751 res!839483) b!1260068))

(assert (= (and b!1260068 res!839482) b!1260080))

(assert (= (and b!1260068 (not res!839478)) b!1260062))

(assert (= (and b!1260062 res!839479) b!1260066))

(assert (= (and b!1260068 res!839480) b!1260070))

(assert (= (and b!1260070 c!122934) b!1260076))

(assert (= (and b!1260070 (not c!122934)) b!1260067))

(assert (= (and b!1260076 res!839484) b!1260075))

(assert (= (or b!1260076 b!1260067) bm!61928))

(assert (= (and b!1260070 res!839481) b!1260074))

(assert (= (and b!1260074 c!122929) b!1260073))

(assert (= (and b!1260074 (not c!122929)) b!1260061))

(assert (= (and b!1260073 res!839477) b!1260069))

(assert (= (or b!1260073 b!1260061) bm!61930))

(declare-fun b_lambda!22717 () Bool)

(assert (=> (not b_lambda!22717) (not b!1260066)))

(declare-fun t!41604 () Bool)

(declare-fun tb!11301 () Bool)

(assert (=> (and start!105888 (= defaultEntry!922 defaultEntry!922) t!41604) tb!11301))

(declare-fun result!23327 () Bool)

(assert (=> tb!11301 (= result!23327 tp_is_empty!32167)))

(assert (=> b!1260066 t!41604))

(declare-fun b_and!45147 () Bool)

(assert (= b_and!45141 (and (=> t!41604 result!23327) b_and!45147)))

(declare-fun m!1160721 () Bool)

(assert (=> b!1260062 m!1160721))

(assert (=> b!1260062 m!1160721))

(declare-fun m!1160723 () Bool)

(assert (=> b!1260062 m!1160723))

(declare-fun m!1160725 () Bool)

(assert (=> bm!61928 m!1160725))

(declare-fun m!1160727 () Bool)

(assert (=> b!1260075 m!1160727))

(declare-fun m!1160729 () Bool)

(assert (=> b!1260064 m!1160729))

(declare-fun m!1160731 () Bool)

(assert (=> bm!61926 m!1160731))

(assert (=> b!1260080 m!1160721))

(assert (=> b!1260080 m!1160721))

(declare-fun m!1160733 () Bool)

(assert (=> b!1260080 m!1160733))

(assert (=> d!138751 m!1160671))

(declare-fun m!1160735 () Bool)

(assert (=> b!1260069 m!1160735))

(assert (=> bm!61927 m!1160669))

(declare-fun m!1160737 () Bool)

(assert (=> b!1260065 m!1160737))

(declare-fun m!1160739 () Bool)

(assert (=> b!1260065 m!1160739))

(declare-fun m!1160741 () Bool)

(assert (=> b!1260065 m!1160741))

(declare-fun m!1160743 () Bool)

(assert (=> b!1260065 m!1160743))

(declare-fun m!1160745 () Bool)

(assert (=> b!1260065 m!1160745))

(assert (=> b!1260065 m!1160743))

(declare-fun m!1160747 () Bool)

(assert (=> b!1260065 m!1160747))

(declare-fun m!1160749 () Bool)

(assert (=> b!1260065 m!1160749))

(declare-fun m!1160751 () Bool)

(assert (=> b!1260065 m!1160751))

(assert (=> b!1260065 m!1160749))

(declare-fun m!1160753 () Bool)

(assert (=> b!1260065 m!1160753))

(declare-fun m!1160755 () Bool)

(assert (=> b!1260065 m!1160755))

(assert (=> b!1260065 m!1160721))

(declare-fun m!1160757 () Bool)

(assert (=> b!1260065 m!1160757))

(declare-fun m!1160759 () Bool)

(assert (=> b!1260065 m!1160759))

(declare-fun m!1160761 () Bool)

(assert (=> b!1260065 m!1160761))

(assert (=> b!1260065 m!1160759))

(declare-fun m!1160763 () Bool)

(assert (=> b!1260065 m!1160763))

(assert (=> b!1260065 m!1160739))

(assert (=> b!1260065 m!1160669))

(declare-fun m!1160765 () Bool)

(assert (=> b!1260065 m!1160765))

(declare-fun m!1160767 () Bool)

(assert (=> bm!61930 m!1160767))

(assert (=> b!1260066 m!1160721))

(declare-fun m!1160769 () Bool)

(assert (=> b!1260066 m!1160769))

(declare-fun m!1160771 () Bool)

(assert (=> b!1260066 m!1160771))

(assert (=> b!1260066 m!1160721))

(declare-fun m!1160773 () Bool)

(assert (=> b!1260066 m!1160773))

(assert (=> b!1260066 m!1160773))

(assert (=> b!1260066 m!1160771))

(declare-fun m!1160775 () Bool)

(assert (=> b!1260066 m!1160775))

(assert (=> b!1260078 m!1160721))

(assert (=> b!1260078 m!1160721))

(assert (=> b!1260078 m!1160733))

(assert (=> b!1259969 d!138751))

(declare-fun d!138753 () Bool)

(assert (=> d!138753 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105888 d!138753))

(declare-fun d!138755 () Bool)

(assert (=> d!138755 (= (array_inv!30265 _keys!1118) (bvsge (size!40093 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105888 d!138755))

(declare-fun d!138757 () Bool)

(assert (=> d!138757 (= (array_inv!30266 _values!914) (bvsge (size!40092 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105888 d!138757))

(declare-fun bm!61935 () Bool)

(declare-fun call!61938 () Bool)

(declare-fun c!122937 () Bool)

(assert (=> bm!61935 (= call!61938 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122937 (Cons!28109 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000) Nil!28110) Nil!28110)))))

(declare-fun b!1260093 () Bool)

(declare-fun e!716834 () Bool)

(assert (=> b!1260093 (= e!716834 call!61938)))

(declare-fun b!1260094 () Bool)

(assert (=> b!1260094 (= e!716834 call!61938)))

(declare-fun b!1260095 () Bool)

(declare-fun e!716835 () Bool)

(assert (=> b!1260095 (= e!716835 e!716834)))

(assert (=> b!1260095 (= c!122937 (validKeyInArray!0 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260096 () Bool)

(declare-fun e!716833 () Bool)

(declare-fun contains!7597 (List!28113 (_ BitVec 64)) Bool)

(assert (=> b!1260096 (= e!716833 (contains!7597 Nil!28110 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138759 () Bool)

(declare-fun res!839493 () Bool)

(declare-fun e!716832 () Bool)

(assert (=> d!138759 (=> res!839493 e!716832)))

(assert (=> d!138759 (= res!839493 (bvsge #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(assert (=> d!138759 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28110) e!716832)))

(declare-fun b!1260097 () Bool)

(assert (=> b!1260097 (= e!716832 e!716835)))

(declare-fun res!839491 () Bool)

(assert (=> b!1260097 (=> (not res!839491) (not e!716835))))

(assert (=> b!1260097 (= res!839491 (not e!716833))))

(declare-fun res!839492 () Bool)

(assert (=> b!1260097 (=> (not res!839492) (not e!716833))))

(assert (=> b!1260097 (= res!839492 (validKeyInArray!0 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138759 (not res!839493)) b!1260097))

(assert (= (and b!1260097 res!839492) b!1260096))

(assert (= (and b!1260097 res!839491) b!1260095))

(assert (= (and b!1260095 c!122937) b!1260094))

(assert (= (and b!1260095 (not c!122937)) b!1260093))

(assert (= (or b!1260094 b!1260093) bm!61935))

(assert (=> bm!61935 m!1160721))

(declare-fun m!1160777 () Bool)

(assert (=> bm!61935 m!1160777))

(assert (=> b!1260095 m!1160721))

(assert (=> b!1260095 m!1160721))

(assert (=> b!1260095 m!1160733))

(assert (=> b!1260096 m!1160721))

(assert (=> b!1260096 m!1160721))

(declare-fun m!1160779 () Bool)

(assert (=> b!1260096 m!1160779))

(assert (=> b!1260097 m!1160721))

(assert (=> b!1260097 m!1160721))

(assert (=> b!1260097 m!1160733))

(assert (=> b!1259966 d!138759))

(declare-fun d!138761 () Bool)

(assert (=> d!138761 (= (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569891 () Unit!41935)

(declare-fun choose!1867 (array!82009 array!82007 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48255 V!48255 V!48255 V!48255 (_ BitVec 32) Int) Unit!41935)

(assert (=> d!138761 (= lt!569891 (choose!1867 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138761 (validMask!0 mask!1466)))

(assert (=> d!138761 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1126 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569891)))

(declare-fun bs!35623 () Bool)

(assert (= bs!35623 d!138761))

(assert (=> bs!35623 m!1160669))

(assert (=> bs!35623 m!1160667))

(declare-fun m!1160781 () Bool)

(assert (=> bs!35623 m!1160781))

(assert (=> bs!35623 m!1160671))

(assert (=> b!1259968 d!138761))

(declare-fun b!1260122 () Bool)

(declare-fun e!716856 () ListLongMap!18765)

(declare-fun call!61941 () ListLongMap!18765)

(assert (=> b!1260122 (= e!716856 call!61941)))

(declare-fun b!1260124 () Bool)

(declare-fun e!716851 () Bool)

(declare-fun e!716855 () Bool)

(assert (=> b!1260124 (= e!716851 e!716855)))

(declare-fun c!122947 () Bool)

(declare-fun e!716850 () Bool)

(assert (=> b!1260124 (= c!122947 e!716850)))

(declare-fun res!839503 () Bool)

(assert (=> b!1260124 (=> (not res!839503) (not e!716850))))

(assert (=> b!1260124 (= res!839503 (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(declare-fun b!1260125 () Bool)

(declare-fun e!716854 () Bool)

(assert (=> b!1260125 (= e!716855 e!716854)))

(declare-fun c!122946 () Bool)

(assert (=> b!1260125 (= c!122946 (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(declare-fun bm!61938 () Bool)

(assert (=> bm!61938 (= call!61941 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1260126 () Bool)

(assert (=> b!1260126 (= e!716850 (validKeyInArray!0 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260126 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1260127 () Bool)

(assert (=> b!1260127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(assert (=> b!1260127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _values!914)))))

(declare-fun e!716852 () Bool)

(declare-fun lt!569911 () ListLongMap!18765)

(assert (=> b!1260127 (= e!716852 (= (apply!1000 lt!569911 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)) (get!20249 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3452 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!138763 () Bool)

(assert (=> d!138763 e!716851))

(declare-fun res!839502 () Bool)

(assert (=> d!138763 (=> (not res!839502) (not e!716851))))

(assert (=> d!138763 (= res!839502 (not (contains!7596 lt!569911 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!716853 () ListLongMap!18765)

(assert (=> d!138763 (= lt!569911 e!716853)))

(declare-fun c!122948 () Bool)

(assert (=> d!138763 (= c!122948 (bvsge #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(assert (=> d!138763 (validMask!0 mask!1466)))

(assert (=> d!138763 (= (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569911)))

(declare-fun b!1260123 () Bool)

(assert (=> b!1260123 (= e!716854 (= lt!569911 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1260128 () Bool)

(assert (=> b!1260128 (= e!716855 e!716852)))

(assert (=> b!1260128 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(declare-fun res!839504 () Bool)

(assert (=> b!1260128 (= res!839504 (contains!7596 lt!569911 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260128 (=> (not res!839504) (not e!716852))))

(declare-fun b!1260129 () Bool)

(declare-fun lt!569909 () Unit!41935)

(declare-fun lt!569910 () Unit!41935)

(assert (=> b!1260129 (= lt!569909 lt!569910)))

(declare-fun lt!569906 () (_ BitVec 64))

(declare-fun lt!569907 () V!48255)

(declare-fun lt!569908 () (_ BitVec 64))

(declare-fun lt!569912 () ListLongMap!18765)

(assert (=> b!1260129 (not (contains!7596 (+!4241 lt!569912 (tuple2!20885 lt!569908 lt!569907)) lt!569906))))

(declare-fun addStillNotContains!321 (ListLongMap!18765 (_ BitVec 64) V!48255 (_ BitVec 64)) Unit!41935)

(assert (=> b!1260129 (= lt!569910 (addStillNotContains!321 lt!569912 lt!569908 lt!569907 lt!569906))))

(assert (=> b!1260129 (= lt!569906 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1260129 (= lt!569907 (get!20249 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3452 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1260129 (= lt!569908 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1260129 (= lt!569912 call!61941)))

(assert (=> b!1260129 (= e!716856 (+!4241 call!61941 (tuple2!20885 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000) (get!20249 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3452 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1260130 () Bool)

(assert (=> b!1260130 (= e!716853 e!716856)))

(declare-fun c!122949 () Bool)

(assert (=> b!1260130 (= c!122949 (validKeyInArray!0 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260131 () Bool)

(assert (=> b!1260131 (= e!716853 (ListLongMap!18766 Nil!28111))))

(declare-fun b!1260132 () Bool)

(declare-fun res!839505 () Bool)

(assert (=> b!1260132 (=> (not res!839505) (not e!716851))))

(assert (=> b!1260132 (= res!839505 (not (contains!7596 lt!569911 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1260133 () Bool)

(declare-fun isEmpty!1037 (ListLongMap!18765) Bool)

(assert (=> b!1260133 (= e!716854 (isEmpty!1037 lt!569911))))

(assert (= (and d!138763 c!122948) b!1260131))

(assert (= (and d!138763 (not c!122948)) b!1260130))

(assert (= (and b!1260130 c!122949) b!1260129))

(assert (= (and b!1260130 (not c!122949)) b!1260122))

(assert (= (or b!1260129 b!1260122) bm!61938))

(assert (= (and d!138763 res!839502) b!1260132))

(assert (= (and b!1260132 res!839505) b!1260124))

(assert (= (and b!1260124 res!839503) b!1260126))

(assert (= (and b!1260124 c!122947) b!1260128))

(assert (= (and b!1260124 (not c!122947)) b!1260125))

(assert (= (and b!1260128 res!839504) b!1260127))

(assert (= (and b!1260125 c!122946) b!1260123))

(assert (= (and b!1260125 (not c!122946)) b!1260133))

(declare-fun b_lambda!22719 () Bool)

(assert (=> (not b_lambda!22719) (not b!1260127)))

(assert (=> b!1260127 t!41604))

(declare-fun b_and!45149 () Bool)

(assert (= b_and!45147 (and (=> t!41604 result!23327) b_and!45149)))

(declare-fun b_lambda!22721 () Bool)

(assert (=> (not b_lambda!22721) (not b!1260129)))

(assert (=> b!1260129 t!41604))

(declare-fun b_and!45151 () Bool)

(assert (= b_and!45149 (and (=> t!41604 result!23327) b_and!45151)))

(assert (=> b!1260127 m!1160721))

(assert (=> b!1260127 m!1160773))

(assert (=> b!1260127 m!1160771))

(assert (=> b!1260127 m!1160773))

(assert (=> b!1260127 m!1160771))

(assert (=> b!1260127 m!1160775))

(assert (=> b!1260127 m!1160721))

(declare-fun m!1160783 () Bool)

(assert (=> b!1260127 m!1160783))

(declare-fun m!1160785 () Bool)

(assert (=> b!1260133 m!1160785))

(declare-fun m!1160787 () Bool)

(assert (=> b!1260123 m!1160787))

(declare-fun m!1160789 () Bool)

(assert (=> b!1260132 m!1160789))

(assert (=> b!1260126 m!1160721))

(assert (=> b!1260126 m!1160721))

(assert (=> b!1260126 m!1160733))

(assert (=> b!1260130 m!1160721))

(assert (=> b!1260130 m!1160721))

(assert (=> b!1260130 m!1160733))

(assert (=> bm!61938 m!1160787))

(declare-fun m!1160791 () Bool)

(assert (=> d!138763 m!1160791))

(assert (=> d!138763 m!1160671))

(assert (=> b!1260129 m!1160721))

(declare-fun m!1160793 () Bool)

(assert (=> b!1260129 m!1160793))

(declare-fun m!1160795 () Bool)

(assert (=> b!1260129 m!1160795))

(assert (=> b!1260129 m!1160773))

(declare-fun m!1160797 () Bool)

(assert (=> b!1260129 m!1160797))

(assert (=> b!1260129 m!1160793))

(declare-fun m!1160799 () Bool)

(assert (=> b!1260129 m!1160799))

(assert (=> b!1260129 m!1160771))

(assert (=> b!1260129 m!1160773))

(assert (=> b!1260129 m!1160771))

(assert (=> b!1260129 m!1160775))

(assert (=> b!1260128 m!1160721))

(assert (=> b!1260128 m!1160721))

(declare-fun m!1160801 () Bool)

(assert (=> b!1260128 m!1160801))

(assert (=> b!1259968 d!138763))

(declare-fun b!1260134 () Bool)

(declare-fun e!716863 () ListLongMap!18765)

(declare-fun call!61942 () ListLongMap!18765)

(assert (=> b!1260134 (= e!716863 call!61942)))

(declare-fun b!1260136 () Bool)

(declare-fun e!716858 () Bool)

(declare-fun e!716862 () Bool)

(assert (=> b!1260136 (= e!716858 e!716862)))

(declare-fun c!122951 () Bool)

(declare-fun e!716857 () Bool)

(assert (=> b!1260136 (= c!122951 e!716857)))

(declare-fun res!839507 () Bool)

(assert (=> b!1260136 (=> (not res!839507) (not e!716857))))

(assert (=> b!1260136 (= res!839507 (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(declare-fun b!1260137 () Bool)

(declare-fun e!716861 () Bool)

(assert (=> b!1260137 (= e!716862 e!716861)))

(declare-fun c!122950 () Bool)

(assert (=> b!1260137 (= c!122950 (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(declare-fun bm!61939 () Bool)

(assert (=> bm!61939 (= call!61942 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1260138 () Bool)

(assert (=> b!1260138 (= e!716857 (validKeyInArray!0 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260138 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1260139 () Bool)

(assert (=> b!1260139 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(assert (=> b!1260139 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40092 _values!914)))))

(declare-fun e!716859 () Bool)

(declare-fun lt!569918 () ListLongMap!18765)

(assert (=> b!1260139 (= e!716859 (= (apply!1000 lt!569918 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)) (get!20249 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3452 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!138765 () Bool)

(assert (=> d!138765 e!716858))

(declare-fun res!839506 () Bool)

(assert (=> d!138765 (=> (not res!839506) (not e!716858))))

(assert (=> d!138765 (= res!839506 (not (contains!7596 lt!569918 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!716860 () ListLongMap!18765)

(assert (=> d!138765 (= lt!569918 e!716860)))

(declare-fun c!122952 () Bool)

(assert (=> d!138765 (= c!122952 (bvsge #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(assert (=> d!138765 (validMask!0 mask!1466)))

(assert (=> d!138765 (= (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569918)))

(declare-fun b!1260135 () Bool)

(assert (=> b!1260135 (= e!716861 (= lt!569918 (getCurrentListMapNoExtraKeys!5812 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1260140 () Bool)

(assert (=> b!1260140 (= e!716862 e!716859)))

(assert (=> b!1260140 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(declare-fun res!839508 () Bool)

(assert (=> b!1260140 (= res!839508 (contains!7596 lt!569918 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1260140 (=> (not res!839508) (not e!716859))))

(declare-fun b!1260141 () Bool)

(declare-fun lt!569916 () Unit!41935)

(declare-fun lt!569917 () Unit!41935)

(assert (=> b!1260141 (= lt!569916 lt!569917)))

(declare-fun lt!569913 () (_ BitVec 64))

(declare-fun lt!569915 () (_ BitVec 64))

(declare-fun lt!569914 () V!48255)

(declare-fun lt!569919 () ListLongMap!18765)

(assert (=> b!1260141 (not (contains!7596 (+!4241 lt!569919 (tuple2!20885 lt!569915 lt!569914)) lt!569913))))

(assert (=> b!1260141 (= lt!569917 (addStillNotContains!321 lt!569919 lt!569915 lt!569914 lt!569913))))

(assert (=> b!1260141 (= lt!569913 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1260141 (= lt!569914 (get!20249 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3452 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1260141 (= lt!569915 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1260141 (= lt!569919 call!61942)))

(assert (=> b!1260141 (= e!716863 (+!4241 call!61942 (tuple2!20885 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000) (get!20249 (select (arr!39555 _values!914) #b00000000000000000000000000000000) (dynLambda!3452 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1260142 () Bool)

(assert (=> b!1260142 (= e!716860 e!716863)))

(declare-fun c!122953 () Bool)

(assert (=> b!1260142 (= c!122953 (validKeyInArray!0 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1260143 () Bool)

(assert (=> b!1260143 (= e!716860 (ListLongMap!18766 Nil!28111))))

(declare-fun b!1260144 () Bool)

(declare-fun res!839509 () Bool)

(assert (=> b!1260144 (=> (not res!839509) (not e!716858))))

(assert (=> b!1260144 (= res!839509 (not (contains!7596 lt!569918 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1260145 () Bool)

(assert (=> b!1260145 (= e!716861 (isEmpty!1037 lt!569918))))

(assert (= (and d!138765 c!122952) b!1260143))

(assert (= (and d!138765 (not c!122952)) b!1260142))

(assert (= (and b!1260142 c!122953) b!1260141))

(assert (= (and b!1260142 (not c!122953)) b!1260134))

(assert (= (or b!1260141 b!1260134) bm!61939))

(assert (= (and d!138765 res!839506) b!1260144))

(assert (= (and b!1260144 res!839509) b!1260136))

(assert (= (and b!1260136 res!839507) b!1260138))

(assert (= (and b!1260136 c!122951) b!1260140))

(assert (= (and b!1260136 (not c!122951)) b!1260137))

(assert (= (and b!1260140 res!839508) b!1260139))

(assert (= (and b!1260137 c!122950) b!1260135))

(assert (= (and b!1260137 (not c!122950)) b!1260145))

(declare-fun b_lambda!22723 () Bool)

(assert (=> (not b_lambda!22723) (not b!1260139)))

(assert (=> b!1260139 t!41604))

(declare-fun b_and!45153 () Bool)

(assert (= b_and!45151 (and (=> t!41604 result!23327) b_and!45153)))

(declare-fun b_lambda!22725 () Bool)

(assert (=> (not b_lambda!22725) (not b!1260141)))

(assert (=> b!1260141 t!41604))

(declare-fun b_and!45155 () Bool)

(assert (= b_and!45153 (and (=> t!41604 result!23327) b_and!45155)))

(assert (=> b!1260139 m!1160721))

(assert (=> b!1260139 m!1160773))

(assert (=> b!1260139 m!1160771))

(assert (=> b!1260139 m!1160773))

(assert (=> b!1260139 m!1160771))

(assert (=> b!1260139 m!1160775))

(assert (=> b!1260139 m!1160721))

(declare-fun m!1160803 () Bool)

(assert (=> b!1260139 m!1160803))

(declare-fun m!1160805 () Bool)

(assert (=> b!1260145 m!1160805))

(declare-fun m!1160807 () Bool)

(assert (=> b!1260135 m!1160807))

(declare-fun m!1160809 () Bool)

(assert (=> b!1260144 m!1160809))

(assert (=> b!1260138 m!1160721))

(assert (=> b!1260138 m!1160721))

(assert (=> b!1260138 m!1160733))

(assert (=> b!1260142 m!1160721))

(assert (=> b!1260142 m!1160721))

(assert (=> b!1260142 m!1160733))

(assert (=> bm!61939 m!1160807))

(declare-fun m!1160811 () Bool)

(assert (=> d!138765 m!1160811))

(assert (=> d!138765 m!1160671))

(assert (=> b!1260141 m!1160721))

(declare-fun m!1160813 () Bool)

(assert (=> b!1260141 m!1160813))

(declare-fun m!1160815 () Bool)

(assert (=> b!1260141 m!1160815))

(assert (=> b!1260141 m!1160773))

(declare-fun m!1160817 () Bool)

(assert (=> b!1260141 m!1160817))

(assert (=> b!1260141 m!1160813))

(declare-fun m!1160819 () Bool)

(assert (=> b!1260141 m!1160819))

(assert (=> b!1260141 m!1160771))

(assert (=> b!1260141 m!1160773))

(assert (=> b!1260141 m!1160771))

(assert (=> b!1260141 m!1160775))

(assert (=> b!1260140 m!1160721))

(assert (=> b!1260140 m!1160721))

(declare-fun m!1160821 () Bool)

(assert (=> b!1260140 m!1160821))

(assert (=> b!1259968 d!138765))

(declare-fun b!1260154 () Bool)

(declare-fun e!716872 () Bool)

(declare-fun e!716870 () Bool)

(assert (=> b!1260154 (= e!716872 e!716870)))

(declare-fun lt!569927 () (_ BitVec 64))

(assert (=> b!1260154 (= lt!569927 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569926 () Unit!41935)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82009 (_ BitVec 64) (_ BitVec 32)) Unit!41935)

(assert (=> b!1260154 (= lt!569926 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!569927 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1260154 (arrayContainsKey!0 _keys!1118 lt!569927 #b00000000000000000000000000000000)))

(declare-fun lt!569928 () Unit!41935)

(assert (=> b!1260154 (= lt!569928 lt!569926)))

(declare-fun res!839515 () Bool)

(declare-datatypes ((SeekEntryResult!9925 0))(
  ( (MissingZero!9925 (index!42071 (_ BitVec 32))) (Found!9925 (index!42072 (_ BitVec 32))) (Intermediate!9925 (undefined!10737 Bool) (index!42073 (_ BitVec 32)) (x!110863 (_ BitVec 32))) (Undefined!9925) (MissingVacant!9925 (index!42074 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82009 (_ BitVec 32)) SeekEntryResult!9925)

(assert (=> b!1260154 (= res!839515 (= (seekEntryOrOpen!0 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9925 #b00000000000000000000000000000000)))))

(assert (=> b!1260154 (=> (not res!839515) (not e!716870))))

(declare-fun d!138767 () Bool)

(declare-fun res!839514 () Bool)

(declare-fun e!716871 () Bool)

(assert (=> d!138767 (=> res!839514 e!716871)))

(assert (=> d!138767 (= res!839514 (bvsge #b00000000000000000000000000000000 (size!40093 _keys!1118)))))

(assert (=> d!138767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!716871)))

(declare-fun bm!61942 () Bool)

(declare-fun call!61945 () Bool)

(assert (=> bm!61942 (= call!61945 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1260155 () Bool)

(assert (=> b!1260155 (= e!716872 call!61945)))

(declare-fun b!1260156 () Bool)

(assert (=> b!1260156 (= e!716870 call!61945)))

(declare-fun b!1260157 () Bool)

(assert (=> b!1260157 (= e!716871 e!716872)))

(declare-fun c!122956 () Bool)

(assert (=> b!1260157 (= c!122956 (validKeyInArray!0 (select (arr!39556 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138767 (not res!839514)) b!1260157))

(assert (= (and b!1260157 c!122956) b!1260154))

(assert (= (and b!1260157 (not c!122956)) b!1260155))

(assert (= (and b!1260154 res!839515) b!1260156))

(assert (= (or b!1260156 b!1260155) bm!61942))

(assert (=> b!1260154 m!1160721))

(declare-fun m!1160823 () Bool)

(assert (=> b!1260154 m!1160823))

(declare-fun m!1160825 () Bool)

(assert (=> b!1260154 m!1160825))

(assert (=> b!1260154 m!1160721))

(declare-fun m!1160827 () Bool)

(assert (=> b!1260154 m!1160827))

(declare-fun m!1160829 () Bool)

(assert (=> bm!61942 m!1160829))

(assert (=> b!1260157 m!1160721))

(assert (=> b!1260157 m!1160721))

(assert (=> b!1260157 m!1160733))

(assert (=> b!1259967 d!138767))

(declare-fun b!1260165 () Bool)

(declare-fun e!716877 () Bool)

(assert (=> b!1260165 (= e!716877 tp_is_empty!32167)))

(declare-fun mapIsEmpty!50053 () Bool)

(declare-fun mapRes!50053 () Bool)

(assert (=> mapIsEmpty!50053 mapRes!50053))

(declare-fun condMapEmpty!50053 () Bool)

(declare-fun mapDefault!50053 () ValueCell!15320)

(assert (=> mapNonEmpty!50044 (= condMapEmpty!50053 (= mapRest!50044 ((as const (Array (_ BitVec 32) ValueCell!15320)) mapDefault!50053)))))

(assert (=> mapNonEmpty!50044 (= tp!95318 (and e!716877 mapRes!50053))))

(declare-fun b!1260164 () Bool)

(declare-fun e!716878 () Bool)

(assert (=> b!1260164 (= e!716878 tp_is_empty!32167)))

(declare-fun mapNonEmpty!50053 () Bool)

(declare-fun tp!95333 () Bool)

(assert (=> mapNonEmpty!50053 (= mapRes!50053 (and tp!95333 e!716878))))

(declare-fun mapKey!50053 () (_ BitVec 32))

(declare-fun mapRest!50053 () (Array (_ BitVec 32) ValueCell!15320))

(declare-fun mapValue!50053 () ValueCell!15320)

(assert (=> mapNonEmpty!50053 (= mapRest!50044 (store mapRest!50053 mapKey!50053 mapValue!50053))))

(assert (= (and mapNonEmpty!50044 condMapEmpty!50053) mapIsEmpty!50053))

(assert (= (and mapNonEmpty!50044 (not condMapEmpty!50053)) mapNonEmpty!50053))

(assert (= (and mapNonEmpty!50053 ((_ is ValueCellFull!15320) mapValue!50053)) b!1260164))

(assert (= (and mapNonEmpty!50044 ((_ is ValueCellFull!15320) mapDefault!50053)) b!1260165))

(declare-fun m!1160831 () Bool)

(assert (=> mapNonEmpty!50053 m!1160831))

(declare-fun b_lambda!22727 () Bool)

(assert (= b_lambda!22719 (or (and start!105888 b_free!27265) b_lambda!22727)))

(declare-fun b_lambda!22729 () Bool)

(assert (= b_lambda!22725 (or (and start!105888 b_free!27265) b_lambda!22729)))

(declare-fun b_lambda!22731 () Bool)

(assert (= b_lambda!22723 (or (and start!105888 b_free!27265) b_lambda!22731)))

(declare-fun b_lambda!22733 () Bool)

(assert (= b_lambda!22717 (or (and start!105888 b_free!27265) b_lambda!22733)))

(declare-fun b_lambda!22735 () Bool)

(assert (= b_lambda!22721 (or (and start!105888 b_free!27265) b_lambda!22735)))

(check-sat (not b!1260141) (not b!1260140) (not b_lambda!22735) (not b!1260132) (not bm!61938) (not b!1260129) (not b!1260075) (not b!1260065) (not b_lambda!22727) (not b_next!27265) (not b!1260123) (not b!1260064) (not b!1260069) (not d!138763) (not b!1260157) (not d!138751) (not b!1260135) (not b!1260130) (not bm!61926) (not b!1260154) (not b!1260126) (not d!138761) (not b!1260096) (not b!1260095) (not b!1260139) (not b!1260142) (not mapNonEmpty!50053) (not bm!61942) (not bm!61939) (not b!1260066) (not bm!61928) b_and!45155 (not d!138765) (not b!1260144) (not bm!61935) (not b_lambda!22731) (not b!1260128) (not b!1260145) (not b!1260133) (not b_lambda!22733) (not bm!61927) (not bm!61930) tp_is_empty!32167 (not b!1260062) (not b!1260138) (not b!1260080) (not b_lambda!22729) (not b!1260127) (not b!1260078) (not b!1260097))
(check-sat b_and!45155 (not b_next!27265))
