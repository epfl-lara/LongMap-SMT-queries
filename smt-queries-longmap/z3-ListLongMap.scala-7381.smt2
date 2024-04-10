; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94028 () Bool)

(assert start!94028)

(declare-fun b_free!21465 () Bool)

(declare-fun b_next!21465 () Bool)

(assert (=> start!94028 (= b_free!21465 (not b_next!21465))))

(declare-fun tp!75824 () Bool)

(declare-fun b_and!34197 () Bool)

(assert (=> start!94028 (= tp!75824 b_and!34197)))

(declare-fun b!1063511 () Bool)

(declare-fun e!606000 () Bool)

(declare-datatypes ((array!67547 0))(
  ( (array!67548 (arr!32479 (Array (_ BitVec 32) (_ BitVec 64))) (size!33015 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67547)

(assert (=> b!1063511 (= e!606000 (bvsle #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(declare-datatypes ((V!38835 0))(
  ( (V!38836 (val!12688 Int)) )
))
(declare-datatypes ((tuple2!16060 0))(
  ( (tuple2!16061 (_1!8041 (_ BitVec 64)) (_2!8041 V!38835)) )
))
(declare-datatypes ((List!22639 0))(
  ( (Nil!22636) (Cons!22635 (h!23844 tuple2!16060) (t!31952 List!22639)) )
))
(declare-datatypes ((ListLongMap!14029 0))(
  ( (ListLongMap!14030 (toList!7030 List!22639)) )
))
(declare-fun lt!468731 () ListLongMap!14029)

(declare-fun -!590 (ListLongMap!14029 (_ BitVec 64)) ListLongMap!14029)

(assert (=> b!1063511 (= (-!590 lt!468731 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468731)))

(declare-datatypes ((Unit!34858 0))(
  ( (Unit!34859) )
))
(declare-fun lt!468733 () Unit!34858)

(declare-fun removeNotPresentStillSame!37 (ListLongMap!14029 (_ BitVec 64)) Unit!34858)

(assert (=> b!1063511 (= lt!468733 (removeNotPresentStillSame!37 lt!468731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063512 () Bool)

(declare-fun res!710099 () Bool)

(declare-fun e!606001 () Bool)

(assert (=> b!1063512 (=> (not res!710099) (not e!606001))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11934 0))(
  ( (ValueCellFull!11934 (v!15299 V!38835)) (EmptyCell!11934) )
))
(declare-datatypes ((array!67549 0))(
  ( (array!67550 (arr!32480 (Array (_ BitVec 32) ValueCell!11934)) (size!33016 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67549)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063512 (= res!710099 (and (= (size!33016 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33015 _keys!1163) (size!33016 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063513 () Bool)

(declare-fun res!710101 () Bool)

(assert (=> b!1063513 (=> (not res!710101) (not e!606001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67547 (_ BitVec 32)) Bool)

(assert (=> b!1063513 (= res!710101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063514 () Bool)

(declare-fun e!606005 () Bool)

(declare-fun e!606002 () Bool)

(declare-fun mapRes!39589 () Bool)

(assert (=> b!1063514 (= e!606005 (and e!606002 mapRes!39589))))

(declare-fun condMapEmpty!39589 () Bool)

(declare-fun mapDefault!39589 () ValueCell!11934)

(assert (=> b!1063514 (= condMapEmpty!39589 (= (arr!32480 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11934)) mapDefault!39589)))))

(declare-fun b!1063516 () Bool)

(declare-fun e!606004 () Bool)

(declare-fun tp_is_empty!25275 () Bool)

(assert (=> b!1063516 (= e!606004 tp_is_empty!25275)))

(declare-fun mapIsEmpty!39589 () Bool)

(assert (=> mapIsEmpty!39589 mapRes!39589))

(declare-fun mapNonEmpty!39589 () Bool)

(declare-fun tp!75823 () Bool)

(assert (=> mapNonEmpty!39589 (= mapRes!39589 (and tp!75823 e!606004))))

(declare-fun mapKey!39589 () (_ BitVec 32))

(declare-fun mapRest!39589 () (Array (_ BitVec 32) ValueCell!11934))

(declare-fun mapValue!39589 () ValueCell!11934)

(assert (=> mapNonEmpty!39589 (= (arr!32480 _values!955) (store mapRest!39589 mapKey!39589 mapValue!39589))))

(declare-fun res!710102 () Bool)

(assert (=> start!94028 (=> (not res!710102) (not e!606001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94028 (= res!710102 (validMask!0 mask!1515))))

(assert (=> start!94028 e!606001))

(assert (=> start!94028 true))

(assert (=> start!94028 tp_is_empty!25275))

(declare-fun array_inv!25156 (array!67549) Bool)

(assert (=> start!94028 (and (array_inv!25156 _values!955) e!606005)))

(assert (=> start!94028 tp!75824))

(declare-fun array_inv!25157 (array!67547) Bool)

(assert (=> start!94028 (array_inv!25157 _keys!1163)))

(declare-fun b!1063515 () Bool)

(declare-fun e!605999 () Bool)

(assert (=> b!1063515 (= e!606001 (not e!605999))))

(declare-fun res!710100 () Bool)

(assert (=> b!1063515 (=> res!710100 e!605999)))

(assert (=> b!1063515 (= res!710100 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468732 () ListLongMap!14029)

(declare-fun lt!468735 () ListLongMap!14029)

(assert (=> b!1063515 (= lt!468732 lt!468735)))

(declare-fun zeroValueBefore!47 () V!38835)

(declare-fun minValue!907 () V!38835)

(declare-fun lt!468734 () Unit!34858)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38835)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!659 (array!67547 array!67549 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38835 V!38835 V!38835 V!38835 (_ BitVec 32) Int) Unit!34858)

(assert (=> b!1063515 (= lt!468734 (lemmaNoChangeToArrayThenSameMapNoExtras!659 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3622 (array!67547 array!67549 (_ BitVec 32) (_ BitVec 32) V!38835 V!38835 (_ BitVec 32) Int) ListLongMap!14029)

(assert (=> b!1063515 (= lt!468735 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063515 (= lt!468732 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063517 () Bool)

(assert (=> b!1063517 (= e!605999 e!606000)))

(declare-fun res!710098 () Bool)

(assert (=> b!1063517 (=> res!710098 e!606000)))

(declare-fun contains!6259 (ListLongMap!14029 (_ BitVec 64)) Bool)

(assert (=> b!1063517 (= res!710098 (contains!6259 lt!468731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4011 (array!67547 array!67549 (_ BitVec 32) (_ BitVec 32) V!38835 V!38835 (_ BitVec 32) Int) ListLongMap!14029)

(assert (=> b!1063517 (= lt!468731 (getCurrentListMap!4011 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063518 () Bool)

(declare-fun res!710103 () Bool)

(assert (=> b!1063518 (=> (not res!710103) (not e!606001))))

(declare-datatypes ((List!22640 0))(
  ( (Nil!22637) (Cons!22636 (h!23845 (_ BitVec 64)) (t!31953 List!22640)) )
))
(declare-fun arrayNoDuplicates!0 (array!67547 (_ BitVec 32) List!22640) Bool)

(assert (=> b!1063518 (= res!710103 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22637))))

(declare-fun b!1063519 () Bool)

(assert (=> b!1063519 (= e!606002 tp_is_empty!25275)))

(assert (= (and start!94028 res!710102) b!1063512))

(assert (= (and b!1063512 res!710099) b!1063513))

(assert (= (and b!1063513 res!710101) b!1063518))

(assert (= (and b!1063518 res!710103) b!1063515))

(assert (= (and b!1063515 (not res!710100)) b!1063517))

(assert (= (and b!1063517 (not res!710098)) b!1063511))

(assert (= (and b!1063514 condMapEmpty!39589) mapIsEmpty!39589))

(assert (= (and b!1063514 (not condMapEmpty!39589)) mapNonEmpty!39589))

(get-info :version)

(assert (= (and mapNonEmpty!39589 ((_ is ValueCellFull!11934) mapValue!39589)) b!1063516))

(assert (= (and b!1063514 ((_ is ValueCellFull!11934) mapDefault!39589)) b!1063519))

(assert (= start!94028 b!1063514))

(declare-fun m!982199 () Bool)

(assert (=> start!94028 m!982199))

(declare-fun m!982201 () Bool)

(assert (=> start!94028 m!982201))

(declare-fun m!982203 () Bool)

(assert (=> start!94028 m!982203))

(declare-fun m!982205 () Bool)

(assert (=> b!1063518 m!982205))

(declare-fun m!982207 () Bool)

(assert (=> b!1063511 m!982207))

(declare-fun m!982209 () Bool)

(assert (=> b!1063511 m!982209))

(declare-fun m!982211 () Bool)

(assert (=> b!1063513 m!982211))

(declare-fun m!982213 () Bool)

(assert (=> b!1063517 m!982213))

(declare-fun m!982215 () Bool)

(assert (=> b!1063517 m!982215))

(declare-fun m!982217 () Bool)

(assert (=> mapNonEmpty!39589 m!982217))

(declare-fun m!982219 () Bool)

(assert (=> b!1063515 m!982219))

(declare-fun m!982221 () Bool)

(assert (=> b!1063515 m!982221))

(declare-fun m!982223 () Bool)

(assert (=> b!1063515 m!982223))

(check-sat (not start!94028) (not b_next!21465) (not mapNonEmpty!39589) tp_is_empty!25275 (not b!1063513) (not b!1063517) (not b!1063511) (not b!1063518) (not b!1063515) b_and!34197)
(check-sat b_and!34197 (not b_next!21465))
(get-model)

(declare-fun b!1063555 () Bool)

(declare-fun e!606033 () Bool)

(declare-fun e!606034 () Bool)

(assert (=> b!1063555 (= e!606033 e!606034)))

(declare-fun c!107285 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1063555 (= c!107285 (validKeyInArray!0 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063556 () Bool)

(declare-fun e!606035 () Bool)

(assert (=> b!1063556 (= e!606034 e!606035)))

(declare-fun lt!468759 () (_ BitVec 64))

(assert (=> b!1063556 (= lt!468759 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468757 () Unit!34858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67547 (_ BitVec 64) (_ BitVec 32)) Unit!34858)

(assert (=> b!1063556 (= lt!468757 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!468759 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1063556 (arrayContainsKey!0 _keys!1163 lt!468759 #b00000000000000000000000000000000)))

(declare-fun lt!468758 () Unit!34858)

(assert (=> b!1063556 (= lt!468758 lt!468757)))

(declare-fun res!710126 () Bool)

(declare-datatypes ((SeekEntryResult!9873 0))(
  ( (MissingZero!9873 (index!41863 (_ BitVec 32))) (Found!9873 (index!41864 (_ BitVec 32))) (Intermediate!9873 (undefined!10685 Bool) (index!41865 (_ BitVec 32)) (x!95162 (_ BitVec 32))) (Undefined!9873) (MissingVacant!9873 (index!41866 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67547 (_ BitVec 32)) SeekEntryResult!9873)

(assert (=> b!1063556 (= res!710126 (= (seekEntryOrOpen!0 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9873 #b00000000000000000000000000000000)))))

(assert (=> b!1063556 (=> (not res!710126) (not e!606035))))

(declare-fun b!1063557 () Bool)

(declare-fun call!44943 () Bool)

(assert (=> b!1063557 (= e!606034 call!44943)))

(declare-fun b!1063558 () Bool)

(assert (=> b!1063558 (= e!606035 call!44943)))

(declare-fun d!128905 () Bool)

(declare-fun res!710127 () Bool)

(assert (=> d!128905 (=> res!710127 e!606033)))

(assert (=> d!128905 (= res!710127 (bvsge #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(assert (=> d!128905 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!606033)))

(declare-fun bm!44940 () Bool)

(assert (=> bm!44940 (= call!44943 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!128905 (not res!710127)) b!1063555))

(assert (= (and b!1063555 c!107285) b!1063556))

(assert (= (and b!1063555 (not c!107285)) b!1063557))

(assert (= (and b!1063556 res!710126) b!1063558))

(assert (= (or b!1063558 b!1063557) bm!44940))

(declare-fun m!982251 () Bool)

(assert (=> b!1063555 m!982251))

(assert (=> b!1063555 m!982251))

(declare-fun m!982253 () Bool)

(assert (=> b!1063555 m!982253))

(assert (=> b!1063556 m!982251))

(declare-fun m!982255 () Bool)

(assert (=> b!1063556 m!982255))

(declare-fun m!982257 () Bool)

(assert (=> b!1063556 m!982257))

(assert (=> b!1063556 m!982251))

(declare-fun m!982259 () Bool)

(assert (=> b!1063556 m!982259))

(declare-fun m!982261 () Bool)

(assert (=> bm!44940 m!982261))

(assert (=> b!1063513 d!128905))

(declare-fun d!128907 () Bool)

(declare-fun e!606040 () Bool)

(assert (=> d!128907 e!606040))

(declare-fun res!710130 () Bool)

(assert (=> d!128907 (=> res!710130 e!606040)))

(declare-fun lt!468768 () Bool)

(assert (=> d!128907 (= res!710130 (not lt!468768))))

(declare-fun lt!468770 () Bool)

(assert (=> d!128907 (= lt!468768 lt!468770)))

(declare-fun lt!468769 () Unit!34858)

(declare-fun e!606041 () Unit!34858)

(assert (=> d!128907 (= lt!468769 e!606041)))

(declare-fun c!107288 () Bool)

(assert (=> d!128907 (= c!107288 lt!468770)))

(declare-fun containsKey!573 (List!22639 (_ BitVec 64)) Bool)

(assert (=> d!128907 (= lt!468770 (containsKey!573 (toList!7030 lt!468731) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128907 (= (contains!6259 lt!468731 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468768)))

(declare-fun b!1063565 () Bool)

(declare-fun lt!468771 () Unit!34858)

(assert (=> b!1063565 (= e!606041 lt!468771)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!406 (List!22639 (_ BitVec 64)) Unit!34858)

(assert (=> b!1063565 (= lt!468771 (lemmaContainsKeyImpliesGetValueByKeyDefined!406 (toList!7030 lt!468731) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!649 0))(
  ( (Some!648 (v!15301 V!38835)) (None!647) )
))
(declare-fun isDefined!445 (Option!649) Bool)

(declare-fun getValueByKey!598 (List!22639 (_ BitVec 64)) Option!649)

(assert (=> b!1063565 (isDefined!445 (getValueByKey!598 (toList!7030 lt!468731) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063566 () Bool)

(declare-fun Unit!34862 () Unit!34858)

(assert (=> b!1063566 (= e!606041 Unit!34862)))

(declare-fun b!1063567 () Bool)

(assert (=> b!1063567 (= e!606040 (isDefined!445 (getValueByKey!598 (toList!7030 lt!468731) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128907 c!107288) b!1063565))

(assert (= (and d!128907 (not c!107288)) b!1063566))

(assert (= (and d!128907 (not res!710130)) b!1063567))

(declare-fun m!982263 () Bool)

(assert (=> d!128907 m!982263))

(declare-fun m!982265 () Bool)

(assert (=> b!1063565 m!982265))

(declare-fun m!982267 () Bool)

(assert (=> b!1063565 m!982267))

(assert (=> b!1063565 m!982267))

(declare-fun m!982269 () Bool)

(assert (=> b!1063565 m!982269))

(assert (=> b!1063567 m!982267))

(assert (=> b!1063567 m!982267))

(assert (=> b!1063567 m!982269))

(assert (=> b!1063517 d!128907))

(declare-fun bm!44955 () Bool)

(declare-fun call!44959 () ListLongMap!14029)

(declare-fun call!44960 () ListLongMap!14029)

(assert (=> bm!44955 (= call!44959 call!44960)))

(declare-fun b!1063610 () Bool)

(declare-fun e!606068 () Bool)

(assert (=> b!1063610 (= e!606068 (validKeyInArray!0 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44956 () Bool)

(declare-fun call!44964 () Bool)

(declare-fun lt!468837 () ListLongMap!14029)

(assert (=> bm!44956 (= call!44964 (contains!6259 lt!468837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!44963 () ListLongMap!14029)

(declare-fun bm!44957 () Bool)

(assert (=> bm!44957 (= call!44963 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063611 () Bool)

(declare-fun e!606078 () Bool)

(declare-fun e!606080 () Bool)

(assert (=> b!1063611 (= e!606078 e!606080)))

(declare-fun res!710153 () Bool)

(assert (=> b!1063611 (=> (not res!710153) (not e!606080))))

(assert (=> b!1063611 (= res!710153 (contains!6259 lt!468837 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(declare-fun b!1063612 () Bool)

(declare-fun e!606075 () Unit!34858)

(declare-fun lt!468828 () Unit!34858)

(assert (=> b!1063612 (= e!606075 lt!468828)))

(declare-fun lt!468817 () ListLongMap!14029)

(assert (=> b!1063612 (= lt!468817 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468821 () (_ BitVec 64))

(assert (=> b!1063612 (= lt!468821 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468825 () (_ BitVec 64))

(assert (=> b!1063612 (= lt!468825 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468833 () Unit!34858)

(declare-fun addStillContains!637 (ListLongMap!14029 (_ BitVec 64) V!38835 (_ BitVec 64)) Unit!34858)

(assert (=> b!1063612 (= lt!468833 (addStillContains!637 lt!468817 lt!468821 zeroValueBefore!47 lt!468825))))

(declare-fun +!3118 (ListLongMap!14029 tuple2!16060) ListLongMap!14029)

(assert (=> b!1063612 (contains!6259 (+!3118 lt!468817 (tuple2!16061 lt!468821 zeroValueBefore!47)) lt!468825)))

(declare-fun lt!468831 () Unit!34858)

(assert (=> b!1063612 (= lt!468831 lt!468833)))

(declare-fun lt!468826 () ListLongMap!14029)

(assert (=> b!1063612 (= lt!468826 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468819 () (_ BitVec 64))

(assert (=> b!1063612 (= lt!468819 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468836 () (_ BitVec 64))

(assert (=> b!1063612 (= lt!468836 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468827 () Unit!34858)

(declare-fun addApplyDifferent!497 (ListLongMap!14029 (_ BitVec 64) V!38835 (_ BitVec 64)) Unit!34858)

(assert (=> b!1063612 (= lt!468827 (addApplyDifferent!497 lt!468826 lt!468819 minValue!907 lt!468836))))

(declare-fun apply!920 (ListLongMap!14029 (_ BitVec 64)) V!38835)

(assert (=> b!1063612 (= (apply!920 (+!3118 lt!468826 (tuple2!16061 lt!468819 minValue!907)) lt!468836) (apply!920 lt!468826 lt!468836))))

(declare-fun lt!468820 () Unit!34858)

(assert (=> b!1063612 (= lt!468820 lt!468827)))

(declare-fun lt!468832 () ListLongMap!14029)

(assert (=> b!1063612 (= lt!468832 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468823 () (_ BitVec 64))

(assert (=> b!1063612 (= lt!468823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468822 () (_ BitVec 64))

(assert (=> b!1063612 (= lt!468822 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468834 () Unit!34858)

(assert (=> b!1063612 (= lt!468834 (addApplyDifferent!497 lt!468832 lt!468823 zeroValueBefore!47 lt!468822))))

(assert (=> b!1063612 (= (apply!920 (+!3118 lt!468832 (tuple2!16061 lt!468823 zeroValueBefore!47)) lt!468822) (apply!920 lt!468832 lt!468822))))

(declare-fun lt!468824 () Unit!34858)

(assert (=> b!1063612 (= lt!468824 lt!468834)))

(declare-fun lt!468818 () ListLongMap!14029)

(assert (=> b!1063612 (= lt!468818 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468830 () (_ BitVec 64))

(assert (=> b!1063612 (= lt!468830 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468829 () (_ BitVec 64))

(assert (=> b!1063612 (= lt!468829 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1063612 (= lt!468828 (addApplyDifferent!497 lt!468818 lt!468830 minValue!907 lt!468829))))

(assert (=> b!1063612 (= (apply!920 (+!3118 lt!468818 (tuple2!16061 lt!468830 minValue!907)) lt!468829) (apply!920 lt!468818 lt!468829))))

(declare-fun b!1063613 () Bool)

(declare-fun e!606077 () Bool)

(declare-fun e!606076 () Bool)

(assert (=> b!1063613 (= e!606077 e!606076)))

(declare-fun res!710149 () Bool)

(declare-fun call!44961 () Bool)

(assert (=> b!1063613 (= res!710149 call!44961)))

(assert (=> b!1063613 (=> (not res!710149) (not e!606076))))

(declare-fun b!1063614 () Bool)

(declare-fun e!606079 () Bool)

(assert (=> b!1063614 (= e!606079 e!606077)))

(declare-fun c!107301 () Bool)

(assert (=> b!1063614 (= c!107301 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1063615 () Bool)

(declare-fun e!606073 () Bool)

(assert (=> b!1063615 (= e!606073 (= (apply!920 lt!468837 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1063616 () Bool)

(declare-fun e!606072 () ListLongMap!14029)

(declare-fun call!44962 () ListLongMap!14029)

(assert (=> b!1063616 (= e!606072 (+!3118 call!44962 (tuple2!16061 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1063617 () Bool)

(declare-fun res!710150 () Bool)

(assert (=> b!1063617 (=> (not res!710150) (not e!606079))))

(assert (=> b!1063617 (= res!710150 e!606078)))

(declare-fun res!710156 () Bool)

(assert (=> b!1063617 (=> res!710156 e!606078)))

(declare-fun e!606069 () Bool)

(assert (=> b!1063617 (= res!710156 (not e!606069))))

(declare-fun res!710152 () Bool)

(assert (=> b!1063617 (=> (not res!710152) (not e!606069))))

(assert (=> b!1063617 (= res!710152 (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(declare-fun b!1063618 () Bool)

(declare-fun get!16970 (ValueCell!11934 V!38835) V!38835)

(declare-fun dynLambda!2027 (Int (_ BitVec 64)) V!38835)

(assert (=> b!1063618 (= e!606080 (= (apply!920 lt!468837 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)) (get!16970 (select (arr!32480 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1063618 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33016 _values!955)))))

(assert (=> b!1063618 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(declare-fun b!1063619 () Bool)

(declare-fun e!606070 () ListLongMap!14029)

(assert (=> b!1063619 (= e!606070 call!44959)))

(declare-fun b!1063620 () Bool)

(assert (=> b!1063620 (= e!606069 (validKeyInArray!0 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063621 () Bool)

(declare-fun e!606074 () Bool)

(assert (=> b!1063621 (= e!606074 e!606073)))

(declare-fun res!710157 () Bool)

(assert (=> b!1063621 (= res!710157 call!44964)))

(assert (=> b!1063621 (=> (not res!710157) (not e!606073))))

(declare-fun c!107306 () Bool)

(declare-fun bm!44959 () Bool)

(declare-fun c!107302 () Bool)

(assert (=> bm!44959 (= call!44962 (+!3118 (ite c!107302 call!44963 (ite c!107306 call!44960 call!44959)) (ite (or c!107302 c!107306) (tuple2!16061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16061 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1063622 () Bool)

(assert (=> b!1063622 (= e!606076 (= (apply!920 lt!468837 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1063623 () Bool)

(declare-fun e!606071 () ListLongMap!14029)

(assert (=> b!1063623 (= e!606072 e!606071)))

(assert (=> b!1063623 (= c!107306 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1063624 () Bool)

(declare-fun call!44958 () ListLongMap!14029)

(assert (=> b!1063624 (= e!606070 call!44958)))

(declare-fun b!1063625 () Bool)

(declare-fun c!107305 () Bool)

(assert (=> b!1063625 (= c!107305 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1063625 (= e!606071 e!606070)))

(declare-fun bm!44960 () Bool)

(assert (=> bm!44960 (= call!44958 call!44962)))

(declare-fun b!1063626 () Bool)

(assert (=> b!1063626 (= e!606074 (not call!44964))))

(declare-fun b!1063627 () Bool)

(declare-fun res!710154 () Bool)

(assert (=> b!1063627 (=> (not res!710154) (not e!606079))))

(assert (=> b!1063627 (= res!710154 e!606074)))

(declare-fun c!107304 () Bool)

(assert (=> b!1063627 (= c!107304 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063628 () Bool)

(declare-fun Unit!34863 () Unit!34858)

(assert (=> b!1063628 (= e!606075 Unit!34863)))

(declare-fun bm!44961 () Bool)

(assert (=> bm!44961 (= call!44960 call!44963)))

(declare-fun d!128909 () Bool)

(assert (=> d!128909 e!606079))

(declare-fun res!710151 () Bool)

(assert (=> d!128909 (=> (not res!710151) (not e!606079))))

(assert (=> d!128909 (= res!710151 (or (bvsge #b00000000000000000000000000000000 (size!33015 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))))

(declare-fun lt!468816 () ListLongMap!14029)

(assert (=> d!128909 (= lt!468837 lt!468816)))

(declare-fun lt!468835 () Unit!34858)

(assert (=> d!128909 (= lt!468835 e!606075)))

(declare-fun c!107303 () Bool)

(assert (=> d!128909 (= c!107303 e!606068)))

(declare-fun res!710155 () Bool)

(assert (=> d!128909 (=> (not res!710155) (not e!606068))))

(assert (=> d!128909 (= res!710155 (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(assert (=> d!128909 (= lt!468816 e!606072)))

(assert (=> d!128909 (= c!107302 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!128909 (validMask!0 mask!1515)))

(assert (=> d!128909 (= (getCurrentListMap!4011 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468837)))

(declare-fun bm!44958 () Bool)

(assert (=> bm!44958 (= call!44961 (contains!6259 lt!468837 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063629 () Bool)

(assert (=> b!1063629 (= e!606071 call!44958)))

(declare-fun b!1063630 () Bool)

(assert (=> b!1063630 (= e!606077 (not call!44961))))

(assert (= (and d!128909 c!107302) b!1063616))

(assert (= (and d!128909 (not c!107302)) b!1063623))

(assert (= (and b!1063623 c!107306) b!1063629))

(assert (= (and b!1063623 (not c!107306)) b!1063625))

(assert (= (and b!1063625 c!107305) b!1063624))

(assert (= (and b!1063625 (not c!107305)) b!1063619))

(assert (= (or b!1063624 b!1063619) bm!44955))

(assert (= (or b!1063629 bm!44955) bm!44961))

(assert (= (or b!1063629 b!1063624) bm!44960))

(assert (= (or b!1063616 bm!44961) bm!44957))

(assert (= (or b!1063616 bm!44960) bm!44959))

(assert (= (and d!128909 res!710155) b!1063610))

(assert (= (and d!128909 c!107303) b!1063612))

(assert (= (and d!128909 (not c!107303)) b!1063628))

(assert (= (and d!128909 res!710151) b!1063617))

(assert (= (and b!1063617 res!710152) b!1063620))

(assert (= (and b!1063617 (not res!710156)) b!1063611))

(assert (= (and b!1063611 res!710153) b!1063618))

(assert (= (and b!1063617 res!710150) b!1063627))

(assert (= (and b!1063627 c!107304) b!1063621))

(assert (= (and b!1063627 (not c!107304)) b!1063626))

(assert (= (and b!1063621 res!710157) b!1063615))

(assert (= (or b!1063621 b!1063626) bm!44956))

(assert (= (and b!1063627 res!710154) b!1063614))

(assert (= (and b!1063614 c!107301) b!1063613))

(assert (= (and b!1063614 (not c!107301)) b!1063630))

(assert (= (and b!1063613 res!710149) b!1063622))

(assert (= (or b!1063613 b!1063630) bm!44958))

(declare-fun b_lambda!16481 () Bool)

(assert (=> (not b_lambda!16481) (not b!1063618)))

(declare-fun t!31956 () Bool)

(declare-fun tb!7135 () Bool)

(assert (=> (and start!94028 (= defaultEntry!963 defaultEntry!963) t!31956) tb!7135))

(declare-fun result!14713 () Bool)

(assert (=> tb!7135 (= result!14713 tp_is_empty!25275)))

(assert (=> b!1063618 t!31956))

(declare-fun b_and!34201 () Bool)

(assert (= b_and!34197 (and (=> t!31956 result!14713) b_and!34201)))

(declare-fun m!982271 () Bool)

(assert (=> b!1063618 m!982271))

(declare-fun m!982273 () Bool)

(assert (=> b!1063618 m!982273))

(declare-fun m!982275 () Bool)

(assert (=> b!1063618 m!982275))

(assert (=> b!1063618 m!982273))

(assert (=> b!1063618 m!982271))

(assert (=> b!1063618 m!982251))

(declare-fun m!982277 () Bool)

(assert (=> b!1063618 m!982277))

(assert (=> b!1063618 m!982251))

(declare-fun m!982279 () Bool)

(assert (=> bm!44956 m!982279))

(declare-fun m!982281 () Bool)

(assert (=> b!1063612 m!982281))

(declare-fun m!982283 () Bool)

(assert (=> b!1063612 m!982283))

(declare-fun m!982285 () Bool)

(assert (=> b!1063612 m!982285))

(declare-fun m!982287 () Bool)

(assert (=> b!1063612 m!982287))

(declare-fun m!982289 () Bool)

(assert (=> b!1063612 m!982289))

(declare-fun m!982291 () Bool)

(assert (=> b!1063612 m!982291))

(declare-fun m!982293 () Bool)

(assert (=> b!1063612 m!982293))

(declare-fun m!982295 () Bool)

(assert (=> b!1063612 m!982295))

(declare-fun m!982297 () Bool)

(assert (=> b!1063612 m!982297))

(assert (=> b!1063612 m!982223))

(assert (=> b!1063612 m!982287))

(declare-fun m!982299 () Bool)

(assert (=> b!1063612 m!982299))

(declare-fun m!982301 () Bool)

(assert (=> b!1063612 m!982301))

(assert (=> b!1063612 m!982299))

(assert (=> b!1063612 m!982291))

(declare-fun m!982303 () Bool)

(assert (=> b!1063612 m!982303))

(assert (=> b!1063612 m!982283))

(declare-fun m!982305 () Bool)

(assert (=> b!1063612 m!982305))

(declare-fun m!982307 () Bool)

(assert (=> b!1063612 m!982307))

(declare-fun m!982309 () Bool)

(assert (=> b!1063612 m!982309))

(assert (=> b!1063612 m!982251))

(declare-fun m!982311 () Bool)

(assert (=> b!1063615 m!982311))

(assert (=> b!1063610 m!982251))

(assert (=> b!1063610 m!982251))

(assert (=> b!1063610 m!982253))

(assert (=> b!1063620 m!982251))

(assert (=> b!1063620 m!982251))

(assert (=> b!1063620 m!982253))

(assert (=> bm!44957 m!982223))

(declare-fun m!982313 () Bool)

(assert (=> b!1063622 m!982313))

(declare-fun m!982315 () Bool)

(assert (=> bm!44959 m!982315))

(declare-fun m!982317 () Bool)

(assert (=> b!1063616 m!982317))

(assert (=> d!128909 m!982199))

(assert (=> b!1063611 m!982251))

(assert (=> b!1063611 m!982251))

(declare-fun m!982319 () Bool)

(assert (=> b!1063611 m!982319))

(declare-fun m!982321 () Bool)

(assert (=> bm!44958 m!982321))

(assert (=> b!1063517 d!128909))

(declare-fun d!128911 () Bool)

(assert (=> d!128911 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94028 d!128911))

(declare-fun d!128913 () Bool)

(assert (=> d!128913 (= (array_inv!25156 _values!955) (bvsge (size!33016 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94028 d!128913))

(declare-fun d!128915 () Bool)

(assert (=> d!128915 (= (array_inv!25157 _keys!1163) (bvsge (size!33015 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94028 d!128915))

(declare-fun b!1063643 () Bool)

(declare-fun e!606090 () Bool)

(declare-fun contains!6261 (List!22640 (_ BitVec 64)) Bool)

(assert (=> b!1063643 (= e!606090 (contains!6261 Nil!22637 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063644 () Bool)

(declare-fun e!606089 () Bool)

(declare-fun call!44967 () Bool)

(assert (=> b!1063644 (= e!606089 call!44967)))

(declare-fun d!128917 () Bool)

(declare-fun res!710165 () Bool)

(declare-fun e!606092 () Bool)

(assert (=> d!128917 (=> res!710165 e!606092)))

(assert (=> d!128917 (= res!710165 (bvsge #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(assert (=> d!128917 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22637) e!606092)))

(declare-fun b!1063645 () Bool)

(declare-fun e!606091 () Bool)

(assert (=> b!1063645 (= e!606091 e!606089)))

(declare-fun c!107309 () Bool)

(assert (=> b!1063645 (= c!107309 (validKeyInArray!0 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063646 () Bool)

(assert (=> b!1063646 (= e!606089 call!44967)))

(declare-fun bm!44964 () Bool)

(assert (=> bm!44964 (= call!44967 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107309 (Cons!22636 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000) Nil!22637) Nil!22637)))))

(declare-fun b!1063647 () Bool)

(assert (=> b!1063647 (= e!606092 e!606091)))

(declare-fun res!710166 () Bool)

(assert (=> b!1063647 (=> (not res!710166) (not e!606091))))

(assert (=> b!1063647 (= res!710166 (not e!606090))))

(declare-fun res!710164 () Bool)

(assert (=> b!1063647 (=> (not res!710164) (not e!606090))))

(assert (=> b!1063647 (= res!710164 (validKeyInArray!0 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!128917 (not res!710165)) b!1063647))

(assert (= (and b!1063647 res!710164) b!1063643))

(assert (= (and b!1063647 res!710166) b!1063645))

(assert (= (and b!1063645 c!107309) b!1063644))

(assert (= (and b!1063645 (not c!107309)) b!1063646))

(assert (= (or b!1063644 b!1063646) bm!44964))

(assert (=> b!1063643 m!982251))

(assert (=> b!1063643 m!982251))

(declare-fun m!982323 () Bool)

(assert (=> b!1063643 m!982323))

(assert (=> b!1063645 m!982251))

(assert (=> b!1063645 m!982251))

(assert (=> b!1063645 m!982253))

(assert (=> bm!44964 m!982251))

(declare-fun m!982325 () Bool)

(assert (=> bm!44964 m!982325))

(assert (=> b!1063647 m!982251))

(assert (=> b!1063647 m!982251))

(assert (=> b!1063647 m!982253))

(assert (=> b!1063518 d!128917))

(declare-fun d!128919 () Bool)

(assert (=> d!128919 (= (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468840 () Unit!34858)

(declare-fun choose!1726 (array!67547 array!67549 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38835 V!38835 V!38835 V!38835 (_ BitVec 32) Int) Unit!34858)

(assert (=> d!128919 (= lt!468840 (choose!1726 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128919 (validMask!0 mask!1515)))

(assert (=> d!128919 (= (lemmaNoChangeToArrayThenSameMapNoExtras!659 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468840)))

(declare-fun bs!31271 () Bool)

(assert (= bs!31271 d!128919))

(assert (=> bs!31271 m!982223))

(assert (=> bs!31271 m!982221))

(declare-fun m!982327 () Bool)

(assert (=> bs!31271 m!982327))

(assert (=> bs!31271 m!982199))

(assert (=> b!1063515 d!128919))

(declare-fun b!1063672 () Bool)

(assert (=> b!1063672 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(assert (=> b!1063672 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33016 _values!955)))))

(declare-fun lt!468857 () ListLongMap!14029)

(declare-fun e!606112 () Bool)

(assert (=> b!1063672 (= e!606112 (= (apply!920 lt!468857 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)) (get!16970 (select (arr!32480 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun call!44970 () ListLongMap!14029)

(declare-fun bm!44967 () Bool)

(assert (=> bm!44967 (= call!44970 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1063673 () Bool)

(declare-fun e!606107 () ListLongMap!14029)

(declare-fun e!606113 () ListLongMap!14029)

(assert (=> b!1063673 (= e!606107 e!606113)))

(declare-fun c!107318 () Bool)

(assert (=> b!1063673 (= c!107318 (validKeyInArray!0 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063674 () Bool)

(declare-fun res!710176 () Bool)

(declare-fun e!606108 () Bool)

(assert (=> b!1063674 (=> (not res!710176) (not e!606108))))

(assert (=> b!1063674 (= res!710176 (not (contains!6259 lt!468857 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1063675 () Bool)

(declare-fun e!606109 () Bool)

(declare-fun isEmpty!938 (ListLongMap!14029) Bool)

(assert (=> b!1063675 (= e!606109 (isEmpty!938 lt!468857))))

(declare-fun b!1063676 () Bool)

(assert (=> b!1063676 (= e!606109 (= lt!468857 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!128921 () Bool)

(assert (=> d!128921 e!606108))

(declare-fun res!710175 () Bool)

(assert (=> d!128921 (=> (not res!710175) (not e!606108))))

(assert (=> d!128921 (= res!710175 (not (contains!6259 lt!468857 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128921 (= lt!468857 e!606107)))

(declare-fun c!107319 () Bool)

(assert (=> d!128921 (= c!107319 (bvsge #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(assert (=> d!128921 (validMask!0 mask!1515)))

(assert (=> d!128921 (= (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468857)))

(declare-fun b!1063677 () Bool)

(declare-fun lt!468861 () Unit!34858)

(declare-fun lt!468859 () Unit!34858)

(assert (=> b!1063677 (= lt!468861 lt!468859)))

(declare-fun lt!468860 () ListLongMap!14029)

(declare-fun lt!468858 () (_ BitVec 64))

(declare-fun lt!468856 () (_ BitVec 64))

(declare-fun lt!468855 () V!38835)

(assert (=> b!1063677 (not (contains!6259 (+!3118 lt!468860 (tuple2!16061 lt!468858 lt!468855)) lt!468856))))

(declare-fun addStillNotContains!248 (ListLongMap!14029 (_ BitVec 64) V!38835 (_ BitVec 64)) Unit!34858)

(assert (=> b!1063677 (= lt!468859 (addStillNotContains!248 lt!468860 lt!468858 lt!468855 lt!468856))))

(assert (=> b!1063677 (= lt!468856 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1063677 (= lt!468855 (get!16970 (select (arr!32480 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1063677 (= lt!468858 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1063677 (= lt!468860 call!44970)))

(assert (=> b!1063677 (= e!606113 (+!3118 call!44970 (tuple2!16061 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000) (get!16970 (select (arr!32480 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1063678 () Bool)

(assert (=> b!1063678 (= e!606107 (ListLongMap!14030 Nil!22636))))

(declare-fun b!1063679 () Bool)

(assert (=> b!1063679 (= e!606113 call!44970)))

(declare-fun b!1063680 () Bool)

(declare-fun e!606110 () Bool)

(assert (=> b!1063680 (= e!606110 e!606109)))

(declare-fun c!107320 () Bool)

(assert (=> b!1063680 (= c!107320 (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(declare-fun b!1063681 () Bool)

(assert (=> b!1063681 (= e!606110 e!606112)))

(assert (=> b!1063681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(declare-fun res!710177 () Bool)

(assert (=> b!1063681 (= res!710177 (contains!6259 lt!468857 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063681 (=> (not res!710177) (not e!606112))))

(declare-fun b!1063682 () Bool)

(declare-fun e!606111 () Bool)

(assert (=> b!1063682 (= e!606111 (validKeyInArray!0 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063682 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1063683 () Bool)

(assert (=> b!1063683 (= e!606108 e!606110)))

(declare-fun c!107321 () Bool)

(assert (=> b!1063683 (= c!107321 e!606111)))

(declare-fun res!710178 () Bool)

(assert (=> b!1063683 (=> (not res!710178) (not e!606111))))

(assert (=> b!1063683 (= res!710178 (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(assert (= (and d!128921 c!107319) b!1063678))

(assert (= (and d!128921 (not c!107319)) b!1063673))

(assert (= (and b!1063673 c!107318) b!1063677))

(assert (= (and b!1063673 (not c!107318)) b!1063679))

(assert (= (or b!1063677 b!1063679) bm!44967))

(assert (= (and d!128921 res!710175) b!1063674))

(assert (= (and b!1063674 res!710176) b!1063683))

(assert (= (and b!1063683 res!710178) b!1063682))

(assert (= (and b!1063683 c!107321) b!1063681))

(assert (= (and b!1063683 (not c!107321)) b!1063680))

(assert (= (and b!1063681 res!710177) b!1063672))

(assert (= (and b!1063680 c!107320) b!1063676))

(assert (= (and b!1063680 (not c!107320)) b!1063675))

(declare-fun b_lambda!16483 () Bool)

(assert (=> (not b_lambda!16483) (not b!1063672)))

(assert (=> b!1063672 t!31956))

(declare-fun b_and!34203 () Bool)

(assert (= b_and!34201 (and (=> t!31956 result!14713) b_and!34203)))

(declare-fun b_lambda!16485 () Bool)

(assert (=> (not b_lambda!16485) (not b!1063677)))

(assert (=> b!1063677 t!31956))

(declare-fun b_and!34205 () Bool)

(assert (= b_and!34203 (and (=> t!31956 result!14713) b_and!34205)))

(declare-fun m!982329 () Bool)

(assert (=> d!128921 m!982329))

(assert (=> d!128921 m!982199))

(assert (=> b!1063673 m!982251))

(assert (=> b!1063673 m!982251))

(assert (=> b!1063673 m!982253))

(declare-fun m!982331 () Bool)

(assert (=> b!1063676 m!982331))

(assert (=> b!1063677 m!982273))

(assert (=> b!1063677 m!982271))

(assert (=> b!1063677 m!982273))

(assert (=> b!1063677 m!982275))

(assert (=> b!1063677 m!982251))

(declare-fun m!982333 () Bool)

(assert (=> b!1063677 m!982333))

(declare-fun m!982335 () Bool)

(assert (=> b!1063677 m!982335))

(assert (=> b!1063677 m!982335))

(declare-fun m!982337 () Bool)

(assert (=> b!1063677 m!982337))

(declare-fun m!982339 () Bool)

(assert (=> b!1063677 m!982339))

(assert (=> b!1063677 m!982271))

(assert (=> b!1063672 m!982273))

(assert (=> b!1063672 m!982271))

(assert (=> b!1063672 m!982273))

(assert (=> b!1063672 m!982275))

(assert (=> b!1063672 m!982251))

(assert (=> b!1063672 m!982251))

(declare-fun m!982341 () Bool)

(assert (=> b!1063672 m!982341))

(assert (=> b!1063672 m!982271))

(declare-fun m!982343 () Bool)

(assert (=> b!1063674 m!982343))

(assert (=> bm!44967 m!982331))

(assert (=> b!1063682 m!982251))

(assert (=> b!1063682 m!982251))

(assert (=> b!1063682 m!982253))

(assert (=> b!1063681 m!982251))

(assert (=> b!1063681 m!982251))

(declare-fun m!982345 () Bool)

(assert (=> b!1063681 m!982345))

(declare-fun m!982347 () Bool)

(assert (=> b!1063675 m!982347))

(assert (=> b!1063515 d!128921))

(declare-fun b!1063684 () Bool)

(assert (=> b!1063684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(assert (=> b!1063684 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33016 _values!955)))))

(declare-fun e!606119 () Bool)

(declare-fun lt!468864 () ListLongMap!14029)

(assert (=> b!1063684 (= e!606119 (= (apply!920 lt!468864 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)) (get!16970 (select (arr!32480 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!44968 () Bool)

(declare-fun call!44971 () ListLongMap!14029)

(assert (=> bm!44968 (= call!44971 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1063685 () Bool)

(declare-fun e!606114 () ListLongMap!14029)

(declare-fun e!606120 () ListLongMap!14029)

(assert (=> b!1063685 (= e!606114 e!606120)))

(declare-fun c!107322 () Bool)

(assert (=> b!1063685 (= c!107322 (validKeyInArray!0 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063686 () Bool)

(declare-fun res!710180 () Bool)

(declare-fun e!606115 () Bool)

(assert (=> b!1063686 (=> (not res!710180) (not e!606115))))

(assert (=> b!1063686 (= res!710180 (not (contains!6259 lt!468864 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1063687 () Bool)

(declare-fun e!606116 () Bool)

(assert (=> b!1063687 (= e!606116 (isEmpty!938 lt!468864))))

(declare-fun b!1063688 () Bool)

(assert (=> b!1063688 (= e!606116 (= lt!468864 (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun d!128923 () Bool)

(assert (=> d!128923 e!606115))

(declare-fun res!710179 () Bool)

(assert (=> d!128923 (=> (not res!710179) (not e!606115))))

(assert (=> d!128923 (= res!710179 (not (contains!6259 lt!468864 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128923 (= lt!468864 e!606114)))

(declare-fun c!107323 () Bool)

(assert (=> d!128923 (= c!107323 (bvsge #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(assert (=> d!128923 (validMask!0 mask!1515)))

(assert (=> d!128923 (= (getCurrentListMapNoExtraKeys!3622 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468864)))

(declare-fun b!1063689 () Bool)

(declare-fun lt!468868 () Unit!34858)

(declare-fun lt!468866 () Unit!34858)

(assert (=> b!1063689 (= lt!468868 lt!468866)))

(declare-fun lt!468863 () (_ BitVec 64))

(declare-fun lt!468867 () ListLongMap!14029)

(declare-fun lt!468862 () V!38835)

(declare-fun lt!468865 () (_ BitVec 64))

(assert (=> b!1063689 (not (contains!6259 (+!3118 lt!468867 (tuple2!16061 lt!468865 lt!468862)) lt!468863))))

(assert (=> b!1063689 (= lt!468866 (addStillNotContains!248 lt!468867 lt!468865 lt!468862 lt!468863))))

(assert (=> b!1063689 (= lt!468863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1063689 (= lt!468862 (get!16970 (select (arr!32480 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1063689 (= lt!468865 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1063689 (= lt!468867 call!44971)))

(assert (=> b!1063689 (= e!606120 (+!3118 call!44971 (tuple2!16061 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000) (get!16970 (select (arr!32480 _values!955) #b00000000000000000000000000000000) (dynLambda!2027 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1063690 () Bool)

(assert (=> b!1063690 (= e!606114 (ListLongMap!14030 Nil!22636))))

(declare-fun b!1063691 () Bool)

(assert (=> b!1063691 (= e!606120 call!44971)))

(declare-fun b!1063692 () Bool)

(declare-fun e!606117 () Bool)

(assert (=> b!1063692 (= e!606117 e!606116)))

(declare-fun c!107324 () Bool)

(assert (=> b!1063692 (= c!107324 (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(declare-fun b!1063693 () Bool)

(assert (=> b!1063693 (= e!606117 e!606119)))

(assert (=> b!1063693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(declare-fun res!710181 () Bool)

(assert (=> b!1063693 (= res!710181 (contains!6259 lt!468864 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063693 (=> (not res!710181) (not e!606119))))

(declare-fun b!1063694 () Bool)

(declare-fun e!606118 () Bool)

(assert (=> b!1063694 (= e!606118 (validKeyInArray!0 (select (arr!32479 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1063694 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1063695 () Bool)

(assert (=> b!1063695 (= e!606115 e!606117)))

(declare-fun c!107325 () Bool)

(assert (=> b!1063695 (= c!107325 e!606118)))

(declare-fun res!710182 () Bool)

(assert (=> b!1063695 (=> (not res!710182) (not e!606118))))

(assert (=> b!1063695 (= res!710182 (bvslt #b00000000000000000000000000000000 (size!33015 _keys!1163)))))

(assert (= (and d!128923 c!107323) b!1063690))

(assert (= (and d!128923 (not c!107323)) b!1063685))

(assert (= (and b!1063685 c!107322) b!1063689))

(assert (= (and b!1063685 (not c!107322)) b!1063691))

(assert (= (or b!1063689 b!1063691) bm!44968))

(assert (= (and d!128923 res!710179) b!1063686))

(assert (= (and b!1063686 res!710180) b!1063695))

(assert (= (and b!1063695 res!710182) b!1063694))

(assert (= (and b!1063695 c!107325) b!1063693))

(assert (= (and b!1063695 (not c!107325)) b!1063692))

(assert (= (and b!1063693 res!710181) b!1063684))

(assert (= (and b!1063692 c!107324) b!1063688))

(assert (= (and b!1063692 (not c!107324)) b!1063687))

(declare-fun b_lambda!16487 () Bool)

(assert (=> (not b_lambda!16487) (not b!1063684)))

(assert (=> b!1063684 t!31956))

(declare-fun b_and!34207 () Bool)

(assert (= b_and!34205 (and (=> t!31956 result!14713) b_and!34207)))

(declare-fun b_lambda!16489 () Bool)

(assert (=> (not b_lambda!16489) (not b!1063689)))

(assert (=> b!1063689 t!31956))

(declare-fun b_and!34209 () Bool)

(assert (= b_and!34207 (and (=> t!31956 result!14713) b_and!34209)))

(declare-fun m!982349 () Bool)

(assert (=> d!128923 m!982349))

(assert (=> d!128923 m!982199))

(assert (=> b!1063685 m!982251))

(assert (=> b!1063685 m!982251))

(assert (=> b!1063685 m!982253))

(declare-fun m!982351 () Bool)

(assert (=> b!1063688 m!982351))

(assert (=> b!1063689 m!982273))

(assert (=> b!1063689 m!982271))

(assert (=> b!1063689 m!982273))

(assert (=> b!1063689 m!982275))

(assert (=> b!1063689 m!982251))

(declare-fun m!982353 () Bool)

(assert (=> b!1063689 m!982353))

(declare-fun m!982355 () Bool)

(assert (=> b!1063689 m!982355))

(assert (=> b!1063689 m!982355))

(declare-fun m!982357 () Bool)

(assert (=> b!1063689 m!982357))

(declare-fun m!982359 () Bool)

(assert (=> b!1063689 m!982359))

(assert (=> b!1063689 m!982271))

(assert (=> b!1063684 m!982273))

(assert (=> b!1063684 m!982271))

(assert (=> b!1063684 m!982273))

(assert (=> b!1063684 m!982275))

(assert (=> b!1063684 m!982251))

(assert (=> b!1063684 m!982251))

(declare-fun m!982361 () Bool)

(assert (=> b!1063684 m!982361))

(assert (=> b!1063684 m!982271))

(declare-fun m!982363 () Bool)

(assert (=> b!1063686 m!982363))

(assert (=> bm!44968 m!982351))

(assert (=> b!1063694 m!982251))

(assert (=> b!1063694 m!982251))

(assert (=> b!1063694 m!982253))

(assert (=> b!1063693 m!982251))

(assert (=> b!1063693 m!982251))

(declare-fun m!982365 () Bool)

(assert (=> b!1063693 m!982365))

(declare-fun m!982367 () Bool)

(assert (=> b!1063687 m!982367))

(assert (=> b!1063515 d!128923))

(declare-fun d!128925 () Bool)

(declare-fun lt!468871 () ListLongMap!14029)

(assert (=> d!128925 (not (contains!6259 lt!468871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!68 (List!22639 (_ BitVec 64)) List!22639)

(assert (=> d!128925 (= lt!468871 (ListLongMap!14030 (removeStrictlySorted!68 (toList!7030 lt!468731) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128925 (= (-!590 lt!468731 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468871)))

(declare-fun bs!31272 () Bool)

(assert (= bs!31272 d!128925))

(declare-fun m!982369 () Bool)

(assert (=> bs!31272 m!982369))

(declare-fun m!982371 () Bool)

(assert (=> bs!31272 m!982371))

(assert (=> b!1063511 d!128925))

(declare-fun d!128927 () Bool)

(assert (=> d!128927 (= (-!590 lt!468731 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468731)))

(declare-fun lt!468874 () Unit!34858)

(declare-fun choose!1727 (ListLongMap!14029 (_ BitVec 64)) Unit!34858)

(assert (=> d!128927 (= lt!468874 (choose!1727 lt!468731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128927 (not (contains!6259 lt!468731 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128927 (= (removeNotPresentStillSame!37 lt!468731 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468874)))

(declare-fun bs!31273 () Bool)

(assert (= bs!31273 d!128927))

(assert (=> bs!31273 m!982207))

(declare-fun m!982373 () Bool)

(assert (=> bs!31273 m!982373))

(assert (=> bs!31273 m!982213))

(assert (=> b!1063511 d!128927))

(declare-fun mapNonEmpty!39595 () Bool)

(declare-fun mapRes!39595 () Bool)

(declare-fun tp!75833 () Bool)

(declare-fun e!606125 () Bool)

(assert (=> mapNonEmpty!39595 (= mapRes!39595 (and tp!75833 e!606125))))

(declare-fun mapValue!39595 () ValueCell!11934)

(declare-fun mapKey!39595 () (_ BitVec 32))

(declare-fun mapRest!39595 () (Array (_ BitVec 32) ValueCell!11934))

(assert (=> mapNonEmpty!39595 (= mapRest!39589 (store mapRest!39595 mapKey!39595 mapValue!39595))))

(declare-fun mapIsEmpty!39595 () Bool)

(assert (=> mapIsEmpty!39595 mapRes!39595))

(declare-fun condMapEmpty!39595 () Bool)

(declare-fun mapDefault!39595 () ValueCell!11934)

(assert (=> mapNonEmpty!39589 (= condMapEmpty!39595 (= mapRest!39589 ((as const (Array (_ BitVec 32) ValueCell!11934)) mapDefault!39595)))))

(declare-fun e!606126 () Bool)

(assert (=> mapNonEmpty!39589 (= tp!75823 (and e!606126 mapRes!39595))))

(declare-fun b!1063703 () Bool)

(assert (=> b!1063703 (= e!606126 tp_is_empty!25275)))

(declare-fun b!1063702 () Bool)

(assert (=> b!1063702 (= e!606125 tp_is_empty!25275)))

(assert (= (and mapNonEmpty!39589 condMapEmpty!39595) mapIsEmpty!39595))

(assert (= (and mapNonEmpty!39589 (not condMapEmpty!39595)) mapNonEmpty!39595))

(assert (= (and mapNonEmpty!39595 ((_ is ValueCellFull!11934) mapValue!39595)) b!1063702))

(assert (= (and mapNonEmpty!39589 ((_ is ValueCellFull!11934) mapDefault!39595)) b!1063703))

(declare-fun m!982375 () Bool)

(assert (=> mapNonEmpty!39595 m!982375))

(declare-fun b_lambda!16491 () Bool)

(assert (= b_lambda!16485 (or (and start!94028 b_free!21465) b_lambda!16491)))

(declare-fun b_lambda!16493 () Bool)

(assert (= b_lambda!16483 (or (and start!94028 b_free!21465) b_lambda!16493)))

(declare-fun b_lambda!16495 () Bool)

(assert (= b_lambda!16481 (or (and start!94028 b_free!21465) b_lambda!16495)))

(declare-fun b_lambda!16497 () Bool)

(assert (= b_lambda!16489 (or (and start!94028 b_free!21465) b_lambda!16497)))

(declare-fun b_lambda!16499 () Bool)

(assert (= b_lambda!16487 (or (and start!94028 b_free!21465) b_lambda!16499)))

(check-sat (not bm!44958) (not b!1063612) (not b_lambda!16491) (not d!128927) (not b!1063674) (not b_lambda!16497) (not b!1063556) (not b!1063677) (not b!1063647) (not b!1063688) (not b_next!21465) b_and!34209 (not b!1063682) (not bm!44959) (not mapNonEmpty!39595) (not b_lambda!16499) (not d!128919) (not b!1063672) (not bm!44968) (not d!128907) (not b!1063673) (not b!1063675) tp_is_empty!25275 (not b!1063555) (not b!1063693) (not b!1063687) (not b!1063684) (not b!1063620) (not b!1063645) (not b!1063610) (not b!1063615) (not b!1063681) (not b!1063686) (not b!1063643) (not bm!44956) (not b!1063689) (not bm!44940) (not b_lambda!16495) (not b!1063685) (not bm!44967) (not b!1063567) (not b!1063616) (not bm!44957) (not bm!44964) (not d!128925) (not b!1063611) (not b!1063694) (not d!128921) (not b_lambda!16493) (not b!1063565) (not b!1063622) (not b!1063618) (not d!128923) (not b!1063676) (not d!128909))
(check-sat b_and!34209 (not b_next!21465))
