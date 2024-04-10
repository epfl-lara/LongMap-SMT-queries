; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42652 () Bool)

(assert start!42652)

(declare-fun b_free!12057 () Bool)

(declare-fun b_next!12057 () Bool)

(assert (=> start!42652 (= b_free!12057 (not b_next!12057))))

(declare-fun tp!42217 () Bool)

(declare-fun b_and!20557 () Bool)

(assert (=> start!42652 (= tp!42217 b_and!20557)))

(declare-fun b!475770 () Bool)

(declare-fun e!279397 () Bool)

(declare-fun e!279400 () Bool)

(assert (=> b!475770 (= e!279397 (not e!279400))))

(declare-fun res!284089 () Bool)

(assert (=> b!475770 (=> res!284089 e!279400)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!475770 (= res!284089 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!19085 0))(
  ( (V!19086 (val!6787 Int)) )
))
(declare-datatypes ((tuple2!8952 0))(
  ( (tuple2!8953 (_1!4487 (_ BitVec 64)) (_2!4487 V!19085)) )
))
(declare-datatypes ((List!9029 0))(
  ( (Nil!9026) (Cons!9025 (h!9881 tuple2!8952) (t!15007 List!9029)) )
))
(declare-datatypes ((ListLongMap!7865 0))(
  ( (ListLongMap!7866 (toList!3948 List!9029)) )
))
(declare-fun lt!216725 () ListLongMap!7865)

(declare-fun lt!216723 () ListLongMap!7865)

(assert (=> b!475770 (= lt!216725 lt!216723)))

(declare-fun minValueBefore!38 () V!19085)

