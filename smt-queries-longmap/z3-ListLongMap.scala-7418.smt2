; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94316 () Bool)

(assert start!94316)

(declare-fun b_free!21685 () Bool)

(declare-fun b_next!21685 () Bool)

(assert (=> start!94316 (= b_free!21685 (not b_next!21685))))

(declare-fun tp!76495 () Bool)

(declare-fun b_and!34431 () Bool)

(assert (=> start!94316 (= tp!76495 b_and!34431)))

(declare-fun mapNonEmpty!39931 () Bool)

(declare-fun mapRes!39931 () Bool)

(declare-fun tp!76496 () Bool)

(declare-fun e!608190 () Bool)

(assert (=> mapNonEmpty!39931 (= mapRes!39931 (and tp!76496 e!608190))))

(declare-fun mapKey!39931 () (_ BitVec 32))

(declare-datatypes ((V!39129 0))(
  ( (V!39130 (val!12798 Int)) )
))
(declare-datatypes ((ValueCell!12044 0))(
  ( (ValueCellFull!12044 (v!15410 V!39129)) (EmptyCell!12044) )
))
(declare-datatypes ((array!67916 0))(
  ( (array!67917 (arr!32660 (Array (_ BitVec 32) ValueCell!12044)) (size!33198 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67916)

(declare-fun mapValue!39931 () ValueCell!12044)

(declare-fun mapRest!39931 () (Array (_ BitVec 32) ValueCell!12044))

(assert (=> mapNonEmpty!39931 (= (arr!32660 _values!955) (store mapRest!39931 mapKey!39931 mapValue!39931))))

(declare-fun res!711846 () Bool)

(declare-fun e!608194 () Bool)

(assert (=> start!94316 (=> (not res!711846) (not e!608194))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94316 (= res!711846 (validMask!0 mask!1515))))

(assert (=> start!94316 e!608194))

(assert (=> start!94316 true))

(declare-fun tp_is_empty!25495 () Bool)

(assert (=> start!94316 tp_is_empty!25495))

(declare-fun e!608189 () Bool)

(declare-fun array_inv!25284 (array!67916) Bool)

(assert (=> start!94316 (and (array_inv!25284 _values!955) e!608189)))

(assert (=> start!94316 tp!76495))

(declare-datatypes ((array!67918 0))(
  ( (array!67919 (arr!32661 (Array (_ BitVec 32) (_ BitVec 64))) (size!33199 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67918)

(declare-fun array_inv!25285 (array!67918) Bool)

(assert (=> start!94316 (array_inv!25285 _keys!1163)))

(declare-fun b!1066506 () Bool)

(declare-fun e!608191 () Bool)

(assert (=> b!1066506 (= e!608191 tp_is_empty!25495)))

(declare-fun b!1066507 () Bool)

(declare-fun res!711849 () Bool)

(assert (=> b!1066507 (=> (not res!711849) (not e!608194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67918 (_ BitVec 32)) Bool)

(assert (=> b!1066507 (= res!711849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066508 () Bool)

(assert (=> b!1066508 (= e!608189 (and e!608191 mapRes!39931))))

(declare-fun condMapEmpty!39931 () Bool)

(declare-fun mapDefault!39931 () ValueCell!12044)

(assert (=> b!1066508 (= condMapEmpty!39931 (= (arr!32660 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12044)) mapDefault!39931)))))

(declare-fun mapIsEmpty!39931 () Bool)

(assert (=> mapIsEmpty!39931 mapRes!39931))

(declare-fun b!1066509 () Bool)

(declare-fun e!608188 () Bool)

(declare-fun e!608193 () Bool)

(assert (=> b!1066509 (= e!608188 e!608193)))

(declare-fun res!711848 () Bool)

(assert (=> b!1066509 (=> res!711848 e!608193)))

(declare-datatypes ((tuple2!16290 0))(
  ( (tuple2!16291 (_1!8156 (_ BitVec 64)) (_2!8156 V!39129)) )
))
(declare-datatypes ((List!22834 0))(
  ( (Nil!22831) (Cons!22830 (h!24039 tuple2!16290) (t!32146 List!22834)) )
))
(declare-datatypes ((ListLongMap!14259 0))(
  ( (ListLongMap!14260 (toList!7145 List!22834)) )
))
(declare-fun lt!470823 () ListLongMap!14259)

(declare-fun lt!470819 () ListLongMap!14259)

(declare-fun -!615 (ListLongMap!14259 (_ BitVec 64)) ListLongMap!14259)

(assert (=> b!1066509 (= res!711848 (not (= (-!615 lt!470823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470819)))))

(declare-fun lt!470820 () ListLongMap!14259)

(declare-fun lt!470818 () ListLongMap!14259)

(assert (=> b!1066509 (= (-!615 lt!470820 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470818)))

(declare-datatypes ((Unit!34878 0))(
  ( (Unit!34879) )
))
(declare-fun lt!470824 () Unit!34878)

(declare-fun zeroValueBefore!47 () V!39129)

(declare-fun addThenRemoveForNewKeyIsSame!33 (ListLongMap!14259 (_ BitVec 64) V!39129) Unit!34878)

(assert (=> b!1066509 (= lt!470824 (addThenRemoveForNewKeyIsSame!33 lt!470818 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470821 () ListLongMap!14259)

(assert (=> b!1066509 (and (= lt!470823 lt!470820) (= lt!470819 lt!470821))))

(declare-fun +!3181 (ListLongMap!14259 tuple2!16290) ListLongMap!14259)

(assert (=> b!1066509 (= lt!470820 (+!3181 lt!470818 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun minValue!907 () V!39129)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39129)

(declare-fun getCurrentListMap!4013 (array!67918 array!67916 (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 (_ BitVec 32) Int) ListLongMap!14259)

(assert (=> b!1066509 (= lt!470819 (getCurrentListMap!4013 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066509 (= lt!470823 (getCurrentListMap!4013 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066510 () Bool)

(declare-fun res!711847 () Bool)

(assert (=> b!1066510 (=> (not res!711847) (not e!608194))))

(assert (=> b!1066510 (= res!711847 (and (= (size!33198 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33199 _keys!1163) (size!33198 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066511 () Bool)

(assert (=> b!1066511 (= e!608190 tp_is_empty!25495)))

(declare-fun b!1066512 () Bool)

(assert (=> b!1066512 (= e!608194 (not e!608188))))

(declare-fun res!711850 () Bool)

(assert (=> b!1066512 (=> res!711850 e!608188)))

(assert (=> b!1066512 (= res!711850 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066512 (= lt!470818 lt!470821)))

(declare-fun lt!470822 () Unit!34878)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!735 (array!67918 array!67916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 V!39129 V!39129 (_ BitVec 32) Int) Unit!34878)

(assert (=> b!1066512 (= lt!470822 (lemmaNoChangeToArrayThenSameMapNoExtras!735 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3741 (array!67918 array!67916 (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 (_ BitVec 32) Int) ListLongMap!14259)

(assert (=> b!1066512 (= lt!470821 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066512 (= lt!470818 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066513 () Bool)

(assert (=> b!1066513 (= e!608193 (bvsle #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun b!1066514 () Bool)

(declare-fun res!711845 () Bool)

(assert (=> b!1066514 (=> (not res!711845) (not e!608194))))

(declare-datatypes ((List!22835 0))(
  ( (Nil!22832) (Cons!22831 (h!24040 (_ BitVec 64)) (t!32147 List!22835)) )
))
(declare-fun arrayNoDuplicates!0 (array!67918 (_ BitVec 32) List!22835) Bool)

(assert (=> b!1066514 (= res!711845 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22832))))

(assert (= (and start!94316 res!711846) b!1066510))

(assert (= (and b!1066510 res!711847) b!1066507))

(assert (= (and b!1066507 res!711849) b!1066514))

(assert (= (and b!1066514 res!711845) b!1066512))

(assert (= (and b!1066512 (not res!711850)) b!1066509))

(assert (= (and b!1066509 (not res!711848)) b!1066513))

(assert (= (and b!1066508 condMapEmpty!39931) mapIsEmpty!39931))

(assert (= (and b!1066508 (not condMapEmpty!39931)) mapNonEmpty!39931))

(get-info :version)

(assert (= (and mapNonEmpty!39931 ((_ is ValueCellFull!12044) mapValue!39931)) b!1066511))

(assert (= (and b!1066508 ((_ is ValueCellFull!12044) mapDefault!39931)) b!1066506))

(assert (= start!94316 b!1066508))

(declare-fun m!984747 () Bool)

(assert (=> b!1066512 m!984747))

(declare-fun m!984749 () Bool)

(assert (=> b!1066512 m!984749))

(declare-fun m!984751 () Bool)

(assert (=> b!1066512 m!984751))

(declare-fun m!984753 () Bool)

(assert (=> b!1066509 m!984753))

(declare-fun m!984755 () Bool)

(assert (=> b!1066509 m!984755))

(declare-fun m!984757 () Bool)

(assert (=> b!1066509 m!984757))

(declare-fun m!984759 () Bool)

(assert (=> b!1066509 m!984759))

(declare-fun m!984761 () Bool)

(assert (=> b!1066509 m!984761))

(declare-fun m!984763 () Bool)

(assert (=> b!1066509 m!984763))

(declare-fun m!984765 () Bool)

(assert (=> b!1066507 m!984765))

(declare-fun m!984767 () Bool)

(assert (=> start!94316 m!984767))

(declare-fun m!984769 () Bool)

(assert (=> start!94316 m!984769))

(declare-fun m!984771 () Bool)

(assert (=> start!94316 m!984771))

(declare-fun m!984773 () Bool)

(assert (=> mapNonEmpty!39931 m!984773))

(declare-fun m!984775 () Bool)

(assert (=> b!1066514 m!984775))

(check-sat tp_is_empty!25495 (not b!1066512) (not start!94316) b_and!34431 (not b!1066507) (not b_next!21685) (not b!1066514) (not mapNonEmpty!39931) (not b!1066509))
(check-sat b_and!34431 (not b_next!21685))
(get-model)

(declare-fun d!128909 () Bool)

(declare-fun res!711893 () Bool)

(declare-fun e!608246 () Bool)

(assert (=> d!128909 (=> res!711893 e!608246)))

(assert (=> d!128909 (= res!711893 (bvsge #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(assert (=> d!128909 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22832) e!608246)))

(declare-fun b!1066579 () Bool)

(declare-fun e!608247 () Bool)

(declare-fun e!608245 () Bool)

(assert (=> b!1066579 (= e!608247 e!608245)))

(declare-fun c!107397 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1066579 (= c!107397 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066580 () Bool)

(declare-fun call!45030 () Bool)

(assert (=> b!1066580 (= e!608245 call!45030)))

(declare-fun b!1066581 () Bool)

(assert (=> b!1066581 (= e!608245 call!45030)))

(declare-fun bm!45027 () Bool)

(assert (=> bm!45027 (= call!45030 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107397 (Cons!22831 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000) Nil!22832) Nil!22832)))))

(declare-fun b!1066582 () Bool)

(declare-fun e!608248 () Bool)

(declare-fun contains!6242 (List!22835 (_ BitVec 64)) Bool)

(assert (=> b!1066582 (= e!608248 (contains!6242 Nil!22832 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066583 () Bool)

(assert (=> b!1066583 (= e!608246 e!608247)))

(declare-fun res!711895 () Bool)

(assert (=> b!1066583 (=> (not res!711895) (not e!608247))))

(assert (=> b!1066583 (= res!711895 (not e!608248))))

(declare-fun res!711894 () Bool)

(assert (=> b!1066583 (=> (not res!711894) (not e!608248))))

(assert (=> b!1066583 (= res!711894 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!128909 (not res!711893)) b!1066583))

(assert (= (and b!1066583 res!711894) b!1066582))

(assert (= (and b!1066583 res!711895) b!1066579))

(assert (= (and b!1066579 c!107397) b!1066580))

(assert (= (and b!1066579 (not c!107397)) b!1066581))

(assert (= (or b!1066580 b!1066581) bm!45027))

(declare-fun m!984837 () Bool)

(assert (=> b!1066579 m!984837))

(assert (=> b!1066579 m!984837))

(declare-fun m!984839 () Bool)

(assert (=> b!1066579 m!984839))

(assert (=> bm!45027 m!984837))

(declare-fun m!984841 () Bool)

(assert (=> bm!45027 m!984841))

(assert (=> b!1066582 m!984837))

(assert (=> b!1066582 m!984837))

(declare-fun m!984843 () Bool)

(assert (=> b!1066582 m!984843))

(assert (=> b!1066583 m!984837))

(assert (=> b!1066583 m!984837))

(assert (=> b!1066583 m!984839))

(assert (=> b!1066514 d!128909))

(declare-fun d!128911 () Bool)

(assert (=> d!128911 (= (-!615 (+!3181 lt!470818 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!470818)))

(declare-fun lt!470869 () Unit!34878)

(declare-fun choose!1739 (ListLongMap!14259 (_ BitVec 64) V!39129) Unit!34878)

(assert (=> d!128911 (= lt!470869 (choose!1739 lt!470818 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun contains!6243 (ListLongMap!14259 (_ BitVec 64)) Bool)

(assert (=> d!128911 (not (contains!6243 lt!470818 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128911 (= (addThenRemoveForNewKeyIsSame!33 lt!470818 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!470869)))

(declare-fun bs!31362 () Bool)

(assert (= bs!31362 d!128911))

(assert (=> bs!31362 m!984763))

(assert (=> bs!31362 m!984763))

(declare-fun m!984845 () Bool)

(assert (=> bs!31362 m!984845))

(declare-fun m!984847 () Bool)

(assert (=> bs!31362 m!984847))

(declare-fun m!984849 () Bool)

(assert (=> bs!31362 m!984849))

(assert (=> b!1066509 d!128911))

(declare-fun d!128913 () Bool)

(declare-fun lt!470872 () ListLongMap!14259)

(assert (=> d!128913 (not (contains!6243 lt!470872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!70 (List!22834 (_ BitVec 64)) List!22834)

(assert (=> d!128913 (= lt!470872 (ListLongMap!14260 (removeStrictlySorted!70 (toList!7145 lt!470823) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128913 (= (-!615 lt!470823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470872)))

(declare-fun bs!31363 () Bool)

(assert (= bs!31363 d!128913))

(declare-fun m!984851 () Bool)

(assert (=> bs!31363 m!984851))

(declare-fun m!984853 () Bool)

(assert (=> bs!31363 m!984853))

(assert (=> b!1066509 d!128913))

(declare-fun b!1066626 () Bool)

(declare-fun e!608284 () Bool)

(declare-fun e!608281 () Bool)

(assert (=> b!1066626 (= e!608284 e!608281)))

(declare-fun c!107415 () Bool)

(assert (=> b!1066626 (= c!107415 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1066627 () Bool)

(declare-fun e!608285 () Bool)

(declare-fun e!608278 () Bool)

(assert (=> b!1066627 (= e!608285 e!608278)))

(declare-fun res!711922 () Bool)

(assert (=> b!1066627 (=> (not res!711922) (not e!608278))))

(declare-fun lt!470933 () ListLongMap!14259)

(assert (=> b!1066627 (= res!711922 (contains!6243 lt!470933 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066627 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun b!1066628 () Bool)

(declare-fun e!608283 () Bool)

(declare-fun apply!917 (ListLongMap!14259 (_ BitVec 64)) V!39129)

(assert (=> b!1066628 (= e!608283 (= (apply!917 lt!470933 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1066629 () Bool)

(declare-fun e!608280 () Unit!34878)

(declare-fun lt!470931 () Unit!34878)

(assert (=> b!1066629 (= e!608280 lt!470931)))

(declare-fun lt!470938 () ListLongMap!14259)

(assert (=> b!1066629 (= lt!470938 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470924 () (_ BitVec 64))

(assert (=> b!1066629 (= lt!470924 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470928 () (_ BitVec 64))

(assert (=> b!1066629 (= lt!470928 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470930 () Unit!34878)

(declare-fun addStillContains!633 (ListLongMap!14259 (_ BitVec 64) V!39129 (_ BitVec 64)) Unit!34878)

(assert (=> b!1066629 (= lt!470930 (addStillContains!633 lt!470938 lt!470924 zeroValueAfter!47 lt!470928))))

(assert (=> b!1066629 (contains!6243 (+!3181 lt!470938 (tuple2!16291 lt!470924 zeroValueAfter!47)) lt!470928)))

(declare-fun lt!470935 () Unit!34878)

(assert (=> b!1066629 (= lt!470935 lt!470930)))

(declare-fun lt!470927 () ListLongMap!14259)

(assert (=> b!1066629 (= lt!470927 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470936 () (_ BitVec 64))

(assert (=> b!1066629 (= lt!470936 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470925 () (_ BitVec 64))

(assert (=> b!1066629 (= lt!470925 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470926 () Unit!34878)

(declare-fun addApplyDifferent!489 (ListLongMap!14259 (_ BitVec 64) V!39129 (_ BitVec 64)) Unit!34878)

(assert (=> b!1066629 (= lt!470926 (addApplyDifferent!489 lt!470927 lt!470936 minValue!907 lt!470925))))

(assert (=> b!1066629 (= (apply!917 (+!3181 lt!470927 (tuple2!16291 lt!470936 minValue!907)) lt!470925) (apply!917 lt!470927 lt!470925))))

(declare-fun lt!470919 () Unit!34878)

(assert (=> b!1066629 (= lt!470919 lt!470926)))

(declare-fun lt!470929 () ListLongMap!14259)

(assert (=> b!1066629 (= lt!470929 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470922 () (_ BitVec 64))

(assert (=> b!1066629 (= lt!470922 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470917 () (_ BitVec 64))

(assert (=> b!1066629 (= lt!470917 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470920 () Unit!34878)

(assert (=> b!1066629 (= lt!470920 (addApplyDifferent!489 lt!470929 lt!470922 zeroValueAfter!47 lt!470917))))

(assert (=> b!1066629 (= (apply!917 (+!3181 lt!470929 (tuple2!16291 lt!470922 zeroValueAfter!47)) lt!470917) (apply!917 lt!470929 lt!470917))))

(declare-fun lt!470923 () Unit!34878)

(assert (=> b!1066629 (= lt!470923 lt!470920)))

(declare-fun lt!470934 () ListLongMap!14259)

(assert (=> b!1066629 (= lt!470934 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470932 () (_ BitVec 64))

(assert (=> b!1066629 (= lt!470932 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470918 () (_ BitVec 64))

(assert (=> b!1066629 (= lt!470918 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1066629 (= lt!470931 (addApplyDifferent!489 lt!470934 lt!470932 minValue!907 lt!470918))))

(assert (=> b!1066629 (= (apply!917 (+!3181 lt!470934 (tuple2!16291 lt!470932 minValue!907)) lt!470918) (apply!917 lt!470934 lt!470918))))

(declare-fun b!1066630 () Bool)

(declare-fun e!608287 () Bool)

(assert (=> b!1066630 (= e!608281 e!608287)))

(declare-fun res!711919 () Bool)

(declare-fun call!45048 () Bool)

(assert (=> b!1066630 (= res!711919 call!45048)))

(assert (=> b!1066630 (=> (not res!711919) (not e!608287))))

(declare-fun call!45047 () ListLongMap!14259)

(declare-fun c!107413 () Bool)

(declare-fun bm!45042 () Bool)

(declare-fun call!45046 () ListLongMap!14259)

(declare-fun call!45045 () ListLongMap!14259)

(declare-fun c!107414 () Bool)

(declare-fun call!45049 () ListLongMap!14259)

(assert (=> bm!45042 (= call!45049 (+!3181 (ite c!107413 call!45047 (ite c!107414 call!45045 call!45046)) (ite (or c!107413 c!107414) (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45043 () Bool)

(declare-fun call!45051 () Bool)

(assert (=> bm!45043 (= call!45051 (contains!6243 lt!470933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45044 () Bool)

(assert (=> bm!45044 (= call!45048 (contains!6243 lt!470933 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1066631 () Bool)

(declare-fun e!608279 () ListLongMap!14259)

(declare-fun e!608276 () ListLongMap!14259)

(assert (=> b!1066631 (= e!608279 e!608276)))

(assert (=> b!1066631 (= c!107414 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1066632 () Bool)

(declare-fun get!17043 (ValueCell!12044 V!39129) V!39129)

(declare-fun dynLambda!2016 (Int (_ BitVec 64)) V!39129)

(assert (=> b!1066632 (= e!608278 (= (apply!917 lt!470933 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)) (get!17043 (select (arr!32660 _values!955) #b00000000000000000000000000000000) (dynLambda!2016 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1066632 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33198 _values!955)))))

(assert (=> b!1066632 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun b!1066633 () Bool)

(declare-fun e!608286 () ListLongMap!14259)

(declare-fun call!45050 () ListLongMap!14259)

(assert (=> b!1066633 (= e!608286 call!45050)))

(declare-fun b!1066634 () Bool)

(assert (=> b!1066634 (= e!608276 call!45050)))

(declare-fun d!128915 () Bool)

(assert (=> d!128915 e!608284))

(declare-fun res!711916 () Bool)

(assert (=> d!128915 (=> (not res!711916) (not e!608284))))

(assert (=> d!128915 (= res!711916 (or (bvsge #b00000000000000000000000000000000 (size!33199 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))))

(declare-fun lt!470937 () ListLongMap!14259)

(assert (=> d!128915 (= lt!470933 lt!470937)))

(declare-fun lt!470921 () Unit!34878)

(assert (=> d!128915 (= lt!470921 e!608280)))

(declare-fun c!107411 () Bool)

(declare-fun e!608282 () Bool)

(assert (=> d!128915 (= c!107411 e!608282)))

(declare-fun res!711921 () Bool)

(assert (=> d!128915 (=> (not res!711921) (not e!608282))))

(assert (=> d!128915 (= res!711921 (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(assert (=> d!128915 (= lt!470937 e!608279)))

(assert (=> d!128915 (= c!107413 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!128915 (validMask!0 mask!1515)))

(assert (=> d!128915 (= (getCurrentListMap!4013 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470933)))

(declare-fun b!1066635 () Bool)

(assert (=> b!1066635 (= e!608279 (+!3181 call!45049 (tuple2!16291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1066636 () Bool)

(assert (=> b!1066636 (= e!608287 (= (apply!917 lt!470933 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1066637 () Bool)

(declare-fun e!608277 () Bool)

(assert (=> b!1066637 (= e!608277 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066638 () Bool)

(declare-fun e!608275 () Bool)

(assert (=> b!1066638 (= e!608275 e!608283)))

(declare-fun res!711920 () Bool)

(assert (=> b!1066638 (= res!711920 call!45051)))

(assert (=> b!1066638 (=> (not res!711920) (not e!608283))))

(declare-fun b!1066639 () Bool)

(assert (=> b!1066639 (= e!608286 call!45046)))

(declare-fun b!1066640 () Bool)

(declare-fun res!711918 () Bool)

(assert (=> b!1066640 (=> (not res!711918) (not e!608284))))

(assert (=> b!1066640 (= res!711918 e!608285)))

(declare-fun res!711915 () Bool)

(assert (=> b!1066640 (=> res!711915 e!608285)))

(assert (=> b!1066640 (= res!711915 (not e!608277))))

(declare-fun res!711914 () Bool)

(assert (=> b!1066640 (=> (not res!711914) (not e!608277))))

(assert (=> b!1066640 (= res!711914 (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun b!1066641 () Bool)

(assert (=> b!1066641 (= e!608275 (not call!45051))))

(declare-fun b!1066642 () Bool)

(assert (=> b!1066642 (= e!608282 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066643 () Bool)

(declare-fun c!107412 () Bool)

(assert (=> b!1066643 (= c!107412 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066643 (= e!608276 e!608286)))

(declare-fun bm!45045 () Bool)

(assert (=> bm!45045 (= call!45045 call!45047)))

(declare-fun b!1066644 () Bool)

(assert (=> b!1066644 (= e!608281 (not call!45048))))

(declare-fun bm!45046 () Bool)

(assert (=> bm!45046 (= call!45047 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066645 () Bool)

(declare-fun Unit!34884 () Unit!34878)

(assert (=> b!1066645 (= e!608280 Unit!34884)))

(declare-fun bm!45047 () Bool)

(assert (=> bm!45047 (= call!45050 call!45049)))

(declare-fun bm!45048 () Bool)

(assert (=> bm!45048 (= call!45046 call!45045)))

(declare-fun b!1066646 () Bool)

(declare-fun res!711917 () Bool)

(assert (=> b!1066646 (=> (not res!711917) (not e!608284))))

(assert (=> b!1066646 (= res!711917 e!608275)))

(declare-fun c!107410 () Bool)

(assert (=> b!1066646 (= c!107410 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!128915 c!107413) b!1066635))

(assert (= (and d!128915 (not c!107413)) b!1066631))

(assert (= (and b!1066631 c!107414) b!1066634))

(assert (= (and b!1066631 (not c!107414)) b!1066643))

(assert (= (and b!1066643 c!107412) b!1066633))

(assert (= (and b!1066643 (not c!107412)) b!1066639))

(assert (= (or b!1066633 b!1066639) bm!45048))

(assert (= (or b!1066634 bm!45048) bm!45045))

(assert (= (or b!1066634 b!1066633) bm!45047))

(assert (= (or b!1066635 bm!45045) bm!45046))

(assert (= (or b!1066635 bm!45047) bm!45042))

(assert (= (and d!128915 res!711921) b!1066642))

(assert (= (and d!128915 c!107411) b!1066629))

(assert (= (and d!128915 (not c!107411)) b!1066645))

(assert (= (and d!128915 res!711916) b!1066640))

(assert (= (and b!1066640 res!711914) b!1066637))

(assert (= (and b!1066640 (not res!711915)) b!1066627))

(assert (= (and b!1066627 res!711922) b!1066632))

(assert (= (and b!1066640 res!711918) b!1066646))

(assert (= (and b!1066646 c!107410) b!1066638))

(assert (= (and b!1066646 (not c!107410)) b!1066641))

(assert (= (and b!1066638 res!711920) b!1066628))

(assert (= (or b!1066638 b!1066641) bm!45043))

(assert (= (and b!1066646 res!711917) b!1066626))

(assert (= (and b!1066626 c!107415) b!1066630))

(assert (= (and b!1066626 (not c!107415)) b!1066644))

(assert (= (and b!1066630 res!711919) b!1066636))

(assert (= (or b!1066630 b!1066644) bm!45044))

(declare-fun b_lambda!16539 () Bool)

(assert (=> (not b_lambda!16539) (not b!1066632)))

(declare-fun t!32152 () Bool)

(declare-fun tb!7135 () Bool)

(assert (=> (and start!94316 (= defaultEntry!963 defaultEntry!963) t!32152) tb!7135))

(declare-fun result!14729 () Bool)

(assert (=> tb!7135 (= result!14729 tp_is_empty!25495)))

(assert (=> b!1066632 t!32152))

(declare-fun b_and!34437 () Bool)

(assert (= b_and!34431 (and (=> t!32152 result!14729) b_and!34437)))

(declare-fun m!984855 () Bool)

(assert (=> b!1066628 m!984855))

(declare-fun m!984857 () Bool)

(assert (=> b!1066635 m!984857))

(assert (=> b!1066632 m!984837))

(assert (=> b!1066632 m!984837))

(declare-fun m!984859 () Bool)

(assert (=> b!1066632 m!984859))

(declare-fun m!984861 () Bool)

(assert (=> b!1066632 m!984861))

(assert (=> b!1066632 m!984861))

(declare-fun m!984863 () Bool)

(assert (=> b!1066632 m!984863))

(declare-fun m!984865 () Bool)

(assert (=> b!1066632 m!984865))

(assert (=> b!1066632 m!984863))

(assert (=> b!1066637 m!984837))

(assert (=> b!1066637 m!984837))

(assert (=> b!1066637 m!984839))

(assert (=> b!1066642 m!984837))

(assert (=> b!1066642 m!984837))

(assert (=> b!1066642 m!984839))

(declare-fun m!984867 () Bool)

(assert (=> b!1066636 m!984867))

(assert (=> d!128915 m!984767))

(declare-fun m!984869 () Bool)

(assert (=> bm!45043 m!984869))

(assert (=> b!1066627 m!984837))

(assert (=> b!1066627 m!984837))

(declare-fun m!984871 () Bool)

(assert (=> b!1066627 m!984871))

(assert (=> b!1066629 m!984837))

(declare-fun m!984873 () Bool)

(assert (=> b!1066629 m!984873))

(declare-fun m!984875 () Bool)

(assert (=> b!1066629 m!984875))

(declare-fun m!984877 () Bool)

(assert (=> b!1066629 m!984877))

(declare-fun m!984879 () Bool)

(assert (=> b!1066629 m!984879))

(assert (=> b!1066629 m!984749))

(declare-fun m!984881 () Bool)

(assert (=> b!1066629 m!984881))

(declare-fun m!984883 () Bool)

(assert (=> b!1066629 m!984883))

(declare-fun m!984885 () Bool)

(assert (=> b!1066629 m!984885))

(declare-fun m!984887 () Bool)

(assert (=> b!1066629 m!984887))

(declare-fun m!984889 () Bool)

(assert (=> b!1066629 m!984889))

(declare-fun m!984891 () Bool)

(assert (=> b!1066629 m!984891))

(assert (=> b!1066629 m!984875))

(declare-fun m!984893 () Bool)

(assert (=> b!1066629 m!984893))

(declare-fun m!984895 () Bool)

(assert (=> b!1066629 m!984895))

(assert (=> b!1066629 m!984887))

(assert (=> b!1066629 m!984885))

(declare-fun m!984897 () Bool)

(assert (=> b!1066629 m!984897))

(declare-fun m!984899 () Bool)

(assert (=> b!1066629 m!984899))

(assert (=> b!1066629 m!984881))

(declare-fun m!984901 () Bool)

(assert (=> b!1066629 m!984901))

(declare-fun m!984903 () Bool)

(assert (=> bm!45044 m!984903))

(declare-fun m!984905 () Bool)

(assert (=> bm!45042 m!984905))

(assert (=> bm!45046 m!984749))

(assert (=> b!1066509 d!128915))

(declare-fun b!1066649 () Bool)

(declare-fun e!608297 () Bool)

(declare-fun e!608294 () Bool)

(assert (=> b!1066649 (= e!608297 e!608294)))

(declare-fun c!107421 () Bool)

(assert (=> b!1066649 (= c!107421 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1066650 () Bool)

(declare-fun e!608298 () Bool)

(declare-fun e!608291 () Bool)

(assert (=> b!1066650 (= e!608298 e!608291)))

(declare-fun res!711931 () Bool)

(assert (=> b!1066650 (=> (not res!711931) (not e!608291))))

(declare-fun lt!470955 () ListLongMap!14259)

(assert (=> b!1066650 (= res!711931 (contains!6243 lt!470955 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066650 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun b!1066651 () Bool)

(declare-fun e!608296 () Bool)

(assert (=> b!1066651 (= e!608296 (= (apply!917 lt!470955 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1066652 () Bool)

(declare-fun e!608293 () Unit!34878)

(declare-fun lt!470953 () Unit!34878)

(assert (=> b!1066652 (= e!608293 lt!470953)))

(declare-fun lt!470960 () ListLongMap!14259)

(assert (=> b!1066652 (= lt!470960 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470946 () (_ BitVec 64))

(assert (=> b!1066652 (= lt!470946 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470950 () (_ BitVec 64))

(assert (=> b!1066652 (= lt!470950 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470952 () Unit!34878)

(assert (=> b!1066652 (= lt!470952 (addStillContains!633 lt!470960 lt!470946 zeroValueBefore!47 lt!470950))))

(assert (=> b!1066652 (contains!6243 (+!3181 lt!470960 (tuple2!16291 lt!470946 zeroValueBefore!47)) lt!470950)))

(declare-fun lt!470957 () Unit!34878)

(assert (=> b!1066652 (= lt!470957 lt!470952)))

(declare-fun lt!470949 () ListLongMap!14259)

(assert (=> b!1066652 (= lt!470949 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470958 () (_ BitVec 64))

(assert (=> b!1066652 (= lt!470958 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470947 () (_ BitVec 64))

(assert (=> b!1066652 (= lt!470947 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470948 () Unit!34878)

(assert (=> b!1066652 (= lt!470948 (addApplyDifferent!489 lt!470949 lt!470958 minValue!907 lt!470947))))

(assert (=> b!1066652 (= (apply!917 (+!3181 lt!470949 (tuple2!16291 lt!470958 minValue!907)) lt!470947) (apply!917 lt!470949 lt!470947))))

(declare-fun lt!470941 () Unit!34878)

(assert (=> b!1066652 (= lt!470941 lt!470948)))

(declare-fun lt!470951 () ListLongMap!14259)

(assert (=> b!1066652 (= lt!470951 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470944 () (_ BitVec 64))

(assert (=> b!1066652 (= lt!470944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470939 () (_ BitVec 64))

(assert (=> b!1066652 (= lt!470939 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470942 () Unit!34878)

(assert (=> b!1066652 (= lt!470942 (addApplyDifferent!489 lt!470951 lt!470944 zeroValueBefore!47 lt!470939))))

(assert (=> b!1066652 (= (apply!917 (+!3181 lt!470951 (tuple2!16291 lt!470944 zeroValueBefore!47)) lt!470939) (apply!917 lt!470951 lt!470939))))

(declare-fun lt!470945 () Unit!34878)

(assert (=> b!1066652 (= lt!470945 lt!470942)))

(declare-fun lt!470956 () ListLongMap!14259)

(assert (=> b!1066652 (= lt!470956 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470954 () (_ BitVec 64))

(assert (=> b!1066652 (= lt!470954 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470940 () (_ BitVec 64))

(assert (=> b!1066652 (= lt!470940 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1066652 (= lt!470953 (addApplyDifferent!489 lt!470956 lt!470954 minValue!907 lt!470940))))

(assert (=> b!1066652 (= (apply!917 (+!3181 lt!470956 (tuple2!16291 lt!470954 minValue!907)) lt!470940) (apply!917 lt!470956 lt!470940))))

(declare-fun b!1066653 () Bool)

(declare-fun e!608300 () Bool)

(assert (=> b!1066653 (= e!608294 e!608300)))

(declare-fun res!711928 () Bool)

(declare-fun call!45055 () Bool)

(assert (=> b!1066653 (= res!711928 call!45055)))

(assert (=> b!1066653 (=> (not res!711928) (not e!608300))))

(declare-fun c!107420 () Bool)

(declare-fun call!45052 () ListLongMap!14259)

(declare-fun bm!45049 () Bool)

(declare-fun c!107419 () Bool)

(declare-fun call!45054 () ListLongMap!14259)

(declare-fun call!45056 () ListLongMap!14259)

(declare-fun call!45053 () ListLongMap!14259)

(assert (=> bm!45049 (= call!45056 (+!3181 (ite c!107419 call!45054 (ite c!107420 call!45052 call!45053)) (ite (or c!107419 c!107420) (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun bm!45050 () Bool)

(declare-fun call!45058 () Bool)

(assert (=> bm!45050 (= call!45058 (contains!6243 lt!470955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45051 () Bool)

(assert (=> bm!45051 (= call!45055 (contains!6243 lt!470955 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1066654 () Bool)

(declare-fun e!608292 () ListLongMap!14259)

(declare-fun e!608289 () ListLongMap!14259)

(assert (=> b!1066654 (= e!608292 e!608289)))

(assert (=> b!1066654 (= c!107420 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1066655 () Bool)

(assert (=> b!1066655 (= e!608291 (= (apply!917 lt!470955 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)) (get!17043 (select (arr!32660 _values!955) #b00000000000000000000000000000000) (dynLambda!2016 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1066655 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33198 _values!955)))))

(assert (=> b!1066655 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun b!1066656 () Bool)

(declare-fun e!608299 () ListLongMap!14259)

(declare-fun call!45057 () ListLongMap!14259)

(assert (=> b!1066656 (= e!608299 call!45057)))

(declare-fun b!1066657 () Bool)

(assert (=> b!1066657 (= e!608289 call!45057)))

(declare-fun d!128917 () Bool)

(assert (=> d!128917 e!608297))

(declare-fun res!711925 () Bool)

(assert (=> d!128917 (=> (not res!711925) (not e!608297))))

(assert (=> d!128917 (= res!711925 (or (bvsge #b00000000000000000000000000000000 (size!33199 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))))

(declare-fun lt!470959 () ListLongMap!14259)

(assert (=> d!128917 (= lt!470955 lt!470959)))

(declare-fun lt!470943 () Unit!34878)

(assert (=> d!128917 (= lt!470943 e!608293)))

(declare-fun c!107417 () Bool)

(declare-fun e!608295 () Bool)

(assert (=> d!128917 (= c!107417 e!608295)))

(declare-fun res!711930 () Bool)

(assert (=> d!128917 (=> (not res!711930) (not e!608295))))

(assert (=> d!128917 (= res!711930 (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(assert (=> d!128917 (= lt!470959 e!608292)))

(assert (=> d!128917 (= c!107419 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!128917 (validMask!0 mask!1515)))

(assert (=> d!128917 (= (getCurrentListMap!4013 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470955)))

(declare-fun b!1066658 () Bool)

(assert (=> b!1066658 (= e!608292 (+!3181 call!45056 (tuple2!16291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1066659 () Bool)

(assert (=> b!1066659 (= e!608300 (= (apply!917 lt!470955 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1066660 () Bool)

(declare-fun e!608290 () Bool)

(assert (=> b!1066660 (= e!608290 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066661 () Bool)

(declare-fun e!608288 () Bool)

(assert (=> b!1066661 (= e!608288 e!608296)))

(declare-fun res!711929 () Bool)

(assert (=> b!1066661 (= res!711929 call!45058)))

(assert (=> b!1066661 (=> (not res!711929) (not e!608296))))

(declare-fun b!1066662 () Bool)

(assert (=> b!1066662 (= e!608299 call!45053)))

(declare-fun b!1066663 () Bool)

(declare-fun res!711927 () Bool)

(assert (=> b!1066663 (=> (not res!711927) (not e!608297))))

(assert (=> b!1066663 (= res!711927 e!608298)))

(declare-fun res!711924 () Bool)

(assert (=> b!1066663 (=> res!711924 e!608298)))

(assert (=> b!1066663 (= res!711924 (not e!608290))))

(declare-fun res!711923 () Bool)

(assert (=> b!1066663 (=> (not res!711923) (not e!608290))))

(assert (=> b!1066663 (= res!711923 (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun b!1066664 () Bool)

(assert (=> b!1066664 (= e!608288 (not call!45058))))

(declare-fun b!1066665 () Bool)

(assert (=> b!1066665 (= e!608295 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066666 () Bool)

(declare-fun c!107418 () Bool)

(assert (=> b!1066666 (= c!107418 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066666 (= e!608289 e!608299)))

(declare-fun bm!45052 () Bool)

(assert (=> bm!45052 (= call!45052 call!45054)))

(declare-fun b!1066667 () Bool)

(assert (=> b!1066667 (= e!608294 (not call!45055))))

(declare-fun bm!45053 () Bool)

(assert (=> bm!45053 (= call!45054 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066668 () Bool)

(declare-fun Unit!34885 () Unit!34878)

(assert (=> b!1066668 (= e!608293 Unit!34885)))

(declare-fun bm!45054 () Bool)

(assert (=> bm!45054 (= call!45057 call!45056)))

(declare-fun bm!45055 () Bool)

(assert (=> bm!45055 (= call!45053 call!45052)))

(declare-fun b!1066669 () Bool)

(declare-fun res!711926 () Bool)

(assert (=> b!1066669 (=> (not res!711926) (not e!608297))))

(assert (=> b!1066669 (= res!711926 e!608288)))

(declare-fun c!107416 () Bool)

(assert (=> b!1066669 (= c!107416 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and d!128917 c!107419) b!1066658))

(assert (= (and d!128917 (not c!107419)) b!1066654))

(assert (= (and b!1066654 c!107420) b!1066657))

(assert (= (and b!1066654 (not c!107420)) b!1066666))

(assert (= (and b!1066666 c!107418) b!1066656))

(assert (= (and b!1066666 (not c!107418)) b!1066662))

(assert (= (or b!1066656 b!1066662) bm!45055))

(assert (= (or b!1066657 bm!45055) bm!45052))

(assert (= (or b!1066657 b!1066656) bm!45054))

(assert (= (or b!1066658 bm!45052) bm!45053))

(assert (= (or b!1066658 bm!45054) bm!45049))

(assert (= (and d!128917 res!711930) b!1066665))

(assert (= (and d!128917 c!107417) b!1066652))

(assert (= (and d!128917 (not c!107417)) b!1066668))

(assert (= (and d!128917 res!711925) b!1066663))

(assert (= (and b!1066663 res!711923) b!1066660))

(assert (= (and b!1066663 (not res!711924)) b!1066650))

(assert (= (and b!1066650 res!711931) b!1066655))

(assert (= (and b!1066663 res!711927) b!1066669))

(assert (= (and b!1066669 c!107416) b!1066661))

(assert (= (and b!1066669 (not c!107416)) b!1066664))

(assert (= (and b!1066661 res!711929) b!1066651))

(assert (= (or b!1066661 b!1066664) bm!45050))

(assert (= (and b!1066669 res!711926) b!1066649))

(assert (= (and b!1066649 c!107421) b!1066653))

(assert (= (and b!1066649 (not c!107421)) b!1066667))

(assert (= (and b!1066653 res!711928) b!1066659))

(assert (= (or b!1066653 b!1066667) bm!45051))

(declare-fun b_lambda!16541 () Bool)

(assert (=> (not b_lambda!16541) (not b!1066655)))

(assert (=> b!1066655 t!32152))

(declare-fun b_and!34439 () Bool)

(assert (= b_and!34437 (and (=> t!32152 result!14729) b_and!34439)))

(declare-fun m!984907 () Bool)

(assert (=> b!1066651 m!984907))

(declare-fun m!984909 () Bool)

(assert (=> b!1066658 m!984909))

(assert (=> b!1066655 m!984837))

(assert (=> b!1066655 m!984837))

(declare-fun m!984911 () Bool)

(assert (=> b!1066655 m!984911))

(assert (=> b!1066655 m!984861))

(assert (=> b!1066655 m!984861))

(assert (=> b!1066655 m!984863))

(assert (=> b!1066655 m!984865))

(assert (=> b!1066655 m!984863))

(assert (=> b!1066660 m!984837))

(assert (=> b!1066660 m!984837))

(assert (=> b!1066660 m!984839))

(assert (=> b!1066665 m!984837))

(assert (=> b!1066665 m!984837))

(assert (=> b!1066665 m!984839))

(declare-fun m!984913 () Bool)

(assert (=> b!1066659 m!984913))

(assert (=> d!128917 m!984767))

(declare-fun m!984915 () Bool)

(assert (=> bm!45050 m!984915))

(assert (=> b!1066650 m!984837))

(assert (=> b!1066650 m!984837))

(declare-fun m!984917 () Bool)

(assert (=> b!1066650 m!984917))

(assert (=> b!1066652 m!984837))

(declare-fun m!984919 () Bool)

(assert (=> b!1066652 m!984919))

(declare-fun m!984921 () Bool)

(assert (=> b!1066652 m!984921))

(declare-fun m!984923 () Bool)

(assert (=> b!1066652 m!984923))

(declare-fun m!984925 () Bool)

(assert (=> b!1066652 m!984925))

(assert (=> b!1066652 m!984751))

(declare-fun m!984927 () Bool)

(assert (=> b!1066652 m!984927))

(declare-fun m!984929 () Bool)

(assert (=> b!1066652 m!984929))

(declare-fun m!984931 () Bool)

(assert (=> b!1066652 m!984931))

(declare-fun m!984933 () Bool)

(assert (=> b!1066652 m!984933))

(declare-fun m!984935 () Bool)

(assert (=> b!1066652 m!984935))

(declare-fun m!984937 () Bool)

(assert (=> b!1066652 m!984937))

(assert (=> b!1066652 m!984921))

(declare-fun m!984939 () Bool)

(assert (=> b!1066652 m!984939))

(declare-fun m!984941 () Bool)

(assert (=> b!1066652 m!984941))

(assert (=> b!1066652 m!984933))

(assert (=> b!1066652 m!984931))

(declare-fun m!984943 () Bool)

(assert (=> b!1066652 m!984943))

(declare-fun m!984945 () Bool)

(assert (=> b!1066652 m!984945))

(assert (=> b!1066652 m!984927))

(declare-fun m!984947 () Bool)

(assert (=> b!1066652 m!984947))

(declare-fun m!984949 () Bool)

(assert (=> bm!45051 m!984949))

(declare-fun m!984951 () Bool)

(assert (=> bm!45049 m!984951))

(assert (=> bm!45053 m!984751))

(assert (=> b!1066509 d!128917))

(declare-fun d!128919 () Bool)

(declare-fun lt!470961 () ListLongMap!14259)

(assert (=> d!128919 (not (contains!6243 lt!470961 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128919 (= lt!470961 (ListLongMap!14260 (removeStrictlySorted!70 (toList!7145 lt!470820) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128919 (= (-!615 lt!470820 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470961)))

(declare-fun bs!31364 () Bool)

(assert (= bs!31364 d!128919))

(declare-fun m!984953 () Bool)

(assert (=> bs!31364 m!984953))

(declare-fun m!984955 () Bool)

(assert (=> bs!31364 m!984955))

(assert (=> b!1066509 d!128919))

(declare-fun d!128921 () Bool)

(declare-fun e!608303 () Bool)

(assert (=> d!128921 e!608303))

(declare-fun res!711937 () Bool)

(assert (=> d!128921 (=> (not res!711937) (not e!608303))))

(declare-fun lt!470971 () ListLongMap!14259)

(assert (=> d!128921 (= res!711937 (contains!6243 lt!470971 (_1!8156 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!470972 () List!22834)

(assert (=> d!128921 (= lt!470971 (ListLongMap!14260 lt!470972))))

(declare-fun lt!470970 () Unit!34878)

(declare-fun lt!470973 () Unit!34878)

(assert (=> d!128921 (= lt!470970 lt!470973)))

(declare-datatypes ((Option!653 0))(
  ( (Some!652 (v!15413 V!39129)) (None!651) )
))
(declare-fun getValueByKey!602 (List!22834 (_ BitVec 64)) Option!653)

(assert (=> d!128921 (= (getValueByKey!602 lt!470972 (_1!8156 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!652 (_2!8156 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!284 (List!22834 (_ BitVec 64) V!39129) Unit!34878)

(assert (=> d!128921 (= lt!470973 (lemmaContainsTupThenGetReturnValue!284 lt!470972 (_1!8156 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8156 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!377 (List!22834 (_ BitVec 64) V!39129) List!22834)

(assert (=> d!128921 (= lt!470972 (insertStrictlySorted!377 (toList!7145 lt!470818) (_1!8156 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8156 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!128921 (= (+!3181 lt!470818 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!470971)))

(declare-fun b!1066674 () Bool)

(declare-fun res!711936 () Bool)

(assert (=> b!1066674 (=> (not res!711936) (not e!608303))))

(assert (=> b!1066674 (= res!711936 (= (getValueByKey!602 (toList!7145 lt!470971) (_1!8156 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!652 (_2!8156 (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1066675 () Bool)

(declare-fun contains!6244 (List!22834 tuple2!16290) Bool)

(assert (=> b!1066675 (= e!608303 (contains!6244 (toList!7145 lt!470971) (tuple2!16291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!128921 res!711937) b!1066674))

(assert (= (and b!1066674 res!711936) b!1066675))

(declare-fun m!984957 () Bool)

(assert (=> d!128921 m!984957))

(declare-fun m!984959 () Bool)

(assert (=> d!128921 m!984959))

(declare-fun m!984961 () Bool)

(assert (=> d!128921 m!984961))

(declare-fun m!984963 () Bool)

(assert (=> d!128921 m!984963))

(declare-fun m!984965 () Bool)

(assert (=> b!1066674 m!984965))

(declare-fun m!984967 () Bool)

(assert (=> b!1066675 m!984967))

(assert (=> b!1066509 d!128921))

(declare-fun d!128923 () Bool)

(declare-fun res!711943 () Bool)

(declare-fun e!608311 () Bool)

(assert (=> d!128923 (=> res!711943 e!608311)))

(assert (=> d!128923 (= res!711943 (bvsge #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(assert (=> d!128923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!608311)))

(declare-fun b!1066684 () Bool)

(declare-fun e!608310 () Bool)

(assert (=> b!1066684 (= e!608311 e!608310)))

(declare-fun c!107424 () Bool)

(assert (=> b!1066684 (= c!107424 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066685 () Bool)

(declare-fun e!608312 () Bool)

(declare-fun call!45061 () Bool)

(assert (=> b!1066685 (= e!608312 call!45061)))

(declare-fun b!1066686 () Bool)

(assert (=> b!1066686 (= e!608310 e!608312)))

(declare-fun lt!470982 () (_ BitVec 64))

(assert (=> b!1066686 (= lt!470982 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470980 () Unit!34878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67918 (_ BitVec 64) (_ BitVec 32)) Unit!34878)

(assert (=> b!1066686 (= lt!470980 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!470982 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1066686 (arrayContainsKey!0 _keys!1163 lt!470982 #b00000000000000000000000000000000)))

(declare-fun lt!470981 () Unit!34878)

(assert (=> b!1066686 (= lt!470981 lt!470980)))

(declare-fun res!711942 () Bool)

(declare-datatypes ((SeekEntryResult!9876 0))(
  ( (MissingZero!9876 (index!41875 (_ BitVec 32))) (Found!9876 (index!41876 (_ BitVec 32))) (Intermediate!9876 (undefined!10688 Bool) (index!41877 (_ BitVec 32)) (x!95502 (_ BitVec 32))) (Undefined!9876) (MissingVacant!9876 (index!41878 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67918 (_ BitVec 32)) SeekEntryResult!9876)

(assert (=> b!1066686 (= res!711942 (= (seekEntryOrOpen!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9876 #b00000000000000000000000000000000)))))

(assert (=> b!1066686 (=> (not res!711942) (not e!608312))))

(declare-fun b!1066687 () Bool)

(assert (=> b!1066687 (= e!608310 call!45061)))

(declare-fun bm!45058 () Bool)

(assert (=> bm!45058 (= call!45061 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!128923 (not res!711943)) b!1066684))

(assert (= (and b!1066684 c!107424) b!1066686))

(assert (= (and b!1066684 (not c!107424)) b!1066687))

(assert (= (and b!1066686 res!711942) b!1066685))

(assert (= (or b!1066685 b!1066687) bm!45058))

(assert (=> b!1066684 m!984837))

(assert (=> b!1066684 m!984837))

(assert (=> b!1066684 m!984839))

(assert (=> b!1066686 m!984837))

(declare-fun m!984969 () Bool)

(assert (=> b!1066686 m!984969))

(declare-fun m!984971 () Bool)

(assert (=> b!1066686 m!984971))

(assert (=> b!1066686 m!984837))

(declare-fun m!984973 () Bool)

(assert (=> b!1066686 m!984973))

(declare-fun m!984975 () Bool)

(assert (=> bm!45058 m!984975))

(assert (=> b!1066507 d!128923))

(declare-fun d!128925 () Bool)

(assert (=> d!128925 (= (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470985 () Unit!34878)

(declare-fun choose!1740 (array!67918 array!67916 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39129 V!39129 V!39129 V!39129 (_ BitVec 32) Int) Unit!34878)

(assert (=> d!128925 (= lt!470985 (choose!1740 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128925 (validMask!0 mask!1515)))

(assert (=> d!128925 (= (lemmaNoChangeToArrayThenSameMapNoExtras!735 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470985)))

(declare-fun bs!31365 () Bool)

(assert (= bs!31365 d!128925))

(assert (=> bs!31365 m!984751))

(assert (=> bs!31365 m!984749))

(declare-fun m!984977 () Bool)

(assert (=> bs!31365 m!984977))

(assert (=> bs!31365 m!984767))

(assert (=> b!1066512 d!128925))

(declare-fun b!1066712 () Bool)

(declare-fun lt!471006 () Unit!34878)

(declare-fun lt!471004 () Unit!34878)

(assert (=> b!1066712 (= lt!471006 lt!471004)))

(declare-fun lt!471002 () ListLongMap!14259)

(declare-fun lt!471005 () (_ BitVec 64))

(declare-fun lt!471001 () (_ BitVec 64))

(declare-fun lt!471000 () V!39129)

(assert (=> b!1066712 (not (contains!6243 (+!3181 lt!471002 (tuple2!16291 lt!471005 lt!471000)) lt!471001))))

(declare-fun addStillNotContains!253 (ListLongMap!14259 (_ BitVec 64) V!39129 (_ BitVec 64)) Unit!34878)

(assert (=> b!1066712 (= lt!471004 (addStillNotContains!253 lt!471002 lt!471005 lt!471000 lt!471001))))

(assert (=> b!1066712 (= lt!471001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1066712 (= lt!471000 (get!17043 (select (arr!32660 _values!955) #b00000000000000000000000000000000) (dynLambda!2016 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1066712 (= lt!471005 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45064 () ListLongMap!14259)

(assert (=> b!1066712 (= lt!471002 call!45064)))

(declare-fun e!608332 () ListLongMap!14259)

(assert (=> b!1066712 (= e!608332 (+!3181 call!45064 (tuple2!16291 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000) (get!17043 (select (arr!32660 _values!955) #b00000000000000000000000000000000) (dynLambda!2016 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!471003 () ListLongMap!14259)

(declare-fun b!1066713 () Bool)

(declare-fun e!608333 () Bool)

(assert (=> b!1066713 (= e!608333 (= lt!471003 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1066714 () Bool)

(declare-fun res!711954 () Bool)

(declare-fun e!608328 () Bool)

(assert (=> b!1066714 (=> (not res!711954) (not e!608328))))

(assert (=> b!1066714 (= res!711954 (not (contains!6243 lt!471003 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1066715 () Bool)

(assert (=> b!1066715 (= e!608332 call!45064)))

(declare-fun b!1066716 () Bool)

(assert (=> b!1066716 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(assert (=> b!1066716 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33198 _values!955)))))

(declare-fun e!608330 () Bool)

(assert (=> b!1066716 (= e!608330 (= (apply!917 lt!471003 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)) (get!17043 (select (arr!32660 _values!955) #b00000000000000000000000000000000) (dynLambda!2016 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1066717 () Bool)

(declare-fun isEmpty!947 (ListLongMap!14259) Bool)

(assert (=> b!1066717 (= e!608333 (isEmpty!947 lt!471003))))

(declare-fun d!128927 () Bool)

(assert (=> d!128927 e!608328))

(declare-fun res!711953 () Bool)

(assert (=> d!128927 (=> (not res!711953) (not e!608328))))

(assert (=> d!128927 (= res!711953 (not (contains!6243 lt!471003 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!608329 () ListLongMap!14259)

(assert (=> d!128927 (= lt!471003 e!608329)))

(declare-fun c!107433 () Bool)

(assert (=> d!128927 (= c!107433 (bvsge #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(assert (=> d!128927 (validMask!0 mask!1515)))

(assert (=> d!128927 (= (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471003)))

(declare-fun b!1066718 () Bool)

(declare-fun e!608331 () Bool)

(assert (=> b!1066718 (= e!608331 e!608333)))

(declare-fun c!107434 () Bool)

(assert (=> b!1066718 (= c!107434 (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun bm!45061 () Bool)

(assert (=> bm!45061 (= call!45064 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1066719 () Bool)

(assert (=> b!1066719 (= e!608328 e!608331)))

(declare-fun c!107435 () Bool)

(declare-fun e!608327 () Bool)

(assert (=> b!1066719 (= c!107435 e!608327)))

(declare-fun res!711952 () Bool)

(assert (=> b!1066719 (=> (not res!711952) (not e!608327))))

(assert (=> b!1066719 (= res!711952 (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun b!1066720 () Bool)

(assert (=> b!1066720 (= e!608331 e!608330)))

(assert (=> b!1066720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun res!711955 () Bool)

(assert (=> b!1066720 (= res!711955 (contains!6243 lt!471003 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066720 (=> (not res!711955) (not e!608330))))

(declare-fun b!1066721 () Bool)

(assert (=> b!1066721 (= e!608329 e!608332)))

(declare-fun c!107436 () Bool)

(assert (=> b!1066721 (= c!107436 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066722 () Bool)

(assert (=> b!1066722 (= e!608329 (ListLongMap!14260 Nil!22831))))

(declare-fun b!1066723 () Bool)

(assert (=> b!1066723 (= e!608327 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066723 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!128927 c!107433) b!1066722))

(assert (= (and d!128927 (not c!107433)) b!1066721))

(assert (= (and b!1066721 c!107436) b!1066712))

(assert (= (and b!1066721 (not c!107436)) b!1066715))

(assert (= (or b!1066712 b!1066715) bm!45061))

(assert (= (and d!128927 res!711953) b!1066714))

(assert (= (and b!1066714 res!711954) b!1066719))

(assert (= (and b!1066719 res!711952) b!1066723))

(assert (= (and b!1066719 c!107435) b!1066720))

(assert (= (and b!1066719 (not c!107435)) b!1066718))

(assert (= (and b!1066720 res!711955) b!1066716))

(assert (= (and b!1066718 c!107434) b!1066713))

(assert (= (and b!1066718 (not c!107434)) b!1066717))

(declare-fun b_lambda!16543 () Bool)

(assert (=> (not b_lambda!16543) (not b!1066712)))

(assert (=> b!1066712 t!32152))

(declare-fun b_and!34441 () Bool)

(assert (= b_and!34439 (and (=> t!32152 result!14729) b_and!34441)))

(declare-fun b_lambda!16545 () Bool)

(assert (=> (not b_lambda!16545) (not b!1066716)))

(assert (=> b!1066716 t!32152))

(declare-fun b_and!34443 () Bool)

(assert (= b_and!34441 (and (=> t!32152 result!14729) b_and!34443)))

(declare-fun m!984979 () Bool)

(assert (=> bm!45061 m!984979))

(declare-fun m!984981 () Bool)

(assert (=> b!1066714 m!984981))

(assert (=> b!1066721 m!984837))

(assert (=> b!1066721 m!984837))

(assert (=> b!1066721 m!984839))

(assert (=> b!1066713 m!984979))

(declare-fun m!984983 () Bool)

(assert (=> b!1066712 m!984983))

(assert (=> b!1066712 m!984861))

(assert (=> b!1066712 m!984861))

(assert (=> b!1066712 m!984863))

(assert (=> b!1066712 m!984865))

(declare-fun m!984985 () Bool)

(assert (=> b!1066712 m!984985))

(assert (=> b!1066712 m!984837))

(assert (=> b!1066712 m!984863))

(declare-fun m!984987 () Bool)

(assert (=> b!1066712 m!984987))

(assert (=> b!1066712 m!984987))

(declare-fun m!984989 () Bool)

(assert (=> b!1066712 m!984989))

(declare-fun m!984991 () Bool)

(assert (=> d!128927 m!984991))

(assert (=> d!128927 m!984767))

(assert (=> b!1066723 m!984837))

(assert (=> b!1066723 m!984837))

(assert (=> b!1066723 m!984839))

(assert (=> b!1066720 m!984837))

(assert (=> b!1066720 m!984837))

(declare-fun m!984993 () Bool)

(assert (=> b!1066720 m!984993))

(declare-fun m!984995 () Bool)

(assert (=> b!1066717 m!984995))

(assert (=> b!1066716 m!984837))

(declare-fun m!984997 () Bool)

(assert (=> b!1066716 m!984997))

(assert (=> b!1066716 m!984861))

(assert (=> b!1066716 m!984861))

(assert (=> b!1066716 m!984863))

(assert (=> b!1066716 m!984865))

(assert (=> b!1066716 m!984837))

(assert (=> b!1066716 m!984863))

(assert (=> b!1066512 d!128927))

(declare-fun b!1066724 () Bool)

(declare-fun lt!471013 () Unit!34878)

(declare-fun lt!471011 () Unit!34878)

(assert (=> b!1066724 (= lt!471013 lt!471011)))

(declare-fun lt!471008 () (_ BitVec 64))

(declare-fun lt!471009 () ListLongMap!14259)

(declare-fun lt!471007 () V!39129)

(declare-fun lt!471012 () (_ BitVec 64))

(assert (=> b!1066724 (not (contains!6243 (+!3181 lt!471009 (tuple2!16291 lt!471012 lt!471007)) lt!471008))))

(assert (=> b!1066724 (= lt!471011 (addStillNotContains!253 lt!471009 lt!471012 lt!471007 lt!471008))))

(assert (=> b!1066724 (= lt!471008 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1066724 (= lt!471007 (get!17043 (select (arr!32660 _values!955) #b00000000000000000000000000000000) (dynLambda!2016 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1066724 (= lt!471012 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45065 () ListLongMap!14259)

(assert (=> b!1066724 (= lt!471009 call!45065)))

(declare-fun e!608339 () ListLongMap!14259)

(assert (=> b!1066724 (= e!608339 (+!3181 call!45065 (tuple2!16291 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000) (get!17043 (select (arr!32660 _values!955) #b00000000000000000000000000000000) (dynLambda!2016 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!608340 () Bool)

(declare-fun lt!471010 () ListLongMap!14259)

(declare-fun b!1066725 () Bool)

(assert (=> b!1066725 (= e!608340 (= lt!471010 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1066726 () Bool)

(declare-fun res!711958 () Bool)

(declare-fun e!608335 () Bool)

(assert (=> b!1066726 (=> (not res!711958) (not e!608335))))

(assert (=> b!1066726 (= res!711958 (not (contains!6243 lt!471010 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1066727 () Bool)

(assert (=> b!1066727 (= e!608339 call!45065)))

(declare-fun b!1066728 () Bool)

(assert (=> b!1066728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(assert (=> b!1066728 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33198 _values!955)))))

(declare-fun e!608337 () Bool)

(assert (=> b!1066728 (= e!608337 (= (apply!917 lt!471010 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)) (get!17043 (select (arr!32660 _values!955) #b00000000000000000000000000000000) (dynLambda!2016 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1066729 () Bool)

(assert (=> b!1066729 (= e!608340 (isEmpty!947 lt!471010))))

(declare-fun d!128929 () Bool)

(assert (=> d!128929 e!608335))

(declare-fun res!711957 () Bool)

(assert (=> d!128929 (=> (not res!711957) (not e!608335))))

(assert (=> d!128929 (= res!711957 (not (contains!6243 lt!471010 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!608336 () ListLongMap!14259)

(assert (=> d!128929 (= lt!471010 e!608336)))

(declare-fun c!107437 () Bool)

(assert (=> d!128929 (= c!107437 (bvsge #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(assert (=> d!128929 (validMask!0 mask!1515)))

(assert (=> d!128929 (= (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!471010)))

(declare-fun b!1066730 () Bool)

(declare-fun e!608338 () Bool)

(assert (=> b!1066730 (= e!608338 e!608340)))

(declare-fun c!107438 () Bool)

(assert (=> b!1066730 (= c!107438 (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun bm!45062 () Bool)

(assert (=> bm!45062 (= call!45065 (getCurrentListMapNoExtraKeys!3741 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1066731 () Bool)

(assert (=> b!1066731 (= e!608335 e!608338)))

(declare-fun c!107439 () Bool)

(declare-fun e!608334 () Bool)

(assert (=> b!1066731 (= c!107439 e!608334)))

(declare-fun res!711956 () Bool)

(assert (=> b!1066731 (=> (not res!711956) (not e!608334))))

(assert (=> b!1066731 (= res!711956 (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun b!1066732 () Bool)

(assert (=> b!1066732 (= e!608338 e!608337)))

(assert (=> b!1066732 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33199 _keys!1163)))))

(declare-fun res!711959 () Bool)

(assert (=> b!1066732 (= res!711959 (contains!6243 lt!471010 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066732 (=> (not res!711959) (not e!608337))))

(declare-fun b!1066733 () Bool)

(assert (=> b!1066733 (= e!608336 e!608339)))

(declare-fun c!107440 () Bool)

(assert (=> b!1066733 (= c!107440 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066734 () Bool)

(assert (=> b!1066734 (= e!608336 (ListLongMap!14260 Nil!22831))))

(declare-fun b!1066735 () Bool)

(assert (=> b!1066735 (= e!608334 (validKeyInArray!0 (select (arr!32661 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066735 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!128929 c!107437) b!1066734))

(assert (= (and d!128929 (not c!107437)) b!1066733))

(assert (= (and b!1066733 c!107440) b!1066724))

(assert (= (and b!1066733 (not c!107440)) b!1066727))

(assert (= (or b!1066724 b!1066727) bm!45062))

(assert (= (and d!128929 res!711957) b!1066726))

(assert (= (and b!1066726 res!711958) b!1066731))

(assert (= (and b!1066731 res!711956) b!1066735))

(assert (= (and b!1066731 c!107439) b!1066732))

(assert (= (and b!1066731 (not c!107439)) b!1066730))

(assert (= (and b!1066732 res!711959) b!1066728))

(assert (= (and b!1066730 c!107438) b!1066725))

(assert (= (and b!1066730 (not c!107438)) b!1066729))

(declare-fun b_lambda!16547 () Bool)

(assert (=> (not b_lambda!16547) (not b!1066724)))

(assert (=> b!1066724 t!32152))

(declare-fun b_and!34445 () Bool)

(assert (= b_and!34443 (and (=> t!32152 result!14729) b_and!34445)))

(declare-fun b_lambda!16549 () Bool)

(assert (=> (not b_lambda!16549) (not b!1066728)))

(assert (=> b!1066728 t!32152))

(declare-fun b_and!34447 () Bool)

(assert (= b_and!34445 (and (=> t!32152 result!14729) b_and!34447)))

(declare-fun m!984999 () Bool)

(assert (=> bm!45062 m!984999))

(declare-fun m!985001 () Bool)

(assert (=> b!1066726 m!985001))

(assert (=> b!1066733 m!984837))

(assert (=> b!1066733 m!984837))

(assert (=> b!1066733 m!984839))

(assert (=> b!1066725 m!984999))

(declare-fun m!985003 () Bool)

(assert (=> b!1066724 m!985003))

(assert (=> b!1066724 m!984861))

(assert (=> b!1066724 m!984861))

(assert (=> b!1066724 m!984863))

(assert (=> b!1066724 m!984865))

(declare-fun m!985005 () Bool)

(assert (=> b!1066724 m!985005))

(assert (=> b!1066724 m!984837))

(assert (=> b!1066724 m!984863))

(declare-fun m!985007 () Bool)

(assert (=> b!1066724 m!985007))

(assert (=> b!1066724 m!985007))

(declare-fun m!985009 () Bool)

(assert (=> b!1066724 m!985009))

(declare-fun m!985011 () Bool)

(assert (=> d!128929 m!985011))

(assert (=> d!128929 m!984767))

(assert (=> b!1066735 m!984837))

(assert (=> b!1066735 m!984837))

(assert (=> b!1066735 m!984839))

(assert (=> b!1066732 m!984837))

(assert (=> b!1066732 m!984837))

(declare-fun m!985013 () Bool)

(assert (=> b!1066732 m!985013))

(declare-fun m!985015 () Bool)

(assert (=> b!1066729 m!985015))

(assert (=> b!1066728 m!984837))

(declare-fun m!985017 () Bool)

(assert (=> b!1066728 m!985017))

(assert (=> b!1066728 m!984861))

(assert (=> b!1066728 m!984861))

(assert (=> b!1066728 m!984863))

(assert (=> b!1066728 m!984865))

(assert (=> b!1066728 m!984837))

(assert (=> b!1066728 m!984863))

(assert (=> b!1066512 d!128929))

(declare-fun d!128931 () Bool)

(assert (=> d!128931 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94316 d!128931))

(declare-fun d!128933 () Bool)

(assert (=> d!128933 (= (array_inv!25284 _values!955) (bvsge (size!33198 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94316 d!128933))

(declare-fun d!128935 () Bool)

(assert (=> d!128935 (= (array_inv!25285 _keys!1163) (bvsge (size!33199 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94316 d!128935))

(declare-fun b!1066743 () Bool)

(declare-fun e!608345 () Bool)

(assert (=> b!1066743 (= e!608345 tp_is_empty!25495)))

(declare-fun condMapEmpty!39940 () Bool)

(declare-fun mapDefault!39940 () ValueCell!12044)

(assert (=> mapNonEmpty!39931 (= condMapEmpty!39940 (= mapRest!39931 ((as const (Array (_ BitVec 32) ValueCell!12044)) mapDefault!39940)))))

(declare-fun mapRes!39940 () Bool)

(assert (=> mapNonEmpty!39931 (= tp!76496 (and e!608345 mapRes!39940))))

(declare-fun mapNonEmpty!39940 () Bool)

(declare-fun tp!76511 () Bool)

(declare-fun e!608346 () Bool)

(assert (=> mapNonEmpty!39940 (= mapRes!39940 (and tp!76511 e!608346))))

(declare-fun mapRest!39940 () (Array (_ BitVec 32) ValueCell!12044))

(declare-fun mapKey!39940 () (_ BitVec 32))

(declare-fun mapValue!39940 () ValueCell!12044)

(assert (=> mapNonEmpty!39940 (= mapRest!39931 (store mapRest!39940 mapKey!39940 mapValue!39940))))

(declare-fun b!1066742 () Bool)

(assert (=> b!1066742 (= e!608346 tp_is_empty!25495)))

(declare-fun mapIsEmpty!39940 () Bool)

(assert (=> mapIsEmpty!39940 mapRes!39940))

(assert (= (and mapNonEmpty!39931 condMapEmpty!39940) mapIsEmpty!39940))

(assert (= (and mapNonEmpty!39931 (not condMapEmpty!39940)) mapNonEmpty!39940))

(assert (= (and mapNonEmpty!39940 ((_ is ValueCellFull!12044) mapValue!39940)) b!1066742))

(assert (= (and mapNonEmpty!39931 ((_ is ValueCellFull!12044) mapDefault!39940)) b!1066743))

(declare-fun m!985019 () Bool)

(assert (=> mapNonEmpty!39940 m!985019))

(declare-fun b_lambda!16551 () Bool)

(assert (= b_lambda!16549 (or (and start!94316 b_free!21685) b_lambda!16551)))

(declare-fun b_lambda!16553 () Bool)

(assert (= b_lambda!16543 (or (and start!94316 b_free!21685) b_lambda!16553)))

(declare-fun b_lambda!16555 () Bool)

(assert (= b_lambda!16539 (or (and start!94316 b_free!21685) b_lambda!16555)))

(declare-fun b_lambda!16557 () Bool)

(assert (= b_lambda!16545 (or (and start!94316 b_free!21685) b_lambda!16557)))

(declare-fun b_lambda!16559 () Bool)

(assert (= b_lambda!16541 (or (and start!94316 b_free!21685) b_lambda!16559)))

(declare-fun b_lambda!16561 () Bool)

(assert (= b_lambda!16547 (or (and start!94316 b_free!21685) b_lambda!16561)))

(check-sat tp_is_empty!25495 (not d!128913) (not bm!45044) (not bm!45027) (not b_next!21685) (not b!1066665) (not b!1066582) (not bm!45043) (not b!1066629) (not b!1066724) (not b!1066642) (not bm!45042) (not bm!45050) (not b!1066726) (not d!128919) (not bm!45049) (not bm!45061) (not b!1066674) (not bm!45053) (not b!1066725) (not b!1066579) (not b!1066716) (not d!128921) (not b!1066659) (not b!1066652) (not b!1066713) (not b!1066628) (not b_lambda!16555) (not b!1066684) (not b!1066717) b_and!34447 (not d!128929) (not b!1066721) (not b!1066658) (not d!128915) (not b!1066714) (not b!1066675) (not b!1066655) (not d!128917) (not b!1066583) (not b!1066651) (not d!128927) (not bm!45058) (not d!128925) (not b!1066637) (not b!1066735) (not b!1066732) (not bm!45062) (not b_lambda!16553) (not b!1066733) (not b_lambda!16551) (not b!1066686) (not bm!45046) (not b!1066728) (not bm!45051) (not b_lambda!16557) (not b!1066660) (not b!1066635) (not b!1066720) (not b_lambda!16561) (not b!1066712) (not d!128911) (not b!1066627) (not b!1066650) (not mapNonEmpty!39940) (not b!1066729) (not b_lambda!16559) (not b!1066632) (not b!1066723) (not b!1066636))
(check-sat b_and!34447 (not b_next!21685))
