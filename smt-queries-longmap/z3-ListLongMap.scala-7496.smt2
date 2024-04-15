; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94942 () Bool)

(assert start!94942)

(declare-fun b_free!22153 () Bool)

(declare-fun b_next!22153 () Bool)

(assert (=> start!94942 (= b_free!22153 (not b_next!22153))))

(declare-fun tp!77923 () Bool)

(declare-fun b_and!34981 () Bool)

(assert (=> start!94942 (= tp!77923 b_and!34981)))

(declare-fun b!1073399 () Bool)

(declare-fun e!613249 () Bool)

(declare-fun tp_is_empty!25963 () Bool)

(assert (=> b!1073399 (= e!613249 tp_is_empty!25963)))

(declare-fun res!715939 () Bool)

(declare-fun e!613246 () Bool)

(assert (=> start!94942 (=> (not res!715939) (not e!613246))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94942 (= res!715939 (validMask!0 mask!1515))))

(assert (=> start!94942 e!613246))

(assert (=> start!94942 true))

(assert (=> start!94942 tp_is_empty!25963))

(declare-datatypes ((V!39753 0))(
  ( (V!39754 (val!13032 Int)) )
))
(declare-datatypes ((ValueCell!12278 0))(
  ( (ValueCellFull!12278 (v!15649 V!39753)) (EmptyCell!12278) )
))
(declare-datatypes ((array!68818 0))(
  ( (array!68819 (arr!33103 (Array (_ BitVec 32) ValueCell!12278)) (size!33641 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68818)

(declare-fun e!613247 () Bool)

(declare-fun array_inv!25610 (array!68818) Bool)

(assert (=> start!94942 (and (array_inv!25610 _values!955) e!613247)))

(assert (=> start!94942 tp!77923))

(declare-datatypes ((array!68820 0))(
  ( (array!68821 (arr!33104 (Array (_ BitVec 32) (_ BitVec 64))) (size!33642 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68820)

(declare-fun array_inv!25611 (array!68820) Bool)

(assert (=> start!94942 (array_inv!25611 _keys!1163)))

(declare-fun b!1073400 () Bool)

(declare-fun res!715936 () Bool)

(assert (=> b!1073400 (=> (not res!715936) (not e!613246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68820 (_ BitVec 32)) Bool)

(assert (=> b!1073400 (= res!715936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073401 () Bool)

(declare-fun res!715937 () Bool)

(assert (=> b!1073401 (=> (not res!715937) (not e!613246))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073401 (= res!715937 (and (= (size!33641 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33642 _keys!1163) (size!33641 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40657 () Bool)

(declare-fun mapRes!40657 () Bool)

(declare-fun tp!77924 () Bool)

(declare-fun e!613250 () Bool)

(assert (=> mapNonEmpty!40657 (= mapRes!40657 (and tp!77924 e!613250))))

(declare-fun mapValue!40657 () ValueCell!12278)

(declare-fun mapKey!40657 () (_ BitVec 32))

(declare-fun mapRest!40657 () (Array (_ BitVec 32) ValueCell!12278))

(assert (=> mapNonEmpty!40657 (= (arr!33103 _values!955) (store mapRest!40657 mapKey!40657 mapValue!40657))))

(declare-fun b!1073402 () Bool)

(assert (=> b!1073402 (= e!613250 tp_is_empty!25963)))

(declare-fun b!1073403 () Bool)

(assert (=> b!1073403 (= e!613246 (bvsgt #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(declare-datatypes ((tuple2!16658 0))(
  ( (tuple2!16659 (_1!8340 (_ BitVec 64)) (_2!8340 V!39753)) )
))
(declare-datatypes ((List!23182 0))(
  ( (Nil!23179) (Cons!23178 (h!24387 tuple2!16658) (t!32510 List!23182)) )
))
(declare-datatypes ((ListLongMap!14627 0))(
  ( (ListLongMap!14628 (toList!7329 List!23182)) )
))
(declare-fun lt!475880 () ListLongMap!14627)

(declare-fun minValue!907 () V!39753)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39753)

(declare-fun getCurrentListMapNoExtraKeys!3909 (array!68820 array!68818 (_ BitVec 32) (_ BitVec 32) V!39753 V!39753 (_ BitVec 32) Int) ListLongMap!14627)

(assert (=> b!1073403 (= lt!475880 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39753)

(declare-fun lt!475879 () ListLongMap!14627)

(assert (=> b!1073403 (= lt!475879 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40657 () Bool)

(assert (=> mapIsEmpty!40657 mapRes!40657))

(declare-fun b!1073404 () Bool)

(declare-fun res!715938 () Bool)

(assert (=> b!1073404 (=> (not res!715938) (not e!613246))))

(declare-datatypes ((List!23183 0))(
  ( (Nil!23180) (Cons!23179 (h!24388 (_ BitVec 64)) (t!32511 List!23183)) )
))
(declare-fun arrayNoDuplicates!0 (array!68820 (_ BitVec 32) List!23183) Bool)

(assert (=> b!1073404 (= res!715938 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23180))))

(declare-fun b!1073405 () Bool)

(assert (=> b!1073405 (= e!613247 (and e!613249 mapRes!40657))))

(declare-fun condMapEmpty!40657 () Bool)

(declare-fun mapDefault!40657 () ValueCell!12278)

(assert (=> b!1073405 (= condMapEmpty!40657 (= (arr!33103 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12278)) mapDefault!40657)))))

(assert (= (and start!94942 res!715939) b!1073401))

(assert (= (and b!1073401 res!715937) b!1073400))

(assert (= (and b!1073400 res!715936) b!1073404))

(assert (= (and b!1073404 res!715938) b!1073403))

(assert (= (and b!1073405 condMapEmpty!40657) mapIsEmpty!40657))

(assert (= (and b!1073405 (not condMapEmpty!40657)) mapNonEmpty!40657))

(get-info :version)

(assert (= (and mapNonEmpty!40657 ((_ is ValueCellFull!12278) mapValue!40657)) b!1073402))

(assert (= (and b!1073405 ((_ is ValueCellFull!12278) mapDefault!40657)) b!1073399))

(assert (= start!94942 b!1073405))

(declare-fun m!991885 () Bool)

(assert (=> b!1073404 m!991885))

(declare-fun m!991887 () Bool)

(assert (=> mapNonEmpty!40657 m!991887))

(declare-fun m!991889 () Bool)

(assert (=> b!1073403 m!991889))

(declare-fun m!991891 () Bool)

(assert (=> b!1073403 m!991891))

(declare-fun m!991893 () Bool)

(assert (=> b!1073400 m!991893))

(declare-fun m!991895 () Bool)

(assert (=> start!94942 m!991895))

(declare-fun m!991897 () Bool)

(assert (=> start!94942 m!991897))

(declare-fun m!991899 () Bool)

(assert (=> start!94942 m!991899))

(check-sat (not b!1073403) tp_is_empty!25963 (not mapNonEmpty!40657) (not b_next!22153) (not b!1073404) b_and!34981 (not start!94942) (not b!1073400))
(check-sat b_and!34981 (not b_next!22153))
(get-model)

(declare-fun b!1073473 () Bool)

(assert (=> b!1073473 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(assert (=> b!1073473 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33641 _values!955)))))

(declare-fun lt!475910 () ListLongMap!14627)

(declare-fun e!613297 () Bool)

(declare-fun apply!925 (ListLongMap!14627 (_ BitVec 64)) V!39753)

(declare-fun get!17207 (ValueCell!12278 V!39753) V!39753)

(declare-fun dynLambda!2024 (Int (_ BitVec 64)) V!39753)

(assert (=> b!1073473 (= e!613297 (= (apply!925 lt!475910 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)) (get!17207 (select (arr!33103 _values!955) #b00000000000000000000000000000000) (dynLambda!2024 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073474 () Bool)

(declare-datatypes ((Unit!35193 0))(
  ( (Unit!35194) )
))
(declare-fun lt!475912 () Unit!35193)

(declare-fun lt!475908 () Unit!35193)

(assert (=> b!1073474 (= lt!475912 lt!475908)))

(declare-fun lt!475909 () (_ BitVec 64))

(declare-fun lt!475907 () ListLongMap!14627)

(declare-fun lt!475911 () V!39753)

(declare-fun lt!475913 () (_ BitVec 64))

(declare-fun contains!6296 (ListLongMap!14627 (_ BitVec 64)) Bool)

(declare-fun +!3237 (ListLongMap!14627 tuple2!16658) ListLongMap!14627)

(assert (=> b!1073474 (not (contains!6296 (+!3237 lt!475907 (tuple2!16659 lt!475913 lt!475911)) lt!475909))))

(declare-fun addStillNotContains!261 (ListLongMap!14627 (_ BitVec 64) V!39753 (_ BitVec 64)) Unit!35193)

(assert (=> b!1073474 (= lt!475908 (addStillNotContains!261 lt!475907 lt!475913 lt!475911 lt!475909))))

(assert (=> b!1073474 (= lt!475909 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1073474 (= lt!475911 (get!17207 (select (arr!33103 _values!955) #b00000000000000000000000000000000) (dynLambda!2024 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073474 (= lt!475913 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45257 () ListLongMap!14627)

(assert (=> b!1073474 (= lt!475907 call!45257)))

(declare-fun e!613300 () ListLongMap!14627)

(assert (=> b!1073474 (= e!613300 (+!3237 call!45257 (tuple2!16659 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000) (get!17207 (select (arr!33103 _values!955) #b00000000000000000000000000000000) (dynLambda!2024 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073475 () Bool)

(declare-fun e!613298 () Bool)

(declare-fun isEmpty!955 (ListLongMap!14627) Bool)

(assert (=> b!1073475 (= e!613298 (isEmpty!955 lt!475910))))

(declare-fun b!1073476 () Bool)

(declare-fun e!613301 () ListLongMap!14627)

(assert (=> b!1073476 (= e!613301 e!613300)))

(declare-fun c!107712 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1073476 (= c!107712 (validKeyInArray!0 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073477 () Bool)

(declare-fun e!613296 () Bool)

(declare-fun e!613295 () Bool)

(assert (=> b!1073477 (= e!613296 e!613295)))

(declare-fun c!107711 () Bool)

(declare-fun e!613299 () Bool)

(assert (=> b!1073477 (= c!107711 e!613299)))

(declare-fun res!715975 () Bool)

(assert (=> b!1073477 (=> (not res!715975) (not e!613299))))

(assert (=> b!1073477 (= res!715975 (bvslt #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(declare-fun d!129267 () Bool)

(assert (=> d!129267 e!613296))

(declare-fun res!715973 () Bool)

(assert (=> d!129267 (=> (not res!715973) (not e!613296))))

(assert (=> d!129267 (= res!715973 (not (contains!6296 lt!475910 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129267 (= lt!475910 e!613301)))

(declare-fun c!107714 () Bool)

(assert (=> d!129267 (= c!107714 (bvsge #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(assert (=> d!129267 (validMask!0 mask!1515)))

(assert (=> d!129267 (= (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475910)))

(declare-fun b!1073472 () Bool)

(assert (=> b!1073472 (= e!613300 call!45257)))

(declare-fun bm!45254 () Bool)

(assert (=> bm!45254 (= call!45257 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1073478 () Bool)

(declare-fun res!715974 () Bool)

(assert (=> b!1073478 (=> (not res!715974) (not e!613296))))

(assert (=> b!1073478 (= res!715974 (not (contains!6296 lt!475910 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1073479 () Bool)

(assert (=> b!1073479 (= e!613295 e!613297)))

(assert (=> b!1073479 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(declare-fun res!715972 () Bool)

(assert (=> b!1073479 (= res!715972 (contains!6296 lt!475910 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073479 (=> (not res!715972) (not e!613297))))

(declare-fun b!1073480 () Bool)

(assert (=> b!1073480 (= e!613298 (= lt!475910 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1073481 () Bool)

(assert (=> b!1073481 (= e!613301 (ListLongMap!14628 Nil!23179))))

(declare-fun b!1073482 () Bool)

(assert (=> b!1073482 (= e!613299 (validKeyInArray!0 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073482 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073483 () Bool)

(assert (=> b!1073483 (= e!613295 e!613298)))

(declare-fun c!107713 () Bool)

(assert (=> b!1073483 (= c!107713 (bvslt #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(assert (= (and d!129267 c!107714) b!1073481))

(assert (= (and d!129267 (not c!107714)) b!1073476))

(assert (= (and b!1073476 c!107712) b!1073474))

(assert (= (and b!1073476 (not c!107712)) b!1073472))

(assert (= (or b!1073474 b!1073472) bm!45254))

(assert (= (and d!129267 res!715973) b!1073478))

(assert (= (and b!1073478 res!715974) b!1073477))

(assert (= (and b!1073477 res!715975) b!1073482))

(assert (= (and b!1073477 c!107711) b!1073479))

(assert (= (and b!1073477 (not c!107711)) b!1073483))

(assert (= (and b!1073479 res!715972) b!1073473))

(assert (= (and b!1073483 c!107713) b!1073480))

(assert (= (and b!1073483 (not c!107713)) b!1073475))

(declare-fun b_lambda!16703 () Bool)

(assert (=> (not b_lambda!16703) (not b!1073473)))

(declare-fun t!32514 () Bool)

(declare-fun tb!7151 () Bool)

(assert (=> (and start!94942 (= defaultEntry!963 defaultEntry!963) t!32514) tb!7151))

(declare-fun result!14777 () Bool)

(assert (=> tb!7151 (= result!14777 tp_is_empty!25963)))

(assert (=> b!1073473 t!32514))

(declare-fun b_and!34987 () Bool)

(assert (= b_and!34981 (and (=> t!32514 result!14777) b_and!34987)))

(declare-fun b_lambda!16705 () Bool)

(assert (=> (not b_lambda!16705) (not b!1073474)))

(assert (=> b!1073474 t!32514))

(declare-fun b_and!34989 () Bool)

(assert (= b_and!34987 (and (=> t!32514 result!14777) b_and!34989)))

(declare-fun m!991933 () Bool)

(assert (=> b!1073473 m!991933))

(declare-fun m!991935 () Bool)

(assert (=> b!1073473 m!991935))

(declare-fun m!991937 () Bool)

(assert (=> b!1073473 m!991937))

(declare-fun m!991939 () Bool)

(assert (=> b!1073473 m!991939))

(assert (=> b!1073473 m!991937))

(assert (=> b!1073473 m!991935))

(assert (=> b!1073473 m!991933))

(declare-fun m!991941 () Bool)

(assert (=> b!1073473 m!991941))

(declare-fun m!991943 () Bool)

(assert (=> bm!45254 m!991943))

(declare-fun m!991945 () Bool)

(assert (=> b!1073478 m!991945))

(assert (=> b!1073480 m!991943))

(declare-fun m!991947 () Bool)

(assert (=> b!1073475 m!991947))

(assert (=> b!1073479 m!991933))

(assert (=> b!1073479 m!991933))

(declare-fun m!991949 () Bool)

(assert (=> b!1073479 m!991949))

(declare-fun m!991951 () Bool)

(assert (=> b!1073474 m!991951))

(declare-fun m!991953 () Bool)

(assert (=> b!1073474 m!991953))

(declare-fun m!991955 () Bool)

(assert (=> b!1073474 m!991955))

(declare-fun m!991957 () Bool)

(assert (=> b!1073474 m!991957))

(assert (=> b!1073474 m!991935))

(assert (=> b!1073474 m!991937))

(assert (=> b!1073474 m!991939))

(assert (=> b!1073474 m!991937))

(assert (=> b!1073474 m!991935))

(assert (=> b!1073474 m!991933))

(assert (=> b!1073474 m!991955))

(declare-fun m!991959 () Bool)

(assert (=> d!129267 m!991959))

(assert (=> d!129267 m!991895))

(assert (=> b!1073476 m!991933))

(assert (=> b!1073476 m!991933))

(declare-fun m!991961 () Bool)

(assert (=> b!1073476 m!991961))

(assert (=> b!1073482 m!991933))

(assert (=> b!1073482 m!991933))

(assert (=> b!1073482 m!991961))

(assert (=> b!1073403 d!129267))

(declare-fun b!1073487 () Bool)

(assert (=> b!1073487 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(assert (=> b!1073487 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33641 _values!955)))))

(declare-fun lt!475917 () ListLongMap!14627)

(declare-fun e!613304 () Bool)

(assert (=> b!1073487 (= e!613304 (= (apply!925 lt!475917 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)) (get!17207 (select (arr!33103 _values!955) #b00000000000000000000000000000000) (dynLambda!2024 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073488 () Bool)

(declare-fun lt!475919 () Unit!35193)

(declare-fun lt!475915 () Unit!35193)

(assert (=> b!1073488 (= lt!475919 lt!475915)))

(declare-fun lt!475920 () (_ BitVec 64))

(declare-fun lt!475916 () (_ BitVec 64))

(declare-fun lt!475914 () ListLongMap!14627)

(declare-fun lt!475918 () V!39753)

(assert (=> b!1073488 (not (contains!6296 (+!3237 lt!475914 (tuple2!16659 lt!475920 lt!475918)) lt!475916))))

(assert (=> b!1073488 (= lt!475915 (addStillNotContains!261 lt!475914 lt!475920 lt!475918 lt!475916))))

(assert (=> b!1073488 (= lt!475916 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1073488 (= lt!475918 (get!17207 (select (arr!33103 _values!955) #b00000000000000000000000000000000) (dynLambda!2024 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073488 (= lt!475920 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45258 () ListLongMap!14627)

(assert (=> b!1073488 (= lt!475914 call!45258)))

(declare-fun e!613307 () ListLongMap!14627)

(assert (=> b!1073488 (= e!613307 (+!3237 call!45258 (tuple2!16659 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000) (get!17207 (select (arr!33103 _values!955) #b00000000000000000000000000000000) (dynLambda!2024 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073489 () Bool)

(declare-fun e!613305 () Bool)

(assert (=> b!1073489 (= e!613305 (isEmpty!955 lt!475917))))

(declare-fun b!1073490 () Bool)

(declare-fun e!613308 () ListLongMap!14627)

(assert (=> b!1073490 (= e!613308 e!613307)))

(declare-fun c!107716 () Bool)

(assert (=> b!1073490 (= c!107716 (validKeyInArray!0 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073491 () Bool)

(declare-fun e!613303 () Bool)

(declare-fun e!613302 () Bool)

(assert (=> b!1073491 (= e!613303 e!613302)))

(declare-fun c!107715 () Bool)

(declare-fun e!613306 () Bool)

(assert (=> b!1073491 (= c!107715 e!613306)))

(declare-fun res!715979 () Bool)

(assert (=> b!1073491 (=> (not res!715979) (not e!613306))))

(assert (=> b!1073491 (= res!715979 (bvslt #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(declare-fun d!129269 () Bool)

(assert (=> d!129269 e!613303))

(declare-fun res!715977 () Bool)

(assert (=> d!129269 (=> (not res!715977) (not e!613303))))

(assert (=> d!129269 (= res!715977 (not (contains!6296 lt!475917 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129269 (= lt!475917 e!613308)))

(declare-fun c!107718 () Bool)

(assert (=> d!129269 (= c!107718 (bvsge #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(assert (=> d!129269 (validMask!0 mask!1515)))

(assert (=> d!129269 (= (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!475917)))

(declare-fun b!1073486 () Bool)

(assert (=> b!1073486 (= e!613307 call!45258)))

(declare-fun bm!45255 () Bool)

(assert (=> bm!45255 (= call!45258 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1073492 () Bool)

(declare-fun res!715978 () Bool)

(assert (=> b!1073492 (=> (not res!715978) (not e!613303))))

(assert (=> b!1073492 (= res!715978 (not (contains!6296 lt!475917 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1073493 () Bool)

(assert (=> b!1073493 (= e!613302 e!613304)))

(assert (=> b!1073493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(declare-fun res!715976 () Bool)

(assert (=> b!1073493 (= res!715976 (contains!6296 lt!475917 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073493 (=> (not res!715976) (not e!613304))))

(declare-fun b!1073494 () Bool)

(assert (=> b!1073494 (= e!613305 (= lt!475917 (getCurrentListMapNoExtraKeys!3909 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1073495 () Bool)

(assert (=> b!1073495 (= e!613308 (ListLongMap!14628 Nil!23179))))

(declare-fun b!1073496 () Bool)

(assert (=> b!1073496 (= e!613306 (validKeyInArray!0 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073496 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073497 () Bool)

(assert (=> b!1073497 (= e!613302 e!613305)))

(declare-fun c!107717 () Bool)

(assert (=> b!1073497 (= c!107717 (bvslt #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(assert (= (and d!129269 c!107718) b!1073495))

(assert (= (and d!129269 (not c!107718)) b!1073490))

(assert (= (and b!1073490 c!107716) b!1073488))

(assert (= (and b!1073490 (not c!107716)) b!1073486))

(assert (= (or b!1073488 b!1073486) bm!45255))

(assert (= (and d!129269 res!715977) b!1073492))

(assert (= (and b!1073492 res!715978) b!1073491))

(assert (= (and b!1073491 res!715979) b!1073496))

(assert (= (and b!1073491 c!107715) b!1073493))

(assert (= (and b!1073491 (not c!107715)) b!1073497))

(assert (= (and b!1073493 res!715976) b!1073487))

(assert (= (and b!1073497 c!107717) b!1073494))

(assert (= (and b!1073497 (not c!107717)) b!1073489))

(declare-fun b_lambda!16707 () Bool)

(assert (=> (not b_lambda!16707) (not b!1073487)))

(assert (=> b!1073487 t!32514))

(declare-fun b_and!34991 () Bool)

(assert (= b_and!34989 (and (=> t!32514 result!14777) b_and!34991)))

(declare-fun b_lambda!16709 () Bool)

(assert (=> (not b_lambda!16709) (not b!1073488)))

(assert (=> b!1073488 t!32514))

(declare-fun b_and!34993 () Bool)

(assert (= b_and!34991 (and (=> t!32514 result!14777) b_and!34993)))

(assert (=> b!1073487 m!991933))

(assert (=> b!1073487 m!991935))

(assert (=> b!1073487 m!991937))

(assert (=> b!1073487 m!991939))

(assert (=> b!1073487 m!991937))

(assert (=> b!1073487 m!991935))

(assert (=> b!1073487 m!991933))

(declare-fun m!991963 () Bool)

(assert (=> b!1073487 m!991963))

(declare-fun m!991965 () Bool)

(assert (=> bm!45255 m!991965))

(declare-fun m!991967 () Bool)

(assert (=> b!1073492 m!991967))

(assert (=> b!1073494 m!991965))

(declare-fun m!991969 () Bool)

(assert (=> b!1073489 m!991969))

(assert (=> b!1073493 m!991933))

(assert (=> b!1073493 m!991933))

(declare-fun m!991971 () Bool)

(assert (=> b!1073493 m!991971))

(declare-fun m!991973 () Bool)

(assert (=> b!1073488 m!991973))

(declare-fun m!991975 () Bool)

(assert (=> b!1073488 m!991975))

(declare-fun m!991977 () Bool)

(assert (=> b!1073488 m!991977))

(declare-fun m!991979 () Bool)

(assert (=> b!1073488 m!991979))

(assert (=> b!1073488 m!991935))

(assert (=> b!1073488 m!991937))

(assert (=> b!1073488 m!991939))

(assert (=> b!1073488 m!991937))

(assert (=> b!1073488 m!991935))

(assert (=> b!1073488 m!991933))

(assert (=> b!1073488 m!991977))

(declare-fun m!991981 () Bool)

(assert (=> d!129269 m!991981))

(assert (=> d!129269 m!991895))

(assert (=> b!1073490 m!991933))

(assert (=> b!1073490 m!991933))

(assert (=> b!1073490 m!991961))

(assert (=> b!1073496 m!991933))

(assert (=> b!1073496 m!991933))

(assert (=> b!1073496 m!991961))

(assert (=> b!1073403 d!129269))

(declare-fun b!1073506 () Bool)

(declare-fun e!613315 () Bool)

(declare-fun call!45261 () Bool)

(assert (=> b!1073506 (= e!613315 call!45261)))

(declare-fun d!129271 () Bool)

(declare-fun res!715985 () Bool)

(declare-fun e!613316 () Bool)

(assert (=> d!129271 (=> res!715985 e!613316)))

(assert (=> d!129271 (= res!715985 (bvsge #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(assert (=> d!129271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!613316)))

(declare-fun b!1073507 () Bool)

(declare-fun e!613317 () Bool)

(assert (=> b!1073507 (= e!613317 call!45261)))

(declare-fun b!1073508 () Bool)

(assert (=> b!1073508 (= e!613315 e!613317)))

(declare-fun lt!475929 () (_ BitVec 64))

(assert (=> b!1073508 (= lt!475929 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!475927 () Unit!35193)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68820 (_ BitVec 64) (_ BitVec 32)) Unit!35193)

(assert (=> b!1073508 (= lt!475927 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!475929 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1073508 (arrayContainsKey!0 _keys!1163 lt!475929 #b00000000000000000000000000000000)))

(declare-fun lt!475928 () Unit!35193)

(assert (=> b!1073508 (= lt!475928 lt!475927)))

(declare-fun res!715984 () Bool)

(declare-datatypes ((SeekEntryResult!9884 0))(
  ( (MissingZero!9884 (index!41907 (_ BitVec 32))) (Found!9884 (index!41908 (_ BitVec 32))) (Intermediate!9884 (undefined!10696 Bool) (index!41909 (_ BitVec 32)) (x!96222 (_ BitVec 32))) (Undefined!9884) (MissingVacant!9884 (index!41910 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68820 (_ BitVec 32)) SeekEntryResult!9884)

(assert (=> b!1073508 (= res!715984 (= (seekEntryOrOpen!0 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9884 #b00000000000000000000000000000000)))))

(assert (=> b!1073508 (=> (not res!715984) (not e!613317))))

(declare-fun bm!45258 () Bool)

(assert (=> bm!45258 (= call!45261 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1073509 () Bool)

(assert (=> b!1073509 (= e!613316 e!613315)))

(declare-fun c!107721 () Bool)

(assert (=> b!1073509 (= c!107721 (validKeyInArray!0 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129271 (not res!715985)) b!1073509))

(assert (= (and b!1073509 c!107721) b!1073508))

(assert (= (and b!1073509 (not c!107721)) b!1073506))

(assert (= (and b!1073508 res!715984) b!1073507))

(assert (= (or b!1073507 b!1073506) bm!45258))

(assert (=> b!1073508 m!991933))

(declare-fun m!991983 () Bool)

(assert (=> b!1073508 m!991983))

(declare-fun m!991985 () Bool)

(assert (=> b!1073508 m!991985))

(assert (=> b!1073508 m!991933))

(declare-fun m!991987 () Bool)

(assert (=> b!1073508 m!991987))

(declare-fun m!991989 () Bool)

(assert (=> bm!45258 m!991989))

(assert (=> b!1073509 m!991933))

(assert (=> b!1073509 m!991933))

(assert (=> b!1073509 m!991961))

(assert (=> b!1073400 d!129271))

(declare-fun b!1073520 () Bool)

(declare-fun e!613326 () Bool)

(declare-fun e!613327 () Bool)

(assert (=> b!1073520 (= e!613326 e!613327)))

(declare-fun c!107724 () Bool)

(assert (=> b!1073520 (= c!107724 (validKeyInArray!0 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073521 () Bool)

(declare-fun e!613328 () Bool)

(assert (=> b!1073521 (= e!613328 e!613326)))

(declare-fun res!715992 () Bool)

(assert (=> b!1073521 (=> (not res!715992) (not e!613326))))

(declare-fun e!613329 () Bool)

(assert (=> b!1073521 (= res!715992 (not e!613329))))

(declare-fun res!715994 () Bool)

(assert (=> b!1073521 (=> (not res!715994) (not e!613329))))

(assert (=> b!1073521 (= res!715994 (validKeyInArray!0 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073522 () Bool)

(declare-fun call!45264 () Bool)

(assert (=> b!1073522 (= e!613327 call!45264)))

(declare-fun b!1073523 () Bool)

(declare-fun contains!6297 (List!23183 (_ BitVec 64)) Bool)

(assert (=> b!1073523 (= e!613329 (contains!6297 Nil!23180 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45261 () Bool)

(assert (=> bm!45261 (= call!45264 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107724 (Cons!23179 (select (arr!33104 _keys!1163) #b00000000000000000000000000000000) Nil!23180) Nil!23180)))))

(declare-fun d!129273 () Bool)

(declare-fun res!715993 () Bool)

(assert (=> d!129273 (=> res!715993 e!613328)))

(assert (=> d!129273 (= res!715993 (bvsge #b00000000000000000000000000000000 (size!33642 _keys!1163)))))

(assert (=> d!129273 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23180) e!613328)))

(declare-fun b!1073524 () Bool)

(assert (=> b!1073524 (= e!613327 call!45264)))

(assert (= (and d!129273 (not res!715993)) b!1073521))

(assert (= (and b!1073521 res!715994) b!1073523))

(assert (= (and b!1073521 res!715992) b!1073520))

(assert (= (and b!1073520 c!107724) b!1073522))

(assert (= (and b!1073520 (not c!107724)) b!1073524))

(assert (= (or b!1073522 b!1073524) bm!45261))

(assert (=> b!1073520 m!991933))

(assert (=> b!1073520 m!991933))

(assert (=> b!1073520 m!991961))

(assert (=> b!1073521 m!991933))

(assert (=> b!1073521 m!991933))

(assert (=> b!1073521 m!991961))

(assert (=> b!1073523 m!991933))

(assert (=> b!1073523 m!991933))

(declare-fun m!991991 () Bool)

(assert (=> b!1073523 m!991991))

(assert (=> bm!45261 m!991933))

(declare-fun m!991993 () Bool)

(assert (=> bm!45261 m!991993))

(assert (=> b!1073404 d!129273))

(declare-fun d!129275 () Bool)

(assert (=> d!129275 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94942 d!129275))

(declare-fun d!129277 () Bool)

(assert (=> d!129277 (= (array_inv!25610 _values!955) (bvsge (size!33641 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94942 d!129277))

(declare-fun d!129279 () Bool)

(assert (=> d!129279 (= (array_inv!25611 _keys!1163) (bvsge (size!33642 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94942 d!129279))

(declare-fun b!1073532 () Bool)

(declare-fun e!613334 () Bool)

(assert (=> b!1073532 (= e!613334 tp_is_empty!25963)))

(declare-fun mapNonEmpty!40666 () Bool)

(declare-fun mapRes!40666 () Bool)

(declare-fun tp!77939 () Bool)

(declare-fun e!613335 () Bool)

(assert (=> mapNonEmpty!40666 (= mapRes!40666 (and tp!77939 e!613335))))

(declare-fun mapKey!40666 () (_ BitVec 32))

(declare-fun mapValue!40666 () ValueCell!12278)

(declare-fun mapRest!40666 () (Array (_ BitVec 32) ValueCell!12278))

(assert (=> mapNonEmpty!40666 (= mapRest!40657 (store mapRest!40666 mapKey!40666 mapValue!40666))))

(declare-fun b!1073531 () Bool)

(assert (=> b!1073531 (= e!613335 tp_is_empty!25963)))

(declare-fun condMapEmpty!40666 () Bool)

(declare-fun mapDefault!40666 () ValueCell!12278)

(assert (=> mapNonEmpty!40657 (= condMapEmpty!40666 (= mapRest!40657 ((as const (Array (_ BitVec 32) ValueCell!12278)) mapDefault!40666)))))

(assert (=> mapNonEmpty!40657 (= tp!77924 (and e!613334 mapRes!40666))))

(declare-fun mapIsEmpty!40666 () Bool)

(assert (=> mapIsEmpty!40666 mapRes!40666))

(assert (= (and mapNonEmpty!40657 condMapEmpty!40666) mapIsEmpty!40666))

(assert (= (and mapNonEmpty!40657 (not condMapEmpty!40666)) mapNonEmpty!40666))

(assert (= (and mapNonEmpty!40666 ((_ is ValueCellFull!12278) mapValue!40666)) b!1073531))

(assert (= (and mapNonEmpty!40657 ((_ is ValueCellFull!12278) mapDefault!40666)) b!1073532))

(declare-fun m!991995 () Bool)

(assert (=> mapNonEmpty!40666 m!991995))

(declare-fun b_lambda!16711 () Bool)

(assert (= b_lambda!16703 (or (and start!94942 b_free!22153) b_lambda!16711)))

(declare-fun b_lambda!16713 () Bool)

(assert (= b_lambda!16705 (or (and start!94942 b_free!22153) b_lambda!16713)))

(declare-fun b_lambda!16715 () Bool)

(assert (= b_lambda!16707 (or (and start!94942 b_free!22153) b_lambda!16715)))

(declare-fun b_lambda!16717 () Bool)

(assert (= b_lambda!16709 (or (and start!94942 b_free!22153) b_lambda!16717)))

(check-sat (not b!1073492) (not b!1073488) (not b_next!22153) (not b!1073493) (not b!1073489) (not b!1073523) (not b_lambda!16717) (not d!129269) (not b!1073480) (not b!1073482) (not b!1073479) (not bm!45261) tp_is_empty!25963 (not b!1073496) (not b!1073473) (not mapNonEmpty!40666) (not b_lambda!16713) (not bm!45258) (not b_lambda!16711) (not b_lambda!16715) (not d!129267) b_and!34993 (not b!1073478) (not b!1073520) (not b!1073487) (not bm!45255) (not b!1073509) (not bm!45254) (not b!1073474) (not b!1073476) (not b!1073494) (not b!1073508) (not b!1073521) (not b!1073490) (not b!1073475))
(check-sat b_and!34993 (not b_next!22153))