(declare-fun zeroValue!794 () V!19085)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!14018 0))(
  ( (Unit!14019) )
))
(declare-fun lt!216726 () Unit!14018)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30709 0))(
  ( (array!30710 (arr!14770 (Array (_ BitVec 32) (_ BitVec 64))) (size!15122 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30709)

(declare-datatypes ((ValueCell!6399 0))(
  ( (ValueCellFull!6399 (v!9081 V!19085)) (EmptyCell!6399) )
))
(declare-datatypes ((array!30711 0))(
  ( (array!30712 (arr!14771 (Array (_ BitVec 32) ValueCell!6399)) (size!15123 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30711)

(declare-fun minValueAfter!38 () V!19085)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!264 (array!30709 array!30711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19085 V!19085 V!19085 V!19085 (_ BitVec 32) Int) Unit!14018)

(assert (=> b!475770 (= lt!216726 (lemmaNoChangeToArrayThenSameMapNoExtras!264 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2104 (array!30709 array!30711 (_ BitVec 32) (_ BitVec 32) V!19085 V!19085 (_ BitVec 32) Int) ListLongMap!7865)

(assert (=> b!475770 (= lt!216723 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!475770 (= lt!216725 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216728 () tuple2!8952)

(declare-fun lt!216727 () ListLongMap!7865)

(declare-fun b!475771 () Bool)

(declare-fun +!1761 (ListLongMap!7865 tuple2!8952) ListLongMap!7865)

(declare-fun getCurrentListMap!2289 (array!30709 array!30711 (_ BitVec 32) (_ BitVec 32) V!19085 V!19085 (_ BitVec 32) Int) ListLongMap!7865)

(assert (=> b!475771 (= e!279400 (= (+!1761 lt!216727 lt!216728) (getCurrentListMap!2289 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841)))))

(assert (=> b!475771 (= (+!1761 lt!216725 lt!216728) (+!1761 (+!1761 lt!216725 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216728))))

(assert (=> b!475771 (= lt!216728 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!216724 () Unit!14018)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!163 (ListLongMap!7865 (_ BitVec 64) V!19085 V!19085) Unit!14018)

(assert (=> b!475771 (= lt!216724 (addSameAsAddTwiceSameKeyDiffValues!163 lt!216725 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!475771 (= lt!216727 (getCurrentListMap!2289 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21952 () Bool)

(declare-fun mapRes!21952 () Bool)

(assert (=> mapIsEmpty!21952 mapRes!21952))

(declare-fun b!475772 () Bool)

(declare-fun res!284087 () Bool)

(assert (=> b!475772 (=> (not res!284087) (not e!279397))))

(declare-datatypes ((List!9030 0))(
  ( (Nil!9027) (Cons!9026 (h!9882 (_ BitVec 64)) (t!15008 List!9030)) )
))
(declare-fun arrayNoDuplicates!0 (array!30709 (_ BitVec 32) List!9030) Bool)

(assert (=> b!475772 (= res!284087 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9027))))

(declare-fun b!475773 () Bool)

(declare-fun e!279402 () Bool)

(declare-fun tp_is_empty!13485 () Bool)

(assert (=> b!475773 (= e!279402 tp_is_empty!13485)))

(declare-fun mapNonEmpty!21952 () Bool)

(declare-fun tp!42216 () Bool)

(assert (=> mapNonEmpty!21952 (= mapRes!21952 (and tp!42216 e!279402))))

(declare-fun mapKey!21952 () (_ BitVec 32))

(declare-fun mapValue!21952 () ValueCell!6399)

(declare-fun mapRest!21952 () (Array (_ BitVec 32) ValueCell!6399))

(assert (=> mapNonEmpty!21952 (= (arr!14771 _values!833) (store mapRest!21952 mapKey!21952 mapValue!21952))))

(declare-fun res!284086 () Bool)

(assert (=> start!42652 (=> (not res!284086) (not e!279397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42652 (= res!284086 (validMask!0 mask!1365))))

(assert (=> start!42652 e!279397))

(assert (=> start!42652 tp_is_empty!13485))

(assert (=> start!42652 tp!42217))

(assert (=> start!42652 true))

(declare-fun array_inv!10660 (array!30709) Bool)

(assert (=> start!42652 (array_inv!10660 _keys!1025)))

(declare-fun e!279401 () Bool)

(declare-fun array_inv!10661 (array!30711) Bool)

(assert (=> start!42652 (and (array_inv!10661 _values!833) e!279401)))

(declare-fun b!475774 () Bool)

(declare-fun e!279398 () Bool)

(assert (=> b!475774 (= e!279398 tp_is_empty!13485)))

(declare-fun b!475775 () Bool)

(declare-fun res!284090 () Bool)

(assert (=> b!475775 (=> (not res!284090) (not e!279397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30709 (_ BitVec 32)) Bool)

(assert (=> b!475775 (= res!284090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!475776 () Bool)

(assert (=> b!475776 (= e!279401 (and e!279398 mapRes!21952))))

(declare-fun condMapEmpty!21952 () Bool)

(declare-fun mapDefault!21952 () ValueCell!6399)

(assert (=> b!475776 (= condMapEmpty!21952 (= (arr!14771 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6399)) mapDefault!21952)))))

(declare-fun b!475777 () Bool)

(declare-fun res!284088 () Bool)

(assert (=> b!475777 (=> (not res!284088) (not e!279397))))

(assert (=> b!475777 (= res!284088 (and (= (size!15123 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15122 _keys!1025) (size!15123 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42652 res!284086) b!475777))

(assert (= (and b!475777 res!284088) b!475775))

(assert (= (and b!475775 res!284090) b!475772))

(assert (= (and b!475772 res!284087) b!475770))

(assert (= (and b!475770 (not res!284089)) b!475771))

(assert (= (and b!475776 condMapEmpty!21952) mapIsEmpty!21952))

(assert (= (and b!475776 (not condMapEmpty!21952)) mapNonEmpty!21952))

(get-info :version)

(assert (= (and mapNonEmpty!21952 ((_ is ValueCellFull!6399) mapValue!21952)) b!475773))

(assert (= (and b!475776 ((_ is ValueCellFull!6399) mapDefault!21952)) b!475774))

(assert (= start!42652 b!475776))

(declare-fun m!457953 () Bool)

(assert (=> b!475775 m!457953))

(declare-fun m!457955 () Bool)

(assert (=> b!475772 m!457955))

(declare-fun m!457957 () Bool)

(assert (=> mapNonEmpty!21952 m!457957))

(declare-fun m!457959 () Bool)

(assert (=> start!42652 m!457959))

(declare-fun m!457961 () Bool)

(assert (=> start!42652 m!457961))

(declare-fun m!457963 () Bool)

(assert (=> start!42652 m!457963))

(declare-fun m!457965 () Bool)

(assert (=> b!475770 m!457965))

(declare-fun m!457967 () Bool)

(assert (=> b!475770 m!457967))

(declare-fun m!457969 () Bool)

(assert (=> b!475770 m!457969))

(declare-fun m!457971 () Bool)

(assert (=> b!475771 m!457971))

(declare-fun m!457973 () Bool)

(assert (=> b!475771 m!457973))

(assert (=> b!475771 m!457971))

(declare-fun m!457975 () Bool)

(assert (=> b!475771 m!457975))

(declare-fun m!457977 () Bool)

(assert (=> b!475771 m!457977))

(declare-fun m!457979 () Bool)

(assert (=> b!475771 m!457979))

(declare-fun m!457981 () Bool)

(assert (=> b!475771 m!457981))

(declare-fun m!457983 () Bool)

(assert (=> b!475771 m!457983))

(check-sat (not b!475775) tp_is_empty!13485 (not b!475770) (not b!475772) b_and!20557 (not b!475771) (not start!42652) (not mapNonEmpty!21952) (not b_next!12057))
(check-sat b_and!20557 (not b_next!12057))
(get-model)

(declare-fun d!75647 () Bool)

(assert (=> d!75647 (= (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216749 () Unit!14018)

(declare-fun choose!1356 (array!30709 array!30711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19085 V!19085 V!19085 V!19085 (_ BitVec 32) Int) Unit!14018)

(assert (=> d!75647 (= lt!216749 (choose!1356 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75647 (validMask!0 mask!1365)))

(assert (=> d!75647 (= (lemmaNoChangeToArrayThenSameMapNoExtras!264 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216749)))

(declare-fun bs!15109 () Bool)

(assert (= bs!15109 d!75647))

(assert (=> bs!15109 m!457969))

(assert (=> bs!15109 m!457967))

(declare-fun m!458017 () Bool)

(assert (=> bs!15109 m!458017))

(assert (=> bs!15109 m!457959))

(assert (=> b!475770 d!75647))

(declare-fun b!475826 () Bool)

(declare-fun res!284115 () Bool)

(declare-fun e!279438 () Bool)

(assert (=> b!475826 (=> (not res!284115) (not e!279438))))

(declare-fun lt!216764 () ListLongMap!7865)

(declare-fun contains!2559 (ListLongMap!7865 (_ BitVec 64)) Bool)

(assert (=> b!475826 (= res!284115 (not (contains!2559 lt!216764 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475828 () Bool)

(declare-fun lt!216768 () Unit!14018)

(declare-fun lt!216769 () Unit!14018)

(assert (=> b!475828 (= lt!216768 lt!216769)))

(declare-fun lt!216770 () (_ BitVec 64))

(declare-fun lt!216766 () ListLongMap!7865)

(declare-fun lt!216767 () V!19085)

(declare-fun lt!216765 () (_ BitVec 64))

(assert (=> b!475828 (not (contains!2559 (+!1761 lt!216766 (tuple2!8953 lt!216765 lt!216767)) lt!216770))))

(declare-fun addStillNotContains!169 (ListLongMap!7865 (_ BitVec 64) V!19085 (_ BitVec 64)) Unit!14018)

(assert (=> b!475828 (= lt!216769 (addStillNotContains!169 lt!216766 lt!216765 lt!216767 lt!216770))))

(assert (=> b!475828 (= lt!216770 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7167 (ValueCell!6399 V!19085) V!19085)

(declare-fun dynLambda!929 (Int (_ BitVec 64)) V!19085)

(assert (=> b!475828 (= lt!216767 (get!7167 (select (arr!14771 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475828 (= lt!216765 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30619 () ListLongMap!7865)

(assert (=> b!475828 (= lt!216766 call!30619)))

(declare-fun e!279435 () ListLongMap!7865)

(assert (=> b!475828 (= e!279435 (+!1761 call!30619 (tuple2!8953 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000) (get!7167 (select (arr!14771 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475829 () Bool)

(declare-fun e!279439 () Bool)

(declare-fun e!279436 () Bool)

(assert (=> b!475829 (= e!279439 e!279436)))

(declare-fun c!57218 () Bool)

(assert (=> b!475829 (= c!57218 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475830 () Bool)

(assert (=> b!475830 (= e!279438 e!279439)))

(declare-fun c!57219 () Bool)

(declare-fun e!279441 () Bool)

(assert (=> b!475830 (= c!57219 e!279441)))

(declare-fun res!284117 () Bool)

(assert (=> b!475830 (=> (not res!284117) (not e!279441))))

(assert (=> b!475830 (= res!284117 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475831 () Bool)

(assert (=> b!475831 (= e!279435 call!30619)))

(declare-fun b!475832 () Bool)

(declare-fun e!279437 () Bool)

(assert (=> b!475832 (= e!279439 e!279437)))

(assert (=> b!475832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun res!284116 () Bool)

(assert (=> b!475832 (= res!284116 (contains!2559 lt!216764 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475832 (=> (not res!284116) (not e!279437))))

(declare-fun b!475833 () Bool)

(declare-fun e!279440 () ListLongMap!7865)

(assert (=> b!475833 (= e!279440 e!279435)))

(declare-fun c!57220 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!475833 (= c!57220 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475834 () Bool)

(assert (=> b!475834 (= e!279436 (= lt!216764 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30616 () Bool)

(assert (=> bm!30616 (= call!30619 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475835 () Bool)

(assert (=> b!475835 (= e!279441 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475835 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475836 () Bool)

(assert (=> b!475836 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> b!475836 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15123 _values!833)))))

(declare-fun apply!336 (ListLongMap!7865 (_ BitVec 64)) V!19085)

(assert (=> b!475836 (= e!279437 (= (apply!336 lt!216764 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)) (get!7167 (select (arr!14771 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475837 () Bool)

(assert (=> b!475837 (= e!279440 (ListLongMap!7866 Nil!9026))))

(declare-fun d!75649 () Bool)

(assert (=> d!75649 e!279438))

(declare-fun res!284114 () Bool)

(assert (=> d!75649 (=> (not res!284114) (not e!279438))))

(assert (=> d!75649 (= res!284114 (not (contains!2559 lt!216764 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75649 (= lt!216764 e!279440)))

(declare-fun c!57217 () Bool)

(assert (=> d!75649 (= c!57217 (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> d!75649 (validMask!0 mask!1365)))

(assert (=> d!75649 (= (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216764)))

(declare-fun b!475827 () Bool)

(declare-fun isEmpty!583 (ListLongMap!7865) Bool)

(assert (=> b!475827 (= e!279436 (isEmpty!583 lt!216764))))

(assert (= (and d!75649 c!57217) b!475837))

(assert (= (and d!75649 (not c!57217)) b!475833))

(assert (= (and b!475833 c!57220) b!475828))

(assert (= (and b!475833 (not c!57220)) b!475831))

(assert (= (or b!475828 b!475831) bm!30616))

(assert (= (and d!75649 res!284114) b!475826))

(assert (= (and b!475826 res!284115) b!475830))

(assert (= (and b!475830 res!284117) b!475835))

(assert (= (and b!475830 c!57219) b!475832))

(assert (= (and b!475830 (not c!57219)) b!475829))

(assert (= (and b!475832 res!284116) b!475836))

(assert (= (and b!475829 c!57218) b!475834))

(assert (= (and b!475829 (not c!57218)) b!475827))

(declare-fun b_lambda!10293 () Bool)

(assert (=> (not b_lambda!10293) (not b!475828)))

(declare-fun t!15010 () Bool)

(declare-fun tb!3937 () Bool)

(assert (=> (and start!42652 (= defaultEntry!841 defaultEntry!841) t!15010) tb!3937))

(declare-fun result!7469 () Bool)

(assert (=> tb!3937 (= result!7469 tp_is_empty!13485)))

(assert (=> b!475828 t!15010))

(declare-fun b_and!20561 () Bool)

(assert (= b_and!20557 (and (=> t!15010 result!7469) b_and!20561)))

(declare-fun b_lambda!10295 () Bool)

(assert (=> (not b_lambda!10295) (not b!475836)))

(assert (=> b!475836 t!15010))

(declare-fun b_and!20563 () Bool)

(assert (= b_and!20561 (and (=> t!15010 result!7469) b_and!20563)))

(declare-fun m!458019 () Bool)

(assert (=> b!475835 m!458019))

(assert (=> b!475835 m!458019))

(declare-fun m!458021 () Bool)

(assert (=> b!475835 m!458021))

(declare-fun m!458023 () Bool)

(assert (=> b!475827 m!458023))

(declare-fun m!458025 () Bool)

(assert (=> b!475834 m!458025))

(declare-fun m!458027 () Bool)

(assert (=> b!475836 m!458027))

(declare-fun m!458029 () Bool)

(assert (=> b!475836 m!458029))

(assert (=> b!475836 m!458029))

(assert (=> b!475836 m!458027))

(declare-fun m!458031 () Bool)

(assert (=> b!475836 m!458031))

(assert (=> b!475836 m!458019))

(assert (=> b!475836 m!458019))

(declare-fun m!458033 () Bool)

(assert (=> b!475836 m!458033))

(declare-fun m!458035 () Bool)

(assert (=> b!475828 m!458035))

(assert (=> b!475828 m!458027))

(declare-fun m!458037 () Bool)

(assert (=> b!475828 m!458037))

(declare-fun m!458039 () Bool)

(assert (=> b!475828 m!458039))

(declare-fun m!458041 () Bool)

(assert (=> b!475828 m!458041))

(assert (=> b!475828 m!458029))

(assert (=> b!475828 m!458019))

(assert (=> b!475828 m!458029))

(assert (=> b!475828 m!458027))

(assert (=> b!475828 m!458031))

(assert (=> b!475828 m!458037))

(assert (=> b!475833 m!458019))

(assert (=> b!475833 m!458019))

(assert (=> b!475833 m!458021))

(assert (=> bm!30616 m!458025))

(assert (=> b!475832 m!458019))

(assert (=> b!475832 m!458019))

(declare-fun m!458043 () Bool)

(assert (=> b!475832 m!458043))

(declare-fun m!458045 () Bool)

(assert (=> d!75649 m!458045))

(assert (=> d!75649 m!457959))

(declare-fun m!458047 () Bool)

(assert (=> b!475826 m!458047))

(assert (=> b!475770 d!75649))

(declare-fun b!475840 () Bool)

(declare-fun res!284119 () Bool)

(declare-fun e!279445 () Bool)

(assert (=> b!475840 (=> (not res!284119) (not e!279445))))

(declare-fun lt!216771 () ListLongMap!7865)

(assert (=> b!475840 (= res!284119 (not (contains!2559 lt!216771 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475842 () Bool)

(declare-fun lt!216775 () Unit!14018)

(declare-fun lt!216776 () Unit!14018)

(assert (=> b!475842 (= lt!216775 lt!216776)))

(declare-fun lt!216777 () (_ BitVec 64))

(declare-fun lt!216774 () V!19085)

(declare-fun lt!216773 () ListLongMap!7865)

(declare-fun lt!216772 () (_ BitVec 64))

(assert (=> b!475842 (not (contains!2559 (+!1761 lt!216773 (tuple2!8953 lt!216772 lt!216774)) lt!216777))))

(assert (=> b!475842 (= lt!216776 (addStillNotContains!169 lt!216773 lt!216772 lt!216774 lt!216777))))

(assert (=> b!475842 (= lt!216777 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475842 (= lt!216774 (get!7167 (select (arr!14771 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475842 (= lt!216772 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30620 () ListLongMap!7865)

(assert (=> b!475842 (= lt!216773 call!30620)))

(declare-fun e!279442 () ListLongMap!7865)

(assert (=> b!475842 (= e!279442 (+!1761 call!30620 (tuple2!8953 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000) (get!7167 (select (arr!14771 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475843 () Bool)

(declare-fun e!279446 () Bool)

(declare-fun e!279443 () Bool)

(assert (=> b!475843 (= e!279446 e!279443)))

(declare-fun c!57222 () Bool)

(assert (=> b!475843 (= c!57222 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475844 () Bool)

(assert (=> b!475844 (= e!279445 e!279446)))

(declare-fun c!57223 () Bool)

(declare-fun e!279448 () Bool)

(assert (=> b!475844 (= c!57223 e!279448)))

(declare-fun res!284121 () Bool)

(assert (=> b!475844 (=> (not res!284121) (not e!279448))))

(assert (=> b!475844 (= res!284121 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475845 () Bool)

(assert (=> b!475845 (= e!279442 call!30620)))

(declare-fun b!475846 () Bool)

(declare-fun e!279444 () Bool)

(assert (=> b!475846 (= e!279446 e!279444)))

(assert (=> b!475846 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun res!284120 () Bool)

(assert (=> b!475846 (= res!284120 (contains!2559 lt!216771 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475846 (=> (not res!284120) (not e!279444))))

(declare-fun b!475847 () Bool)

(declare-fun e!279447 () ListLongMap!7865)

(assert (=> b!475847 (= e!279447 e!279442)))

(declare-fun c!57224 () Bool)

(assert (=> b!475847 (= c!57224 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475848 () Bool)

(assert (=> b!475848 (= e!279443 (= lt!216771 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30617 () Bool)

(assert (=> bm!30617 (= call!30620 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475849 () Bool)

(assert (=> b!475849 (= e!279448 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475849 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475850 () Bool)

(assert (=> b!475850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> b!475850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15123 _values!833)))))

(assert (=> b!475850 (= e!279444 (= (apply!336 lt!216771 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)) (get!7167 (select (arr!14771 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475851 () Bool)

(assert (=> b!475851 (= e!279447 (ListLongMap!7866 Nil!9026))))

(declare-fun d!75651 () Bool)

(assert (=> d!75651 e!279445))

(declare-fun res!284118 () Bool)

(assert (=> d!75651 (=> (not res!284118) (not e!279445))))

(assert (=> d!75651 (= res!284118 (not (contains!2559 lt!216771 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75651 (= lt!216771 e!279447)))

(declare-fun c!57221 () Bool)

(assert (=> d!75651 (= c!57221 (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> d!75651 (validMask!0 mask!1365)))

(assert (=> d!75651 (= (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216771)))

(declare-fun b!475841 () Bool)

(assert (=> b!475841 (= e!279443 (isEmpty!583 lt!216771))))

(assert (= (and d!75651 c!57221) b!475851))

(assert (= (and d!75651 (not c!57221)) b!475847))

(assert (= (and b!475847 c!57224) b!475842))

(assert (= (and b!475847 (not c!57224)) b!475845))

(assert (= (or b!475842 b!475845) bm!30617))

(assert (= (and d!75651 res!284118) b!475840))

(assert (= (and b!475840 res!284119) b!475844))

(assert (= (and b!475844 res!284121) b!475849))

(assert (= (and b!475844 c!57223) b!475846))

(assert (= (and b!475844 (not c!57223)) b!475843))

(assert (= (and b!475846 res!284120) b!475850))

(assert (= (and b!475843 c!57222) b!475848))

(assert (= (and b!475843 (not c!57222)) b!475841))

(declare-fun b_lambda!10297 () Bool)

(assert (=> (not b_lambda!10297) (not b!475842)))

(assert (=> b!475842 t!15010))

(declare-fun b_and!20565 () Bool)

(assert (= b_and!20563 (and (=> t!15010 result!7469) b_and!20565)))

(declare-fun b_lambda!10299 () Bool)

(assert (=> (not b_lambda!10299) (not b!475850)))

(assert (=> b!475850 t!15010))

(declare-fun b_and!20567 () Bool)

(assert (= b_and!20565 (and (=> t!15010 result!7469) b_and!20567)))

(assert (=> b!475849 m!458019))

(assert (=> b!475849 m!458019))

(assert (=> b!475849 m!458021))

(declare-fun m!458049 () Bool)

(assert (=> b!475841 m!458049))

(declare-fun m!458051 () Bool)

(assert (=> b!475848 m!458051))

(assert (=> b!475850 m!458027))

(assert (=> b!475850 m!458029))

(assert (=> b!475850 m!458029))

(assert (=> b!475850 m!458027))

(assert (=> b!475850 m!458031))

(assert (=> b!475850 m!458019))

(assert (=> b!475850 m!458019))

(declare-fun m!458053 () Bool)

(assert (=> b!475850 m!458053))

(declare-fun m!458055 () Bool)

(assert (=> b!475842 m!458055))

(assert (=> b!475842 m!458027))

(declare-fun m!458057 () Bool)

(assert (=> b!475842 m!458057))

(declare-fun m!458059 () Bool)

(assert (=> b!475842 m!458059))

(declare-fun m!458061 () Bool)

(assert (=> b!475842 m!458061))

(assert (=> b!475842 m!458029))

(assert (=> b!475842 m!458019))

(assert (=> b!475842 m!458029))

(assert (=> b!475842 m!458027))

(assert (=> b!475842 m!458031))

(assert (=> b!475842 m!458057))

(assert (=> b!475847 m!458019))

(assert (=> b!475847 m!458019))

(assert (=> b!475847 m!458021))

(assert (=> bm!30617 m!458051))

(assert (=> b!475846 m!458019))

(assert (=> b!475846 m!458019))

(declare-fun m!458063 () Bool)

(assert (=> b!475846 m!458063))

(declare-fun m!458065 () Bool)

(assert (=> d!75651 m!458065))

(assert (=> d!75651 m!457959))

(declare-fun m!458067 () Bool)

(assert (=> b!475840 m!458067))

(assert (=> b!475770 d!75651))

(declare-fun b!475862 () Bool)

(declare-fun e!279460 () Bool)

(declare-fun e!279457 () Bool)

(assert (=> b!475862 (= e!279460 e!279457)))

(declare-fun res!284130 () Bool)

(assert (=> b!475862 (=> (not res!284130) (not e!279457))))

(declare-fun e!279459 () Bool)

(assert (=> b!475862 (= res!284130 (not e!279459))))

(declare-fun res!284129 () Bool)

(assert (=> b!475862 (=> (not res!284129) (not e!279459))))

(assert (=> b!475862 (= res!284129 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475863 () Bool)

(declare-fun e!279458 () Bool)

(declare-fun call!30623 () Bool)

(assert (=> b!475863 (= e!279458 call!30623)))

(declare-fun b!475864 () Bool)

(assert (=> b!475864 (= e!279457 e!279458)))

(declare-fun c!57227 () Bool)

(assert (=> b!475864 (= c!57227 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475866 () Bool)

(assert (=> b!475866 (= e!279458 call!30623)))

(declare-fun bm!30620 () Bool)

(assert (=> bm!30620 (= call!30623 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57227 (Cons!9026 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000) Nil!9027) Nil!9027)))))

(declare-fun d!75653 () Bool)

(declare-fun res!284128 () Bool)

(assert (=> d!75653 (=> res!284128 e!279460)))

(assert (=> d!75653 (= res!284128 (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> d!75653 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9027) e!279460)))

(declare-fun b!475865 () Bool)

(declare-fun contains!2560 (List!9030 (_ BitVec 64)) Bool)

(assert (=> b!475865 (= e!279459 (contains!2560 Nil!9027 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75653 (not res!284128)) b!475862))

(assert (= (and b!475862 res!284129) b!475865))

(assert (= (and b!475862 res!284130) b!475864))

(assert (= (and b!475864 c!57227) b!475863))

(assert (= (and b!475864 (not c!57227)) b!475866))

(assert (= (or b!475863 b!475866) bm!30620))

(assert (=> b!475862 m!458019))

(assert (=> b!475862 m!458019))

(assert (=> b!475862 m!458021))

(assert (=> b!475864 m!458019))

(assert (=> b!475864 m!458019))

(assert (=> b!475864 m!458021))

(assert (=> bm!30620 m!458019))

(declare-fun m!458069 () Bool)

(assert (=> bm!30620 m!458069))

(assert (=> b!475865 m!458019))

(assert (=> b!475865 m!458019))

(declare-fun m!458071 () Bool)

(assert (=> b!475865 m!458071))

(assert (=> b!475772 d!75653))

(declare-fun d!75655 () Bool)

(assert (=> d!75655 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42652 d!75655))

(declare-fun d!75657 () Bool)

(assert (=> d!75657 (= (array_inv!10660 _keys!1025) (bvsge (size!15122 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42652 d!75657))

(declare-fun d!75659 () Bool)

(assert (=> d!75659 (= (array_inv!10661 _values!833) (bvsge (size!15123 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42652 d!75659))

(declare-fun b!475909 () Bool)

(declare-fun e!279497 () Bool)

(declare-fun call!30641 () Bool)

(assert (=> b!475909 (= e!279497 (not call!30641))))

(declare-fun b!475910 () Bool)

(declare-fun e!279487 () Bool)

(declare-fun call!30644 () Bool)

(assert (=> b!475910 (= e!279487 (not call!30644))))

(declare-fun bm!30635 () Bool)

(declare-fun call!30643 () ListLongMap!7865)

(declare-fun call!30640 () ListLongMap!7865)

(assert (=> bm!30635 (= call!30643 call!30640)))

(declare-fun b!475911 () Bool)

(declare-fun e!279498 () Bool)

(declare-fun lt!216822 () ListLongMap!7865)

(assert (=> b!475911 (= e!279498 (= (apply!336 lt!216822 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475912 () Bool)

(declare-fun c!57242 () Bool)

(assert (=> b!475912 (= c!57242 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279488 () ListLongMap!7865)

(declare-fun e!279490 () ListLongMap!7865)

(assert (=> b!475912 (= e!279488 e!279490)))

(declare-fun bm!30636 () Bool)

(assert (=> bm!30636 (= call!30644 (contains!2559 lt!216822 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30637 () Bool)

(assert (=> bm!30637 (= call!30641 (contains!2559 lt!216822 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30638 () Bool)

(assert (=> bm!30638 (= call!30640 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475914 () Bool)

(declare-fun e!279489 () Bool)

(assert (=> b!475914 (= e!279489 e!279497)))

(declare-fun c!57243 () Bool)

(assert (=> b!475914 (= c!57243 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475915 () Bool)

(declare-fun e!279495 () ListLongMap!7865)

(declare-fun call!30639 () ListLongMap!7865)

(assert (=> b!475915 (= e!279495 (+!1761 call!30639 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!475916 () Bool)

(declare-fun e!279492 () Bool)

(assert (=> b!475916 (= e!279497 e!279492)))

(declare-fun res!284151 () Bool)

(assert (=> b!475916 (= res!284151 call!30641)))

(assert (=> b!475916 (=> (not res!284151) (not e!279492))))

(declare-fun b!475917 () Bool)

(declare-fun e!279491 () Unit!14018)

(declare-fun lt!216843 () Unit!14018)

(assert (=> b!475917 (= e!279491 lt!216843)))

(declare-fun lt!216840 () ListLongMap!7865)

(assert (=> b!475917 (= lt!216840 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216825 () (_ BitVec 64))

(assert (=> b!475917 (= lt!216825 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216838 () (_ BitVec 64))

(assert (=> b!475917 (= lt!216838 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216839 () Unit!14018)

(declare-fun addStillContains!294 (ListLongMap!7865 (_ BitVec 64) V!19085 (_ BitVec 64)) Unit!14018)

(assert (=> b!475917 (= lt!216839 (addStillContains!294 lt!216840 lt!216825 zeroValue!794 lt!216838))))

(assert (=> b!475917 (contains!2559 (+!1761 lt!216840 (tuple2!8953 lt!216825 zeroValue!794)) lt!216838)))

(declare-fun lt!216841 () Unit!14018)

(assert (=> b!475917 (= lt!216841 lt!216839)))

(declare-fun lt!216829 () ListLongMap!7865)

(assert (=> b!475917 (= lt!216829 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216823 () (_ BitVec 64))

(assert (=> b!475917 (= lt!216823 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216834 () (_ BitVec 64))

(assert (=> b!475917 (= lt!216834 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216835 () Unit!14018)

(declare-fun addApplyDifferent!294 (ListLongMap!7865 (_ BitVec 64) V!19085 (_ BitVec 64)) Unit!14018)

(assert (=> b!475917 (= lt!216835 (addApplyDifferent!294 lt!216829 lt!216823 minValueAfter!38 lt!216834))))

(assert (=> b!475917 (= (apply!336 (+!1761 lt!216829 (tuple2!8953 lt!216823 minValueAfter!38)) lt!216834) (apply!336 lt!216829 lt!216834))))

(declare-fun lt!216824 () Unit!14018)

(assert (=> b!475917 (= lt!216824 lt!216835)))

(declare-fun lt!216832 () ListLongMap!7865)

(assert (=> b!475917 (= lt!216832 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216837 () (_ BitVec 64))

(assert (=> b!475917 (= lt!216837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216833 () (_ BitVec 64))

(assert (=> b!475917 (= lt!216833 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216827 () Unit!14018)

(assert (=> b!475917 (= lt!216827 (addApplyDifferent!294 lt!216832 lt!216837 zeroValue!794 lt!216833))))

(assert (=> b!475917 (= (apply!336 (+!1761 lt!216832 (tuple2!8953 lt!216837 zeroValue!794)) lt!216833) (apply!336 lt!216832 lt!216833))))

(declare-fun lt!216826 () Unit!14018)

(assert (=> b!475917 (= lt!216826 lt!216827)))

(declare-fun lt!216828 () ListLongMap!7865)

(assert (=> b!475917 (= lt!216828 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216831 () (_ BitVec 64))

(assert (=> b!475917 (= lt!216831 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216836 () (_ BitVec 64))

(assert (=> b!475917 (= lt!216836 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475917 (= lt!216843 (addApplyDifferent!294 lt!216828 lt!216831 minValueAfter!38 lt!216836))))

(assert (=> b!475917 (= (apply!336 (+!1761 lt!216828 (tuple2!8953 lt!216831 minValueAfter!38)) lt!216836) (apply!336 lt!216828 lt!216836))))

(declare-fun b!475918 () Bool)

(declare-fun call!30642 () ListLongMap!7865)

(assert (=> b!475918 (= e!279488 call!30642)))

(declare-fun b!475919 () Bool)

(assert (=> b!475919 (= e!279495 e!279488)))

(declare-fun c!57245 () Bool)

(assert (=> b!475919 (= c!57245 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!57244 () Bool)

(declare-fun call!30638 () ListLongMap!7865)

(declare-fun bm!30639 () Bool)

(assert (=> bm!30639 (= call!30639 (+!1761 (ite c!57244 call!30640 (ite c!57245 call!30643 call!30638)) (ite (or c!57244 c!57245) (tuple2!8953 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))))

(declare-fun b!475920 () Bool)

(declare-fun e!279496 () Bool)

(assert (=> b!475920 (= e!279496 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475921 () Bool)

(assert (=> b!475921 (= e!279490 call!30642)))

(declare-fun b!475922 () Bool)

(declare-fun res!284150 () Bool)

(assert (=> b!475922 (=> (not res!284150) (not e!279489))))

(assert (=> b!475922 (= res!284150 e!279487)))

(declare-fun c!57240 () Bool)

(assert (=> b!475922 (= c!57240 (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475923 () Bool)

(declare-fun res!284154 () Bool)

(assert (=> b!475923 (=> (not res!284154) (not e!279489))))

(declare-fun e!279499 () Bool)

(assert (=> b!475923 (= res!284154 e!279499)))

(declare-fun res!284149 () Bool)

(assert (=> b!475923 (=> res!284149 e!279499)))

(assert (=> b!475923 (= res!284149 (not e!279496))))

(declare-fun res!284156 () Bool)

(assert (=> b!475923 (=> (not res!284156) (not e!279496))))

(assert (=> b!475923 (= res!284156 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun d!75661 () Bool)

(assert (=> d!75661 e!279489))

(declare-fun res!284153 () Bool)

(assert (=> d!75661 (=> (not res!284153) (not e!279489))))

(assert (=> d!75661 (= res!284153 (or (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))))

(declare-fun lt!216842 () ListLongMap!7865)

(assert (=> d!75661 (= lt!216822 lt!216842)))

(declare-fun lt!216830 () Unit!14018)

(assert (=> d!75661 (= lt!216830 e!279491)))

(declare-fun c!57241 () Bool)

(declare-fun e!279493 () Bool)

(assert (=> d!75661 (= c!57241 e!279493)))

(declare-fun res!284157 () Bool)

(assert (=> d!75661 (=> (not res!284157) (not e!279493))))

(assert (=> d!75661 (= res!284157 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> d!75661 (= lt!216842 e!279495)))

(assert (=> d!75661 (= c!57244 (and (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75661 (validMask!0 mask!1365)))

(assert (=> d!75661 (= (getCurrentListMap!2289 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216822)))

(declare-fun b!475913 () Bool)

(declare-fun e!279494 () Bool)

(assert (=> b!475913 (= e!279499 e!279494)))

(declare-fun res!284155 () Bool)

(assert (=> b!475913 (=> (not res!284155) (not e!279494))))

(assert (=> b!475913 (= res!284155 (contains!2559 lt!216822 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475924 () Bool)

(assert (=> b!475924 (= e!279487 e!279498)))

(declare-fun res!284152 () Bool)

(assert (=> b!475924 (= res!284152 call!30644)))

(assert (=> b!475924 (=> (not res!284152) (not e!279498))))

(declare-fun bm!30640 () Bool)

(assert (=> bm!30640 (= call!30642 call!30639)))

(declare-fun b!475925 () Bool)

(assert (=> b!475925 (= e!279494 (= (apply!336 lt!216822 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)) (get!7167 (select (arr!14771 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15123 _values!833)))))

(assert (=> b!475925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475926 () Bool)

(assert (=> b!475926 (= e!279492 (= (apply!336 lt!216822 #b1000000000000000000000000000000000000000000000000000000000000000) minValueAfter!38))))

(declare-fun b!475927 () Bool)

(assert (=> b!475927 (= e!279490 call!30638)))

(declare-fun b!475928 () Bool)

(declare-fun Unit!14020 () Unit!14018)

(assert (=> b!475928 (= e!279491 Unit!14020)))

(declare-fun bm!30641 () Bool)

(assert (=> bm!30641 (= call!30638 call!30643)))

(declare-fun b!475929 () Bool)

(assert (=> b!475929 (= e!279493 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75661 c!57244) b!475915))

(assert (= (and d!75661 (not c!57244)) b!475919))

(assert (= (and b!475919 c!57245) b!475918))

(assert (= (and b!475919 (not c!57245)) b!475912))

(assert (= (and b!475912 c!57242) b!475921))

(assert (= (and b!475912 (not c!57242)) b!475927))

(assert (= (or b!475921 b!475927) bm!30641))

(assert (= (or b!475918 bm!30641) bm!30635))

(assert (= (or b!475918 b!475921) bm!30640))

(assert (= (or b!475915 bm!30635) bm!30638))

(assert (= (or b!475915 bm!30640) bm!30639))

(assert (= (and d!75661 res!284157) b!475929))

(assert (= (and d!75661 c!57241) b!475917))

(assert (= (and d!75661 (not c!57241)) b!475928))

(assert (= (and d!75661 res!284153) b!475923))

(assert (= (and b!475923 res!284156) b!475920))

(assert (= (and b!475923 (not res!284149)) b!475913))

(assert (= (and b!475913 res!284155) b!475925))

(assert (= (and b!475923 res!284154) b!475922))

(assert (= (and b!475922 c!57240) b!475924))

(assert (= (and b!475922 (not c!57240)) b!475910))

(assert (= (and b!475924 res!284152) b!475911))

(assert (= (or b!475924 b!475910) bm!30636))

(assert (= (and b!475922 res!284150) b!475914))

(assert (= (and b!475914 c!57243) b!475916))

(assert (= (and b!475914 (not c!57243)) b!475909))

(assert (= (and b!475916 res!284151) b!475926))

(assert (= (or b!475916 b!475909) bm!30637))

(declare-fun b_lambda!10301 () Bool)

(assert (=> (not b_lambda!10301) (not b!475925)))

(assert (=> b!475925 t!15010))

(declare-fun b_and!20569 () Bool)

(assert (= b_and!20567 (and (=> t!15010 result!7469) b_and!20569)))

(declare-fun m!458073 () Bool)

(assert (=> bm!30639 m!458073))

(assert (=> b!475929 m!458019))

(assert (=> b!475929 m!458019))

(assert (=> b!475929 m!458021))

(declare-fun m!458075 () Bool)

(assert (=> b!475926 m!458075))

(declare-fun m!458077 () Bool)

(assert (=> b!475917 m!458077))

(declare-fun m!458079 () Bool)

(assert (=> b!475917 m!458079))

(declare-fun m!458081 () Bool)

(assert (=> b!475917 m!458081))

(assert (=> b!475917 m!457967))

(assert (=> b!475917 m!458079))

(declare-fun m!458083 () Bool)

(assert (=> b!475917 m!458083))

(assert (=> b!475917 m!458083))

(declare-fun m!458085 () Bool)

(assert (=> b!475917 m!458085))

(declare-fun m!458087 () Bool)

(assert (=> b!475917 m!458087))

(declare-fun m!458089 () Bool)

(assert (=> b!475917 m!458089))

(declare-fun m!458091 () Bool)

(assert (=> b!475917 m!458091))

(declare-fun m!458093 () Bool)

(assert (=> b!475917 m!458093))

(declare-fun m!458095 () Bool)

(assert (=> b!475917 m!458095))

(declare-fun m!458097 () Bool)

(assert (=> b!475917 m!458097))

(declare-fun m!458099 () Bool)

(assert (=> b!475917 m!458099))

(declare-fun m!458101 () Bool)

(assert (=> b!475917 m!458101))

(assert (=> b!475917 m!458097))

(assert (=> b!475917 m!458019))

(assert (=> b!475917 m!458089))

(declare-fun m!458103 () Bool)

(assert (=> b!475917 m!458103))

(declare-fun m!458105 () Bool)

(assert (=> b!475917 m!458105))

(declare-fun m!458107 () Bool)

(assert (=> bm!30636 m!458107))

(assert (=> bm!30638 m!457967))

(assert (=> b!475913 m!458019))

(assert (=> b!475913 m!458019))

(declare-fun m!458109 () Bool)

(assert (=> b!475913 m!458109))

(assert (=> b!475920 m!458019))

(assert (=> b!475920 m!458019))

(assert (=> b!475920 m!458021))

(assert (=> d!75661 m!457959))

(assert (=> b!475925 m!458029))

(assert (=> b!475925 m!458027))

(assert (=> b!475925 m!458019))

(declare-fun m!458111 () Bool)

(assert (=> b!475925 m!458111))

(assert (=> b!475925 m!458019))

(assert (=> b!475925 m!458029))

(assert (=> b!475925 m!458027))

(assert (=> b!475925 m!458031))

(declare-fun m!458113 () Bool)

(assert (=> b!475911 m!458113))

(declare-fun m!458115 () Bool)

(assert (=> bm!30637 m!458115))

(declare-fun m!458117 () Bool)

(assert (=> b!475915 m!458117))

(assert (=> b!475771 d!75661))

(declare-fun d!75663 () Bool)

(declare-fun e!279502 () Bool)

(assert (=> d!75663 e!279502))

(declare-fun res!284163 () Bool)

(assert (=> d!75663 (=> (not res!284163) (not e!279502))))

(declare-fun lt!216853 () ListLongMap!7865)

(assert (=> d!75663 (= res!284163 (contains!2559 lt!216853 (_1!4487 lt!216728)))))

(declare-fun lt!216855 () List!9029)

(assert (=> d!75663 (= lt!216853 (ListLongMap!7866 lt!216855))))

(declare-fun lt!216854 () Unit!14018)

(declare-fun lt!216852 () Unit!14018)

(assert (=> d!75663 (= lt!216854 lt!216852)))

(declare-datatypes ((Option!389 0))(
  ( (Some!388 (v!9083 V!19085)) (None!387) )
))
(declare-fun getValueByKey!383 (List!9029 (_ BitVec 64)) Option!389)

(assert (=> d!75663 (= (getValueByKey!383 lt!216855 (_1!4487 lt!216728)) (Some!388 (_2!4487 lt!216728)))))

(declare-fun lemmaContainsTupThenGetReturnValue!205 (List!9029 (_ BitVec 64) V!19085) Unit!14018)

(assert (=> d!75663 (= lt!216852 (lemmaContainsTupThenGetReturnValue!205 lt!216855 (_1!4487 lt!216728) (_2!4487 lt!216728)))))

(declare-fun insertStrictlySorted!208 (List!9029 (_ BitVec 64) V!19085) List!9029)

(assert (=> d!75663 (= lt!216855 (insertStrictlySorted!208 (toList!3948 (+!1761 lt!216725 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (_1!4487 lt!216728) (_2!4487 lt!216728)))))

(assert (=> d!75663 (= (+!1761 (+!1761 lt!216725 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216728) lt!216853)))

(declare-fun b!475934 () Bool)

(declare-fun res!284162 () Bool)

(assert (=> b!475934 (=> (not res!284162) (not e!279502))))

(assert (=> b!475934 (= res!284162 (= (getValueByKey!383 (toList!3948 lt!216853) (_1!4487 lt!216728)) (Some!388 (_2!4487 lt!216728))))))

(declare-fun b!475935 () Bool)

(declare-fun contains!2561 (List!9029 tuple2!8952) Bool)

(assert (=> b!475935 (= e!279502 (contains!2561 (toList!3948 lt!216853) lt!216728))))

(assert (= (and d!75663 res!284163) b!475934))

(assert (= (and b!475934 res!284162) b!475935))

(declare-fun m!458119 () Bool)

(assert (=> d!75663 m!458119))

(declare-fun m!458121 () Bool)

(assert (=> d!75663 m!458121))

(declare-fun m!458123 () Bool)

(assert (=> d!75663 m!458123))

(declare-fun m!458125 () Bool)

(assert (=> d!75663 m!458125))

(declare-fun m!458127 () Bool)

(assert (=> b!475934 m!458127))

(declare-fun m!458129 () Bool)

(assert (=> b!475935 m!458129))

(assert (=> b!475771 d!75663))

(declare-fun d!75665 () Bool)

(declare-fun e!279503 () Bool)

(assert (=> d!75665 e!279503))

(declare-fun res!284165 () Bool)

(assert (=> d!75665 (=> (not res!284165) (not e!279503))))

(declare-fun lt!216857 () ListLongMap!7865)

(assert (=> d!75665 (= res!284165 (contains!2559 lt!216857 (_1!4487 lt!216728)))))

(declare-fun lt!216859 () List!9029)

(assert (=> d!75665 (= lt!216857 (ListLongMap!7866 lt!216859))))

(declare-fun lt!216858 () Unit!14018)

(declare-fun lt!216856 () Unit!14018)

(assert (=> d!75665 (= lt!216858 lt!216856)))

(assert (=> d!75665 (= (getValueByKey!383 lt!216859 (_1!4487 lt!216728)) (Some!388 (_2!4487 lt!216728)))))

(assert (=> d!75665 (= lt!216856 (lemmaContainsTupThenGetReturnValue!205 lt!216859 (_1!4487 lt!216728) (_2!4487 lt!216728)))))

(assert (=> d!75665 (= lt!216859 (insertStrictlySorted!208 (toList!3948 lt!216727) (_1!4487 lt!216728) (_2!4487 lt!216728)))))

(assert (=> d!75665 (= (+!1761 lt!216727 lt!216728) lt!216857)))

(declare-fun b!475936 () Bool)

(declare-fun res!284164 () Bool)

(assert (=> b!475936 (=> (not res!284164) (not e!279503))))

(assert (=> b!475936 (= res!284164 (= (getValueByKey!383 (toList!3948 lt!216857) (_1!4487 lt!216728)) (Some!388 (_2!4487 lt!216728))))))

(declare-fun b!475937 () Bool)

(assert (=> b!475937 (= e!279503 (contains!2561 (toList!3948 lt!216857) lt!216728))))

(assert (= (and d!75665 res!284165) b!475936))

(assert (= (and b!475936 res!284164) b!475937))

(declare-fun m!458131 () Bool)

(assert (=> d!75665 m!458131))

(declare-fun m!458133 () Bool)

(assert (=> d!75665 m!458133))

(declare-fun m!458135 () Bool)

(assert (=> d!75665 m!458135))

(declare-fun m!458137 () Bool)

(assert (=> d!75665 m!458137))

(declare-fun m!458139 () Bool)

(assert (=> b!475936 m!458139))

(declare-fun m!458141 () Bool)

(assert (=> b!475937 m!458141))

(assert (=> b!475771 d!75665))

(declare-fun d!75667 () Bool)

(declare-fun e!279504 () Bool)

(assert (=> d!75667 e!279504))

(declare-fun res!284167 () Bool)

(assert (=> d!75667 (=> (not res!284167) (not e!279504))))

(declare-fun lt!216861 () ListLongMap!7865)

(assert (=> d!75667 (= res!284167 (contains!2559 lt!216861 (_1!4487 lt!216728)))))

(declare-fun lt!216863 () List!9029)

(assert (=> d!75667 (= lt!216861 (ListLongMap!7866 lt!216863))))

(declare-fun lt!216862 () Unit!14018)

(declare-fun lt!216860 () Unit!14018)

(assert (=> d!75667 (= lt!216862 lt!216860)))

(assert (=> d!75667 (= (getValueByKey!383 lt!216863 (_1!4487 lt!216728)) (Some!388 (_2!4487 lt!216728)))))

(assert (=> d!75667 (= lt!216860 (lemmaContainsTupThenGetReturnValue!205 lt!216863 (_1!4487 lt!216728) (_2!4487 lt!216728)))))

(assert (=> d!75667 (= lt!216863 (insertStrictlySorted!208 (toList!3948 lt!216725) (_1!4487 lt!216728) (_2!4487 lt!216728)))))

(assert (=> d!75667 (= (+!1761 lt!216725 lt!216728) lt!216861)))

(declare-fun b!475938 () Bool)

(declare-fun res!284166 () Bool)

(assert (=> b!475938 (=> (not res!284166) (not e!279504))))

(assert (=> b!475938 (= res!284166 (= (getValueByKey!383 (toList!3948 lt!216861) (_1!4487 lt!216728)) (Some!388 (_2!4487 lt!216728))))))

(declare-fun b!475939 () Bool)

(assert (=> b!475939 (= e!279504 (contains!2561 (toList!3948 lt!216861) lt!216728))))

(assert (= (and d!75667 res!284167) b!475938))

(assert (= (and b!475938 res!284166) b!475939))

(declare-fun m!458143 () Bool)

(assert (=> d!75667 m!458143))

(declare-fun m!458145 () Bool)

(assert (=> d!75667 m!458145))

(declare-fun m!458147 () Bool)

(assert (=> d!75667 m!458147))

(declare-fun m!458149 () Bool)

(assert (=> d!75667 m!458149))

(declare-fun m!458151 () Bool)

(assert (=> b!475938 m!458151))

(declare-fun m!458153 () Bool)

(assert (=> b!475939 m!458153))

(assert (=> b!475771 d!75667))

(declare-fun d!75669 () Bool)

(assert (=> d!75669 (= (+!1761 lt!216725 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)) (+!1761 (+!1761 lt!216725 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun lt!216866 () Unit!14018)

(declare-fun choose!1357 (ListLongMap!7865 (_ BitVec 64) V!19085 V!19085) Unit!14018)

(assert (=> d!75669 (= lt!216866 (choose!1357 lt!216725 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> d!75669 (= (addSameAsAddTwiceSameKeyDiffValues!163 lt!216725 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38) lt!216866)))

(declare-fun bs!15110 () Bool)

(assert (= bs!15110 d!75669))

(declare-fun m!458155 () Bool)

(assert (=> bs!15110 m!458155))

(assert (=> bs!15110 m!457971))

(assert (=> bs!15110 m!457971))

(declare-fun m!458157 () Bool)

(assert (=> bs!15110 m!458157))

(declare-fun m!458159 () Bool)

(assert (=> bs!15110 m!458159))

(assert (=> b!475771 d!75669))

(declare-fun d!75671 () Bool)

(declare-fun e!279505 () Bool)

(assert (=> d!75671 e!279505))

(declare-fun res!284169 () Bool)

(assert (=> d!75671 (=> (not res!284169) (not e!279505))))

(declare-fun lt!216868 () ListLongMap!7865)

(assert (=> d!75671 (= res!284169 (contains!2559 lt!216868 (_1!4487 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun lt!216870 () List!9029)

(assert (=> d!75671 (= lt!216868 (ListLongMap!7866 lt!216870))))

(declare-fun lt!216869 () Unit!14018)

(declare-fun lt!216867 () Unit!14018)

(assert (=> d!75671 (= lt!216869 lt!216867)))

(assert (=> d!75671 (= (getValueByKey!383 lt!216870 (_1!4487 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!388 (_2!4487 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75671 (= lt!216867 (lemmaContainsTupThenGetReturnValue!205 lt!216870 (_1!4487 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4487 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75671 (= lt!216870 (insertStrictlySorted!208 (toList!3948 lt!216725) (_1!4487 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) (_2!4487 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(assert (=> d!75671 (= (+!1761 lt!216725 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!216868)))

(declare-fun b!475940 () Bool)

(declare-fun res!284168 () Bool)

(assert (=> b!475940 (=> (not res!284168) (not e!279505))))

(assert (=> b!475940 (= res!284168 (= (getValueByKey!383 (toList!3948 lt!216868) (_1!4487 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))) (Some!388 (_2!4487 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))))

(declare-fun b!475941 () Bool)

(assert (=> b!475941 (= e!279505 (contains!2561 (toList!3948 lt!216868) (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(assert (= (and d!75671 res!284169) b!475940))

(assert (= (and b!475940 res!284168) b!475941))

(declare-fun m!458161 () Bool)

(assert (=> d!75671 m!458161))

(declare-fun m!458163 () Bool)

(assert (=> d!75671 m!458163))

(declare-fun m!458165 () Bool)

(assert (=> d!75671 m!458165))

(declare-fun m!458167 () Bool)

(assert (=> d!75671 m!458167))

(declare-fun m!458169 () Bool)

(assert (=> b!475940 m!458169))

(declare-fun m!458171 () Bool)

(assert (=> b!475941 m!458171))

(assert (=> b!475771 d!75671))

(declare-fun b!475942 () Bool)

(declare-fun e!279516 () Bool)

(declare-fun call!30648 () Bool)

(assert (=> b!475942 (= e!279516 (not call!30648))))

(declare-fun b!475943 () Bool)

(declare-fun e!279506 () Bool)

(declare-fun call!30651 () Bool)

(assert (=> b!475943 (= e!279506 (not call!30651))))

(declare-fun bm!30642 () Bool)

(declare-fun call!30650 () ListLongMap!7865)

(declare-fun call!30647 () ListLongMap!7865)

(assert (=> bm!30642 (= call!30650 call!30647)))

(declare-fun b!475944 () Bool)

(declare-fun e!279517 () Bool)

(declare-fun lt!216871 () ListLongMap!7865)

(assert (=> b!475944 (= e!279517 (= (apply!336 lt!216871 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!794))))

(declare-fun b!475945 () Bool)

(declare-fun c!57248 () Bool)

(assert (=> b!475945 (= c!57248 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!279507 () ListLongMap!7865)

(declare-fun e!279509 () ListLongMap!7865)

(assert (=> b!475945 (= e!279507 e!279509)))

(declare-fun bm!30643 () Bool)

(assert (=> bm!30643 (= call!30651 (contains!2559 lt!216871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30644 () Bool)

(assert (=> bm!30644 (= call!30648 (contains!2559 lt!216871 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!30645 () Bool)

(assert (=> bm!30645 (= call!30647 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475947 () Bool)

(declare-fun e!279508 () Bool)

(assert (=> b!475947 (= e!279508 e!279516)))

(declare-fun c!57249 () Bool)

(assert (=> b!475947 (= c!57249 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!475948 () Bool)

(declare-fun e!279514 () ListLongMap!7865)

(declare-fun call!30646 () ListLongMap!7865)

(assert (=> b!475948 (= e!279514 (+!1761 call!30646 (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)))))

(declare-fun b!475949 () Bool)

(declare-fun e!279511 () Bool)

(assert (=> b!475949 (= e!279516 e!279511)))

(declare-fun res!284172 () Bool)

(assert (=> b!475949 (= res!284172 call!30648)))

(assert (=> b!475949 (=> (not res!284172) (not e!279511))))

(declare-fun b!475950 () Bool)

(declare-fun e!279510 () Unit!14018)

(declare-fun lt!216892 () Unit!14018)

(assert (=> b!475950 (= e!279510 lt!216892)))

(declare-fun lt!216889 () ListLongMap!7865)

(assert (=> b!475950 (= lt!216889 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216874 () (_ BitVec 64))

(assert (=> b!475950 (= lt!216874 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216887 () (_ BitVec 64))

(assert (=> b!475950 (= lt!216887 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216888 () Unit!14018)

(assert (=> b!475950 (= lt!216888 (addStillContains!294 lt!216889 lt!216874 zeroValue!794 lt!216887))))

(assert (=> b!475950 (contains!2559 (+!1761 lt!216889 (tuple2!8953 lt!216874 zeroValue!794)) lt!216887)))

(declare-fun lt!216890 () Unit!14018)

(assert (=> b!475950 (= lt!216890 lt!216888)))

(declare-fun lt!216878 () ListLongMap!7865)

(assert (=> b!475950 (= lt!216878 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216872 () (_ BitVec 64))

(assert (=> b!475950 (= lt!216872 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216883 () (_ BitVec 64))

(assert (=> b!475950 (= lt!216883 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216884 () Unit!14018)

(assert (=> b!475950 (= lt!216884 (addApplyDifferent!294 lt!216878 lt!216872 minValueBefore!38 lt!216883))))

(assert (=> b!475950 (= (apply!336 (+!1761 lt!216878 (tuple2!8953 lt!216872 minValueBefore!38)) lt!216883) (apply!336 lt!216878 lt!216883))))

(declare-fun lt!216873 () Unit!14018)

(assert (=> b!475950 (= lt!216873 lt!216884)))

(declare-fun lt!216881 () ListLongMap!7865)

(assert (=> b!475950 (= lt!216881 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216886 () (_ BitVec 64))

(assert (=> b!475950 (= lt!216886 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216882 () (_ BitVec 64))

(assert (=> b!475950 (= lt!216882 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216876 () Unit!14018)

(assert (=> b!475950 (= lt!216876 (addApplyDifferent!294 lt!216881 lt!216886 zeroValue!794 lt!216882))))

(assert (=> b!475950 (= (apply!336 (+!1761 lt!216881 (tuple2!8953 lt!216886 zeroValue!794)) lt!216882) (apply!336 lt!216881 lt!216882))))

(declare-fun lt!216875 () Unit!14018)

(assert (=> b!475950 (= lt!216875 lt!216876)))

(declare-fun lt!216877 () ListLongMap!7865)

(assert (=> b!475950 (= lt!216877 (getCurrentListMapNoExtraKeys!2104 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!216880 () (_ BitVec 64))

(assert (=> b!475950 (= lt!216880 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!216885 () (_ BitVec 64))

(assert (=> b!475950 (= lt!216885 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475950 (= lt!216892 (addApplyDifferent!294 lt!216877 lt!216880 minValueBefore!38 lt!216885))))

(assert (=> b!475950 (= (apply!336 (+!1761 lt!216877 (tuple2!8953 lt!216880 minValueBefore!38)) lt!216885) (apply!336 lt!216877 lt!216885))))

(declare-fun b!475951 () Bool)

(declare-fun call!30649 () ListLongMap!7865)

(assert (=> b!475951 (= e!279507 call!30649)))

(declare-fun b!475952 () Bool)

(assert (=> b!475952 (= e!279514 e!279507)))

(declare-fun c!57251 () Bool)

(assert (=> b!475952 (= c!57251 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30646 () Bool)

(declare-fun call!30645 () ListLongMap!7865)

(declare-fun c!57250 () Bool)

(assert (=> bm!30646 (= call!30646 (+!1761 (ite c!57250 call!30647 (ite c!57251 call!30650 call!30645)) (ite (or c!57250 c!57251) (tuple2!8953 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794) (tuple2!8953 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38))))))

(declare-fun b!475953 () Bool)

(declare-fun e!279515 () Bool)

(assert (=> b!475953 (= e!279515 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475954 () Bool)

(assert (=> b!475954 (= e!279509 call!30649)))

(declare-fun b!475955 () Bool)

(declare-fun res!284171 () Bool)

(assert (=> b!475955 (=> (not res!284171) (not e!279508))))

(assert (=> b!475955 (= res!284171 e!279506)))

(declare-fun c!57246 () Bool)

(assert (=> b!475955 (= c!57246 (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!475956 () Bool)

(declare-fun res!284175 () Bool)

(assert (=> b!475956 (=> (not res!284175) (not e!279508))))

(declare-fun e!279518 () Bool)

(assert (=> b!475956 (= res!284175 e!279518)))

(declare-fun res!284170 () Bool)

(assert (=> b!475956 (=> res!284170 e!279518)))

(assert (=> b!475956 (= res!284170 (not e!279515))))

(declare-fun res!284177 () Bool)

(assert (=> b!475956 (=> (not res!284177) (not e!279515))))

(assert (=> b!475956 (= res!284177 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun d!75673 () Bool)

(assert (=> d!75673 e!279508))

(declare-fun res!284174 () Bool)

(assert (=> d!75673 (=> (not res!284174) (not e!279508))))

(assert (=> d!75673 (= res!284174 (or (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))))

(declare-fun lt!216891 () ListLongMap!7865)

(assert (=> d!75673 (= lt!216871 lt!216891)))

(declare-fun lt!216879 () Unit!14018)

(assert (=> d!75673 (= lt!216879 e!279510)))

(declare-fun c!57247 () Bool)

(declare-fun e!279512 () Bool)

(assert (=> d!75673 (= c!57247 e!279512)))

(declare-fun res!284178 () Bool)

(assert (=> d!75673 (=> (not res!284178) (not e!279512))))

(assert (=> d!75673 (= res!284178 (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> d!75673 (= lt!216891 e!279514)))

(assert (=> d!75673 (= c!57250 (and (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!75673 (validMask!0 mask!1365)))

(assert (=> d!75673 (= (getCurrentListMap!2289 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216871)))

(declare-fun b!475946 () Bool)

(declare-fun e!279513 () Bool)

(assert (=> b!475946 (= e!279518 e!279513)))

(declare-fun res!284176 () Bool)

(assert (=> b!475946 (=> (not res!284176) (not e!279513))))

(assert (=> b!475946 (= res!284176 (contains!2559 lt!216871 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475946 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475957 () Bool)

(assert (=> b!475957 (= e!279506 e!279517)))

(declare-fun res!284173 () Bool)

(assert (=> b!475957 (= res!284173 call!30651)))

(assert (=> b!475957 (=> (not res!284173) (not e!279517))))

(declare-fun bm!30647 () Bool)

(assert (=> bm!30647 (= call!30649 call!30646)))

(declare-fun b!475958 () Bool)

(assert (=> b!475958 (= e!279513 (= (apply!336 lt!216871 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)) (get!7167 (select (arr!14771 _values!833) #b00000000000000000000000000000000) (dynLambda!929 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!475958 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15123 _values!833)))))

(assert (=> b!475958 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(declare-fun b!475959 () Bool)

(assert (=> b!475959 (= e!279511 (= (apply!336 lt!216871 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!38))))

(declare-fun b!475960 () Bool)

(assert (=> b!475960 (= e!279509 call!30645)))

(declare-fun b!475961 () Bool)

(declare-fun Unit!14021 () Unit!14018)

(assert (=> b!475961 (= e!279510 Unit!14021)))

(declare-fun bm!30648 () Bool)

(assert (=> bm!30648 (= call!30645 call!30650)))

(declare-fun b!475962 () Bool)

(assert (=> b!475962 (= e!279512 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75673 c!57250) b!475948))

(assert (= (and d!75673 (not c!57250)) b!475952))

(assert (= (and b!475952 c!57251) b!475951))

(assert (= (and b!475952 (not c!57251)) b!475945))

(assert (= (and b!475945 c!57248) b!475954))

(assert (= (and b!475945 (not c!57248)) b!475960))

(assert (= (or b!475954 b!475960) bm!30648))

(assert (= (or b!475951 bm!30648) bm!30642))

(assert (= (or b!475951 b!475954) bm!30647))

(assert (= (or b!475948 bm!30642) bm!30645))

(assert (= (or b!475948 bm!30647) bm!30646))

(assert (= (and d!75673 res!284178) b!475962))

(assert (= (and d!75673 c!57247) b!475950))

(assert (= (and d!75673 (not c!57247)) b!475961))

(assert (= (and d!75673 res!284174) b!475956))

(assert (= (and b!475956 res!284177) b!475953))

(assert (= (and b!475956 (not res!284170)) b!475946))

(assert (= (and b!475946 res!284176) b!475958))

(assert (= (and b!475956 res!284175) b!475955))

(assert (= (and b!475955 c!57246) b!475957))

(assert (= (and b!475955 (not c!57246)) b!475943))

(assert (= (and b!475957 res!284173) b!475944))

(assert (= (or b!475957 b!475943) bm!30643))

(assert (= (and b!475955 res!284171) b!475947))

(assert (= (and b!475947 c!57249) b!475949))

(assert (= (and b!475947 (not c!57249)) b!475942))

(assert (= (and b!475949 res!284172) b!475959))

(assert (= (or b!475949 b!475942) bm!30644))

(declare-fun b_lambda!10303 () Bool)

(assert (=> (not b_lambda!10303) (not b!475958)))

(assert (=> b!475958 t!15010))

(declare-fun b_and!20571 () Bool)

(assert (= b_and!20569 (and (=> t!15010 result!7469) b_and!20571)))

(declare-fun m!458173 () Bool)

(assert (=> bm!30646 m!458173))

(assert (=> b!475962 m!458019))

(assert (=> b!475962 m!458019))

(assert (=> b!475962 m!458021))

(declare-fun m!458175 () Bool)

(assert (=> b!475959 m!458175))

(declare-fun m!458177 () Bool)

(assert (=> b!475950 m!458177))

(declare-fun m!458179 () Bool)

(assert (=> b!475950 m!458179))

(declare-fun m!458181 () Bool)

(assert (=> b!475950 m!458181))

(assert (=> b!475950 m!457969))

(assert (=> b!475950 m!458179))

(declare-fun m!458183 () Bool)

(assert (=> b!475950 m!458183))

(assert (=> b!475950 m!458183))

(declare-fun m!458185 () Bool)

(assert (=> b!475950 m!458185))

(declare-fun m!458187 () Bool)

(assert (=> b!475950 m!458187))

(declare-fun m!458189 () Bool)

(assert (=> b!475950 m!458189))

(declare-fun m!458191 () Bool)

(assert (=> b!475950 m!458191))

(declare-fun m!458193 () Bool)

(assert (=> b!475950 m!458193))

(declare-fun m!458195 () Bool)

(assert (=> b!475950 m!458195))

(declare-fun m!458197 () Bool)

(assert (=> b!475950 m!458197))

(declare-fun m!458199 () Bool)

(assert (=> b!475950 m!458199))

(declare-fun m!458201 () Bool)

(assert (=> b!475950 m!458201))

(assert (=> b!475950 m!458197))

(assert (=> b!475950 m!458019))

(assert (=> b!475950 m!458189))

(declare-fun m!458203 () Bool)

(assert (=> b!475950 m!458203))

(declare-fun m!458205 () Bool)

(assert (=> b!475950 m!458205))

(declare-fun m!458207 () Bool)

(assert (=> bm!30643 m!458207))

(assert (=> bm!30645 m!457969))

(assert (=> b!475946 m!458019))

(assert (=> b!475946 m!458019))

(declare-fun m!458209 () Bool)

(assert (=> b!475946 m!458209))

(assert (=> b!475953 m!458019))

(assert (=> b!475953 m!458019))

(assert (=> b!475953 m!458021))

(assert (=> d!75673 m!457959))

(assert (=> b!475958 m!458029))

(assert (=> b!475958 m!458027))

(assert (=> b!475958 m!458019))

(declare-fun m!458211 () Bool)

(assert (=> b!475958 m!458211))

(assert (=> b!475958 m!458019))

(assert (=> b!475958 m!458029))

(assert (=> b!475958 m!458027))

(assert (=> b!475958 m!458031))

(declare-fun m!458213 () Bool)

(assert (=> b!475944 m!458213))

(declare-fun m!458215 () Bool)

(assert (=> bm!30644 m!458215))

(declare-fun m!458217 () Bool)

(assert (=> b!475948 m!458217))

(assert (=> b!475771 d!75673))

(declare-fun b!475971 () Bool)

(declare-fun e!279526 () Bool)

(declare-fun e!279527 () Bool)

(assert (=> b!475971 (= e!279526 e!279527)))

(declare-fun lt!216900 () (_ BitVec 64))

(assert (=> b!475971 (= lt!216900 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216899 () Unit!14018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30709 (_ BitVec 64) (_ BitVec 32)) Unit!14018)

(assert (=> b!475971 (= lt!216899 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216900 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!475971 (arrayContainsKey!0 _keys!1025 lt!216900 #b00000000000000000000000000000000)))

(declare-fun lt!216901 () Unit!14018)

(assert (=> b!475971 (= lt!216901 lt!216899)))

(declare-fun res!284184 () Bool)

(declare-datatypes ((SeekEntryResult!3560 0))(
  ( (MissingZero!3560 (index!16419 (_ BitVec 32))) (Found!3560 (index!16420 (_ BitVec 32))) (Intermediate!3560 (undefined!4372 Bool) (index!16421 (_ BitVec 32)) (x!44664 (_ BitVec 32))) (Undefined!3560) (MissingVacant!3560 (index!16422 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30709 (_ BitVec 32)) SeekEntryResult!3560)

(assert (=> b!475971 (= res!284184 (= (seekEntryOrOpen!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3560 #b00000000000000000000000000000000)))))

(assert (=> b!475971 (=> (not res!284184) (not e!279527))))

(declare-fun b!475972 () Bool)

(declare-fun call!30654 () Bool)

(assert (=> b!475972 (= e!279526 call!30654)))

(declare-fun bm!30651 () Bool)

(assert (=> bm!30651 (= call!30654 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun d!75675 () Bool)

(declare-fun res!284183 () Bool)

(declare-fun e!279525 () Bool)

(assert (=> d!75675 (=> res!284183 e!279525)))

(assert (=> d!75675 (= res!284183 (bvsge #b00000000000000000000000000000000 (size!15122 _keys!1025)))))

(assert (=> d!75675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279525)))

(declare-fun b!475973 () Bool)

(assert (=> b!475973 (= e!279525 e!279526)))

(declare-fun c!57254 () Bool)

(assert (=> b!475973 (= c!57254 (validKeyInArray!0 (select (arr!14770 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475974 () Bool)

(assert (=> b!475974 (= e!279527 call!30654)))

(assert (= (and d!75675 (not res!284183)) b!475973))

(assert (= (and b!475973 c!57254) b!475971))

(assert (= (and b!475973 (not c!57254)) b!475972))

(assert (= (and b!475971 res!284184) b!475974))

(assert (= (or b!475974 b!475972) bm!30651))

(assert (=> b!475971 m!458019))

(declare-fun m!458219 () Bool)

(assert (=> b!475971 m!458219))

(declare-fun m!458221 () Bool)

(assert (=> b!475971 m!458221))

(assert (=> b!475971 m!458019))

(declare-fun m!458223 () Bool)

(assert (=> b!475971 m!458223))

(declare-fun m!458225 () Bool)

(assert (=> bm!30651 m!458225))

(assert (=> b!475973 m!458019))

(assert (=> b!475973 m!458019))

(assert (=> b!475973 m!458021))

(assert (=> b!475775 d!75675))

(declare-fun condMapEmpty!21958 () Bool)

(declare-fun mapDefault!21958 () ValueCell!6399)

(assert (=> mapNonEmpty!21952 (= condMapEmpty!21958 (= mapRest!21952 ((as const (Array (_ BitVec 32) ValueCell!6399)) mapDefault!21958)))))

(declare-fun e!279533 () Bool)

(declare-fun mapRes!21958 () Bool)

(assert (=> mapNonEmpty!21952 (= tp!42216 (and e!279533 mapRes!21958))))

(declare-fun mapIsEmpty!21958 () Bool)

(assert (=> mapIsEmpty!21958 mapRes!21958))

(declare-fun b!475981 () Bool)

(declare-fun e!279532 () Bool)

(assert (=> b!475981 (= e!279532 tp_is_empty!13485)))

(declare-fun mapNonEmpty!21958 () Bool)

(declare-fun tp!42226 () Bool)

(assert (=> mapNonEmpty!21958 (= mapRes!21958 (and tp!42226 e!279532))))

(declare-fun mapValue!21958 () ValueCell!6399)

(declare-fun mapKey!21958 () (_ BitVec 32))

(declare-fun mapRest!21958 () (Array (_ BitVec 32) ValueCell!6399))

(assert (=> mapNonEmpty!21958 (= mapRest!21952 (store mapRest!21958 mapKey!21958 mapValue!21958))))

(declare-fun b!475982 () Bool)

(assert (=> b!475982 (= e!279533 tp_is_empty!13485)))

(assert (= (and mapNonEmpty!21952 condMapEmpty!21958) mapIsEmpty!21958))

(assert (= (and mapNonEmpty!21952 (not condMapEmpty!21958)) mapNonEmpty!21958))

(assert (= (and mapNonEmpty!21958 ((_ is ValueCellFull!6399) mapValue!21958)) b!475981))

(assert (= (and mapNonEmpty!21952 ((_ is ValueCellFull!6399) mapDefault!21958)) b!475982))

(declare-fun m!458227 () Bool)

(assert (=> mapNonEmpty!21958 m!458227))

(declare-fun b_lambda!10305 () Bool)

(assert (= b_lambda!10301 (or (and start!42652 b_free!12057) b_lambda!10305)))

(declare-fun b_lambda!10307 () Bool)

(assert (= b_lambda!10293 (or (and start!42652 b_free!12057) b_lambda!10307)))

(declare-fun b_lambda!10309 () Bool)

(assert (= b_lambda!10299 (or (and start!42652 b_free!12057) b_lambda!10309)))

(declare-fun b_lambda!10311 () Bool)

(assert (= b_lambda!10297 (or (and start!42652 b_free!12057) b_lambda!10311)))

(declare-fun b_lambda!10313 () Bool)

(assert (= b_lambda!10295 (or (and start!42652 b_free!12057) b_lambda!10313)))

(declare-fun b_lambda!10315 () Bool)

(assert (= b_lambda!10303 (or (and start!42652 b_free!12057) b_lambda!10315)))

(check-sat (not mapNonEmpty!21958) (not bm!30616) (not b!475959) (not d!75671) (not b_lambda!10307) (not bm!30646) (not b!475917) (not b!475939) (not b!475941) (not b!475934) (not b!475915) b_and!20571 (not b_lambda!10311) (not b!475835) (not b!475826) (not b!475948) (not d!75665) tp_is_empty!13485 (not b!475828) (not b!475920) (not b!475862) (not b!475950) (not b!475834) (not b!475850) (not bm!30637) (not d!75673) (not b!475847) (not b!475925) (not b!475840) (not d!75669) (not d!75647) (not b!475926) (not b!475841) (not b!475973) (not b!475832) (not b!475865) (not b!475938) (not b!475836) (not b!475944) (not b!475935) (not bm!30638) (not b!475848) (not bm!30636) (not d!75667) (not b_next!12057) (not b_lambda!10313) (not bm!30643) (not b!475913) (not b!475953) (not b!475911) (not bm!30639) (not b_lambda!10305) (not bm!30651) (not b!475827) (not b_lambda!10315) (not bm!30617) (not b!475936) (not b!475929) (not d!75661) (not d!75649) (not b!475846) (not b!475937) (not b!475833) (not b!475864) (not b!475958) (not bm!30620) (not b!475946) (not b!475940) (not b!475842) (not d!75651) (not bm!30644) (not b_lambda!10309) (not d!75663) (not b!475971) (not bm!30645) (not b!475849) (not b!475962))
(check-sat b_and!20571 (not b_next!12057))
