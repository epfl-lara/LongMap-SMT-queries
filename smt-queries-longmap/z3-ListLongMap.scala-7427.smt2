; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94634 () Bool)

(assert start!94634)

(declare-fun b_free!21739 () Bool)

(declare-fun b_next!21739 () Bool)

(assert (=> start!94634 (= b_free!21739 (not b_next!21739))))

(declare-fun tp!76660 () Bool)

(declare-fun b_and!34533 () Bool)

(assert (=> start!94634 (= tp!76660 b_and!34533)))

(declare-fun mapIsEmpty!40015 () Bool)

(declare-fun mapRes!40015 () Bool)

(assert (=> mapIsEmpty!40015 mapRes!40015))

(declare-fun b!1068742 () Bool)

(declare-fun res!712850 () Bool)

(declare-fun e!609668 () Bool)

(assert (=> b!1068742 (=> (not res!712850) (not e!609668))))

(declare-datatypes ((array!68123 0))(
  ( (array!68124 (arr!32756 (Array (_ BitVec 32) (_ BitVec 64))) (size!33293 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68123)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68123 (_ BitVec 32)) Bool)

(assert (=> b!1068742 (= res!712850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068743 () Bool)

(declare-fun res!712847 () Bool)

(assert (=> b!1068743 (=> (not res!712847) (not e!609668))))

(declare-datatypes ((V!39201 0))(
  ( (V!39202 (val!12825 Int)) )
))
(declare-datatypes ((ValueCell!12071 0))(
  ( (ValueCellFull!12071 (v!15435 V!39201)) (EmptyCell!12071) )
))
(declare-datatypes ((array!68125 0))(
  ( (array!68126 (arr!32757 (Array (_ BitVec 32) ValueCell!12071)) (size!33294 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68125)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068743 (= res!712847 (and (= (size!33294 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33293 _keys!1163) (size!33294 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068744 () Bool)

(declare-fun e!609669 () Bool)

(declare-fun tp_is_empty!25549 () Bool)

(assert (=> b!1068744 (= e!609669 tp_is_empty!25549)))

(declare-fun b!1068745 () Bool)

(assert (=> b!1068745 (= e!609668 (not (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!33293 _keys!1163)))))))

(declare-datatypes ((tuple2!16250 0))(
  ( (tuple2!16251 (_1!8136 (_ BitVec 64)) (_2!8136 V!39201)) )
))
(declare-datatypes ((List!22822 0))(
  ( (Nil!22819) (Cons!22818 (h!24036 tuple2!16250) (t!32137 List!22822)) )
))
(declare-datatypes ((ListLongMap!14227 0))(
  ( (ListLongMap!14228 (toList!7129 List!22822)) )
))
(declare-fun lt!471952 () ListLongMap!14227)

(declare-fun lt!471953 () ListLongMap!14227)

(assert (=> b!1068745 (= lt!471952 lt!471953)))

(declare-fun zeroValueBefore!47 () V!39201)

(declare-fun minValue!907 () V!39201)

(declare-datatypes ((Unit!35056 0))(
  ( (Unit!35057) )
))
(declare-fun lt!471951 () Unit!35056)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39201)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!751 (array!68123 array!68125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39201 V!39201 V!39201 V!39201 (_ BitVec 32) Int) Unit!35056)

(assert (=> b!1068745 (= lt!471951 (lemmaNoChangeToArrayThenSameMapNoExtras!751 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3748 (array!68123 array!68125 (_ BitVec 32) (_ BitVec 32) V!39201 V!39201 (_ BitVec 32) Int) ListLongMap!14227)

(assert (=> b!1068745 (= lt!471953 (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068745 (= lt!471952 (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!712849 () Bool)

(assert (=> start!94634 (=> (not res!712849) (not e!609668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94634 (= res!712849 (validMask!0 mask!1515))))

(assert (=> start!94634 e!609668))

(assert (=> start!94634 true))

(assert (=> start!94634 tp_is_empty!25549))

(declare-fun e!609667 () Bool)

(declare-fun array_inv!25380 (array!68125) Bool)

(assert (=> start!94634 (and (array_inv!25380 _values!955) e!609667)))

(assert (=> start!94634 tp!76660))

(declare-fun array_inv!25381 (array!68123) Bool)

(assert (=> start!94634 (array_inv!25381 _keys!1163)))

(declare-fun b!1068746 () Bool)

(declare-fun res!712848 () Bool)

(assert (=> b!1068746 (=> (not res!712848) (not e!609668))))

(declare-datatypes ((List!22823 0))(
  ( (Nil!22820) (Cons!22819 (h!24037 (_ BitVec 64)) (t!32138 List!22823)) )
))
(declare-fun arrayNoDuplicates!0 (array!68123 (_ BitVec 32) List!22823) Bool)

(assert (=> b!1068746 (= res!712848 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22820))))

(declare-fun b!1068747 () Bool)

(declare-fun e!609665 () Bool)

(assert (=> b!1068747 (= e!609665 tp_is_empty!25549)))

(declare-fun mapNonEmpty!40015 () Bool)

(declare-fun tp!76661 () Bool)

(assert (=> mapNonEmpty!40015 (= mapRes!40015 (and tp!76661 e!609669))))

(declare-fun mapValue!40015 () ValueCell!12071)

(declare-fun mapKey!40015 () (_ BitVec 32))

(declare-fun mapRest!40015 () (Array (_ BitVec 32) ValueCell!12071))

(assert (=> mapNonEmpty!40015 (= (arr!32757 _values!955) (store mapRest!40015 mapKey!40015 mapValue!40015))))

(declare-fun b!1068748 () Bool)

(assert (=> b!1068748 (= e!609667 (and e!609665 mapRes!40015))))

(declare-fun condMapEmpty!40015 () Bool)

(declare-fun mapDefault!40015 () ValueCell!12071)

(assert (=> b!1068748 (= condMapEmpty!40015 (= (arr!32757 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12071)) mapDefault!40015)))))

(assert (= (and start!94634 res!712849) b!1068743))

(assert (= (and b!1068743 res!712847) b!1068742))

(assert (= (and b!1068742 res!712850) b!1068746))

(assert (= (and b!1068746 res!712848) b!1068745))

(assert (= (and b!1068748 condMapEmpty!40015) mapIsEmpty!40015))

(assert (= (and b!1068748 (not condMapEmpty!40015)) mapNonEmpty!40015))

(get-info :version)

(assert (= (and mapNonEmpty!40015 ((_ is ValueCellFull!12071) mapValue!40015)) b!1068744))

(assert (= (and b!1068748 ((_ is ValueCellFull!12071) mapDefault!40015)) b!1068747))

(assert (= start!94634 b!1068748))

(declare-fun m!987751 () Bool)

(assert (=> b!1068742 m!987751))

(declare-fun m!987753 () Bool)

(assert (=> start!94634 m!987753))

(declare-fun m!987755 () Bool)

(assert (=> start!94634 m!987755))

(declare-fun m!987757 () Bool)

(assert (=> start!94634 m!987757))

(declare-fun m!987759 () Bool)

(assert (=> mapNonEmpty!40015 m!987759))

(declare-fun m!987761 () Bool)

(assert (=> b!1068745 m!987761))

(declare-fun m!987763 () Bool)

(assert (=> b!1068745 m!987763))

(declare-fun m!987765 () Bool)

(assert (=> b!1068745 m!987765))

(declare-fun m!987767 () Bool)

(assert (=> b!1068746 m!987767))

(check-sat tp_is_empty!25549 (not b!1068745) (not b!1068746) b_and!34533 (not start!94634) (not b_next!21739) (not mapNonEmpty!40015) (not b!1068742))
(check-sat b_and!34533 (not b_next!21739))
(get-model)

(declare-fun d!129575 () Bool)

(assert (=> d!129575 (= (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!471974 () Unit!35056)

(declare-fun choose!1738 (array!68123 array!68125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39201 V!39201 V!39201 V!39201 (_ BitVec 32) Int) Unit!35056)

(assert (=> d!129575 (= lt!471974 (choose!1738 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129575 (validMask!0 mask!1515)))

(assert (=> d!129575 (= (lemmaNoChangeToArrayThenSameMapNoExtras!751 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471974)))

(declare-fun bs!31442 () Bool)

(assert (= bs!31442 d!129575))

(assert (=> bs!31442 m!987765))

(assert (=> bs!31442 m!987763))

(declare-fun m!987805 () Bool)

(assert (=> bs!31442 m!987805))

(assert (=> bs!31442 m!987753))

(assert (=> b!1068745 d!129575))

(declare-fun bm!45155 () Bool)

(declare-fun call!45158 () ListLongMap!14227)

(assert (=> bm!45155 (= call!45158 (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1068816 () Bool)

(declare-fun e!609720 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1068816 (= e!609720 (validKeyInArray!0 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068816 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1068817 () Bool)

(declare-fun e!609715 () Bool)

(declare-fun lt!471991 () ListLongMap!14227)

(declare-fun isEmpty!947 (ListLongMap!14227) Bool)

(assert (=> b!1068817 (= e!609715 (isEmpty!947 lt!471991))))

(declare-fun b!1068818 () Bool)

(declare-fun lt!471993 () Unit!35056)

(declare-fun lt!471995 () Unit!35056)

(assert (=> b!1068818 (= lt!471993 lt!471995)))

(declare-fun lt!471992 () (_ BitVec 64))

(declare-fun lt!471994 () V!39201)

(declare-fun lt!471990 () ListLongMap!14227)

(declare-fun lt!471989 () (_ BitVec 64))

(declare-fun contains!6294 (ListLongMap!14227 (_ BitVec 64)) Bool)

(declare-fun +!3178 (ListLongMap!14227 tuple2!16250) ListLongMap!14227)

(assert (=> b!1068818 (not (contains!6294 (+!3178 lt!471990 (tuple2!16251 lt!471992 lt!471994)) lt!471989))))

(declare-fun addStillNotContains!255 (ListLongMap!14227 (_ BitVec 64) V!39201 (_ BitVec 64)) Unit!35056)

(assert (=> b!1068818 (= lt!471995 (addStillNotContains!255 lt!471990 lt!471992 lt!471994 lt!471989))))

(assert (=> b!1068818 (= lt!471989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17096 (ValueCell!12071 V!39201) V!39201)

(declare-fun dynLambda!2049 (Int (_ BitVec 64)) V!39201)

(assert (=> b!1068818 (= lt!471994 (get!17096 (select (arr!32757 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1068818 (= lt!471992 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068818 (= lt!471990 call!45158)))

(declare-fun e!609714 () ListLongMap!14227)

(assert (=> b!1068818 (= e!609714 (+!3178 call!45158 (tuple2!16251 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000) (get!17096 (select (arr!32757 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1068819 () Bool)

(declare-fun e!609719 () ListLongMap!14227)

(assert (=> b!1068819 (= e!609719 e!609714)))

(declare-fun c!107900 () Bool)

(assert (=> b!1068819 (= c!107900 (validKeyInArray!0 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068820 () Bool)

(assert (=> b!1068820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(assert (=> b!1068820 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33294 _values!955)))))

(declare-fun e!609716 () Bool)

(declare-fun apply!934 (ListLongMap!14227 (_ BitVec 64)) V!39201)

(assert (=> b!1068820 (= e!609716 (= (apply!934 lt!471991 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)) (get!17096 (select (arr!32757 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1068821 () Bool)

(declare-fun e!609718 () Bool)

(assert (=> b!1068821 (= e!609718 e!609715)))

(declare-fun c!107901 () Bool)

(assert (=> b!1068821 (= c!107901 (bvslt #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(declare-fun b!1068822 () Bool)

(assert (=> b!1068822 (= e!609718 e!609716)))

(assert (=> b!1068822 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(declare-fun res!712884 () Bool)

(assert (=> b!1068822 (= res!712884 (contains!6294 lt!471991 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068822 (=> (not res!712884) (not e!609716))))

(declare-fun b!1068823 () Bool)

(assert (=> b!1068823 (= e!609714 call!45158)))

(declare-fun b!1068824 () Bool)

(assert (=> b!1068824 (= e!609715 (= lt!471991 (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1068815 () Bool)

(declare-fun e!609717 () Bool)

(assert (=> b!1068815 (= e!609717 e!609718)))

(declare-fun c!107898 () Bool)

(assert (=> b!1068815 (= c!107898 e!609720)))

(declare-fun res!712883 () Bool)

(assert (=> b!1068815 (=> (not res!712883) (not e!609720))))

(assert (=> b!1068815 (= res!712883 (bvslt #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(declare-fun d!129577 () Bool)

(assert (=> d!129577 e!609717))

(declare-fun res!712886 () Bool)

(assert (=> d!129577 (=> (not res!712886) (not e!609717))))

(assert (=> d!129577 (= res!712886 (not (contains!6294 lt!471991 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129577 (= lt!471991 e!609719)))

(declare-fun c!107899 () Bool)

(assert (=> d!129577 (= c!107899 (bvsge #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(assert (=> d!129577 (validMask!0 mask!1515)))

(assert (=> d!129577 (= (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471991)))

(declare-fun b!1068825 () Bool)

(assert (=> b!1068825 (= e!609719 (ListLongMap!14228 Nil!22819))))

(declare-fun b!1068826 () Bool)

(declare-fun res!712885 () Bool)

(assert (=> b!1068826 (=> (not res!712885) (not e!609717))))

(assert (=> b!1068826 (= res!712885 (not (contains!6294 lt!471991 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129577 c!107899) b!1068825))

(assert (= (and d!129577 (not c!107899)) b!1068819))

(assert (= (and b!1068819 c!107900) b!1068818))

(assert (= (and b!1068819 (not c!107900)) b!1068823))

(assert (= (or b!1068818 b!1068823) bm!45155))

(assert (= (and d!129577 res!712886) b!1068826))

(assert (= (and b!1068826 res!712885) b!1068815))

(assert (= (and b!1068815 res!712883) b!1068816))

(assert (= (and b!1068815 c!107898) b!1068822))

(assert (= (and b!1068815 (not c!107898)) b!1068821))

(assert (= (and b!1068822 res!712884) b!1068820))

(assert (= (and b!1068821 c!107901) b!1068824))

(assert (= (and b!1068821 (not c!107901)) b!1068817))

(declare-fun b_lambda!16595 () Bool)

(assert (=> (not b_lambda!16595) (not b!1068818)))

(declare-fun t!32142 () Bool)

(declare-fun tb!7137 () Bool)

(assert (=> (and start!94634 (= defaultEntry!963 defaultEntry!963) t!32142) tb!7137))

(declare-fun result!14735 () Bool)

(assert (=> tb!7137 (= result!14735 tp_is_empty!25549)))

(assert (=> b!1068818 t!32142))

(declare-fun b_and!34539 () Bool)

(assert (= b_and!34533 (and (=> t!32142 result!14735) b_and!34539)))

(declare-fun b_lambda!16597 () Bool)

(assert (=> (not b_lambda!16597) (not b!1068820)))

(assert (=> b!1068820 t!32142))

(declare-fun b_and!34541 () Bool)

(assert (= b_and!34539 (and (=> t!32142 result!14735) b_and!34541)))

(declare-fun m!987807 () Bool)

(assert (=> d!129577 m!987807))

(assert (=> d!129577 m!987753))

(declare-fun m!987809 () Bool)

(assert (=> b!1068824 m!987809))

(declare-fun m!987811 () Bool)

(assert (=> b!1068826 m!987811))

(declare-fun m!987813 () Bool)

(assert (=> b!1068816 m!987813))

(assert (=> b!1068816 m!987813))

(declare-fun m!987815 () Bool)

(assert (=> b!1068816 m!987815))

(assert (=> b!1068819 m!987813))

(assert (=> b!1068819 m!987813))

(assert (=> b!1068819 m!987815))

(assert (=> bm!45155 m!987809))

(declare-fun m!987817 () Bool)

(assert (=> b!1068818 m!987817))

(declare-fun m!987819 () Bool)

(assert (=> b!1068818 m!987819))

(assert (=> b!1068818 m!987813))

(declare-fun m!987821 () Bool)

(assert (=> b!1068818 m!987821))

(declare-fun m!987823 () Bool)

(assert (=> b!1068818 m!987823))

(declare-fun m!987825 () Bool)

(assert (=> b!1068818 m!987825))

(assert (=> b!1068818 m!987825))

(assert (=> b!1068818 m!987821))

(declare-fun m!987827 () Bool)

(assert (=> b!1068818 m!987827))

(assert (=> b!1068818 m!987817))

(declare-fun m!987829 () Bool)

(assert (=> b!1068818 m!987829))

(assert (=> b!1068822 m!987813))

(assert (=> b!1068822 m!987813))

(declare-fun m!987831 () Bool)

(assert (=> b!1068822 m!987831))

(declare-fun m!987833 () Bool)

(assert (=> b!1068817 m!987833))

(assert (=> b!1068820 m!987813))

(assert (=> b!1068820 m!987821))

(assert (=> b!1068820 m!987825))

(assert (=> b!1068820 m!987825))

(assert (=> b!1068820 m!987821))

(assert (=> b!1068820 m!987827))

(assert (=> b!1068820 m!987813))

(declare-fun m!987835 () Bool)

(assert (=> b!1068820 m!987835))

(assert (=> b!1068745 d!129577))

(declare-fun bm!45156 () Bool)

(declare-fun call!45159 () ListLongMap!14227)

(assert (=> bm!45156 (= call!45159 (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1068830 () Bool)

(declare-fun e!609727 () Bool)

(assert (=> b!1068830 (= e!609727 (validKeyInArray!0 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068830 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1068831 () Bool)

(declare-fun e!609722 () Bool)

(declare-fun lt!471998 () ListLongMap!14227)

(assert (=> b!1068831 (= e!609722 (isEmpty!947 lt!471998))))

(declare-fun b!1068832 () Bool)

(declare-fun lt!472000 () Unit!35056)

(declare-fun lt!472002 () Unit!35056)

(assert (=> b!1068832 (= lt!472000 lt!472002)))

(declare-fun lt!471999 () (_ BitVec 64))

(declare-fun lt!471997 () ListLongMap!14227)

(declare-fun lt!472001 () V!39201)

(declare-fun lt!471996 () (_ BitVec 64))

(assert (=> b!1068832 (not (contains!6294 (+!3178 lt!471997 (tuple2!16251 lt!471999 lt!472001)) lt!471996))))

(assert (=> b!1068832 (= lt!472002 (addStillNotContains!255 lt!471997 lt!471999 lt!472001 lt!471996))))

(assert (=> b!1068832 (= lt!471996 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1068832 (= lt!472001 (get!17096 (select (arr!32757 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1068832 (= lt!471999 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1068832 (= lt!471997 call!45159)))

(declare-fun e!609721 () ListLongMap!14227)

(assert (=> b!1068832 (= e!609721 (+!3178 call!45159 (tuple2!16251 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000) (get!17096 (select (arr!32757 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1068833 () Bool)

(declare-fun e!609726 () ListLongMap!14227)

(assert (=> b!1068833 (= e!609726 e!609721)))

(declare-fun c!107904 () Bool)

(assert (=> b!1068833 (= c!107904 (validKeyInArray!0 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068834 () Bool)

(assert (=> b!1068834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(assert (=> b!1068834 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33294 _values!955)))))

(declare-fun e!609723 () Bool)

(assert (=> b!1068834 (= e!609723 (= (apply!934 lt!471998 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)) (get!17096 (select (arr!32757 _values!955) #b00000000000000000000000000000000) (dynLambda!2049 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1068835 () Bool)

(declare-fun e!609725 () Bool)

(assert (=> b!1068835 (= e!609725 e!609722)))

(declare-fun c!107905 () Bool)

(assert (=> b!1068835 (= c!107905 (bvslt #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(declare-fun b!1068836 () Bool)

(assert (=> b!1068836 (= e!609725 e!609723)))

(assert (=> b!1068836 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(declare-fun res!712888 () Bool)

(assert (=> b!1068836 (= res!712888 (contains!6294 lt!471998 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1068836 (=> (not res!712888) (not e!609723))))

(declare-fun b!1068837 () Bool)

(assert (=> b!1068837 (= e!609721 call!45159)))

(declare-fun b!1068838 () Bool)

(assert (=> b!1068838 (= e!609722 (= lt!471998 (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1068829 () Bool)

(declare-fun e!609724 () Bool)

(assert (=> b!1068829 (= e!609724 e!609725)))

(declare-fun c!107902 () Bool)

(assert (=> b!1068829 (= c!107902 e!609727)))

(declare-fun res!712887 () Bool)

(assert (=> b!1068829 (=> (not res!712887) (not e!609727))))

(assert (=> b!1068829 (= res!712887 (bvslt #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(declare-fun d!129579 () Bool)

(assert (=> d!129579 e!609724))

(declare-fun res!712890 () Bool)

(assert (=> d!129579 (=> (not res!712890) (not e!609724))))

(assert (=> d!129579 (= res!712890 (not (contains!6294 lt!471998 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129579 (= lt!471998 e!609726)))

(declare-fun c!107903 () Bool)

(assert (=> d!129579 (= c!107903 (bvsge #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(assert (=> d!129579 (validMask!0 mask!1515)))

(assert (=> d!129579 (= (getCurrentListMapNoExtraKeys!3748 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471998)))

(declare-fun b!1068839 () Bool)

(assert (=> b!1068839 (= e!609726 (ListLongMap!14228 Nil!22819))))

(declare-fun b!1068840 () Bool)

(declare-fun res!712889 () Bool)

(assert (=> b!1068840 (=> (not res!712889) (not e!609724))))

(assert (=> b!1068840 (= res!712889 (not (contains!6294 lt!471998 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129579 c!107903) b!1068839))

(assert (= (and d!129579 (not c!107903)) b!1068833))

(assert (= (and b!1068833 c!107904) b!1068832))

(assert (= (and b!1068833 (not c!107904)) b!1068837))

(assert (= (or b!1068832 b!1068837) bm!45156))

(assert (= (and d!129579 res!712890) b!1068840))

(assert (= (and b!1068840 res!712889) b!1068829))

(assert (= (and b!1068829 res!712887) b!1068830))

(assert (= (and b!1068829 c!107902) b!1068836))

(assert (= (and b!1068829 (not c!107902)) b!1068835))

(assert (= (and b!1068836 res!712888) b!1068834))

(assert (= (and b!1068835 c!107905) b!1068838))

(assert (= (and b!1068835 (not c!107905)) b!1068831))

(declare-fun b_lambda!16599 () Bool)

(assert (=> (not b_lambda!16599) (not b!1068832)))

(assert (=> b!1068832 t!32142))

(declare-fun b_and!34543 () Bool)

(assert (= b_and!34541 (and (=> t!32142 result!14735) b_and!34543)))

(declare-fun b_lambda!16601 () Bool)

(assert (=> (not b_lambda!16601) (not b!1068834)))

(assert (=> b!1068834 t!32142))

(declare-fun b_and!34545 () Bool)

(assert (= b_and!34543 (and (=> t!32142 result!14735) b_and!34545)))

(declare-fun m!987837 () Bool)

(assert (=> d!129579 m!987837))

(assert (=> d!129579 m!987753))

(declare-fun m!987839 () Bool)

(assert (=> b!1068838 m!987839))

(declare-fun m!987841 () Bool)

(assert (=> b!1068840 m!987841))

(assert (=> b!1068830 m!987813))

(assert (=> b!1068830 m!987813))

(assert (=> b!1068830 m!987815))

(assert (=> b!1068833 m!987813))

(assert (=> b!1068833 m!987813))

(assert (=> b!1068833 m!987815))

(assert (=> bm!45156 m!987839))

(declare-fun m!987843 () Bool)

(assert (=> b!1068832 m!987843))

(declare-fun m!987845 () Bool)

(assert (=> b!1068832 m!987845))

(assert (=> b!1068832 m!987813))

(assert (=> b!1068832 m!987821))

(declare-fun m!987847 () Bool)

(assert (=> b!1068832 m!987847))

(assert (=> b!1068832 m!987825))

(assert (=> b!1068832 m!987825))

(assert (=> b!1068832 m!987821))

(assert (=> b!1068832 m!987827))

(assert (=> b!1068832 m!987843))

(declare-fun m!987849 () Bool)

(assert (=> b!1068832 m!987849))

(assert (=> b!1068836 m!987813))

(assert (=> b!1068836 m!987813))

(declare-fun m!987851 () Bool)

(assert (=> b!1068836 m!987851))

(declare-fun m!987853 () Bool)

(assert (=> b!1068831 m!987853))

(assert (=> b!1068834 m!987813))

(assert (=> b!1068834 m!987821))

(assert (=> b!1068834 m!987825))

(assert (=> b!1068834 m!987825))

(assert (=> b!1068834 m!987821))

(assert (=> b!1068834 m!987827))

(assert (=> b!1068834 m!987813))

(declare-fun m!987855 () Bool)

(assert (=> b!1068834 m!987855))

(assert (=> b!1068745 d!129579))

(declare-fun b!1068851 () Bool)

(declare-fun e!609736 () Bool)

(declare-fun e!609739 () Bool)

(assert (=> b!1068851 (= e!609736 e!609739)))

(declare-fun res!712898 () Bool)

(assert (=> b!1068851 (=> (not res!712898) (not e!609739))))

(declare-fun e!609738 () Bool)

(assert (=> b!1068851 (= res!712898 (not e!609738))))

(declare-fun res!712897 () Bool)

(assert (=> b!1068851 (=> (not res!712897) (not e!609738))))

(assert (=> b!1068851 (= res!712897 (validKeyInArray!0 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129581 () Bool)

(declare-fun res!712899 () Bool)

(assert (=> d!129581 (=> res!712899 e!609736)))

(assert (=> d!129581 (= res!712899 (bvsge #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(assert (=> d!129581 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22820) e!609736)))

(declare-fun b!1068852 () Bool)

(declare-fun e!609737 () Bool)

(declare-fun call!45162 () Bool)

(assert (=> b!1068852 (= e!609737 call!45162)))

(declare-fun b!1068853 () Bool)

(declare-fun contains!6295 (List!22823 (_ BitVec 64)) Bool)

(assert (=> b!1068853 (= e!609738 (contains!6295 Nil!22820 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1068854 () Bool)

(assert (=> b!1068854 (= e!609737 call!45162)))

(declare-fun b!1068855 () Bool)

(assert (=> b!1068855 (= e!609739 e!609737)))

(declare-fun c!107908 () Bool)

(assert (=> b!1068855 (= c!107908 (validKeyInArray!0 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45159 () Bool)

(assert (=> bm!45159 (= call!45162 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107908 (Cons!22819 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000) Nil!22820) Nil!22820)))))

(assert (= (and d!129581 (not res!712899)) b!1068851))

(assert (= (and b!1068851 res!712897) b!1068853))

(assert (= (and b!1068851 res!712898) b!1068855))

(assert (= (and b!1068855 c!107908) b!1068852))

(assert (= (and b!1068855 (not c!107908)) b!1068854))

(assert (= (or b!1068852 b!1068854) bm!45159))

(assert (=> b!1068851 m!987813))

(assert (=> b!1068851 m!987813))

(assert (=> b!1068851 m!987815))

(assert (=> b!1068853 m!987813))

(assert (=> b!1068853 m!987813))

(declare-fun m!987857 () Bool)

(assert (=> b!1068853 m!987857))

(assert (=> b!1068855 m!987813))

(assert (=> b!1068855 m!987813))

(assert (=> b!1068855 m!987815))

(assert (=> bm!45159 m!987813))

(declare-fun m!987859 () Bool)

(assert (=> bm!45159 m!987859))

(assert (=> b!1068746 d!129581))

(declare-fun d!129583 () Bool)

(assert (=> d!129583 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94634 d!129583))

(declare-fun d!129585 () Bool)

(assert (=> d!129585 (= (array_inv!25380 _values!955) (bvsge (size!33294 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94634 d!129585))

(declare-fun d!129587 () Bool)

(assert (=> d!129587 (= (array_inv!25381 _keys!1163) (bvsge (size!33293 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94634 d!129587))

(declare-fun d!129589 () Bool)

(declare-fun res!712905 () Bool)

(declare-fun e!609747 () Bool)

(assert (=> d!129589 (=> res!712905 e!609747)))

(assert (=> d!129589 (= res!712905 (bvsge #b00000000000000000000000000000000 (size!33293 _keys!1163)))))

(assert (=> d!129589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!609747)))

(declare-fun b!1068864 () Bool)

(declare-fun e!609746 () Bool)

(declare-fun call!45165 () Bool)

(assert (=> b!1068864 (= e!609746 call!45165)))

(declare-fun b!1068865 () Bool)

(assert (=> b!1068865 (= e!609747 e!609746)))

(declare-fun c!107911 () Bool)

(assert (=> b!1068865 (= c!107911 (validKeyInArray!0 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45162 () Bool)

(assert (=> bm!45162 (= call!45165 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1068866 () Bool)

(declare-fun e!609748 () Bool)

(assert (=> b!1068866 (= e!609748 call!45165)))

(declare-fun b!1068867 () Bool)

(assert (=> b!1068867 (= e!609746 e!609748)))

(declare-fun lt!472009 () (_ BitVec 64))

(assert (=> b!1068867 (= lt!472009 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472011 () Unit!35056)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68123 (_ BitVec 64) (_ BitVec 32)) Unit!35056)

(assert (=> b!1068867 (= lt!472011 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!472009 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1068867 (arrayContainsKey!0 _keys!1163 lt!472009 #b00000000000000000000000000000000)))

(declare-fun lt!472010 () Unit!35056)

(assert (=> b!1068867 (= lt!472010 lt!472011)))

(declare-fun res!712904 () Bool)

(declare-datatypes ((SeekEntryResult!9834 0))(
  ( (MissingZero!9834 (index!41707 (_ BitVec 32))) (Found!9834 (index!41708 (_ BitVec 32))) (Intermediate!9834 (undefined!10646 Bool) (index!41709 (_ BitVec 32)) (x!95568 (_ BitVec 32))) (Undefined!9834) (MissingVacant!9834 (index!41710 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68123 (_ BitVec 32)) SeekEntryResult!9834)

(assert (=> b!1068867 (= res!712904 (= (seekEntryOrOpen!0 (select (arr!32756 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9834 #b00000000000000000000000000000000)))))

(assert (=> b!1068867 (=> (not res!712904) (not e!609748))))

(assert (= (and d!129589 (not res!712905)) b!1068865))

(assert (= (and b!1068865 c!107911) b!1068867))

(assert (= (and b!1068865 (not c!107911)) b!1068864))

(assert (= (and b!1068867 res!712904) b!1068866))

(assert (= (or b!1068866 b!1068864) bm!45162))

(assert (=> b!1068865 m!987813))

(assert (=> b!1068865 m!987813))

(assert (=> b!1068865 m!987815))

(declare-fun m!987861 () Bool)

(assert (=> bm!45162 m!987861))

(assert (=> b!1068867 m!987813))

(declare-fun m!987863 () Bool)

(assert (=> b!1068867 m!987863))

(declare-fun m!987865 () Bool)

(assert (=> b!1068867 m!987865))

(assert (=> b!1068867 m!987813))

(declare-fun m!987867 () Bool)

(assert (=> b!1068867 m!987867))

(assert (=> b!1068742 d!129589))

(declare-fun mapNonEmpty!40024 () Bool)

(declare-fun mapRes!40024 () Bool)

(declare-fun tp!76676 () Bool)

(declare-fun e!609753 () Bool)

(assert (=> mapNonEmpty!40024 (= mapRes!40024 (and tp!76676 e!609753))))

(declare-fun mapValue!40024 () ValueCell!12071)

(declare-fun mapRest!40024 () (Array (_ BitVec 32) ValueCell!12071))

(declare-fun mapKey!40024 () (_ BitVec 32))

(assert (=> mapNonEmpty!40024 (= mapRest!40015 (store mapRest!40024 mapKey!40024 mapValue!40024))))

(declare-fun b!1068875 () Bool)

(declare-fun e!609754 () Bool)

(assert (=> b!1068875 (= e!609754 tp_is_empty!25549)))

(declare-fun mapIsEmpty!40024 () Bool)

(assert (=> mapIsEmpty!40024 mapRes!40024))

(declare-fun condMapEmpty!40024 () Bool)

(declare-fun mapDefault!40024 () ValueCell!12071)

(assert (=> mapNonEmpty!40015 (= condMapEmpty!40024 (= mapRest!40015 ((as const (Array (_ BitVec 32) ValueCell!12071)) mapDefault!40024)))))

(assert (=> mapNonEmpty!40015 (= tp!76661 (and e!609754 mapRes!40024))))

(declare-fun b!1068874 () Bool)

(assert (=> b!1068874 (= e!609753 tp_is_empty!25549)))

(assert (= (and mapNonEmpty!40015 condMapEmpty!40024) mapIsEmpty!40024))

(assert (= (and mapNonEmpty!40015 (not condMapEmpty!40024)) mapNonEmpty!40024))

(assert (= (and mapNonEmpty!40024 ((_ is ValueCellFull!12071) mapValue!40024)) b!1068874))

(assert (= (and mapNonEmpty!40015 ((_ is ValueCellFull!12071) mapDefault!40024)) b!1068875))

(declare-fun m!987869 () Bool)

(assert (=> mapNonEmpty!40024 m!987869))

(declare-fun b_lambda!16603 () Bool)

(assert (= b_lambda!16597 (or (and start!94634 b_free!21739) b_lambda!16603)))

(declare-fun b_lambda!16605 () Bool)

(assert (= b_lambda!16599 (or (and start!94634 b_free!21739) b_lambda!16605)))

(declare-fun b_lambda!16607 () Bool)

(assert (= b_lambda!16595 (or (and start!94634 b_free!21739) b_lambda!16607)))

(declare-fun b_lambda!16609 () Bool)

(assert (= b_lambda!16601 (or (and start!94634 b_free!21739) b_lambda!16609)))

(check-sat (not b!1068836) (not b!1068831) (not d!129575) (not b!1068834) (not mapNonEmpty!40024) (not b!1068851) (not b!1068822) (not b!1068833) (not bm!45156) (not b!1068830) (not b_next!21739) (not b!1068824) (not b!1068855) (not b_lambda!16607) (not b!1068865) (not d!129577) (not b!1068826) tp_is_empty!25549 (not b!1068840) (not b_lambda!16603) (not b!1068832) (not b!1068817) b_and!34545 (not b!1068819) (not bm!45159) (not b_lambda!16605) (not b!1068838) (not bm!45155) (not bm!45162) (not b!1068820) (not b!1068816) (not d!129579) (not b_lambda!16609) (not b!1068853) (not b!1068867) (not b!1068818))
(check-sat b_and!34545 (not b_next!21739))
