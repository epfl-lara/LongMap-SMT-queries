; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105522 () Bool)

(assert start!105522)

(declare-fun b_free!27159 () Bool)

(declare-fun b_next!27159 () Bool)

(assert (=> start!105522 (= b_free!27159 (not b_next!27159))))

(declare-fun tp!94993 () Bool)

(declare-fun b_and!45015 () Bool)

(assert (=> start!105522 (= tp!94993 b_and!45015)))

(declare-fun b!1257220 () Bool)

(declare-fun res!838095 () Bool)

(declare-fun e!714865 () Bool)

(assert (=> b!1257220 (=> (not res!838095) (not e!714865))))

(declare-datatypes ((array!81756 0))(
  ( (array!81757 (arr!39436 (Array (_ BitVec 32) (_ BitVec 64))) (size!39972 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81756)

(declare-datatypes ((List!28006 0))(
  ( (Nil!28003) (Cons!28002 (h!29211 (_ BitVec 64)) (t!41495 List!28006)) )
))
(declare-fun arrayNoDuplicates!0 (array!81756 (_ BitVec 32) List!28006) Bool)

(assert (=> b!1257220 (= res!838095 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28003))))

(declare-fun b!1257221 () Bool)

(declare-fun res!838093 () Bool)

(assert (=> b!1257221 (=> (not res!838093) (not e!714865))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!48113 0))(
  ( (V!48114 (val!16093 Int)) )
))
(declare-datatypes ((ValueCell!15267 0))(
  ( (ValueCellFull!15267 (v!18794 V!48113)) (EmptyCell!15267) )
))
(declare-datatypes ((array!81758 0))(
  ( (array!81759 (arr!39437 (Array (_ BitVec 32) ValueCell!15267)) (size!39973 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81758)

(assert (=> b!1257221 (= res!838093 (and (= (size!39973 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39972 _keys!1118) (size!39973 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49879 () Bool)

(declare-fun mapRes!49879 () Bool)

(declare-fun tp!94994 () Bool)

(declare-fun e!714869 () Bool)

(assert (=> mapNonEmpty!49879 (= mapRes!49879 (and tp!94994 e!714869))))

(declare-fun mapRest!49879 () (Array (_ BitVec 32) ValueCell!15267))

(declare-fun mapValue!49879 () ValueCell!15267)

(declare-fun mapKey!49879 () (_ BitVec 32))

(assert (=> mapNonEmpty!49879 (= (arr!39437 _values!914) (store mapRest!49879 mapKey!49879 mapValue!49879))))

(declare-fun b!1257222 () Bool)

(declare-fun e!714864 () Bool)

(declare-fun e!714867 () Bool)

(assert (=> b!1257222 (= e!714864 e!714867)))

(declare-fun res!838098 () Bool)

(assert (=> b!1257222 (=> res!838098 e!714867)))

(declare-datatypes ((tuple2!20792 0))(
  ( (tuple2!20793 (_1!10407 (_ BitVec 64)) (_2!10407 V!48113)) )
))
(declare-datatypes ((List!28007 0))(
  ( (Nil!28004) (Cons!28003 (h!29212 tuple2!20792) (t!41496 List!28007)) )
))
(declare-datatypes ((ListLongMap!18665 0))(
  ( (ListLongMap!18666 (toList!9348 List!28007)) )
))
(declare-fun lt!568590 () ListLongMap!18665)

(declare-fun contains!7564 (ListLongMap!18665 (_ BitVec 64)) Bool)

(assert (=> b!1257222 (= res!838098 (contains!7564 lt!568590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48113)

(declare-fun minValueBefore!43 () V!48113)

(declare-fun getCurrentListMap!4569 (array!81756 array!81758 (_ BitVec 32) (_ BitVec 32) V!48113 V!48113 (_ BitVec 32) Int) ListLongMap!18665)

(assert (=> b!1257222 (= lt!568590 (getCurrentListMap!4569 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257223 () Bool)

(declare-fun e!714870 () Bool)

(declare-fun tp_is_empty!32061 () Bool)

(assert (=> b!1257223 (= e!714870 tp_is_empty!32061)))

(declare-fun b!1257224 () Bool)

(assert (=> b!1257224 (= e!714869 tp_is_empty!32061)))

(declare-fun b!1257225 () Bool)

(assert (=> b!1257225 (= e!714865 (not e!714864))))

(declare-fun res!838094 () Bool)

(assert (=> b!1257225 (=> res!838094 e!714864)))

(assert (=> b!1257225 (= res!838094 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!568588 () ListLongMap!18665)

(declare-fun lt!568592 () ListLongMap!18665)

(assert (=> b!1257225 (= lt!568588 lt!568592)))

(declare-fun minValueAfter!43 () V!48113)

(declare-datatypes ((Unit!41880 0))(
  ( (Unit!41881) )
))
(declare-fun lt!568591 () Unit!41880)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1091 (array!81756 array!81758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48113 V!48113 V!48113 V!48113 (_ BitVec 32) Int) Unit!41880)

(assert (=> b!1257225 (= lt!568591 (lemmaNoChangeToArrayThenSameMapNoExtras!1091 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5727 (array!81756 array!81758 (_ BitVec 32) (_ BitVec 32) V!48113 V!48113 (_ BitVec 32) Int) ListLongMap!18665)

(assert (=> b!1257225 (= lt!568592 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257225 (= lt!568588 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838096 () Bool)

(assert (=> start!105522 (=> (not res!838096) (not e!714865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105522 (= res!838096 (validMask!0 mask!1466))))

(assert (=> start!105522 e!714865))

(assert (=> start!105522 true))

(assert (=> start!105522 tp!94993))

(assert (=> start!105522 tp_is_empty!32061))

(declare-fun array_inv!30041 (array!81756) Bool)

(assert (=> start!105522 (array_inv!30041 _keys!1118)))

(declare-fun e!714866 () Bool)

(declare-fun array_inv!30042 (array!81758) Bool)

(assert (=> start!105522 (and (array_inv!30042 _values!914) e!714866)))

(declare-fun b!1257226 () Bool)

(declare-fun res!838097 () Bool)

(assert (=> b!1257226 (=> (not res!838097) (not e!714865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81756 (_ BitVec 32)) Bool)

(assert (=> b!1257226 (= res!838097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49879 () Bool)

(assert (=> mapIsEmpty!49879 mapRes!49879))

(declare-fun b!1257227 () Bool)

(assert (=> b!1257227 (= e!714866 (and e!714870 mapRes!49879))))

(declare-fun condMapEmpty!49879 () Bool)

(declare-fun mapDefault!49879 () ValueCell!15267)

(assert (=> b!1257227 (= condMapEmpty!49879 (= (arr!39437 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15267)) mapDefault!49879)))))

(declare-fun b!1257228 () Bool)

(assert (=> b!1257228 (= e!714867 (bvsle #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun -!2095 (ListLongMap!18665 (_ BitVec 64)) ListLongMap!18665)

(assert (=> b!1257228 (= (-!2095 lt!568590 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568590)))

(declare-fun lt!568589 () Unit!41880)

(declare-fun removeNotPresentStillSame!148 (ListLongMap!18665 (_ BitVec 64)) Unit!41880)

(assert (=> b!1257228 (= lt!568589 (removeNotPresentStillSame!148 lt!568590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!105522 res!838096) b!1257221))

(assert (= (and b!1257221 res!838093) b!1257226))

(assert (= (and b!1257226 res!838097) b!1257220))

(assert (= (and b!1257220 res!838095) b!1257225))

(assert (= (and b!1257225 (not res!838094)) b!1257222))

(assert (= (and b!1257222 (not res!838098)) b!1257228))

(assert (= (and b!1257227 condMapEmpty!49879) mapIsEmpty!49879))

(assert (= (and b!1257227 (not condMapEmpty!49879)) mapNonEmpty!49879))

(get-info :version)

(assert (= (and mapNonEmpty!49879 ((_ is ValueCellFull!15267) mapValue!49879)) b!1257224))

(assert (= (and b!1257227 ((_ is ValueCellFull!15267) mapDefault!49879)) b!1257223))

(assert (= start!105522 b!1257227))

(declare-fun m!1157839 () Bool)

(assert (=> b!1257222 m!1157839))

(declare-fun m!1157841 () Bool)

(assert (=> b!1257222 m!1157841))

(declare-fun m!1157843 () Bool)

(assert (=> b!1257220 m!1157843))

(declare-fun m!1157845 () Bool)

(assert (=> b!1257226 m!1157845))

(declare-fun m!1157847 () Bool)

(assert (=> b!1257225 m!1157847))

(declare-fun m!1157849 () Bool)

(assert (=> b!1257225 m!1157849))

(declare-fun m!1157851 () Bool)

(assert (=> b!1257225 m!1157851))

(declare-fun m!1157853 () Bool)

(assert (=> b!1257228 m!1157853))

(declare-fun m!1157855 () Bool)

(assert (=> b!1257228 m!1157855))

(declare-fun m!1157857 () Bool)

(assert (=> mapNonEmpty!49879 m!1157857))

(declare-fun m!1157859 () Bool)

(assert (=> start!105522 m!1157859))

(declare-fun m!1157861 () Bool)

(assert (=> start!105522 m!1157861))

(declare-fun m!1157863 () Bool)

(assert (=> start!105522 m!1157863))

(check-sat (not b_next!27159) (not b!1257226) (not b!1257222) (not b!1257225) (not start!105522) tp_is_empty!32061 b_and!45015 (not mapNonEmpty!49879) (not b!1257220) (not b!1257228))
(check-sat b_and!45015 (not b_next!27159))
(get-model)

(declare-fun d!138227 () Bool)

(assert (=> d!138227 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105522 d!138227))

(declare-fun d!138229 () Bool)

(assert (=> d!138229 (= (array_inv!30041 _keys!1118) (bvsge (size!39972 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105522 d!138229))

(declare-fun d!138231 () Bool)

(assert (=> d!138231 (= (array_inv!30042 _values!914) (bvsge (size!39973 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105522 d!138231))

(declare-fun d!138233 () Bool)

(declare-fun lt!568610 () ListLongMap!18665)

(assert (=> d!138233 (not (contains!7564 lt!568610 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!141 (List!28007 (_ BitVec 64)) List!28007)

(assert (=> d!138233 (= lt!568610 (ListLongMap!18666 (removeStrictlySorted!141 (toList!9348 lt!568590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138233 (= (-!2095 lt!568590 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568610)))

(declare-fun bs!35549 () Bool)

(assert (= bs!35549 d!138233))

(declare-fun m!1157891 () Bool)

(assert (=> bs!35549 m!1157891))

(declare-fun m!1157893 () Bool)

(assert (=> bs!35549 m!1157893))

(assert (=> b!1257228 d!138233))

(declare-fun d!138235 () Bool)

(assert (=> d!138235 (= (-!2095 lt!568590 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568590)))

(declare-fun lt!568613 () Unit!41880)

(declare-fun choose!1860 (ListLongMap!18665 (_ BitVec 64)) Unit!41880)

(assert (=> d!138235 (= lt!568613 (choose!1860 lt!568590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138235 (not (contains!7564 lt!568590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138235 (= (removeNotPresentStillSame!148 lt!568590 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568613)))

(declare-fun bs!35550 () Bool)

(assert (= bs!35550 d!138235))

(assert (=> bs!35550 m!1157853))

(declare-fun m!1157895 () Bool)

(assert (=> bs!35550 m!1157895))

(assert (=> bs!35550 m!1157839))

(assert (=> b!1257228 d!138235))

(declare-fun d!138237 () Bool)

(declare-fun e!714896 () Bool)

(assert (=> d!138237 e!714896))

(declare-fun res!838119 () Bool)

(assert (=> d!138237 (=> res!838119 e!714896)))

(declare-fun lt!568624 () Bool)

(assert (=> d!138237 (= res!838119 (not lt!568624))))

(declare-fun lt!568625 () Bool)

(assert (=> d!138237 (= lt!568624 lt!568625)))

(declare-fun lt!568623 () Unit!41880)

(declare-fun e!714897 () Unit!41880)

(assert (=> d!138237 (= lt!568623 e!714897)))

(declare-fun c!122454 () Bool)

(assert (=> d!138237 (= c!122454 lt!568625)))

(declare-fun containsKey!621 (List!28007 (_ BitVec 64)) Bool)

(assert (=> d!138237 (= lt!568625 (containsKey!621 (toList!9348 lt!568590) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138237 (= (contains!7564 lt!568590 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568624)))

(declare-fun b!1257262 () Bool)

(declare-fun lt!568622 () Unit!41880)

(assert (=> b!1257262 (= e!714897 lt!568622)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!430 (List!28007 (_ BitVec 64)) Unit!41880)

(assert (=> b!1257262 (= lt!568622 (lemmaContainsKeyImpliesGetValueByKeyDefined!430 (toList!9348 lt!568590) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!708 0))(
  ( (Some!707 (v!18796 V!48113)) (None!706) )
))
(declare-fun isDefined!469 (Option!708) Bool)

(declare-fun getValueByKey!657 (List!28007 (_ BitVec 64)) Option!708)

(assert (=> b!1257262 (isDefined!469 (getValueByKey!657 (toList!9348 lt!568590) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257263 () Bool)

(declare-fun Unit!41882 () Unit!41880)

(assert (=> b!1257263 (= e!714897 Unit!41882)))

(declare-fun b!1257264 () Bool)

(assert (=> b!1257264 (= e!714896 (isDefined!469 (getValueByKey!657 (toList!9348 lt!568590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138237 c!122454) b!1257262))

(assert (= (and d!138237 (not c!122454)) b!1257263))

(assert (= (and d!138237 (not res!838119)) b!1257264))

(declare-fun m!1157897 () Bool)

(assert (=> d!138237 m!1157897))

(declare-fun m!1157899 () Bool)

(assert (=> b!1257262 m!1157899))

(declare-fun m!1157901 () Bool)

(assert (=> b!1257262 m!1157901))

(assert (=> b!1257262 m!1157901))

(declare-fun m!1157903 () Bool)

(assert (=> b!1257262 m!1157903))

(assert (=> b!1257264 m!1157901))

(assert (=> b!1257264 m!1157901))

(assert (=> b!1257264 m!1157903))

(assert (=> b!1257222 d!138237))

(declare-fun d!138239 () Bool)

(declare-fun e!714927 () Bool)

(assert (=> d!138239 e!714927))

(declare-fun res!838144 () Bool)

(assert (=> d!138239 (=> (not res!838144) (not e!714927))))

(assert (=> d!138239 (= res!838144 (or (bvsge #b00000000000000000000000000000000 (size!39972 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))))

(declare-fun lt!568683 () ListLongMap!18665)

(declare-fun lt!568681 () ListLongMap!18665)

(assert (=> d!138239 (= lt!568683 lt!568681)))

(declare-fun lt!568687 () Unit!41880)

(declare-fun e!714936 () Unit!41880)

(assert (=> d!138239 (= lt!568687 e!714936)))

(declare-fun c!122472 () Bool)

(declare-fun e!714934 () Bool)

(assert (=> d!138239 (= c!122472 e!714934)))

(declare-fun res!838142 () Bool)

(assert (=> d!138239 (=> (not res!838142) (not e!714934))))

(assert (=> d!138239 (= res!838142 (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun e!714933 () ListLongMap!18665)

(assert (=> d!138239 (= lt!568681 e!714933)))

(declare-fun c!122468 () Bool)

(assert (=> d!138239 (= c!122468 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138239 (validMask!0 mask!1466)))

(assert (=> d!138239 (= (getCurrentListMap!4569 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568683)))

(declare-fun b!1257307 () Bool)

(declare-fun c!122470 () Bool)

(assert (=> b!1257307 (= c!122470 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!714929 () ListLongMap!18665)

(declare-fun e!714930 () ListLongMap!18665)

(assert (=> b!1257307 (= e!714929 e!714930)))

(declare-fun bm!61820 () Bool)

(declare-fun call!61829 () Bool)

(assert (=> bm!61820 (= call!61829 (contains!7564 lt!568683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257308 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1257308 (= e!714934 (validKeyInArray!0 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257309 () Bool)

(declare-fun e!714926 () Bool)

(declare-fun apply!989 (ListLongMap!18665 (_ BitVec 64)) V!48113)

(assert (=> b!1257309 (= e!714926 (= (apply!989 lt!568683 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun c!122469 () Bool)

(declare-fun call!61825 () ListLongMap!18665)

(declare-fun call!61828 () ListLongMap!18665)

(declare-fun call!61827 () ListLongMap!18665)

(declare-fun bm!61821 () Bool)

(declare-fun call!61826 () ListLongMap!18665)

(declare-fun +!4188 (ListLongMap!18665 tuple2!20792) ListLongMap!18665)

(assert (=> bm!61821 (= call!61827 (+!4188 (ite c!122468 call!61826 (ite c!122469 call!61825 call!61828)) (ite (or c!122468 c!122469) (tuple2!20793 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20793 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun bm!61822 () Bool)

(assert (=> bm!61822 (= call!61826 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257310 () Bool)

(declare-fun e!714935 () Bool)

(declare-fun e!714925 () Bool)

(assert (=> b!1257310 (= e!714935 e!714925)))

(declare-fun res!838145 () Bool)

(assert (=> b!1257310 (=> (not res!838145) (not e!714925))))

(assert (=> b!1257310 (= res!838145 (contains!7564 lt!568683 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257310 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun b!1257311 () Bool)

(assert (=> b!1257311 (= e!714930 call!61828)))

(declare-fun bm!61823 () Bool)

(declare-fun call!61823 () ListLongMap!18665)

(assert (=> bm!61823 (= call!61823 call!61827)))

(declare-fun bm!61824 () Bool)

(assert (=> bm!61824 (= call!61825 call!61826)))

(declare-fun b!1257312 () Bool)

(declare-fun e!714924 () Bool)

(assert (=> b!1257312 (= e!714924 (validKeyInArray!0 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257313 () Bool)

(declare-fun e!714931 () Bool)

(declare-fun e!714928 () Bool)

(assert (=> b!1257313 (= e!714931 e!714928)))

(declare-fun res!838146 () Bool)

(assert (=> b!1257313 (= res!838146 call!61829)))

(assert (=> b!1257313 (=> (not res!838146) (not e!714928))))

(declare-fun bm!61825 () Bool)

(assert (=> bm!61825 (= call!61828 call!61825)))

(declare-fun b!1257314 () Bool)

(assert (=> b!1257314 (= e!714933 e!714929)))

(assert (=> b!1257314 (= c!122469 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!61826 () Bool)

(declare-fun call!61824 () Bool)

(assert (=> bm!61826 (= call!61824 (contains!7564 lt!568683 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257315 () Bool)

(declare-fun res!838138 () Bool)

(assert (=> b!1257315 (=> (not res!838138) (not e!714927))))

(assert (=> b!1257315 (= res!838138 e!714931)))

(declare-fun c!122467 () Bool)

(assert (=> b!1257315 (= c!122467 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1257316 () Bool)

(declare-fun lt!568674 () Unit!41880)

(assert (=> b!1257316 (= e!714936 lt!568674)))

(declare-fun lt!568691 () ListLongMap!18665)

(assert (=> b!1257316 (= lt!568691 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568675 () (_ BitVec 64))

(assert (=> b!1257316 (= lt!568675 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568679 () (_ BitVec 64))

(assert (=> b!1257316 (= lt!568679 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568670 () Unit!41880)

(declare-fun addStillContains!1081 (ListLongMap!18665 (_ BitVec 64) V!48113 (_ BitVec 64)) Unit!41880)

(assert (=> b!1257316 (= lt!568670 (addStillContains!1081 lt!568691 lt!568675 zeroValue!871 lt!568679))))

(assert (=> b!1257316 (contains!7564 (+!4188 lt!568691 (tuple2!20793 lt!568675 zeroValue!871)) lt!568679)))

(declare-fun lt!568671 () Unit!41880)

(assert (=> b!1257316 (= lt!568671 lt!568670)))

(declare-fun lt!568685 () ListLongMap!18665)

(assert (=> b!1257316 (= lt!568685 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568678 () (_ BitVec 64))

(assert (=> b!1257316 (= lt!568678 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568672 () (_ BitVec 64))

(assert (=> b!1257316 (= lt!568672 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568680 () Unit!41880)

(declare-fun addApplyDifferent!535 (ListLongMap!18665 (_ BitVec 64) V!48113 (_ BitVec 64)) Unit!41880)

(assert (=> b!1257316 (= lt!568680 (addApplyDifferent!535 lt!568685 lt!568678 minValueBefore!43 lt!568672))))

(assert (=> b!1257316 (= (apply!989 (+!4188 lt!568685 (tuple2!20793 lt!568678 minValueBefore!43)) lt!568672) (apply!989 lt!568685 lt!568672))))

(declare-fun lt!568684 () Unit!41880)

(assert (=> b!1257316 (= lt!568684 lt!568680)))

(declare-fun lt!568689 () ListLongMap!18665)

(assert (=> b!1257316 (= lt!568689 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568682 () (_ BitVec 64))

(assert (=> b!1257316 (= lt!568682 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568688 () (_ BitVec 64))

(assert (=> b!1257316 (= lt!568688 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568677 () Unit!41880)

(assert (=> b!1257316 (= lt!568677 (addApplyDifferent!535 lt!568689 lt!568682 zeroValue!871 lt!568688))))

(assert (=> b!1257316 (= (apply!989 (+!4188 lt!568689 (tuple2!20793 lt!568682 zeroValue!871)) lt!568688) (apply!989 lt!568689 lt!568688))))

(declare-fun lt!568690 () Unit!41880)

(assert (=> b!1257316 (= lt!568690 lt!568677)))

(declare-fun lt!568673 () ListLongMap!18665)

(assert (=> b!1257316 (= lt!568673 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568676 () (_ BitVec 64))

(assert (=> b!1257316 (= lt!568676 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!568686 () (_ BitVec 64))

(assert (=> b!1257316 (= lt!568686 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1257316 (= lt!568674 (addApplyDifferent!535 lt!568673 lt!568676 minValueBefore!43 lt!568686))))

(assert (=> b!1257316 (= (apply!989 (+!4188 lt!568673 (tuple2!20793 lt!568676 minValueBefore!43)) lt!568686) (apply!989 lt!568673 lt!568686))))

(declare-fun b!1257317 () Bool)

(declare-fun Unit!41883 () Unit!41880)

(assert (=> b!1257317 (= e!714936 Unit!41883)))

(declare-fun b!1257318 () Bool)

(assert (=> b!1257318 (= e!714928 (= (apply!989 lt!568683 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1257319 () Bool)

(declare-fun e!714932 () Bool)

(assert (=> b!1257319 (= e!714927 e!714932)))

(declare-fun c!122471 () Bool)

(assert (=> b!1257319 (= c!122471 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257320 () Bool)

(assert (=> b!1257320 (= e!714933 (+!4188 call!61827 (tuple2!20793 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun b!1257321 () Bool)

(assert (=> b!1257321 (= e!714932 (not call!61824))))

(declare-fun b!1257322 () Bool)

(declare-fun res!838143 () Bool)

(assert (=> b!1257322 (=> (not res!838143) (not e!714927))))

(assert (=> b!1257322 (= res!838143 e!714935)))

(declare-fun res!838140 () Bool)

(assert (=> b!1257322 (=> res!838140 e!714935)))

(assert (=> b!1257322 (= res!838140 (not e!714924))))

(declare-fun res!838139 () Bool)

(assert (=> b!1257322 (=> (not res!838139) (not e!714924))))

(assert (=> b!1257322 (= res!838139 (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun b!1257323 () Bool)

(declare-fun get!20160 (ValueCell!15267 V!48113) V!48113)

(declare-fun dynLambda!3387 (Int (_ BitVec 64)) V!48113)

(assert (=> b!1257323 (= e!714925 (= (apply!989 lt!568683 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)) (get!20160 (select (arr!39437 _values!914) #b00000000000000000000000000000000) (dynLambda!3387 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1257323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39973 _values!914)))))

(assert (=> b!1257323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun b!1257324 () Bool)

(assert (=> b!1257324 (= e!714932 e!714926)))

(declare-fun res!838141 () Bool)

(assert (=> b!1257324 (= res!838141 call!61824)))

(assert (=> b!1257324 (=> (not res!838141) (not e!714926))))

(declare-fun b!1257325 () Bool)

(assert (=> b!1257325 (= e!714930 call!61823)))

(declare-fun b!1257326 () Bool)

(assert (=> b!1257326 (= e!714929 call!61823)))

(declare-fun b!1257327 () Bool)

(assert (=> b!1257327 (= e!714931 (not call!61829))))

(assert (= (and d!138239 c!122468) b!1257320))

(assert (= (and d!138239 (not c!122468)) b!1257314))

(assert (= (and b!1257314 c!122469) b!1257326))

(assert (= (and b!1257314 (not c!122469)) b!1257307))

(assert (= (and b!1257307 c!122470) b!1257325))

(assert (= (and b!1257307 (not c!122470)) b!1257311))

(assert (= (or b!1257325 b!1257311) bm!61825))

(assert (= (or b!1257326 bm!61825) bm!61824))

(assert (= (or b!1257326 b!1257325) bm!61823))

(assert (= (or b!1257320 bm!61824) bm!61822))

(assert (= (or b!1257320 bm!61823) bm!61821))

(assert (= (and d!138239 res!838142) b!1257308))

(assert (= (and d!138239 c!122472) b!1257316))

(assert (= (and d!138239 (not c!122472)) b!1257317))

(assert (= (and d!138239 res!838144) b!1257322))

(assert (= (and b!1257322 res!838139) b!1257312))

(assert (= (and b!1257322 (not res!838140)) b!1257310))

(assert (= (and b!1257310 res!838145) b!1257323))

(assert (= (and b!1257322 res!838143) b!1257315))

(assert (= (and b!1257315 c!122467) b!1257313))

(assert (= (and b!1257315 (not c!122467)) b!1257327))

(assert (= (and b!1257313 res!838146) b!1257318))

(assert (= (or b!1257313 b!1257327) bm!61820))

(assert (= (and b!1257315 res!838138) b!1257319))

(assert (= (and b!1257319 c!122471) b!1257324))

(assert (= (and b!1257319 (not c!122471)) b!1257321))

(assert (= (and b!1257324 res!838141) b!1257309))

(assert (= (or b!1257324 b!1257321) bm!61826))

(declare-fun b_lambda!22687 () Bool)

(assert (=> (not b_lambda!22687) (not b!1257323)))

(declare-fun t!41499 () Bool)

(declare-fun tb!11305 () Bool)

(assert (=> (and start!105522 (= defaultEntry!922 defaultEntry!922) t!41499) tb!11305))

(declare-fun result!23323 () Bool)

(assert (=> tb!11305 (= result!23323 tp_is_empty!32061)))

(assert (=> b!1257323 t!41499))

(declare-fun b_and!45019 () Bool)

(assert (= b_and!45015 (and (=> t!41499 result!23323) b_and!45019)))

(assert (=> bm!61822 m!1157851))

(declare-fun m!1157905 () Bool)

(assert (=> b!1257312 m!1157905))

(assert (=> b!1257312 m!1157905))

(declare-fun m!1157907 () Bool)

(assert (=> b!1257312 m!1157907))

(declare-fun m!1157909 () Bool)

(assert (=> b!1257316 m!1157909))

(declare-fun m!1157911 () Bool)

(assert (=> b!1257316 m!1157911))

(declare-fun m!1157913 () Bool)

(assert (=> b!1257316 m!1157913))

(declare-fun m!1157915 () Bool)

(assert (=> b!1257316 m!1157915))

(declare-fun m!1157917 () Bool)

(assert (=> b!1257316 m!1157917))

(declare-fun m!1157919 () Bool)

(assert (=> b!1257316 m!1157919))

(declare-fun m!1157921 () Bool)

(assert (=> b!1257316 m!1157921))

(declare-fun m!1157923 () Bool)

(assert (=> b!1257316 m!1157923))

(assert (=> b!1257316 m!1157851))

(assert (=> b!1257316 m!1157919))

(declare-fun m!1157925 () Bool)

(assert (=> b!1257316 m!1157925))

(declare-fun m!1157927 () Bool)

(assert (=> b!1257316 m!1157927))

(declare-fun m!1157929 () Bool)

(assert (=> b!1257316 m!1157929))

(assert (=> b!1257316 m!1157905))

(declare-fun m!1157931 () Bool)

(assert (=> b!1257316 m!1157931))

(assert (=> b!1257316 m!1157909))

(declare-fun m!1157933 () Bool)

(assert (=> b!1257316 m!1157933))

(assert (=> b!1257316 m!1157915))

(declare-fun m!1157935 () Bool)

(assert (=> b!1257316 m!1157935))

(declare-fun m!1157937 () Bool)

(assert (=> b!1257316 m!1157937))

(assert (=> b!1257316 m!1157935))

(declare-fun m!1157939 () Bool)

(assert (=> bm!61826 m!1157939))

(declare-fun m!1157941 () Bool)

(assert (=> b!1257309 m!1157941))

(declare-fun m!1157943 () Bool)

(assert (=> b!1257318 m!1157943))

(assert (=> b!1257310 m!1157905))

(assert (=> b!1257310 m!1157905))

(declare-fun m!1157945 () Bool)

(assert (=> b!1257310 m!1157945))

(assert (=> d!138239 m!1157859))

(declare-fun m!1157947 () Bool)

(assert (=> b!1257323 m!1157947))

(declare-fun m!1157949 () Bool)

(assert (=> b!1257323 m!1157949))

(declare-fun m!1157951 () Bool)

(assert (=> b!1257323 m!1157951))

(assert (=> b!1257323 m!1157947))

(assert (=> b!1257323 m!1157905))

(declare-fun m!1157953 () Bool)

(assert (=> b!1257323 m!1157953))

(assert (=> b!1257323 m!1157949))

(assert (=> b!1257323 m!1157905))

(declare-fun m!1157955 () Bool)

(assert (=> bm!61821 m!1157955))

(declare-fun m!1157957 () Bool)

(assert (=> bm!61820 m!1157957))

(declare-fun m!1157959 () Bool)

(assert (=> b!1257320 m!1157959))

(assert (=> b!1257308 m!1157905))

(assert (=> b!1257308 m!1157905))

(assert (=> b!1257308 m!1157907))

(assert (=> b!1257222 d!138239))

(declare-fun d!138241 () Bool)

(declare-fun res!838151 () Bool)

(declare-fun e!714943 () Bool)

(assert (=> d!138241 (=> res!838151 e!714943)))

(assert (=> d!138241 (= res!838151 (bvsge #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(assert (=> d!138241 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!714943)))

(declare-fun b!1257338 () Bool)

(declare-fun e!714944 () Bool)

(declare-fun call!61832 () Bool)

(assert (=> b!1257338 (= e!714944 call!61832)))

(declare-fun b!1257339 () Bool)

(declare-fun e!714945 () Bool)

(assert (=> b!1257339 (= e!714945 e!714944)))

(declare-fun lt!568700 () (_ BitVec 64))

(assert (=> b!1257339 (= lt!568700 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!568698 () Unit!41880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81756 (_ BitVec 64) (_ BitVec 32)) Unit!41880)

(assert (=> b!1257339 (= lt!568698 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!568700 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1257339 (arrayContainsKey!0 _keys!1118 lt!568700 #b00000000000000000000000000000000)))

(declare-fun lt!568699 () Unit!41880)

(assert (=> b!1257339 (= lt!568699 lt!568698)))

(declare-fun res!838152 () Bool)

(declare-datatypes ((SeekEntryResult!9967 0))(
  ( (MissingZero!9967 (index!42239 (_ BitVec 32))) (Found!9967 (index!42240 (_ BitVec 32))) (Intermediate!9967 (undefined!10779 Bool) (index!42241 (_ BitVec 32)) (x!110717 (_ BitVec 32))) (Undefined!9967) (MissingVacant!9967 (index!42242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81756 (_ BitVec 32)) SeekEntryResult!9967)

(assert (=> b!1257339 (= res!838152 (= (seekEntryOrOpen!0 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9967 #b00000000000000000000000000000000)))))

(assert (=> b!1257339 (=> (not res!838152) (not e!714944))))

(declare-fun b!1257340 () Bool)

(assert (=> b!1257340 (= e!714945 call!61832)))

(declare-fun bm!61829 () Bool)

(assert (=> bm!61829 (= call!61832 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1257341 () Bool)

(assert (=> b!1257341 (= e!714943 e!714945)))

(declare-fun c!122475 () Bool)

(assert (=> b!1257341 (= c!122475 (validKeyInArray!0 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(assert (= (and d!138241 (not res!838151)) b!1257341))

(assert (= (and b!1257341 c!122475) b!1257339))

(assert (= (and b!1257341 (not c!122475)) b!1257340))

(assert (= (and b!1257339 res!838152) b!1257338))

(assert (= (or b!1257338 b!1257340) bm!61829))

(assert (=> b!1257339 m!1157905))

(declare-fun m!1157961 () Bool)

(assert (=> b!1257339 m!1157961))

(declare-fun m!1157963 () Bool)

(assert (=> b!1257339 m!1157963))

(assert (=> b!1257339 m!1157905))

(declare-fun m!1157965 () Bool)

(assert (=> b!1257339 m!1157965))

(declare-fun m!1157967 () Bool)

(assert (=> bm!61829 m!1157967))

(assert (=> b!1257341 m!1157905))

(assert (=> b!1257341 m!1157905))

(assert (=> b!1257341 m!1157907))

(assert (=> b!1257226 d!138241))

(declare-fun b!1257352 () Bool)

(declare-fun e!714955 () Bool)

(declare-fun e!714957 () Bool)

(assert (=> b!1257352 (= e!714955 e!714957)))

(declare-fun c!122478 () Bool)

(assert (=> b!1257352 (= c!122478 (validKeyInArray!0 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257353 () Bool)

(declare-fun call!61835 () Bool)

(assert (=> b!1257353 (= e!714957 call!61835)))

(declare-fun bm!61832 () Bool)

(assert (=> bm!61832 (= call!61835 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122478 (Cons!28002 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000) Nil!28003) Nil!28003)))))

(declare-fun b!1257354 () Bool)

(declare-fun e!714954 () Bool)

(declare-fun contains!7566 (List!28006 (_ BitVec 64)) Bool)

(assert (=> b!1257354 (= e!714954 (contains!7566 Nil!28003 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257355 () Bool)

(declare-fun e!714956 () Bool)

(assert (=> b!1257355 (= e!714956 e!714955)))

(declare-fun res!838159 () Bool)

(assert (=> b!1257355 (=> (not res!838159) (not e!714955))))

(assert (=> b!1257355 (= res!838159 (not e!714954))))

(declare-fun res!838160 () Bool)

(assert (=> b!1257355 (=> (not res!838160) (not e!714954))))

(assert (=> b!1257355 (= res!838160 (validKeyInArray!0 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138243 () Bool)

(declare-fun res!838161 () Bool)

(assert (=> d!138243 (=> res!838161 e!714956)))

(assert (=> d!138243 (= res!838161 (bvsge #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(assert (=> d!138243 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28003) e!714956)))

(declare-fun b!1257356 () Bool)

(assert (=> b!1257356 (= e!714957 call!61835)))

(assert (= (and d!138243 (not res!838161)) b!1257355))

(assert (= (and b!1257355 res!838160) b!1257354))

(assert (= (and b!1257355 res!838159) b!1257352))

(assert (= (and b!1257352 c!122478) b!1257356))

(assert (= (and b!1257352 (not c!122478)) b!1257353))

(assert (= (or b!1257356 b!1257353) bm!61832))

(assert (=> b!1257352 m!1157905))

(assert (=> b!1257352 m!1157905))

(assert (=> b!1257352 m!1157907))

(assert (=> bm!61832 m!1157905))

(declare-fun m!1157969 () Bool)

(assert (=> bm!61832 m!1157969))

(assert (=> b!1257354 m!1157905))

(assert (=> b!1257354 m!1157905))

(declare-fun m!1157971 () Bool)

(assert (=> b!1257354 m!1157971))

(assert (=> b!1257355 m!1157905))

(assert (=> b!1257355 m!1157905))

(assert (=> b!1257355 m!1157907))

(assert (=> b!1257220 d!138243))

(declare-fun d!138245 () Bool)

(assert (=> d!138245 (= (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!568703 () Unit!41880)

(declare-fun choose!1861 (array!81756 array!81758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48113 V!48113 V!48113 V!48113 (_ BitVec 32) Int) Unit!41880)

(assert (=> d!138245 (= lt!568703 (choose!1861 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138245 (validMask!0 mask!1466)))

(assert (=> d!138245 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1091 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568703)))

(declare-fun bs!35551 () Bool)

(assert (= bs!35551 d!138245))

(assert (=> bs!35551 m!1157851))

(assert (=> bs!35551 m!1157849))

(declare-fun m!1157973 () Bool)

(assert (=> bs!35551 m!1157973))

(assert (=> bs!35551 m!1157859))

(assert (=> b!1257225 d!138245))

(declare-fun b!1257381 () Bool)

(declare-fun e!714973 () Bool)

(declare-fun e!714976 () Bool)

(assert (=> b!1257381 (= e!714973 e!714976)))

(declare-fun c!122490 () Bool)

(assert (=> b!1257381 (= c!122490 (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun b!1257382 () Bool)

(assert (=> b!1257382 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(assert (=> b!1257382 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39973 _values!914)))))

(declare-fun e!714972 () Bool)

(declare-fun lt!568718 () ListLongMap!18665)

(assert (=> b!1257382 (= e!714972 (= (apply!989 lt!568718 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)) (get!20160 (select (arr!39437 _values!914) #b00000000000000000000000000000000) (dynLambda!3387 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1257383 () Bool)

(assert (=> b!1257383 (= e!714976 (= lt!568718 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1257384 () Bool)

(declare-fun lt!568719 () Unit!41880)

(declare-fun lt!568720 () Unit!41880)

(assert (=> b!1257384 (= lt!568719 lt!568720)))

(declare-fun lt!568724 () ListLongMap!18665)

(declare-fun lt!568721 () (_ BitVec 64))

(declare-fun lt!568723 () (_ BitVec 64))

(declare-fun lt!568722 () V!48113)

(assert (=> b!1257384 (not (contains!7564 (+!4188 lt!568724 (tuple2!20793 lt!568721 lt!568722)) lt!568723))))

(declare-fun addStillNotContains!317 (ListLongMap!18665 (_ BitVec 64) V!48113 (_ BitVec 64)) Unit!41880)

(assert (=> b!1257384 (= lt!568720 (addStillNotContains!317 lt!568724 lt!568721 lt!568722 lt!568723))))

(assert (=> b!1257384 (= lt!568723 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1257384 (= lt!568722 (get!20160 (select (arr!39437 _values!914) #b00000000000000000000000000000000) (dynLambda!3387 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1257384 (= lt!568721 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61838 () ListLongMap!18665)

(assert (=> b!1257384 (= lt!568724 call!61838)))

(declare-fun e!714977 () ListLongMap!18665)

(assert (=> b!1257384 (= e!714977 (+!4188 call!61838 (tuple2!20793 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000) (get!20160 (select (arr!39437 _values!914) #b00000000000000000000000000000000) (dynLambda!3387 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!61835 () Bool)

(assert (=> bm!61835 (= call!61838 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1257385 () Bool)

(declare-fun e!714975 () ListLongMap!18665)

(assert (=> b!1257385 (= e!714975 (ListLongMap!18666 Nil!28004))))

(declare-fun b!1257386 () Bool)

(assert (=> b!1257386 (= e!714977 call!61838)))

(declare-fun b!1257387 () Bool)

(declare-fun e!714978 () Bool)

(assert (=> b!1257387 (= e!714978 e!714973)))

(declare-fun c!122489 () Bool)

(declare-fun e!714974 () Bool)

(assert (=> b!1257387 (= c!122489 e!714974)))

(declare-fun res!838170 () Bool)

(assert (=> b!1257387 (=> (not res!838170) (not e!714974))))

(assert (=> b!1257387 (= res!838170 (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun b!1257388 () Bool)

(declare-fun res!838172 () Bool)

(assert (=> b!1257388 (=> (not res!838172) (not e!714978))))

(assert (=> b!1257388 (= res!838172 (not (contains!7564 lt!568718 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138247 () Bool)

(assert (=> d!138247 e!714978))

(declare-fun res!838173 () Bool)

(assert (=> d!138247 (=> (not res!838173) (not e!714978))))

(assert (=> d!138247 (= res!838173 (not (contains!7564 lt!568718 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138247 (= lt!568718 e!714975)))

(declare-fun c!122487 () Bool)

(assert (=> d!138247 (= c!122487 (bvsge #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(assert (=> d!138247 (validMask!0 mask!1466)))

(assert (=> d!138247 (= (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568718)))

(declare-fun b!1257389 () Bool)

(assert (=> b!1257389 (= e!714974 (validKeyInArray!0 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257389 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1257390 () Bool)

(assert (=> b!1257390 (= e!714975 e!714977)))

(declare-fun c!122488 () Bool)

(assert (=> b!1257390 (= c!122488 (validKeyInArray!0 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257391 () Bool)

(declare-fun isEmpty!1031 (ListLongMap!18665) Bool)

(assert (=> b!1257391 (= e!714976 (isEmpty!1031 lt!568718))))

(declare-fun b!1257392 () Bool)

(assert (=> b!1257392 (= e!714973 e!714972)))

(assert (=> b!1257392 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun res!838171 () Bool)

(assert (=> b!1257392 (= res!838171 (contains!7564 lt!568718 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257392 (=> (not res!838171) (not e!714972))))

(assert (= (and d!138247 c!122487) b!1257385))

(assert (= (and d!138247 (not c!122487)) b!1257390))

(assert (= (and b!1257390 c!122488) b!1257384))

(assert (= (and b!1257390 (not c!122488)) b!1257386))

(assert (= (or b!1257384 b!1257386) bm!61835))

(assert (= (and d!138247 res!838173) b!1257388))

(assert (= (and b!1257388 res!838172) b!1257387))

(assert (= (and b!1257387 res!838170) b!1257389))

(assert (= (and b!1257387 c!122489) b!1257392))

(assert (= (and b!1257387 (not c!122489)) b!1257381))

(assert (= (and b!1257392 res!838171) b!1257382))

(assert (= (and b!1257381 c!122490) b!1257383))

(assert (= (and b!1257381 (not c!122490)) b!1257391))

(declare-fun b_lambda!22689 () Bool)

(assert (=> (not b_lambda!22689) (not b!1257382)))

(assert (=> b!1257382 t!41499))

(declare-fun b_and!45021 () Bool)

(assert (= b_and!45019 (and (=> t!41499 result!23323) b_and!45021)))

(declare-fun b_lambda!22691 () Bool)

(assert (=> (not b_lambda!22691) (not b!1257384)))

(assert (=> b!1257384 t!41499))

(declare-fun b_and!45023 () Bool)

(assert (= b_and!45021 (and (=> t!41499 result!23323) b_and!45023)))

(assert (=> b!1257389 m!1157905))

(assert (=> b!1257389 m!1157905))

(assert (=> b!1257389 m!1157907))

(declare-fun m!1157975 () Bool)

(assert (=> b!1257388 m!1157975))

(assert (=> b!1257384 m!1157949))

(assert (=> b!1257384 m!1157905))

(declare-fun m!1157977 () Bool)

(assert (=> b!1257384 m!1157977))

(declare-fun m!1157979 () Bool)

(assert (=> b!1257384 m!1157979))

(declare-fun m!1157981 () Bool)

(assert (=> b!1257384 m!1157981))

(assert (=> b!1257384 m!1157977))

(declare-fun m!1157983 () Bool)

(assert (=> b!1257384 m!1157983))

(assert (=> b!1257384 m!1157947))

(assert (=> b!1257384 m!1157947))

(assert (=> b!1257384 m!1157949))

(assert (=> b!1257384 m!1157951))

(assert (=> b!1257390 m!1157905))

(assert (=> b!1257390 m!1157905))

(assert (=> b!1257390 m!1157907))

(assert (=> b!1257382 m!1157949))

(assert (=> b!1257382 m!1157905))

(assert (=> b!1257382 m!1157905))

(declare-fun m!1157985 () Bool)

(assert (=> b!1257382 m!1157985))

(assert (=> b!1257382 m!1157947))

(assert (=> b!1257382 m!1157947))

(assert (=> b!1257382 m!1157949))

(assert (=> b!1257382 m!1157951))

(declare-fun m!1157987 () Bool)

(assert (=> b!1257383 m!1157987))

(assert (=> bm!61835 m!1157987))

(declare-fun m!1157989 () Bool)

(assert (=> b!1257391 m!1157989))

(assert (=> b!1257392 m!1157905))

(assert (=> b!1257392 m!1157905))

(declare-fun m!1157991 () Bool)

(assert (=> b!1257392 m!1157991))

(declare-fun m!1157993 () Bool)

(assert (=> d!138247 m!1157993))

(assert (=> d!138247 m!1157859))

(assert (=> b!1257225 d!138247))

(declare-fun b!1257393 () Bool)

(declare-fun e!714980 () Bool)

(declare-fun e!714983 () Bool)

(assert (=> b!1257393 (= e!714980 e!714983)))

(declare-fun c!122494 () Bool)

(assert (=> b!1257393 (= c!122494 (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun b!1257394 () Bool)

(assert (=> b!1257394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(assert (=> b!1257394 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39973 _values!914)))))

(declare-fun e!714979 () Bool)

(declare-fun lt!568725 () ListLongMap!18665)

(assert (=> b!1257394 (= e!714979 (= (apply!989 lt!568725 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)) (get!20160 (select (arr!39437 _values!914) #b00000000000000000000000000000000) (dynLambda!3387 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1257395 () Bool)

(assert (=> b!1257395 (= e!714983 (= lt!568725 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1257396 () Bool)

(declare-fun lt!568726 () Unit!41880)

(declare-fun lt!568727 () Unit!41880)

(assert (=> b!1257396 (= lt!568726 lt!568727)))

(declare-fun lt!568730 () (_ BitVec 64))

(declare-fun lt!568729 () V!48113)

(declare-fun lt!568731 () ListLongMap!18665)

(declare-fun lt!568728 () (_ BitVec 64))

(assert (=> b!1257396 (not (contains!7564 (+!4188 lt!568731 (tuple2!20793 lt!568728 lt!568729)) lt!568730))))

(assert (=> b!1257396 (= lt!568727 (addStillNotContains!317 lt!568731 lt!568728 lt!568729 lt!568730))))

(assert (=> b!1257396 (= lt!568730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1257396 (= lt!568729 (get!20160 (select (arr!39437 _values!914) #b00000000000000000000000000000000) (dynLambda!3387 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1257396 (= lt!568728 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun call!61839 () ListLongMap!18665)

(assert (=> b!1257396 (= lt!568731 call!61839)))

(declare-fun e!714984 () ListLongMap!18665)

(assert (=> b!1257396 (= e!714984 (+!4188 call!61839 (tuple2!20793 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000) (get!20160 (select (arr!39437 _values!914) #b00000000000000000000000000000000) (dynLambda!3387 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!61836 () Bool)

(assert (=> bm!61836 (= call!61839 (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1257397 () Bool)

(declare-fun e!714982 () ListLongMap!18665)

(assert (=> b!1257397 (= e!714982 (ListLongMap!18666 Nil!28004))))

(declare-fun b!1257398 () Bool)

(assert (=> b!1257398 (= e!714984 call!61839)))

(declare-fun b!1257399 () Bool)

(declare-fun e!714985 () Bool)

(assert (=> b!1257399 (= e!714985 e!714980)))

(declare-fun c!122493 () Bool)

(declare-fun e!714981 () Bool)

(assert (=> b!1257399 (= c!122493 e!714981)))

(declare-fun res!838174 () Bool)

(assert (=> b!1257399 (=> (not res!838174) (not e!714981))))

(assert (=> b!1257399 (= res!838174 (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun b!1257400 () Bool)

(declare-fun res!838176 () Bool)

(assert (=> b!1257400 (=> (not res!838176) (not e!714985))))

(assert (=> b!1257400 (= res!838176 (not (contains!7564 lt!568725 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!138249 () Bool)

(assert (=> d!138249 e!714985))

(declare-fun res!838177 () Bool)

(assert (=> d!138249 (=> (not res!838177) (not e!714985))))

(assert (=> d!138249 (= res!838177 (not (contains!7564 lt!568725 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138249 (= lt!568725 e!714982)))

(declare-fun c!122491 () Bool)

(assert (=> d!138249 (= c!122491 (bvsge #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(assert (=> d!138249 (validMask!0 mask!1466)))

(assert (=> d!138249 (= (getCurrentListMapNoExtraKeys!5727 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!568725)))

(declare-fun b!1257401 () Bool)

(assert (=> b!1257401 (= e!714981 (validKeyInArray!0 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257401 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1257402 () Bool)

(assert (=> b!1257402 (= e!714982 e!714984)))

(declare-fun c!122492 () Bool)

(assert (=> b!1257402 (= c!122492 (validKeyInArray!0 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1257403 () Bool)

(assert (=> b!1257403 (= e!714983 (isEmpty!1031 lt!568725))))

(declare-fun b!1257404 () Bool)

(assert (=> b!1257404 (= e!714980 e!714979)))

(assert (=> b!1257404 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39972 _keys!1118)))))

(declare-fun res!838175 () Bool)

(assert (=> b!1257404 (= res!838175 (contains!7564 lt!568725 (select (arr!39436 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1257404 (=> (not res!838175) (not e!714979))))

(assert (= (and d!138249 c!122491) b!1257397))

(assert (= (and d!138249 (not c!122491)) b!1257402))

(assert (= (and b!1257402 c!122492) b!1257396))

(assert (= (and b!1257402 (not c!122492)) b!1257398))

(assert (= (or b!1257396 b!1257398) bm!61836))

(assert (= (and d!138249 res!838177) b!1257400))

(assert (= (and b!1257400 res!838176) b!1257399))

(assert (= (and b!1257399 res!838174) b!1257401))

(assert (= (and b!1257399 c!122493) b!1257404))

(assert (= (and b!1257399 (not c!122493)) b!1257393))

(assert (= (and b!1257404 res!838175) b!1257394))

(assert (= (and b!1257393 c!122494) b!1257395))

(assert (= (and b!1257393 (not c!122494)) b!1257403))

(declare-fun b_lambda!22693 () Bool)

(assert (=> (not b_lambda!22693) (not b!1257394)))

(assert (=> b!1257394 t!41499))

(declare-fun b_and!45025 () Bool)

(assert (= b_and!45023 (and (=> t!41499 result!23323) b_and!45025)))

(declare-fun b_lambda!22695 () Bool)

(assert (=> (not b_lambda!22695) (not b!1257396)))

(assert (=> b!1257396 t!41499))

(declare-fun b_and!45027 () Bool)

(assert (= b_and!45025 (and (=> t!41499 result!23323) b_and!45027)))

(assert (=> b!1257401 m!1157905))

(assert (=> b!1257401 m!1157905))

(assert (=> b!1257401 m!1157907))

(declare-fun m!1157995 () Bool)

(assert (=> b!1257400 m!1157995))

(assert (=> b!1257396 m!1157949))

(assert (=> b!1257396 m!1157905))

(declare-fun m!1157997 () Bool)

(assert (=> b!1257396 m!1157997))

(declare-fun m!1157999 () Bool)

(assert (=> b!1257396 m!1157999))

(declare-fun m!1158001 () Bool)

(assert (=> b!1257396 m!1158001))

(assert (=> b!1257396 m!1157997))

(declare-fun m!1158003 () Bool)

(assert (=> b!1257396 m!1158003))

(assert (=> b!1257396 m!1157947))

(assert (=> b!1257396 m!1157947))

(assert (=> b!1257396 m!1157949))

(assert (=> b!1257396 m!1157951))

(assert (=> b!1257402 m!1157905))

(assert (=> b!1257402 m!1157905))

(assert (=> b!1257402 m!1157907))

(assert (=> b!1257394 m!1157949))

(assert (=> b!1257394 m!1157905))

(assert (=> b!1257394 m!1157905))

(declare-fun m!1158005 () Bool)

(assert (=> b!1257394 m!1158005))

(assert (=> b!1257394 m!1157947))

(assert (=> b!1257394 m!1157947))

(assert (=> b!1257394 m!1157949))

(assert (=> b!1257394 m!1157951))

(declare-fun m!1158007 () Bool)

(assert (=> b!1257395 m!1158007))

(assert (=> bm!61836 m!1158007))

(declare-fun m!1158009 () Bool)

(assert (=> b!1257403 m!1158009))

(assert (=> b!1257404 m!1157905))

(assert (=> b!1257404 m!1157905))

(declare-fun m!1158011 () Bool)

(assert (=> b!1257404 m!1158011))

(declare-fun m!1158013 () Bool)

(assert (=> d!138249 m!1158013))

(assert (=> d!138249 m!1157859))

(assert (=> b!1257225 d!138249))

(declare-fun b!1257411 () Bool)

(declare-fun e!714990 () Bool)

(assert (=> b!1257411 (= e!714990 tp_is_empty!32061)))

(declare-fun condMapEmpty!49885 () Bool)

(declare-fun mapDefault!49885 () ValueCell!15267)

(assert (=> mapNonEmpty!49879 (= condMapEmpty!49885 (= mapRest!49879 ((as const (Array (_ BitVec 32) ValueCell!15267)) mapDefault!49885)))))

(declare-fun e!714991 () Bool)

(declare-fun mapRes!49885 () Bool)

(assert (=> mapNonEmpty!49879 (= tp!94994 (and e!714991 mapRes!49885))))

(declare-fun b!1257412 () Bool)

(assert (=> b!1257412 (= e!714991 tp_is_empty!32061)))

(declare-fun mapIsEmpty!49885 () Bool)

(assert (=> mapIsEmpty!49885 mapRes!49885))

(declare-fun mapNonEmpty!49885 () Bool)

(declare-fun tp!95003 () Bool)

(assert (=> mapNonEmpty!49885 (= mapRes!49885 (and tp!95003 e!714990))))

(declare-fun mapKey!49885 () (_ BitVec 32))

(declare-fun mapValue!49885 () ValueCell!15267)

(declare-fun mapRest!49885 () (Array (_ BitVec 32) ValueCell!15267))

(assert (=> mapNonEmpty!49885 (= mapRest!49879 (store mapRest!49885 mapKey!49885 mapValue!49885))))

(assert (= (and mapNonEmpty!49879 condMapEmpty!49885) mapIsEmpty!49885))

(assert (= (and mapNonEmpty!49879 (not condMapEmpty!49885)) mapNonEmpty!49885))

(assert (= (and mapNonEmpty!49885 ((_ is ValueCellFull!15267) mapValue!49885)) b!1257411))

(assert (= (and mapNonEmpty!49879 ((_ is ValueCellFull!15267) mapDefault!49885)) b!1257412))

(declare-fun m!1158015 () Bool)

(assert (=> mapNonEmpty!49885 m!1158015))

(declare-fun b_lambda!22697 () Bool)

(assert (= b_lambda!22693 (or (and start!105522 b_free!27159) b_lambda!22697)))

(declare-fun b_lambda!22699 () Bool)

(assert (= b_lambda!22687 (or (and start!105522 b_free!27159) b_lambda!22699)))

(declare-fun b_lambda!22701 () Bool)

(assert (= b_lambda!22695 (or (and start!105522 b_free!27159) b_lambda!22701)))

(declare-fun b_lambda!22703 () Bool)

(assert (= b_lambda!22689 (or (and start!105522 b_free!27159) b_lambda!22703)))

(declare-fun b_lambda!22705 () Bool)

(assert (= b_lambda!22691 (or (and start!105522 b_free!27159) b_lambda!22705)))

(check-sat (not d!138235) (not b_lambda!22705) (not b_lambda!22701) (not b!1257404) (not b!1257390) (not b!1257389) (not d!138247) (not b!1257401) (not b!1257383) (not b!1257382) (not b!1257403) (not b!1257341) (not b!1257402) (not d!138249) (not b!1257309) (not b_next!27159) (not b!1257384) (not bm!61822) (not b!1257318) (not bm!61820) (not b!1257339) (not bm!61835) (not b!1257355) (not b!1257400) (not b_lambda!22699) (not b!1257391) (not b!1257395) (not b!1257352) (not b!1257308) (not d!138233) (not b!1257396) (not bm!61826) (not mapNonEmpty!49885) (not b!1257264) (not bm!61829) (not b!1257354) (not b!1257316) (not bm!61832) (not b!1257320) (not b!1257394) (not d!138239) (not b!1257388) (not d!138237) (not b!1257323) b_and!45027 (not d!138245) (not b!1257262) (not b!1257312) (not b!1257310) tp_is_empty!32061 (not bm!61821) (not b_lambda!22697) (not bm!61836) (not b_lambda!22703) (not b!1257392))
(check-sat b_and!45027 (not b_next!27159))
