; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105146 () Bool)

(assert start!105146)

(declare-fun b_free!26713 () Bool)

(declare-fun b_next!26713 () Bool)

(assert (=> start!105146 (= b_free!26713 (not b_next!26713))))

(declare-fun tp!93632 () Bool)

(declare-fun b_and!44491 () Bool)

(assert (=> start!105146 (= tp!93632 b_and!44491)))

(declare-fun mapIsEmpty!49186 () Bool)

(declare-fun mapRes!49186 () Bool)

(assert (=> mapIsEmpty!49186 mapRes!49186))

(declare-fun b!1251923 () Bool)

(declare-fun e!710863 () Bool)

(declare-datatypes ((array!80947 0))(
  ( (array!80948 (arr!39035 (Array (_ BitVec 32) (_ BitVec 64))) (size!39572 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80947)

(assert (=> b!1251923 (= e!710863 (bvsle #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(declare-datatypes ((V!47519 0))(
  ( (V!47520 (val!15870 Int)) )
))
(declare-datatypes ((tuple2!20488 0))(
  ( (tuple2!20489 (_1!10255 (_ BitVec 64)) (_2!10255 V!47519)) )
))
(declare-datatypes ((List!27737 0))(
  ( (Nil!27734) (Cons!27733 (h!28951 tuple2!20488) (t!41202 List!27737)) )
))
(declare-datatypes ((ListLongMap!18369 0))(
  ( (ListLongMap!18370 (toList!9200 List!27737)) )
))
(declare-fun lt!564815 () ListLongMap!18369)

(declare-fun -!1987 (ListLongMap!18369 (_ BitVec 64)) ListLongMap!18369)

(assert (=> b!1251923 (= (-!1987 lt!564815 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564815)))

(declare-datatypes ((Unit!41536 0))(
  ( (Unit!41537) )
))
(declare-fun lt!564816 () Unit!41536)

(declare-fun removeNotPresentStillSame!97 (ListLongMap!18369 (_ BitVec 64)) Unit!41536)

(assert (=> b!1251923 (= lt!564816 (removeNotPresentStillSame!97 lt!564815 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251924 () Bool)

(declare-fun res!834712 () Bool)

(declare-fun e!710868 () Bool)

(assert (=> b!1251924 (=> (not res!834712) (not e!710868))))

(declare-datatypes ((List!27738 0))(
  ( (Nil!27735) (Cons!27734 (h!28952 (_ BitVec 64)) (t!41203 List!27738)) )
))
(declare-fun arrayNoDuplicates!0 (array!80947 (_ BitVec 32) List!27738) Bool)

(assert (=> b!1251924 (= res!834712 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27735))))

(declare-fun res!834713 () Bool)

(assert (=> start!105146 (=> (not res!834713) (not e!710868))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105146 (= res!834713 (validMask!0 mask!1466))))

(assert (=> start!105146 e!710868))

(assert (=> start!105146 true))

(assert (=> start!105146 tp!93632))

(declare-fun tp_is_empty!31615 () Bool)

(assert (=> start!105146 tp_is_empty!31615))

(declare-fun array_inv!29895 (array!80947) Bool)

(assert (=> start!105146 (array_inv!29895 _keys!1118)))

(declare-datatypes ((ValueCell!15044 0))(
  ( (ValueCellFull!15044 (v!18562 V!47519)) (EmptyCell!15044) )
))
(declare-datatypes ((array!80949 0))(
  ( (array!80950 (arr!39036 (Array (_ BitVec 32) ValueCell!15044)) (size!39573 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80949)

(declare-fun e!710864 () Bool)

(declare-fun array_inv!29896 (array!80949) Bool)

(assert (=> start!105146 (and (array_inv!29896 _values!914) e!710864)))

(declare-fun b!1251925 () Bool)

(declare-fun e!710865 () Bool)

(assert (=> b!1251925 (= e!710865 tp_is_empty!31615)))

(declare-fun b!1251926 () Bool)

(declare-fun res!834710 () Bool)

(assert (=> b!1251926 (=> (not res!834710) (not e!710868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80947 (_ BitVec 32)) Bool)

(assert (=> b!1251926 (= res!834710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251927 () Bool)

(declare-fun e!710866 () Bool)

(assert (=> b!1251927 (= e!710864 (and e!710866 mapRes!49186))))

(declare-fun condMapEmpty!49186 () Bool)

(declare-fun mapDefault!49186 () ValueCell!15044)

(assert (=> b!1251927 (= condMapEmpty!49186 (= (arr!39036 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15044)) mapDefault!49186)))))

(declare-fun b!1251928 () Bool)

(declare-fun e!710862 () Bool)

(assert (=> b!1251928 (= e!710868 (not e!710862))))

(declare-fun res!834709 () Bool)

(assert (=> b!1251928 (=> res!834709 e!710862)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1251928 (= res!834709 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564812 () ListLongMap!18369)

(declare-fun lt!564814 () ListLongMap!18369)

(assert (=> b!1251928 (= lt!564812 lt!564814)))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47519)

(declare-fun minValueBefore!43 () V!47519)

(declare-fun lt!564813 () Unit!41536)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47519)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!944 (array!80947 array!80949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47519 V!47519 V!47519 V!47519 (_ BitVec 32) Int) Unit!41536)

(assert (=> b!1251928 (= lt!564813 (lemmaNoChangeToArrayThenSameMapNoExtras!944 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5630 (array!80947 array!80949 (_ BitVec 32) (_ BitVec 32) V!47519 V!47519 (_ BitVec 32) Int) ListLongMap!18369)

(assert (=> b!1251928 (= lt!564814 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251928 (= lt!564812 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251929 () Bool)

(assert (=> b!1251929 (= e!710862 e!710863)))

(declare-fun res!834711 () Bool)

(assert (=> b!1251929 (=> res!834711 e!710863)))

(declare-fun contains!7525 (ListLongMap!18369 (_ BitVec 64)) Bool)

(assert (=> b!1251929 (= res!834711 (contains!7525 lt!564815 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4462 (array!80947 array!80949 (_ BitVec 32) (_ BitVec 32) V!47519 V!47519 (_ BitVec 32) Int) ListLongMap!18369)

(assert (=> b!1251929 (= lt!564815 (getCurrentListMap!4462 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251930 () Bool)

(assert (=> b!1251930 (= e!710866 tp_is_empty!31615)))

(declare-fun mapNonEmpty!49186 () Bool)

(declare-fun tp!93631 () Bool)

(assert (=> mapNonEmpty!49186 (= mapRes!49186 (and tp!93631 e!710865))))

(declare-fun mapRest!49186 () (Array (_ BitVec 32) ValueCell!15044))

(declare-fun mapValue!49186 () ValueCell!15044)

(declare-fun mapKey!49186 () (_ BitVec 32))

(assert (=> mapNonEmpty!49186 (= (arr!39036 _values!914) (store mapRest!49186 mapKey!49186 mapValue!49186))))

(declare-fun b!1251931 () Bool)

(declare-fun res!834708 () Bool)

(assert (=> b!1251931 (=> (not res!834708) (not e!710868))))

(assert (=> b!1251931 (= res!834708 (and (= (size!39573 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39572 _keys!1118) (size!39573 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!105146 res!834713) b!1251931))

(assert (= (and b!1251931 res!834708) b!1251926))

(assert (= (and b!1251926 res!834710) b!1251924))

(assert (= (and b!1251924 res!834712) b!1251928))

(assert (= (and b!1251928 (not res!834709)) b!1251929))

(assert (= (and b!1251929 (not res!834711)) b!1251923))

(assert (= (and b!1251927 condMapEmpty!49186) mapIsEmpty!49186))

(assert (= (and b!1251927 (not condMapEmpty!49186)) mapNonEmpty!49186))

(get-info :version)

(assert (= (and mapNonEmpty!49186 ((_ is ValueCellFull!15044) mapValue!49186)) b!1251925))

(assert (= (and b!1251927 ((_ is ValueCellFull!15044) mapDefault!49186)) b!1251930))

(assert (= start!105146 b!1251927))

(declare-fun m!1153053 () Bool)

(assert (=> b!1251928 m!1153053))

(declare-fun m!1153055 () Bool)

(assert (=> b!1251928 m!1153055))

(declare-fun m!1153057 () Bool)

(assert (=> b!1251928 m!1153057))

(declare-fun m!1153059 () Bool)

(assert (=> b!1251926 m!1153059))

(declare-fun m!1153061 () Bool)

(assert (=> b!1251929 m!1153061))

(declare-fun m!1153063 () Bool)

(assert (=> b!1251929 m!1153063))

(declare-fun m!1153065 () Bool)

(assert (=> mapNonEmpty!49186 m!1153065))

(declare-fun m!1153067 () Bool)

(assert (=> start!105146 m!1153067))

(declare-fun m!1153069 () Bool)

(assert (=> start!105146 m!1153069))

(declare-fun m!1153071 () Bool)

(assert (=> start!105146 m!1153071))

(declare-fun m!1153073 () Bool)

(assert (=> b!1251923 m!1153073))

(declare-fun m!1153075 () Bool)

(assert (=> b!1251923 m!1153075))

(declare-fun m!1153077 () Bool)

(assert (=> b!1251924 m!1153077))

(check-sat (not b!1251923) (not b_next!26713) (not b!1251924) (not b!1251929) (not start!105146) (not b!1251928) (not mapNonEmpty!49186) (not b!1251926) tp_is_empty!31615 b_and!44491)
(check-sat b_and!44491 (not b_next!26713))
(get-model)

(declare-fun d!138349 () Bool)

(declare-fun lt!564849 () ListLongMap!18369)

(assert (=> d!138349 (not (contains!7525 lt!564849 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!135 (List!27737 (_ BitVec 64)) List!27737)

(assert (=> d!138349 (= lt!564849 (ListLongMap!18370 (removeStrictlySorted!135 (toList!9200 lt!564815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138349 (= (-!1987 lt!564815 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564849)))

(declare-fun bs!35323 () Bool)

(assert (= bs!35323 d!138349))

(declare-fun m!1153131 () Bool)

(assert (=> bs!35323 m!1153131))

(declare-fun m!1153133 () Bool)

(assert (=> bs!35323 m!1153133))

(assert (=> b!1251923 d!138349))

(declare-fun d!138351 () Bool)

(assert (=> d!138351 (= (-!1987 lt!564815 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564815)))

(declare-fun lt!564852 () Unit!41536)

(declare-fun choose!1851 (ListLongMap!18369 (_ BitVec 64)) Unit!41536)

(assert (=> d!138351 (= lt!564852 (choose!1851 lt!564815 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138351 (not (contains!7525 lt!564815 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138351 (= (removeNotPresentStillSame!97 lt!564815 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564852)))

(declare-fun bs!35324 () Bool)

(assert (= bs!35324 d!138351))

(assert (=> bs!35324 m!1153073))

(declare-fun m!1153135 () Bool)

(assert (=> bs!35324 m!1153135))

(assert (=> bs!35324 m!1153061))

(assert (=> b!1251923 d!138351))

(declare-fun d!138353 () Bool)

(assert (=> d!138353 (= (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564855 () Unit!41536)

(declare-fun choose!1852 (array!80947 array!80949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47519 V!47519 V!47519 V!47519 (_ BitVec 32) Int) Unit!41536)

(assert (=> d!138353 (= lt!564855 (choose!1852 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138353 (validMask!0 mask!1466)))

(assert (=> d!138353 (= (lemmaNoChangeToArrayThenSameMapNoExtras!944 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564855)))

(declare-fun bs!35325 () Bool)

(assert (= bs!35325 d!138353))

(assert (=> bs!35325 m!1153057))

(assert (=> bs!35325 m!1153055))

(declare-fun m!1153137 () Bool)

(assert (=> bs!35325 m!1153137))

(assert (=> bs!35325 m!1153067))

(assert (=> b!1251928 d!138353))

(declare-fun b!1252011 () Bool)

(declare-fun e!710930 () Bool)

(declare-fun e!710925 () Bool)

(assert (=> b!1252011 (= e!710930 e!710925)))

(declare-fun c!122556 () Bool)

(declare-fun e!710926 () Bool)

(assert (=> b!1252011 (= c!122556 e!710926)))

(declare-fun res!834761 () Bool)

(assert (=> b!1252011 (=> (not res!834761) (not e!710926))))

(assert (=> b!1252011 (= res!834761 (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(declare-fun b!1252012 () Bool)

(declare-fun e!710931 () ListLongMap!18369)

(assert (=> b!1252012 (= e!710931 (ListLongMap!18370 Nil!27734))))

(declare-fun call!61656 () ListLongMap!18369)

(declare-fun bm!61653 () Bool)

(assert (=> bm!61653 (= call!61656 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1252013 () Bool)

(declare-fun e!710928 () Bool)

(declare-fun lt!564874 () ListLongMap!18369)

(declare-fun isEmpty!1027 (ListLongMap!18369) Bool)

(assert (=> b!1252013 (= e!710928 (isEmpty!1027 lt!564874))))

(declare-fun b!1252014 () Bool)

(declare-fun lt!564875 () Unit!41536)

(declare-fun lt!564870 () Unit!41536)

(assert (=> b!1252014 (= lt!564875 lt!564870)))

(declare-fun lt!564876 () ListLongMap!18369)

(declare-fun lt!564871 () V!47519)

(declare-fun lt!564872 () (_ BitVec 64))

(declare-fun lt!564873 () (_ BitVec 64))

(declare-fun +!4194 (ListLongMap!18369 tuple2!20488) ListLongMap!18369)

(assert (=> b!1252014 (not (contains!7525 (+!4194 lt!564876 (tuple2!20489 lt!564873 lt!564871)) lt!564872))))

(declare-fun addStillNotContains!311 (ListLongMap!18369 (_ BitVec 64) V!47519 (_ BitVec 64)) Unit!41536)

(assert (=> b!1252014 (= lt!564870 (addStillNotContains!311 lt!564876 lt!564873 lt!564871 lt!564872))))

(assert (=> b!1252014 (= lt!564872 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!20055 (ValueCell!15044 V!47519) V!47519)

(declare-fun dynLambda!3442 (Int (_ BitVec 64)) V!47519)

(assert (=> b!1252014 (= lt!564871 (get!20055 (select (arr!39036 _values!914) #b00000000000000000000000000000000) (dynLambda!3442 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1252014 (= lt!564873 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252014 (= lt!564876 call!61656)))

(declare-fun e!710927 () ListLongMap!18369)

(assert (=> b!1252014 (= e!710927 (+!4194 call!61656 (tuple2!20489 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000) (get!20055 (select (arr!39036 _values!914) #b00000000000000000000000000000000) (dynLambda!3442 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1252015 () Bool)

(assert (=> b!1252015 (= e!710925 e!710928)))

(declare-fun c!122558 () Bool)

(assert (=> b!1252015 (= c!122558 (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(declare-fun b!1252016 () Bool)

(assert (=> b!1252016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(assert (=> b!1252016 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39573 _values!914)))))

(declare-fun e!710929 () Bool)

(declare-fun apply!990 (ListLongMap!18369 (_ BitVec 64)) V!47519)

(assert (=> b!1252016 (= e!710929 (= (apply!990 lt!564874 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)) (get!20055 (select (arr!39036 _values!914) #b00000000000000000000000000000000) (dynLambda!3442 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1252017 () Bool)

(assert (=> b!1252017 (= e!710928 (= lt!564874 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138355 () Bool)

(assert (=> d!138355 e!710930))

(declare-fun res!834758 () Bool)

(assert (=> d!138355 (=> (not res!834758) (not e!710930))))

(assert (=> d!138355 (= res!834758 (not (contains!7525 lt!564874 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138355 (= lt!564874 e!710931)))

(declare-fun c!122555 () Bool)

(assert (=> d!138355 (= c!122555 (bvsge #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(assert (=> d!138355 (validMask!0 mask!1466)))

(assert (=> d!138355 (= (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564874)))

(declare-fun b!1252010 () Bool)

(declare-fun res!834760 () Bool)

(assert (=> b!1252010 (=> (not res!834760) (not e!710930))))

(assert (=> b!1252010 (= res!834760 (not (contains!7525 lt!564874 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1252018 () Bool)

(assert (=> b!1252018 (= e!710925 e!710929)))

(assert (=> b!1252018 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(declare-fun res!834759 () Bool)

(assert (=> b!1252018 (= res!834759 (contains!7525 lt!564874 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252018 (=> (not res!834759) (not e!710929))))

(declare-fun b!1252019 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1252019 (= e!710926 (validKeyInArray!0 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252019 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1252020 () Bool)

(assert (=> b!1252020 (= e!710931 e!710927)))

(declare-fun c!122557 () Bool)

(assert (=> b!1252020 (= c!122557 (validKeyInArray!0 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252021 () Bool)

(assert (=> b!1252021 (= e!710927 call!61656)))

(assert (= (and d!138355 c!122555) b!1252012))

(assert (= (and d!138355 (not c!122555)) b!1252020))

(assert (= (and b!1252020 c!122557) b!1252014))

(assert (= (and b!1252020 (not c!122557)) b!1252021))

(assert (= (or b!1252014 b!1252021) bm!61653))

(assert (= (and d!138355 res!834758) b!1252010))

(assert (= (and b!1252010 res!834760) b!1252011))

(assert (= (and b!1252011 res!834761) b!1252019))

(assert (= (and b!1252011 c!122556) b!1252018))

(assert (= (and b!1252011 (not c!122556)) b!1252015))

(assert (= (and b!1252018 res!834759) b!1252016))

(assert (= (and b!1252015 c!122558) b!1252017))

(assert (= (and b!1252015 (not c!122558)) b!1252013))

(declare-fun b_lambda!22521 () Bool)

(assert (=> (not b_lambda!22521) (not b!1252014)))

(declare-fun t!41206 () Bool)

(declare-fun tb!11281 () Bool)

(assert (=> (and start!105146 (= defaultEntry!922 defaultEntry!922) t!41206) tb!11281))

(declare-fun result!23267 () Bool)

(assert (=> tb!11281 (= result!23267 tp_is_empty!31615)))

(assert (=> b!1252014 t!41206))

(declare-fun b_and!44497 () Bool)

(assert (= b_and!44491 (and (=> t!41206 result!23267) b_and!44497)))

(declare-fun b_lambda!22523 () Bool)

(assert (=> (not b_lambda!22523) (not b!1252016)))

(assert (=> b!1252016 t!41206))

(declare-fun b_and!44499 () Bool)

(assert (= b_and!44497 (and (=> t!41206 result!23267) b_and!44499)))

(declare-fun m!1153139 () Bool)

(assert (=> d!138355 m!1153139))

(assert (=> d!138355 m!1153067))

(declare-fun m!1153141 () Bool)

(assert (=> bm!61653 m!1153141))

(declare-fun m!1153143 () Bool)

(assert (=> b!1252016 m!1153143))

(declare-fun m!1153145 () Bool)

(assert (=> b!1252016 m!1153145))

(declare-fun m!1153147 () Bool)

(assert (=> b!1252016 m!1153147))

(assert (=> b!1252016 m!1153147))

(assert (=> b!1252016 m!1153143))

(declare-fun m!1153149 () Bool)

(assert (=> b!1252016 m!1153149))

(assert (=> b!1252016 m!1153145))

(declare-fun m!1153151 () Bool)

(assert (=> b!1252016 m!1153151))

(assert (=> b!1252020 m!1153145))

(assert (=> b!1252020 m!1153145))

(declare-fun m!1153153 () Bool)

(assert (=> b!1252020 m!1153153))

(assert (=> b!1252018 m!1153145))

(assert (=> b!1252018 m!1153145))

(declare-fun m!1153155 () Bool)

(assert (=> b!1252018 m!1153155))

(declare-fun m!1153157 () Bool)

(assert (=> b!1252013 m!1153157))

(assert (=> b!1252014 m!1153143))

(assert (=> b!1252014 m!1153147))

(assert (=> b!1252014 m!1153143))

(assert (=> b!1252014 m!1153149))

(declare-fun m!1153159 () Bool)

(assert (=> b!1252014 m!1153159))

(declare-fun m!1153161 () Bool)

(assert (=> b!1252014 m!1153161))

(assert (=> b!1252014 m!1153145))

(declare-fun m!1153163 () Bool)

(assert (=> b!1252014 m!1153163))

(assert (=> b!1252014 m!1153147))

(assert (=> b!1252014 m!1153163))

(declare-fun m!1153165 () Bool)

(assert (=> b!1252014 m!1153165))

(declare-fun m!1153167 () Bool)

(assert (=> b!1252010 m!1153167))

(assert (=> b!1252019 m!1153145))

(assert (=> b!1252019 m!1153145))

(assert (=> b!1252019 m!1153153))

(assert (=> b!1252017 m!1153141))

(assert (=> b!1251928 d!138355))

(declare-fun b!1252025 () Bool)

(declare-fun e!710937 () Bool)

(declare-fun e!710932 () Bool)

(assert (=> b!1252025 (= e!710937 e!710932)))

(declare-fun c!122560 () Bool)

(declare-fun e!710933 () Bool)

(assert (=> b!1252025 (= c!122560 e!710933)))

(declare-fun res!834765 () Bool)

(assert (=> b!1252025 (=> (not res!834765) (not e!710933))))

(assert (=> b!1252025 (= res!834765 (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(declare-fun b!1252026 () Bool)

(declare-fun e!710938 () ListLongMap!18369)

(assert (=> b!1252026 (= e!710938 (ListLongMap!18370 Nil!27734))))

(declare-fun bm!61654 () Bool)

(declare-fun call!61657 () ListLongMap!18369)

(assert (=> bm!61654 (= call!61657 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1252027 () Bool)

(declare-fun e!710935 () Bool)

(declare-fun lt!564881 () ListLongMap!18369)

(assert (=> b!1252027 (= e!710935 (isEmpty!1027 lt!564881))))

(declare-fun b!1252028 () Bool)

(declare-fun lt!564882 () Unit!41536)

(declare-fun lt!564877 () Unit!41536)

(assert (=> b!1252028 (= lt!564882 lt!564877)))

(declare-fun lt!564880 () (_ BitVec 64))

(declare-fun lt!564883 () ListLongMap!18369)

(declare-fun lt!564879 () (_ BitVec 64))

(declare-fun lt!564878 () V!47519)

(assert (=> b!1252028 (not (contains!7525 (+!4194 lt!564883 (tuple2!20489 lt!564880 lt!564878)) lt!564879))))

(assert (=> b!1252028 (= lt!564877 (addStillNotContains!311 lt!564883 lt!564880 lt!564878 lt!564879))))

(assert (=> b!1252028 (= lt!564879 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1252028 (= lt!564878 (get!20055 (select (arr!39036 _values!914) #b00000000000000000000000000000000) (dynLambda!3442 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1252028 (= lt!564880 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252028 (= lt!564883 call!61657)))

(declare-fun e!710934 () ListLongMap!18369)

(assert (=> b!1252028 (= e!710934 (+!4194 call!61657 (tuple2!20489 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000) (get!20055 (select (arr!39036 _values!914) #b00000000000000000000000000000000) (dynLambda!3442 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1252029 () Bool)

(assert (=> b!1252029 (= e!710932 e!710935)))

(declare-fun c!122562 () Bool)

(assert (=> b!1252029 (= c!122562 (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(declare-fun b!1252030 () Bool)

(assert (=> b!1252030 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(assert (=> b!1252030 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39573 _values!914)))))

(declare-fun e!710936 () Bool)

(assert (=> b!1252030 (= e!710936 (= (apply!990 lt!564881 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)) (get!20055 (select (arr!39036 _values!914) #b00000000000000000000000000000000) (dynLambda!3442 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1252031 () Bool)

(assert (=> b!1252031 (= e!710935 (= lt!564881 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun d!138357 () Bool)

(assert (=> d!138357 e!710937))

(declare-fun res!834762 () Bool)

(assert (=> d!138357 (=> (not res!834762) (not e!710937))))

(assert (=> d!138357 (= res!834762 (not (contains!7525 lt!564881 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138357 (= lt!564881 e!710938)))

(declare-fun c!122559 () Bool)

(assert (=> d!138357 (= c!122559 (bvsge #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(assert (=> d!138357 (validMask!0 mask!1466)))

(assert (=> d!138357 (= (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564881)))

(declare-fun b!1252024 () Bool)

(declare-fun res!834764 () Bool)

(assert (=> b!1252024 (=> (not res!834764) (not e!710937))))

(assert (=> b!1252024 (= res!834764 (not (contains!7525 lt!564881 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1252032 () Bool)

(assert (=> b!1252032 (= e!710932 e!710936)))

(assert (=> b!1252032 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(declare-fun res!834763 () Bool)

(assert (=> b!1252032 (= res!834763 (contains!7525 lt!564881 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252032 (=> (not res!834763) (not e!710936))))

(declare-fun b!1252033 () Bool)

(assert (=> b!1252033 (= e!710933 (validKeyInArray!0 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252033 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1252034 () Bool)

(assert (=> b!1252034 (= e!710938 e!710934)))

(declare-fun c!122561 () Bool)

(assert (=> b!1252034 (= c!122561 (validKeyInArray!0 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252035 () Bool)

(assert (=> b!1252035 (= e!710934 call!61657)))

(assert (= (and d!138357 c!122559) b!1252026))

(assert (= (and d!138357 (not c!122559)) b!1252034))

(assert (= (and b!1252034 c!122561) b!1252028))

(assert (= (and b!1252034 (not c!122561)) b!1252035))

(assert (= (or b!1252028 b!1252035) bm!61654))

(assert (= (and d!138357 res!834762) b!1252024))

(assert (= (and b!1252024 res!834764) b!1252025))

(assert (= (and b!1252025 res!834765) b!1252033))

(assert (= (and b!1252025 c!122560) b!1252032))

(assert (= (and b!1252025 (not c!122560)) b!1252029))

(assert (= (and b!1252032 res!834763) b!1252030))

(assert (= (and b!1252029 c!122562) b!1252031))

(assert (= (and b!1252029 (not c!122562)) b!1252027))

(declare-fun b_lambda!22525 () Bool)

(assert (=> (not b_lambda!22525) (not b!1252028)))

(assert (=> b!1252028 t!41206))

(declare-fun b_and!44501 () Bool)

(assert (= b_and!44499 (and (=> t!41206 result!23267) b_and!44501)))

(declare-fun b_lambda!22527 () Bool)

(assert (=> (not b_lambda!22527) (not b!1252030)))

(assert (=> b!1252030 t!41206))

(declare-fun b_and!44503 () Bool)

(assert (= b_and!44501 (and (=> t!41206 result!23267) b_and!44503)))

(declare-fun m!1153169 () Bool)

(assert (=> d!138357 m!1153169))

(assert (=> d!138357 m!1153067))

(declare-fun m!1153171 () Bool)

(assert (=> bm!61654 m!1153171))

(assert (=> b!1252030 m!1153143))

(assert (=> b!1252030 m!1153145))

(assert (=> b!1252030 m!1153147))

(assert (=> b!1252030 m!1153147))

(assert (=> b!1252030 m!1153143))

(assert (=> b!1252030 m!1153149))

(assert (=> b!1252030 m!1153145))

(declare-fun m!1153173 () Bool)

(assert (=> b!1252030 m!1153173))

(assert (=> b!1252034 m!1153145))

(assert (=> b!1252034 m!1153145))

(assert (=> b!1252034 m!1153153))

(assert (=> b!1252032 m!1153145))

(assert (=> b!1252032 m!1153145))

(declare-fun m!1153175 () Bool)

(assert (=> b!1252032 m!1153175))

(declare-fun m!1153177 () Bool)

(assert (=> b!1252027 m!1153177))

(assert (=> b!1252028 m!1153143))

(assert (=> b!1252028 m!1153147))

(assert (=> b!1252028 m!1153143))

(assert (=> b!1252028 m!1153149))

(declare-fun m!1153179 () Bool)

(assert (=> b!1252028 m!1153179))

(declare-fun m!1153181 () Bool)

(assert (=> b!1252028 m!1153181))

(assert (=> b!1252028 m!1153145))

(declare-fun m!1153183 () Bool)

(assert (=> b!1252028 m!1153183))

(assert (=> b!1252028 m!1153147))

(assert (=> b!1252028 m!1153183))

(declare-fun m!1153185 () Bool)

(assert (=> b!1252028 m!1153185))

(declare-fun m!1153187 () Bool)

(assert (=> b!1252024 m!1153187))

(assert (=> b!1252033 m!1153145))

(assert (=> b!1252033 m!1153145))

(assert (=> b!1252033 m!1153153))

(assert (=> b!1252031 m!1153171))

(assert (=> b!1251928 d!138357))

(declare-fun d!138359 () Bool)

(declare-fun e!710944 () Bool)

(assert (=> d!138359 e!710944))

(declare-fun res!834768 () Bool)

(assert (=> d!138359 (=> res!834768 e!710944)))

(declare-fun lt!564893 () Bool)

(assert (=> d!138359 (= res!834768 (not lt!564893))))

(declare-fun lt!564894 () Bool)

(assert (=> d!138359 (= lt!564893 lt!564894)))

(declare-fun lt!564892 () Unit!41536)

(declare-fun e!710943 () Unit!41536)

(assert (=> d!138359 (= lt!564892 e!710943)))

(declare-fun c!122565 () Bool)

(assert (=> d!138359 (= c!122565 lt!564894)))

(declare-fun containsKey!618 (List!27737 (_ BitVec 64)) Bool)

(assert (=> d!138359 (= lt!564894 (containsKey!618 (toList!9200 lt!564815) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138359 (= (contains!7525 lt!564815 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564893)))

(declare-fun b!1252042 () Bool)

(declare-fun lt!564895 () Unit!41536)

(assert (=> b!1252042 (= e!710943 lt!564895)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!427 (List!27737 (_ BitVec 64)) Unit!41536)

(assert (=> b!1252042 (= lt!564895 (lemmaContainsKeyImpliesGetValueByKeyDefined!427 (toList!9200 lt!564815) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!699 0))(
  ( (Some!698 (v!18565 V!47519)) (None!697) )
))
(declare-fun isDefined!465 (Option!699) Bool)

(declare-fun getValueByKey!648 (List!27737 (_ BitVec 64)) Option!699)

(assert (=> b!1252042 (isDefined!465 (getValueByKey!648 (toList!9200 lt!564815) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1252043 () Bool)

(declare-fun Unit!41540 () Unit!41536)

(assert (=> b!1252043 (= e!710943 Unit!41540)))

(declare-fun b!1252044 () Bool)

(assert (=> b!1252044 (= e!710944 (isDefined!465 (getValueByKey!648 (toList!9200 lt!564815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138359 c!122565) b!1252042))

(assert (= (and d!138359 (not c!122565)) b!1252043))

(assert (= (and d!138359 (not res!834768)) b!1252044))

(declare-fun m!1153189 () Bool)

(assert (=> d!138359 m!1153189))

(declare-fun m!1153191 () Bool)

(assert (=> b!1252042 m!1153191))

(declare-fun m!1153193 () Bool)

(assert (=> b!1252042 m!1153193))

(assert (=> b!1252042 m!1153193))

(declare-fun m!1153195 () Bool)

(assert (=> b!1252042 m!1153195))

(assert (=> b!1252044 m!1153193))

(assert (=> b!1252044 m!1153193))

(assert (=> b!1252044 m!1153195))

(assert (=> b!1251929 d!138359))

(declare-fun b!1252087 () Bool)

(declare-fun e!710979 () ListLongMap!18369)

(declare-fun call!61676 () ListLongMap!18369)

(assert (=> b!1252087 (= e!710979 (+!4194 call!61676 (tuple2!20489 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun d!138361 () Bool)

(declare-fun e!710975 () Bool)

(assert (=> d!138361 e!710975))

(declare-fun res!834792 () Bool)

(assert (=> d!138361 (=> (not res!834792) (not e!710975))))

(assert (=> d!138361 (= res!834792 (or (bvsge #b00000000000000000000000000000000 (size!39572 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))))

(declare-fun lt!564953 () ListLongMap!18369)

(declare-fun lt!564961 () ListLongMap!18369)

(assert (=> d!138361 (= lt!564953 lt!564961)))

(declare-fun lt!564958 () Unit!41536)

(declare-fun e!710977 () Unit!41536)

(assert (=> d!138361 (= lt!564958 e!710977)))

(declare-fun c!122580 () Bool)

(declare-fun e!710981 () Bool)

(assert (=> d!138361 (= c!122580 e!710981)))

(declare-fun res!834795 () Bool)

(assert (=> d!138361 (=> (not res!834795) (not e!710981))))

(assert (=> d!138361 (= res!834795 (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(assert (=> d!138361 (= lt!564961 e!710979)))

(declare-fun c!122583 () Bool)

(assert (=> d!138361 (= c!122583 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138361 (validMask!0 mask!1466)))

(assert (=> d!138361 (= (getCurrentListMap!4462 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!564953)))

(declare-fun b!1252088 () Bool)

(declare-fun e!710980 () Bool)

(declare-fun e!710978 () Bool)

(assert (=> b!1252088 (= e!710980 e!710978)))

(declare-fun res!834793 () Bool)

(declare-fun call!61672 () Bool)

(assert (=> b!1252088 (= res!834793 call!61672)))

(assert (=> b!1252088 (=> (not res!834793) (not e!710978))))

(declare-fun b!1252089 () Bool)

(declare-fun c!122578 () Bool)

(assert (=> b!1252089 (= c!122578 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!710973 () ListLongMap!18369)

(declare-fun e!710982 () ListLongMap!18369)

(assert (=> b!1252089 (= e!710973 e!710982)))

(declare-fun b!1252090 () Bool)

(declare-fun call!61675 () ListLongMap!18369)

(assert (=> b!1252090 (= e!710982 call!61675)))

(declare-fun call!61674 () ListLongMap!18369)

(declare-fun call!61678 () ListLongMap!18369)

(declare-fun bm!61669 () Bool)

(declare-fun call!61677 () ListLongMap!18369)

(declare-fun c!122581 () Bool)

(assert (=> bm!61669 (= call!61676 (+!4194 (ite c!122583 call!61678 (ite c!122581 call!61674 call!61677)) (ite (or c!122583 c!122581) (tuple2!20489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20489 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1252091 () Bool)

(assert (=> b!1252091 (= e!710982 call!61677)))

(declare-fun b!1252092 () Bool)

(declare-fun e!710971 () Bool)

(declare-fun e!710976 () Bool)

(assert (=> b!1252092 (= e!710971 e!710976)))

(declare-fun res!834790 () Bool)

(declare-fun call!61673 () Bool)

(assert (=> b!1252092 (= res!834790 call!61673)))

(assert (=> b!1252092 (=> (not res!834790) (not e!710976))))

(declare-fun b!1252093 () Bool)

(declare-fun res!834794 () Bool)

(assert (=> b!1252093 (=> (not res!834794) (not e!710975))))

(declare-fun e!710972 () Bool)

(assert (=> b!1252093 (= res!834794 e!710972)))

(declare-fun res!834791 () Bool)

(assert (=> b!1252093 (=> res!834791 e!710972)))

(declare-fun e!710983 () Bool)

(assert (=> b!1252093 (= res!834791 (not e!710983))))

(declare-fun res!834787 () Bool)

(assert (=> b!1252093 (=> (not res!834787) (not e!710983))))

(assert (=> b!1252093 (= res!834787 (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(declare-fun b!1252094 () Bool)

(assert (=> b!1252094 (= e!710980 (not call!61672))))

(declare-fun b!1252095 () Bool)

(assert (=> b!1252095 (= e!710978 (= (apply!990 lt!564953 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun b!1252096 () Bool)

(declare-fun lt!564957 () Unit!41536)

(assert (=> b!1252096 (= e!710977 lt!564957)))

(declare-fun lt!564956 () ListLongMap!18369)

(assert (=> b!1252096 (= lt!564956 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564949 () (_ BitVec 64))

(assert (=> b!1252096 (= lt!564949 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564947 () (_ BitVec 64))

(assert (=> b!1252096 (= lt!564947 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564941 () Unit!41536)

(declare-fun addStillContains!1083 (ListLongMap!18369 (_ BitVec 64) V!47519 (_ BitVec 64)) Unit!41536)

(assert (=> b!1252096 (= lt!564941 (addStillContains!1083 lt!564956 lt!564949 zeroValue!871 lt!564947))))

(assert (=> b!1252096 (contains!7525 (+!4194 lt!564956 (tuple2!20489 lt!564949 zeroValue!871)) lt!564947)))

(declare-fun lt!564946 () Unit!41536)

(assert (=> b!1252096 (= lt!564946 lt!564941)))

(declare-fun lt!564952 () ListLongMap!18369)

(assert (=> b!1252096 (= lt!564952 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564954 () (_ BitVec 64))

(assert (=> b!1252096 (= lt!564954 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564951 () (_ BitVec 64))

(assert (=> b!1252096 (= lt!564951 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564960 () Unit!41536)

(declare-fun addApplyDifferent!525 (ListLongMap!18369 (_ BitVec 64) V!47519 (_ BitVec 64)) Unit!41536)

(assert (=> b!1252096 (= lt!564960 (addApplyDifferent!525 lt!564952 lt!564954 minValueBefore!43 lt!564951))))

(assert (=> b!1252096 (= (apply!990 (+!4194 lt!564952 (tuple2!20489 lt!564954 minValueBefore!43)) lt!564951) (apply!990 lt!564952 lt!564951))))

(declare-fun lt!564959 () Unit!41536)

(assert (=> b!1252096 (= lt!564959 lt!564960)))

(declare-fun lt!564944 () ListLongMap!18369)

(assert (=> b!1252096 (= lt!564944 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564948 () (_ BitVec 64))

(assert (=> b!1252096 (= lt!564948 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564955 () (_ BitVec 64))

(assert (=> b!1252096 (= lt!564955 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564942 () Unit!41536)

(assert (=> b!1252096 (= lt!564942 (addApplyDifferent!525 lt!564944 lt!564948 zeroValue!871 lt!564955))))

(assert (=> b!1252096 (= (apply!990 (+!4194 lt!564944 (tuple2!20489 lt!564948 zeroValue!871)) lt!564955) (apply!990 lt!564944 lt!564955))))

(declare-fun lt!564943 () Unit!41536)

(assert (=> b!1252096 (= lt!564943 lt!564942)))

(declare-fun lt!564945 () ListLongMap!18369)

(assert (=> b!1252096 (= lt!564945 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!564950 () (_ BitVec 64))

(assert (=> b!1252096 (= lt!564950 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!564940 () (_ BitVec 64))

(assert (=> b!1252096 (= lt!564940 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1252096 (= lt!564957 (addApplyDifferent!525 lt!564945 lt!564950 minValueBefore!43 lt!564940))))

(assert (=> b!1252096 (= (apply!990 (+!4194 lt!564945 (tuple2!20489 lt!564950 minValueBefore!43)) lt!564940) (apply!990 lt!564945 lt!564940))))

(declare-fun bm!61670 () Bool)

(assert (=> bm!61670 (= call!61677 call!61674)))

(declare-fun bm!61671 () Bool)

(assert (=> bm!61671 (= call!61672 (contains!7525 lt!564953 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1252097 () Bool)

(declare-fun e!710974 () Bool)

(assert (=> b!1252097 (= e!710974 (= (apply!990 lt!564953 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)) (get!20055 (select (arr!39036 _values!914) #b00000000000000000000000000000000) (dynLambda!3442 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1252097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39573 _values!914)))))

(assert (=> b!1252097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(declare-fun b!1252098 () Bool)

(assert (=> b!1252098 (= e!710981 (validKeyInArray!0 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252099 () Bool)

(assert (=> b!1252099 (= e!710975 e!710980)))

(declare-fun c!122579 () Bool)

(assert (=> b!1252099 (= c!122579 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252100 () Bool)

(assert (=> b!1252100 (= e!710983 (validKeyInArray!0 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61672 () Bool)

(assert (=> bm!61672 (= call!61678 (getCurrentListMapNoExtraKeys!5630 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252101 () Bool)

(assert (=> b!1252101 (= e!710976 (= (apply!990 lt!564953 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1252102 () Bool)

(assert (=> b!1252102 (= e!710972 e!710974)))

(declare-fun res!834789 () Bool)

(assert (=> b!1252102 (=> (not res!834789) (not e!710974))))

(assert (=> b!1252102 (= res!834789 (contains!7525 lt!564953 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1252102 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(declare-fun b!1252103 () Bool)

(declare-fun res!834788 () Bool)

(assert (=> b!1252103 (=> (not res!834788) (not e!710975))))

(assert (=> b!1252103 (= res!834788 e!710971)))

(declare-fun c!122582 () Bool)

(assert (=> b!1252103 (= c!122582 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1252104 () Bool)

(assert (=> b!1252104 (= e!710973 call!61675)))

(declare-fun bm!61673 () Bool)

(assert (=> bm!61673 (= call!61674 call!61678)))

(declare-fun b!1252105 () Bool)

(assert (=> b!1252105 (= e!710979 e!710973)))

(assert (=> b!1252105 (= c!122581 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252106 () Bool)

(assert (=> b!1252106 (= e!710971 (not call!61673))))

(declare-fun bm!61674 () Bool)

(assert (=> bm!61674 (= call!61673 (contains!7525 lt!564953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1252107 () Bool)

(declare-fun Unit!41541 () Unit!41536)

(assert (=> b!1252107 (= e!710977 Unit!41541)))

(declare-fun bm!61675 () Bool)

(assert (=> bm!61675 (= call!61675 call!61676)))

(assert (= (and d!138361 c!122583) b!1252087))

(assert (= (and d!138361 (not c!122583)) b!1252105))

(assert (= (and b!1252105 c!122581) b!1252104))

(assert (= (and b!1252105 (not c!122581)) b!1252089))

(assert (= (and b!1252089 c!122578) b!1252090))

(assert (= (and b!1252089 (not c!122578)) b!1252091))

(assert (= (or b!1252090 b!1252091) bm!61670))

(assert (= (or b!1252104 bm!61670) bm!61673))

(assert (= (or b!1252104 b!1252090) bm!61675))

(assert (= (or b!1252087 bm!61673) bm!61672))

(assert (= (or b!1252087 bm!61675) bm!61669))

(assert (= (and d!138361 res!834795) b!1252098))

(assert (= (and d!138361 c!122580) b!1252096))

(assert (= (and d!138361 (not c!122580)) b!1252107))

(assert (= (and d!138361 res!834792) b!1252093))

(assert (= (and b!1252093 res!834787) b!1252100))

(assert (= (and b!1252093 (not res!834791)) b!1252102))

(assert (= (and b!1252102 res!834789) b!1252097))

(assert (= (and b!1252093 res!834794) b!1252103))

(assert (= (and b!1252103 c!122582) b!1252092))

(assert (= (and b!1252103 (not c!122582)) b!1252106))

(assert (= (and b!1252092 res!834790) b!1252101))

(assert (= (or b!1252092 b!1252106) bm!61674))

(assert (= (and b!1252103 res!834788) b!1252099))

(assert (= (and b!1252099 c!122579) b!1252088))

(assert (= (and b!1252099 (not c!122579)) b!1252094))

(assert (= (and b!1252088 res!834793) b!1252095))

(assert (= (or b!1252088 b!1252094) bm!61671))

(declare-fun b_lambda!22529 () Bool)

(assert (=> (not b_lambda!22529) (not b!1252097)))

(assert (=> b!1252097 t!41206))

(declare-fun b_and!44505 () Bool)

(assert (= b_and!44503 (and (=> t!41206 result!23267) b_and!44505)))

(assert (=> b!1252097 m!1153147))

(assert (=> b!1252097 m!1153147))

(assert (=> b!1252097 m!1153143))

(assert (=> b!1252097 m!1153149))

(assert (=> b!1252097 m!1153145))

(declare-fun m!1153197 () Bool)

(assert (=> b!1252097 m!1153197))

(assert (=> b!1252097 m!1153145))

(assert (=> b!1252097 m!1153143))

(declare-fun m!1153199 () Bool)

(assert (=> b!1252087 m!1153199))

(assert (=> b!1252100 m!1153145))

(assert (=> b!1252100 m!1153145))

(assert (=> b!1252100 m!1153153))

(declare-fun m!1153201 () Bool)

(assert (=> bm!61674 m!1153201))

(assert (=> bm!61672 m!1153057))

(assert (=> d!138361 m!1153067))

(declare-fun m!1153203 () Bool)

(assert (=> bm!61669 m!1153203))

(declare-fun m!1153205 () Bool)

(assert (=> b!1252095 m!1153205))

(declare-fun m!1153207 () Bool)

(assert (=> bm!61671 m!1153207))

(assert (=> b!1252098 m!1153145))

(assert (=> b!1252098 m!1153145))

(assert (=> b!1252098 m!1153153))

(declare-fun m!1153209 () Bool)

(assert (=> b!1252096 m!1153209))

(declare-fun m!1153211 () Bool)

(assert (=> b!1252096 m!1153211))

(declare-fun m!1153213 () Bool)

(assert (=> b!1252096 m!1153213))

(declare-fun m!1153215 () Bool)

(assert (=> b!1252096 m!1153215))

(declare-fun m!1153217 () Bool)

(assert (=> b!1252096 m!1153217))

(declare-fun m!1153219 () Bool)

(assert (=> b!1252096 m!1153219))

(declare-fun m!1153221 () Bool)

(assert (=> b!1252096 m!1153221))

(declare-fun m!1153223 () Bool)

(assert (=> b!1252096 m!1153223))

(declare-fun m!1153225 () Bool)

(assert (=> b!1252096 m!1153225))

(declare-fun m!1153227 () Bool)

(assert (=> b!1252096 m!1153227))

(assert (=> b!1252096 m!1153145))

(declare-fun m!1153229 () Bool)

(assert (=> b!1252096 m!1153229))

(declare-fun m!1153231 () Bool)

(assert (=> b!1252096 m!1153231))

(declare-fun m!1153233 () Bool)

(assert (=> b!1252096 m!1153233))

(assert (=> b!1252096 m!1153215))

(assert (=> b!1252096 m!1153057))

(declare-fun m!1153235 () Bool)

(assert (=> b!1252096 m!1153235))

(declare-fun m!1153237 () Bool)

(assert (=> b!1252096 m!1153237))

(assert (=> b!1252096 m!1153211))

(assert (=> b!1252096 m!1153221))

(assert (=> b!1252096 m!1153231))

(declare-fun m!1153239 () Bool)

(assert (=> b!1252101 m!1153239))

(assert (=> b!1252102 m!1153145))

(assert (=> b!1252102 m!1153145))

(declare-fun m!1153241 () Bool)

(assert (=> b!1252102 m!1153241))

(assert (=> b!1251929 d!138361))

(declare-fun d!138363 () Bool)

(declare-fun res!834804 () Bool)

(declare-fun e!710992 () Bool)

(assert (=> d!138363 (=> res!834804 e!710992)))

(assert (=> d!138363 (= res!834804 (bvsge #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(assert (=> d!138363 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27735) e!710992)))

(declare-fun bm!61678 () Bool)

(declare-fun call!61681 () Bool)

(declare-fun c!122586 () Bool)

(assert (=> bm!61678 (= call!61681 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122586 (Cons!27734 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000) Nil!27735) Nil!27735)))))

(declare-fun b!1252118 () Bool)

(declare-fun e!710993 () Bool)

(declare-fun contains!7526 (List!27738 (_ BitVec 64)) Bool)

(assert (=> b!1252118 (= e!710993 (contains!7526 Nil!27735 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252119 () Bool)

(declare-fun e!710995 () Bool)

(assert (=> b!1252119 (= e!710992 e!710995)))

(declare-fun res!834803 () Bool)

(assert (=> b!1252119 (=> (not res!834803) (not e!710995))))

(assert (=> b!1252119 (= res!834803 (not e!710993))))

(declare-fun res!834802 () Bool)

(assert (=> b!1252119 (=> (not res!834802) (not e!710993))))

(assert (=> b!1252119 (= res!834802 (validKeyInArray!0 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252120 () Bool)

(declare-fun e!710994 () Bool)

(assert (=> b!1252120 (= e!710994 call!61681)))

(declare-fun b!1252121 () Bool)

(assert (=> b!1252121 (= e!710995 e!710994)))

(assert (=> b!1252121 (= c!122586 (validKeyInArray!0 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1252122 () Bool)

(assert (=> b!1252122 (= e!710994 call!61681)))

(assert (= (and d!138363 (not res!834804)) b!1252119))

(assert (= (and b!1252119 res!834802) b!1252118))

(assert (= (and b!1252119 res!834803) b!1252121))

(assert (= (and b!1252121 c!122586) b!1252122))

(assert (= (and b!1252121 (not c!122586)) b!1252120))

(assert (= (or b!1252122 b!1252120) bm!61678))

(assert (=> bm!61678 m!1153145))

(declare-fun m!1153243 () Bool)

(assert (=> bm!61678 m!1153243))

(assert (=> b!1252118 m!1153145))

(assert (=> b!1252118 m!1153145))

(declare-fun m!1153245 () Bool)

(assert (=> b!1252118 m!1153245))

(assert (=> b!1252119 m!1153145))

(assert (=> b!1252119 m!1153145))

(assert (=> b!1252119 m!1153153))

(assert (=> b!1252121 m!1153145))

(assert (=> b!1252121 m!1153145))

(assert (=> b!1252121 m!1153153))

(assert (=> b!1251924 d!138363))

(declare-fun d!138365 () Bool)

(assert (=> d!138365 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105146 d!138365))

(declare-fun d!138367 () Bool)

(assert (=> d!138367 (= (array_inv!29895 _keys!1118) (bvsge (size!39572 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105146 d!138367))

(declare-fun d!138369 () Bool)

(assert (=> d!138369 (= (array_inv!29896 _values!914) (bvsge (size!39573 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105146 d!138369))

(declare-fun bm!61681 () Bool)

(declare-fun call!61684 () Bool)

(assert (=> bm!61681 (= call!61684 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1252131 () Bool)

(declare-fun e!711003 () Bool)

(assert (=> b!1252131 (= e!711003 call!61684)))

(declare-fun b!1252132 () Bool)

(declare-fun e!711002 () Bool)

(assert (=> b!1252132 (= e!711002 e!711003)))

(declare-fun lt!564969 () (_ BitVec 64))

(assert (=> b!1252132 (= lt!564969 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!564968 () Unit!41536)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80947 (_ BitVec 64) (_ BitVec 32)) Unit!41536)

(assert (=> b!1252132 (= lt!564968 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!564969 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1252132 (arrayContainsKey!0 _keys!1118 lt!564969 #b00000000000000000000000000000000)))

(declare-fun lt!564970 () Unit!41536)

(assert (=> b!1252132 (= lt!564970 lt!564968)))

(declare-fun res!834809 () Bool)

(declare-datatypes ((SeekEntryResult!9915 0))(
  ( (MissingZero!9915 (index!42031 (_ BitVec 32))) (Found!9915 (index!42032 (_ BitVec 32))) (Intermediate!9915 (undefined!10727 Bool) (index!42033 (_ BitVec 32)) (x!110007 (_ BitVec 32))) (Undefined!9915) (MissingVacant!9915 (index!42034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80947 (_ BitVec 32)) SeekEntryResult!9915)

(assert (=> b!1252132 (= res!834809 (= (seekEntryOrOpen!0 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9915 #b00000000000000000000000000000000)))))

(assert (=> b!1252132 (=> (not res!834809) (not e!711003))))

(declare-fun b!1252133 () Bool)

(assert (=> b!1252133 (= e!711002 call!61684)))

(declare-fun b!1252134 () Bool)

(declare-fun e!711004 () Bool)

(assert (=> b!1252134 (= e!711004 e!711002)))

(declare-fun c!122589 () Bool)

(assert (=> b!1252134 (= c!122589 (validKeyInArray!0 (select (arr!39035 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138371 () Bool)

(declare-fun res!834810 () Bool)

(assert (=> d!138371 (=> res!834810 e!711004)))

(assert (=> d!138371 (= res!834810 (bvsge #b00000000000000000000000000000000 (size!39572 _keys!1118)))))

(assert (=> d!138371 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!711004)))

(assert (= (and d!138371 (not res!834810)) b!1252134))

(assert (= (and b!1252134 c!122589) b!1252132))

(assert (= (and b!1252134 (not c!122589)) b!1252133))

(assert (= (and b!1252132 res!834809) b!1252131))

(assert (= (or b!1252131 b!1252133) bm!61681))

(declare-fun m!1153247 () Bool)

(assert (=> bm!61681 m!1153247))

(assert (=> b!1252132 m!1153145))

(declare-fun m!1153249 () Bool)

(assert (=> b!1252132 m!1153249))

(declare-fun m!1153251 () Bool)

(assert (=> b!1252132 m!1153251))

(assert (=> b!1252132 m!1153145))

(declare-fun m!1153253 () Bool)

(assert (=> b!1252132 m!1153253))

(assert (=> b!1252134 m!1153145))

(assert (=> b!1252134 m!1153145))

(assert (=> b!1252134 m!1153153))

(assert (=> b!1251926 d!138371))

(declare-fun condMapEmpty!49195 () Bool)

(declare-fun mapDefault!49195 () ValueCell!15044)

(assert (=> mapNonEmpty!49186 (= condMapEmpty!49195 (= mapRest!49186 ((as const (Array (_ BitVec 32) ValueCell!15044)) mapDefault!49195)))))

(declare-fun e!711009 () Bool)

(declare-fun mapRes!49195 () Bool)

(assert (=> mapNonEmpty!49186 (= tp!93631 (and e!711009 mapRes!49195))))

(declare-fun mapIsEmpty!49195 () Bool)

(assert (=> mapIsEmpty!49195 mapRes!49195))

(declare-fun b!1252142 () Bool)

(assert (=> b!1252142 (= e!711009 tp_is_empty!31615)))

(declare-fun b!1252141 () Bool)

(declare-fun e!711010 () Bool)

(assert (=> b!1252141 (= e!711010 tp_is_empty!31615)))

(declare-fun mapNonEmpty!49195 () Bool)

(declare-fun tp!93647 () Bool)

(assert (=> mapNonEmpty!49195 (= mapRes!49195 (and tp!93647 e!711010))))

(declare-fun mapKey!49195 () (_ BitVec 32))

(declare-fun mapValue!49195 () ValueCell!15044)

(declare-fun mapRest!49195 () (Array (_ BitVec 32) ValueCell!15044))

(assert (=> mapNonEmpty!49195 (= mapRest!49186 (store mapRest!49195 mapKey!49195 mapValue!49195))))

(assert (= (and mapNonEmpty!49186 condMapEmpty!49195) mapIsEmpty!49195))

(assert (= (and mapNonEmpty!49186 (not condMapEmpty!49195)) mapNonEmpty!49195))

(assert (= (and mapNonEmpty!49195 ((_ is ValueCellFull!15044) mapValue!49195)) b!1252141))

(assert (= (and mapNonEmpty!49186 ((_ is ValueCellFull!15044) mapDefault!49195)) b!1252142))

(declare-fun m!1153255 () Bool)

(assert (=> mapNonEmpty!49195 m!1153255))

(declare-fun b_lambda!22531 () Bool)

(assert (= b_lambda!22525 (or (and start!105146 b_free!26713) b_lambda!22531)))

(declare-fun b_lambda!22533 () Bool)

(assert (= b_lambda!22529 (or (and start!105146 b_free!26713) b_lambda!22533)))

(declare-fun b_lambda!22535 () Bool)

(assert (= b_lambda!22523 (or (and start!105146 b_free!26713) b_lambda!22535)))

(declare-fun b_lambda!22537 () Bool)

(assert (= b_lambda!22521 (or (and start!105146 b_free!26713) b_lambda!22537)))

(declare-fun b_lambda!22539 () Bool)

(assert (= b_lambda!22527 (or (and start!105146 b_free!26713) b_lambda!22539)))

(check-sat (not b!1252013) (not bm!61654) (not b!1252028) (not bm!61678) (not b!1252101) (not b!1252027) (not b!1252019) (not d!138349) (not b!1252096) (not b!1252010) (not d!138357) (not b_lambda!22531) (not b!1252087) (not b!1252031) (not b_next!26713) (not bm!61671) (not d!138353) (not d!138359) (not bm!61681) (not d!138351) (not bm!61674) (not b!1252132) (not b!1252032) (not mapNonEmpty!49195) (not b_lambda!22535) b_and!44505 (not b!1252017) (not b!1252014) (not b!1252020) (not b!1252044) (not b!1252098) (not d!138355) (not b!1252121) (not b!1252095) (not b!1252016) (not b!1252018) (not bm!61653) (not b_lambda!22533) tp_is_empty!31615 (not b!1252097) (not bm!61672) (not b_lambda!22539) (not b!1252024) (not d!138361) (not bm!61669) (not b!1252119) (not b!1252042) (not b!1252033) (not b!1252102) (not b!1252134) (not b!1252118) (not b_lambda!22537) (not b!1252034) (not b!1252030) (not b!1252100))
(check-sat b_and!44505 (not b_next!26713))
