; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94186 () Bool)

(assert start!94186)

(declare-fun b_free!21409 () Bool)

(declare-fun b_next!21409 () Bool)

(assert (=> start!94186 (= b_free!21409 (not b_next!21409))))

(declare-fun tp!75652 () Bool)

(declare-fun b_and!34141 () Bool)

(assert (=> start!94186 (= tp!75652 b_and!34141)))

(declare-fun b!1063925 () Bool)

(declare-fun e!606170 () Bool)

(declare-fun tp_is_empty!25219 () Bool)

(assert (=> b!1063925 (= e!606170 tp_is_empty!25219)))

(declare-fun mapIsEmpty!39502 () Bool)

(declare-fun mapRes!39502 () Bool)

(assert (=> mapIsEmpty!39502 mapRes!39502))

(declare-fun b!1063927 () Bool)

(declare-fun res!710055 () Bool)

(declare-fun e!606168 () Bool)

(assert (=> b!1063927 (=> (not res!710055) (not e!606168))))

(declare-datatypes ((array!67481 0))(
  ( (array!67482 (arr!32441 (Array (_ BitVec 32) (_ BitVec 64))) (size!32978 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67481)

(declare-datatypes ((List!22582 0))(
  ( (Nil!22579) (Cons!22578 (h!23796 (_ BitVec 64)) (t!31885 List!22582)) )
))
(declare-fun arrayNoDuplicates!0 (array!67481 (_ BitVec 32) List!22582) Bool)

(assert (=> b!1063927 (= res!710055 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22579))))

(declare-fun b!1063928 () Bool)

(declare-fun res!710060 () Bool)

(assert (=> b!1063928 (=> (not res!710060) (not e!606168))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38761 0))(
  ( (V!38762 (val!12660 Int)) )
))
(declare-datatypes ((ValueCell!11906 0))(
  ( (ValueCellFull!11906 (v!15266 V!38761)) (EmptyCell!11906) )
))
(declare-datatypes ((array!67483 0))(
  ( (array!67484 (arr!32442 (Array (_ BitVec 32) ValueCell!11906)) (size!32979 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67483)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063928 (= res!710060 (and (= (size!32979 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32978 _keys!1163) (size!32979 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063929 () Bool)

(declare-fun e!606166 () Bool)

(declare-fun e!606171 () Bool)

(assert (=> b!1063929 (= e!606166 e!606171)))

(declare-fun res!710057 () Bool)

(assert (=> b!1063929 (=> res!710057 e!606171)))

(declare-datatypes ((tuple2!16000 0))(
  ( (tuple2!16001 (_1!8011 (_ BitVec 64)) (_2!8011 V!38761)) )
))
(declare-datatypes ((List!22583 0))(
  ( (Nil!22580) (Cons!22579 (h!23797 tuple2!16000) (t!31886 List!22583)) )
))
(declare-datatypes ((ListLongMap!13977 0))(
  ( (ListLongMap!13978 (toList!7004 List!22583)) )
))
(declare-fun lt!468703 () ListLongMap!13977)

(declare-fun contains!6259 (ListLongMap!13977 (_ BitVec 64)) Bool)

(assert (=> b!1063929 (= res!710057 (contains!6259 lt!468703 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38761)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38761)

(declare-fun getCurrentListMap!3985 (array!67481 array!67483 (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 (_ BitVec 32) Int) ListLongMap!13977)

(assert (=> b!1063929 (= lt!468703 (getCurrentListMap!3985 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063930 () Bool)

(declare-fun res!710058 () Bool)

(assert (=> b!1063930 (=> (not res!710058) (not e!606168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67481 (_ BitVec 32)) Bool)

(assert (=> b!1063930 (= res!710058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063931 () Bool)

(assert (=> b!1063931 (= e!606168 (not e!606166))))

(declare-fun res!710059 () Bool)

(assert (=> b!1063931 (=> res!710059 e!606166)))

(assert (=> b!1063931 (= res!710059 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468702 () ListLongMap!13977)

(declare-fun lt!468704 () ListLongMap!13977)

(assert (=> b!1063931 (= lt!468702 lt!468704)))

(declare-datatypes ((Unit!34811 0))(
  ( (Unit!34812) )
))
(declare-fun lt!468706 () Unit!34811)

(declare-fun zeroValueAfter!47 () V!38761)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!650 (array!67481 array!67483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 V!38761 V!38761 (_ BitVec 32) Int) Unit!34811)

(assert (=> b!1063931 (= lt!468706 (lemmaNoChangeToArrayThenSameMapNoExtras!650 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3647 (array!67481 array!67483 (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 (_ BitVec 32) Int) ListLongMap!13977)

(assert (=> b!1063931 (= lt!468704 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063931 (= lt!468702 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063932 () Bool)

(declare-fun e!606172 () Bool)

(declare-fun e!606169 () Bool)

(assert (=> b!1063932 (= e!606172 (and e!606169 mapRes!39502))))

(declare-fun condMapEmpty!39502 () Bool)

(declare-fun mapDefault!39502 () ValueCell!11906)

(assert (=> b!1063932 (= condMapEmpty!39502 (= (arr!32442 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11906)) mapDefault!39502)))))

(declare-fun res!710056 () Bool)

(assert (=> start!94186 (=> (not res!710056) (not e!606168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94186 (= res!710056 (validMask!0 mask!1515))))

(assert (=> start!94186 e!606168))

(assert (=> start!94186 true))

(assert (=> start!94186 tp_is_empty!25219))

(declare-fun array_inv!25148 (array!67483) Bool)

(assert (=> start!94186 (and (array_inv!25148 _values!955) e!606172)))

(assert (=> start!94186 tp!75652))

(declare-fun array_inv!25149 (array!67481) Bool)

(assert (=> start!94186 (array_inv!25149 _keys!1163)))

(declare-fun b!1063926 () Bool)

(assert (=> b!1063926 (= e!606171 (bvsle #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun -!567 (ListLongMap!13977 (_ BitVec 64)) ListLongMap!13977)

(assert (=> b!1063926 (= (-!567 lt!468703 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468703)))

(declare-fun lt!468705 () Unit!34811)

(declare-fun removeNotPresentStillSame!18 (ListLongMap!13977 (_ BitVec 64)) Unit!34811)

(assert (=> b!1063926 (= lt!468705 (removeNotPresentStillSame!18 lt!468703 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!39502 () Bool)

(declare-fun tp!75653 () Bool)

(assert (=> mapNonEmpty!39502 (= mapRes!39502 (and tp!75653 e!606170))))

(declare-fun mapValue!39502 () ValueCell!11906)

(declare-fun mapKey!39502 () (_ BitVec 32))

(declare-fun mapRest!39502 () (Array (_ BitVec 32) ValueCell!11906))

(assert (=> mapNonEmpty!39502 (= (arr!32442 _values!955) (store mapRest!39502 mapKey!39502 mapValue!39502))))

(declare-fun b!1063933 () Bool)

(assert (=> b!1063933 (= e!606169 tp_is_empty!25219)))

(assert (= (and start!94186 res!710056) b!1063928))

(assert (= (and b!1063928 res!710060) b!1063930))

(assert (= (and b!1063930 res!710058) b!1063927))

(assert (= (and b!1063927 res!710055) b!1063931))

(assert (= (and b!1063931 (not res!710059)) b!1063929))

(assert (= (and b!1063929 (not res!710057)) b!1063926))

(assert (= (and b!1063932 condMapEmpty!39502) mapIsEmpty!39502))

(assert (= (and b!1063932 (not condMapEmpty!39502)) mapNonEmpty!39502))

(get-info :version)

(assert (= (and mapNonEmpty!39502 ((_ is ValueCellFull!11906) mapValue!39502)) b!1063925))

(assert (= (and b!1063932 ((_ is ValueCellFull!11906) mapDefault!39502)) b!1063933))

(assert (= start!94186 b!1063932))

(declare-fun m!983017 () Bool)

(assert (=> b!1063927 m!983017))

(declare-fun m!983019 () Bool)

(assert (=> mapNonEmpty!39502 m!983019))

(declare-fun m!983021 () Bool)

(assert (=> b!1063929 m!983021))

(declare-fun m!983023 () Bool)

(assert (=> b!1063929 m!983023))

(declare-fun m!983025 () Bool)

(assert (=> start!94186 m!983025))

(declare-fun m!983027 () Bool)

(assert (=> start!94186 m!983027))

(declare-fun m!983029 () Bool)

(assert (=> start!94186 m!983029))

(declare-fun m!983031 () Bool)

(assert (=> b!1063930 m!983031))

(declare-fun m!983033 () Bool)

(assert (=> b!1063926 m!983033))

(declare-fun m!983035 () Bool)

(assert (=> b!1063926 m!983035))

(declare-fun m!983037 () Bool)

(assert (=> b!1063931 m!983037))

(declare-fun m!983039 () Bool)

(assert (=> b!1063931 m!983039))

(declare-fun m!983041 () Bool)

(assert (=> b!1063931 m!983041))

(check-sat (not b_next!21409) (not b!1063926) (not b!1063930) b_and!34141 (not b!1063931) (not b!1063929) (not start!94186) (not b!1063927) tp_is_empty!25219 (not mapNonEmpty!39502))
(check-sat b_and!34141 (not b_next!21409))
(get-model)

(declare-fun b!1063996 () Bool)

(declare-fun e!606221 () Bool)

(declare-fun e!606222 () Bool)

(assert (=> b!1063996 (= e!606221 e!606222)))

(declare-fun lt!468745 () (_ BitVec 64))

(assert (=> b!1063996 (= lt!468745 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468744 () Unit!34811)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67481 (_ BitVec 64) (_ BitVec 32)) Unit!34811)

(assert (=> b!1063996 (= lt!468744 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!468745 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1063996 (arrayContainsKey!0 _keys!1163 lt!468745 #b00000000000000000000000000000000)))

(declare-fun lt!468743 () Unit!34811)

(assert (=> b!1063996 (= lt!468743 lt!468744)))

(declare-fun res!710101 () Bool)

(declare-datatypes ((SeekEntryResult!9828 0))(
  ( (MissingZero!9828 (index!41683 (_ BitVec 32))) (Found!9828 (index!41684 (_ BitVec 32))) (Intermediate!9828 (undefined!10640 Bool) (index!41685 (_ BitVec 32)) (x!95056 (_ BitVec 32))) (Undefined!9828) (MissingVacant!9828 (index!41686 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67481 (_ BitVec 32)) SeekEntryResult!9828)

(assert (=> b!1063996 (= res!710101 (= (seekEntryOrOpen!0 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9828 #b00000000000000000000000000000000)))))

(assert (=> b!1063996 (=> (not res!710101) (not e!606222))))

(declare-fun d!129327 () Bool)

(declare-fun res!710102 () Bool)

(declare-fun e!606223 () Bool)

(assert (=> d!129327 (=> res!710102 e!606223)))

(assert (=> d!129327 (= res!710102 (bvsge #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(assert (=> d!129327 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!606223)))

(declare-fun b!1063997 () Bool)

(declare-fun call!44979 () Bool)

(assert (=> b!1063997 (= e!606221 call!44979)))

(declare-fun b!1063998 () Bool)

(assert (=> b!1063998 (= e!606223 e!606221)))

(declare-fun c!107652 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1063998 (= c!107652 (validKeyInArray!0 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1063999 () Bool)

(assert (=> b!1063999 (= e!606222 call!44979)))

(declare-fun bm!44976 () Bool)

(assert (=> bm!44976 (= call!44979 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129327 (not res!710102)) b!1063998))

(assert (= (and b!1063998 c!107652) b!1063996))

(assert (= (and b!1063998 (not c!107652)) b!1063997))

(assert (= (and b!1063996 res!710101) b!1063999))

(assert (= (or b!1063999 b!1063997) bm!44976))

(declare-fun m!983095 () Bool)

(assert (=> b!1063996 m!983095))

(declare-fun m!983097 () Bool)

(assert (=> b!1063996 m!983097))

(declare-fun m!983099 () Bool)

(assert (=> b!1063996 m!983099))

(assert (=> b!1063996 m!983095))

(declare-fun m!983101 () Bool)

(assert (=> b!1063996 m!983101))

(assert (=> b!1063998 m!983095))

(assert (=> b!1063998 m!983095))

(declare-fun m!983103 () Bool)

(assert (=> b!1063998 m!983103))

(declare-fun m!983105 () Bool)

(assert (=> bm!44976 m!983105))

(assert (=> b!1063930 d!129327))

(declare-fun d!129329 () Bool)

(assert (=> d!129329 (= (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468748 () Unit!34811)

(declare-fun choose!1728 (array!67481 array!67483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38761 V!38761 V!38761 V!38761 (_ BitVec 32) Int) Unit!34811)

(assert (=> d!129329 (= lt!468748 (choose!1728 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129329 (validMask!0 mask!1515)))

(assert (=> d!129329 (= (lemmaNoChangeToArrayThenSameMapNoExtras!650 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468748)))

(declare-fun bs!31261 () Bool)

(assert (= bs!31261 d!129329))

(assert (=> bs!31261 m!983041))

(assert (=> bs!31261 m!983039))

(declare-fun m!983107 () Bool)

(assert (=> bs!31261 m!983107))

(assert (=> bs!31261 m!983025))

(assert (=> b!1063931 d!129329))

(declare-fun b!1064024 () Bool)

(declare-fun e!606244 () ListLongMap!13977)

(declare-fun call!44982 () ListLongMap!13977)

(assert (=> b!1064024 (= e!606244 call!44982)))

(declare-fun d!129331 () Bool)

(declare-fun e!606240 () Bool)

(assert (=> d!129331 e!606240))

(declare-fun res!710111 () Bool)

(assert (=> d!129331 (=> (not res!710111) (not e!606240))))

(declare-fun lt!468763 () ListLongMap!13977)

(assert (=> d!129331 (= res!710111 (not (contains!6259 lt!468763 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!606238 () ListLongMap!13977)

(assert (=> d!129331 (= lt!468763 e!606238)))

(declare-fun c!107662 () Bool)

(assert (=> d!129331 (= c!107662 (bvsge #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(assert (=> d!129331 (validMask!0 mask!1515)))

(assert (=> d!129331 (= (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468763)))

(declare-fun b!1064025 () Bool)

(declare-fun e!606242 () Bool)

(declare-fun isEmpty!941 (ListLongMap!13977) Bool)

(assert (=> b!1064025 (= e!606242 (isEmpty!941 lt!468763))))

(declare-fun b!1064026 () Bool)

(assert (=> b!1064026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(assert (=> b!1064026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32979 _values!955)))))

(declare-fun e!606241 () Bool)

(declare-fun apply!928 (ListLongMap!13977 (_ BitVec 64)) V!38761)

(declare-fun get!16980 (ValueCell!11906 V!38761) V!38761)

(declare-fun dynLambda!2043 (Int (_ BitVec 64)) V!38761)

(assert (=> b!1064026 (= e!606241 (= (apply!928 lt!468763 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)) (get!16980 (select (arr!32442 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1064027 () Bool)

(declare-fun lt!468765 () Unit!34811)

(declare-fun lt!468768 () Unit!34811)

(assert (=> b!1064027 (= lt!468765 lt!468768)))

(declare-fun lt!468767 () (_ BitVec 64))

(declare-fun lt!468766 () ListLongMap!13977)

(declare-fun lt!468764 () V!38761)

(declare-fun lt!468769 () (_ BitVec 64))

(declare-fun +!3139 (ListLongMap!13977 tuple2!16000) ListLongMap!13977)

(assert (=> b!1064027 (not (contains!6259 (+!3139 lt!468766 (tuple2!16001 lt!468767 lt!468764)) lt!468769))))

(declare-fun addStillNotContains!249 (ListLongMap!13977 (_ BitVec 64) V!38761 (_ BitVec 64)) Unit!34811)

(assert (=> b!1064027 (= lt!468768 (addStillNotContains!249 lt!468766 lt!468767 lt!468764 lt!468769))))

(assert (=> b!1064027 (= lt!468769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1064027 (= lt!468764 (get!16980 (select (arr!32442 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1064027 (= lt!468767 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1064027 (= lt!468766 call!44982)))

(assert (=> b!1064027 (= e!606244 (+!3139 call!44982 (tuple2!16001 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000) (get!16980 (select (arr!32442 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1064028 () Bool)

(declare-fun e!606243 () Bool)

(assert (=> b!1064028 (= e!606240 e!606243)))

(declare-fun c!107661 () Bool)

(declare-fun e!606239 () Bool)

(assert (=> b!1064028 (= c!107661 e!606239)))

(declare-fun res!710113 () Bool)

(assert (=> b!1064028 (=> (not res!710113) (not e!606239))))

(assert (=> b!1064028 (= res!710113 (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun b!1064029 () Bool)

(assert (=> b!1064029 (= e!606242 (= lt!468763 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1064030 () Bool)

(declare-fun res!710112 () Bool)

(assert (=> b!1064030 (=> (not res!710112) (not e!606240))))

(assert (=> b!1064030 (= res!710112 (not (contains!6259 lt!468763 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1064031 () Bool)

(assert (=> b!1064031 (= e!606243 e!606242)))

(declare-fun c!107664 () Bool)

(assert (=> b!1064031 (= c!107664 (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun b!1064032 () Bool)

(assert (=> b!1064032 (= e!606238 (ListLongMap!13978 Nil!22580))))

(declare-fun b!1064033 () Bool)

(assert (=> b!1064033 (= e!606238 e!606244)))

(declare-fun c!107663 () Bool)

(assert (=> b!1064033 (= c!107663 (validKeyInArray!0 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064034 () Bool)

(assert (=> b!1064034 (= e!606243 e!606241)))

(assert (=> b!1064034 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun res!710114 () Bool)

(assert (=> b!1064034 (= res!710114 (contains!6259 lt!468763 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064034 (=> (not res!710114) (not e!606241))))

(declare-fun b!1064035 () Bool)

(assert (=> b!1064035 (= e!606239 (validKeyInArray!0 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064035 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!44979 () Bool)

(assert (=> bm!44979 (= call!44982 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(assert (= (and d!129331 c!107662) b!1064032))

(assert (= (and d!129331 (not c!107662)) b!1064033))

(assert (= (and b!1064033 c!107663) b!1064027))

(assert (= (and b!1064033 (not c!107663)) b!1064024))

(assert (= (or b!1064027 b!1064024) bm!44979))

(assert (= (and d!129331 res!710111) b!1064030))

(assert (= (and b!1064030 res!710112) b!1064028))

(assert (= (and b!1064028 res!710113) b!1064035))

(assert (= (and b!1064028 c!107661) b!1064034))

(assert (= (and b!1064028 (not c!107661)) b!1064031))

(assert (= (and b!1064034 res!710114) b!1064026))

(assert (= (and b!1064031 c!107664) b!1064029))

(assert (= (and b!1064031 (not c!107664)) b!1064025))

(declare-fun b_lambda!16471 () Bool)

(assert (=> (not b_lambda!16471) (not b!1064026)))

(declare-fun t!31890 () Bool)

(declare-fun tb!7125 () Bool)

(assert (=> (and start!94186 (= defaultEntry!963 defaultEntry!963) t!31890) tb!7125))

(declare-fun result!14699 () Bool)

(assert (=> tb!7125 (= result!14699 tp_is_empty!25219)))

(assert (=> b!1064026 t!31890))

(declare-fun b_and!34147 () Bool)

(assert (= b_and!34141 (and (=> t!31890 result!14699) b_and!34147)))

(declare-fun b_lambda!16473 () Bool)

(assert (=> (not b_lambda!16473) (not b!1064027)))

(assert (=> b!1064027 t!31890))

(declare-fun b_and!34149 () Bool)

(assert (= b_and!34147 (and (=> t!31890 result!14699) b_and!34149)))

(assert (=> b!1064027 m!983095))

(declare-fun m!983109 () Bool)

(assert (=> b!1064027 m!983109))

(declare-fun m!983111 () Bool)

(assert (=> b!1064027 m!983111))

(declare-fun m!983113 () Bool)

(assert (=> b!1064027 m!983113))

(declare-fun m!983115 () Bool)

(assert (=> b!1064027 m!983115))

(declare-fun m!983117 () Bool)

(assert (=> b!1064027 m!983117))

(assert (=> b!1064027 m!983111))

(assert (=> b!1064027 m!983113))

(declare-fun m!983119 () Bool)

(assert (=> b!1064027 m!983119))

(assert (=> b!1064027 m!983115))

(declare-fun m!983121 () Bool)

(assert (=> b!1064027 m!983121))

(declare-fun m!983123 () Bool)

(assert (=> b!1064029 m!983123))

(assert (=> b!1064035 m!983095))

(assert (=> b!1064035 m!983095))

(assert (=> b!1064035 m!983103))

(declare-fun m!983125 () Bool)

(assert (=> b!1064025 m!983125))

(assert (=> b!1064026 m!983095))

(assert (=> b!1064026 m!983111))

(assert (=> b!1064026 m!983113))

(assert (=> b!1064026 m!983119))

(assert (=> b!1064026 m!983095))

(declare-fun m!983127 () Bool)

(assert (=> b!1064026 m!983127))

(assert (=> b!1064026 m!983111))

(assert (=> b!1064026 m!983113))

(declare-fun m!983129 () Bool)

(assert (=> b!1064030 m!983129))

(declare-fun m!983131 () Bool)

(assert (=> d!129331 m!983131))

(assert (=> d!129331 m!983025))

(assert (=> b!1064033 m!983095))

(assert (=> b!1064033 m!983095))

(assert (=> b!1064033 m!983103))

(assert (=> b!1064034 m!983095))

(assert (=> b!1064034 m!983095))

(declare-fun m!983133 () Bool)

(assert (=> b!1064034 m!983133))

(assert (=> bm!44979 m!983123))

(assert (=> b!1063931 d!129331))

(declare-fun b!1064038 () Bool)

(declare-fun e!606251 () ListLongMap!13977)

(declare-fun call!44983 () ListLongMap!13977)

(assert (=> b!1064038 (= e!606251 call!44983)))

(declare-fun d!129333 () Bool)

(declare-fun e!606247 () Bool)

(assert (=> d!129333 e!606247))

(declare-fun res!710115 () Bool)

(assert (=> d!129333 (=> (not res!710115) (not e!606247))))

(declare-fun lt!468770 () ListLongMap!13977)

(assert (=> d!129333 (= res!710115 (not (contains!6259 lt!468770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!606245 () ListLongMap!13977)

(assert (=> d!129333 (= lt!468770 e!606245)))

(declare-fun c!107666 () Bool)

(assert (=> d!129333 (= c!107666 (bvsge #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(assert (=> d!129333 (validMask!0 mask!1515)))

(assert (=> d!129333 (= (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468770)))

(declare-fun b!1064039 () Bool)

(declare-fun e!606249 () Bool)

(assert (=> b!1064039 (= e!606249 (isEmpty!941 lt!468770))))

(declare-fun b!1064040 () Bool)

(assert (=> b!1064040 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(assert (=> b!1064040 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32979 _values!955)))))

(declare-fun e!606248 () Bool)

(assert (=> b!1064040 (= e!606248 (= (apply!928 lt!468770 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)) (get!16980 (select (arr!32442 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1064041 () Bool)

(declare-fun lt!468772 () Unit!34811)

(declare-fun lt!468775 () Unit!34811)

(assert (=> b!1064041 (= lt!468772 lt!468775)))

(declare-fun lt!468774 () (_ BitVec 64))

(declare-fun lt!468773 () ListLongMap!13977)

(declare-fun lt!468776 () (_ BitVec 64))

(declare-fun lt!468771 () V!38761)

(assert (=> b!1064041 (not (contains!6259 (+!3139 lt!468773 (tuple2!16001 lt!468774 lt!468771)) lt!468776))))

(assert (=> b!1064041 (= lt!468775 (addStillNotContains!249 lt!468773 lt!468774 lt!468771 lt!468776))))

(assert (=> b!1064041 (= lt!468776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1064041 (= lt!468771 (get!16980 (select (arr!32442 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1064041 (= lt!468774 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1064041 (= lt!468773 call!44983)))

(assert (=> b!1064041 (= e!606251 (+!3139 call!44983 (tuple2!16001 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000) (get!16980 (select (arr!32442 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1064042 () Bool)

(declare-fun e!606250 () Bool)

(assert (=> b!1064042 (= e!606247 e!606250)))

(declare-fun c!107665 () Bool)

(declare-fun e!606246 () Bool)

(assert (=> b!1064042 (= c!107665 e!606246)))

(declare-fun res!710117 () Bool)

(assert (=> b!1064042 (=> (not res!710117) (not e!606246))))

(assert (=> b!1064042 (= res!710117 (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun b!1064043 () Bool)

(assert (=> b!1064043 (= e!606249 (= lt!468770 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1064044 () Bool)

(declare-fun res!710116 () Bool)

(assert (=> b!1064044 (=> (not res!710116) (not e!606247))))

(assert (=> b!1064044 (= res!710116 (not (contains!6259 lt!468770 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1064045 () Bool)

(assert (=> b!1064045 (= e!606250 e!606249)))

(declare-fun c!107668 () Bool)

(assert (=> b!1064045 (= c!107668 (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun b!1064046 () Bool)

(assert (=> b!1064046 (= e!606245 (ListLongMap!13978 Nil!22580))))

(declare-fun b!1064047 () Bool)

(assert (=> b!1064047 (= e!606245 e!606251)))

(declare-fun c!107667 () Bool)

(assert (=> b!1064047 (= c!107667 (validKeyInArray!0 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064048 () Bool)

(assert (=> b!1064048 (= e!606250 e!606248)))

(assert (=> b!1064048 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun res!710118 () Bool)

(assert (=> b!1064048 (= res!710118 (contains!6259 lt!468770 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064048 (=> (not res!710118) (not e!606248))))

(declare-fun b!1064049 () Bool)

(assert (=> b!1064049 (= e!606246 (validKeyInArray!0 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064049 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!44980 () Bool)

(assert (=> bm!44980 (= call!44983 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(assert (= (and d!129333 c!107666) b!1064046))

(assert (= (and d!129333 (not c!107666)) b!1064047))

(assert (= (and b!1064047 c!107667) b!1064041))

(assert (= (and b!1064047 (not c!107667)) b!1064038))

(assert (= (or b!1064041 b!1064038) bm!44980))

(assert (= (and d!129333 res!710115) b!1064044))

(assert (= (and b!1064044 res!710116) b!1064042))

(assert (= (and b!1064042 res!710117) b!1064049))

(assert (= (and b!1064042 c!107665) b!1064048))

(assert (= (and b!1064042 (not c!107665)) b!1064045))

(assert (= (and b!1064048 res!710118) b!1064040))

(assert (= (and b!1064045 c!107668) b!1064043))

(assert (= (and b!1064045 (not c!107668)) b!1064039))

(declare-fun b_lambda!16475 () Bool)

(assert (=> (not b_lambda!16475) (not b!1064040)))

(assert (=> b!1064040 t!31890))

(declare-fun b_and!34151 () Bool)

(assert (= b_and!34149 (and (=> t!31890 result!14699) b_and!34151)))

(declare-fun b_lambda!16477 () Bool)

(assert (=> (not b_lambda!16477) (not b!1064041)))

(assert (=> b!1064041 t!31890))

(declare-fun b_and!34153 () Bool)

(assert (= b_and!34151 (and (=> t!31890 result!14699) b_and!34153)))

(assert (=> b!1064041 m!983095))

(declare-fun m!983135 () Bool)

(assert (=> b!1064041 m!983135))

(assert (=> b!1064041 m!983111))

(assert (=> b!1064041 m!983113))

(declare-fun m!983137 () Bool)

(assert (=> b!1064041 m!983137))

(declare-fun m!983139 () Bool)

(assert (=> b!1064041 m!983139))

(assert (=> b!1064041 m!983111))

(assert (=> b!1064041 m!983113))

(assert (=> b!1064041 m!983119))

(assert (=> b!1064041 m!983137))

(declare-fun m!983141 () Bool)

(assert (=> b!1064041 m!983141))

(declare-fun m!983143 () Bool)

(assert (=> b!1064043 m!983143))

(assert (=> b!1064049 m!983095))

(assert (=> b!1064049 m!983095))

(assert (=> b!1064049 m!983103))

(declare-fun m!983145 () Bool)

(assert (=> b!1064039 m!983145))

(assert (=> b!1064040 m!983095))

(assert (=> b!1064040 m!983111))

(assert (=> b!1064040 m!983113))

(assert (=> b!1064040 m!983119))

(assert (=> b!1064040 m!983095))

(declare-fun m!983147 () Bool)

(assert (=> b!1064040 m!983147))

(assert (=> b!1064040 m!983111))

(assert (=> b!1064040 m!983113))

(declare-fun m!983149 () Bool)

(assert (=> b!1064044 m!983149))

(declare-fun m!983151 () Bool)

(assert (=> d!129333 m!983151))

(assert (=> d!129333 m!983025))

(assert (=> b!1064047 m!983095))

(assert (=> b!1064047 m!983095))

(assert (=> b!1064047 m!983103))

(assert (=> b!1064048 m!983095))

(assert (=> b!1064048 m!983095))

(declare-fun m!983153 () Bool)

(assert (=> b!1064048 m!983153))

(assert (=> bm!44980 m!983143))

(assert (=> b!1063931 d!129333))

(declare-fun d!129335 () Bool)

(declare-fun lt!468779 () ListLongMap!13977)

(assert (=> d!129335 (not (contains!6259 lt!468779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!66 (List!22583 (_ BitVec 64)) List!22583)

(assert (=> d!129335 (= lt!468779 (ListLongMap!13978 (removeStrictlySorted!66 (toList!7004 lt!468703) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129335 (= (-!567 lt!468703 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468779)))

(declare-fun bs!31262 () Bool)

(assert (= bs!31262 d!129335))

(declare-fun m!983155 () Bool)

(assert (=> bs!31262 m!983155))

(declare-fun m!983157 () Bool)

(assert (=> bs!31262 m!983157))

(assert (=> b!1063926 d!129335))

(declare-fun d!129337 () Bool)

(assert (=> d!129337 (= (-!567 lt!468703 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468703)))

(declare-fun lt!468782 () Unit!34811)

(declare-fun choose!1729 (ListLongMap!13977 (_ BitVec 64)) Unit!34811)

(assert (=> d!129337 (= lt!468782 (choose!1729 lt!468703 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129337 (not (contains!6259 lt!468703 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129337 (= (removeNotPresentStillSame!18 lt!468703 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468782)))

(declare-fun bs!31263 () Bool)

(assert (= bs!31263 d!129337))

(assert (=> bs!31263 m!983033))

(declare-fun m!983159 () Bool)

(assert (=> bs!31263 m!983159))

(assert (=> bs!31263 m!983021))

(assert (=> b!1063926 d!129337))

(declare-fun b!1064060 () Bool)

(declare-fun e!606261 () Bool)

(declare-fun call!44986 () Bool)

(assert (=> b!1064060 (= e!606261 call!44986)))

(declare-fun b!1064061 () Bool)

(declare-fun e!606263 () Bool)

(declare-fun contains!6261 (List!22582 (_ BitVec 64)) Bool)

(assert (=> b!1064061 (= e!606263 (contains!6261 Nil!22579 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064062 () Bool)

(assert (=> b!1064062 (= e!606261 call!44986)))

(declare-fun b!1064063 () Bool)

(declare-fun e!606262 () Bool)

(declare-fun e!606260 () Bool)

(assert (=> b!1064063 (= e!606262 e!606260)))

(declare-fun res!710125 () Bool)

(assert (=> b!1064063 (=> (not res!710125) (not e!606260))))

(assert (=> b!1064063 (= res!710125 (not e!606263))))

(declare-fun res!710126 () Bool)

(assert (=> b!1064063 (=> (not res!710126) (not e!606263))))

(assert (=> b!1064063 (= res!710126 (validKeyInArray!0 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129339 () Bool)

(declare-fun res!710127 () Bool)

(assert (=> d!129339 (=> res!710127 e!606262)))

(assert (=> d!129339 (= res!710127 (bvsge #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(assert (=> d!129339 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22579) e!606262)))

(declare-fun bm!44983 () Bool)

(declare-fun c!107671 () Bool)

(assert (=> bm!44983 (= call!44986 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107671 (Cons!22578 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000) Nil!22579) Nil!22579)))))

(declare-fun b!1064064 () Bool)

(assert (=> b!1064064 (= e!606260 e!606261)))

(assert (=> b!1064064 (= c!107671 (validKeyInArray!0 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129339 (not res!710127)) b!1064063))

(assert (= (and b!1064063 res!710126) b!1064061))

(assert (= (and b!1064063 res!710125) b!1064064))

(assert (= (and b!1064064 c!107671) b!1064062))

(assert (= (and b!1064064 (not c!107671)) b!1064060))

(assert (= (or b!1064062 b!1064060) bm!44983))

(assert (=> b!1064061 m!983095))

(assert (=> b!1064061 m!983095))

(declare-fun m!983161 () Bool)

(assert (=> b!1064061 m!983161))

(assert (=> b!1064063 m!983095))

(assert (=> b!1064063 m!983095))

(assert (=> b!1064063 m!983103))

(assert (=> bm!44983 m!983095))

(declare-fun m!983163 () Bool)

(assert (=> bm!44983 m!983163))

(assert (=> b!1064064 m!983095))

(assert (=> b!1064064 m!983095))

(assert (=> b!1064064 m!983103))

(assert (=> b!1063927 d!129339))

(declare-fun d!129341 () Bool)

(assert (=> d!129341 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94186 d!129341))

(declare-fun d!129343 () Bool)

(assert (=> d!129343 (= (array_inv!25148 _values!955) (bvsge (size!32979 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94186 d!129343))

(declare-fun d!129345 () Bool)

(assert (=> d!129345 (= (array_inv!25149 _keys!1163) (bvsge (size!32978 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94186 d!129345))

(declare-fun d!129347 () Bool)

(declare-fun e!606268 () Bool)

(assert (=> d!129347 e!606268))

(declare-fun res!710130 () Bool)

(assert (=> d!129347 (=> res!710130 e!606268)))

(declare-fun lt!468791 () Bool)

(assert (=> d!129347 (= res!710130 (not lt!468791))))

(declare-fun lt!468793 () Bool)

(assert (=> d!129347 (= lt!468791 lt!468793)))

(declare-fun lt!468794 () Unit!34811)

(declare-fun e!606269 () Unit!34811)

(assert (=> d!129347 (= lt!468794 e!606269)))

(declare-fun c!107674 () Bool)

(assert (=> d!129347 (= c!107674 lt!468793)))

(declare-fun containsKey!574 (List!22583 (_ BitVec 64)) Bool)

(assert (=> d!129347 (= lt!468793 (containsKey!574 (toList!7004 lt!468703) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129347 (= (contains!6259 lt!468703 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468791)))

(declare-fun b!1064071 () Bool)

(declare-fun lt!468792 () Unit!34811)

(assert (=> b!1064071 (= e!606269 lt!468792)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!405 (List!22583 (_ BitVec 64)) Unit!34811)

(assert (=> b!1064071 (= lt!468792 (lemmaContainsKeyImpliesGetValueByKeyDefined!405 (toList!7004 lt!468703) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!644 0))(
  ( (Some!643 (v!15269 V!38761)) (None!642) )
))
(declare-fun isDefined!443 (Option!644) Bool)

(declare-fun getValueByKey!593 (List!22583 (_ BitVec 64)) Option!644)

(assert (=> b!1064071 (isDefined!443 (getValueByKey!593 (toList!7004 lt!468703) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064072 () Bool)

(declare-fun Unit!34817 () Unit!34811)

(assert (=> b!1064072 (= e!606269 Unit!34817)))

(declare-fun b!1064073 () Bool)

(assert (=> b!1064073 (= e!606268 (isDefined!443 (getValueByKey!593 (toList!7004 lt!468703) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129347 c!107674) b!1064071))

(assert (= (and d!129347 (not c!107674)) b!1064072))

(assert (= (and d!129347 (not res!710130)) b!1064073))

(declare-fun m!983165 () Bool)

(assert (=> d!129347 m!983165))

(declare-fun m!983167 () Bool)

(assert (=> b!1064071 m!983167))

(declare-fun m!983169 () Bool)

(assert (=> b!1064071 m!983169))

(assert (=> b!1064071 m!983169))

(declare-fun m!983171 () Bool)

(assert (=> b!1064071 m!983171))

(assert (=> b!1064073 m!983169))

(assert (=> b!1064073 m!983169))

(assert (=> b!1064073 m!983171))

(assert (=> b!1063929 d!129347))

(declare-fun d!129349 () Bool)

(declare-fun e!606305 () Bool)

(assert (=> d!129349 e!606305))

(declare-fun res!710149 () Bool)

(assert (=> d!129349 (=> (not res!710149) (not e!606305))))

(assert (=> d!129349 (= res!710149 (or (bvsge #b00000000000000000000000000000000 (size!32978 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))))

(declare-fun lt!468853 () ListLongMap!13977)

(declare-fun lt!468848 () ListLongMap!13977)

(assert (=> d!129349 (= lt!468853 lt!468848)))

(declare-fun lt!468851 () Unit!34811)

(declare-fun e!606300 () Unit!34811)

(assert (=> d!129349 (= lt!468851 e!606300)))

(declare-fun c!107691 () Bool)

(declare-fun e!606298 () Bool)

(assert (=> d!129349 (= c!107691 e!606298)))

(declare-fun res!710157 () Bool)

(assert (=> d!129349 (=> (not res!710157) (not e!606298))))

(assert (=> d!129349 (= res!710157 (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun e!606308 () ListLongMap!13977)

(assert (=> d!129349 (= lt!468848 e!606308)))

(declare-fun c!107688 () Bool)

(assert (=> d!129349 (= c!107688 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129349 (validMask!0 mask!1515)))

(assert (=> d!129349 (= (getCurrentListMap!3985 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!468853)))

(declare-fun b!1064116 () Bool)

(assert (=> b!1064116 (= e!606298 (validKeyInArray!0 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44998 () Bool)

(declare-fun call!45003 () Bool)

(assert (=> bm!44998 (= call!45003 (contains!6259 lt!468853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064117 () Bool)

(declare-fun e!606296 () Bool)

(assert (=> b!1064117 (= e!606296 (= (apply!928 lt!468853 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)) (get!16980 (select (arr!32442 _values!955) #b00000000000000000000000000000000) (dynLambda!2043 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1064117 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32979 _values!955)))))

(assert (=> b!1064117 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun b!1064118 () Bool)

(declare-fun c!107689 () Bool)

(assert (=> b!1064118 (= c!107689 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!606303 () ListLongMap!13977)

(declare-fun e!606301 () ListLongMap!13977)

(assert (=> b!1064118 (= e!606303 e!606301)))

(declare-fun b!1064119 () Bool)

(declare-fun call!45005 () ListLongMap!13977)

(assert (=> b!1064119 (= e!606308 (+!3139 call!45005 (tuple2!16001 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1064120 () Bool)

(declare-fun e!606302 () Bool)

(assert (=> b!1064120 (= e!606302 (not call!45003))))

(declare-fun bm!44999 () Bool)

(declare-fun call!45004 () ListLongMap!13977)

(declare-fun call!45007 () ListLongMap!13977)

(assert (=> bm!44999 (= call!45004 call!45007)))

(declare-fun b!1064121 () Bool)

(declare-fun e!606304 () Bool)

(assert (=> b!1064121 (= e!606304 (validKeyInArray!0 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1064122 () Bool)

(declare-fun e!606307 () Bool)

(assert (=> b!1064122 (= e!606307 (= (apply!928 lt!468853 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45000 () Bool)

(declare-fun call!45002 () ListLongMap!13977)

(assert (=> bm!45000 (= call!45002 call!45004)))

(declare-fun b!1064123 () Bool)

(declare-fun lt!468860 () Unit!34811)

(assert (=> b!1064123 (= e!606300 lt!468860)))

(declare-fun lt!468847 () ListLongMap!13977)

(assert (=> b!1064123 (= lt!468847 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468845 () (_ BitVec 64))

(assert (=> b!1064123 (= lt!468845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468855 () (_ BitVec 64))

(assert (=> b!1064123 (= lt!468855 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468859 () Unit!34811)

(declare-fun addStillContains!636 (ListLongMap!13977 (_ BitVec 64) V!38761 (_ BitVec 64)) Unit!34811)

(assert (=> b!1064123 (= lt!468859 (addStillContains!636 lt!468847 lt!468845 zeroValueBefore!47 lt!468855))))

(assert (=> b!1064123 (contains!6259 (+!3139 lt!468847 (tuple2!16001 lt!468845 zeroValueBefore!47)) lt!468855)))

(declare-fun lt!468844 () Unit!34811)

(assert (=> b!1064123 (= lt!468844 lt!468859)))

(declare-fun lt!468842 () ListLongMap!13977)

(assert (=> b!1064123 (= lt!468842 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468846 () (_ BitVec 64))

(assert (=> b!1064123 (= lt!468846 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468858 () (_ BitVec 64))

(assert (=> b!1064123 (= lt!468858 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468852 () Unit!34811)

(declare-fun addApplyDifferent!492 (ListLongMap!13977 (_ BitVec 64) V!38761 (_ BitVec 64)) Unit!34811)

(assert (=> b!1064123 (= lt!468852 (addApplyDifferent!492 lt!468842 lt!468846 minValue!907 lt!468858))))

(assert (=> b!1064123 (= (apply!928 (+!3139 lt!468842 (tuple2!16001 lt!468846 minValue!907)) lt!468858) (apply!928 lt!468842 lt!468858))))

(declare-fun lt!468839 () Unit!34811)

(assert (=> b!1064123 (= lt!468839 lt!468852)))

(declare-fun lt!468849 () ListLongMap!13977)

(assert (=> b!1064123 (= lt!468849 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468857 () (_ BitVec 64))

(assert (=> b!1064123 (= lt!468857 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468841 () (_ BitVec 64))

(assert (=> b!1064123 (= lt!468841 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!468850 () Unit!34811)

(assert (=> b!1064123 (= lt!468850 (addApplyDifferent!492 lt!468849 lt!468857 zeroValueBefore!47 lt!468841))))

(assert (=> b!1064123 (= (apply!928 (+!3139 lt!468849 (tuple2!16001 lt!468857 zeroValueBefore!47)) lt!468841) (apply!928 lt!468849 lt!468841))))

(declare-fun lt!468856 () Unit!34811)

(assert (=> b!1064123 (= lt!468856 lt!468850)))

(declare-fun lt!468854 () ListLongMap!13977)

(assert (=> b!1064123 (= lt!468854 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!468840 () (_ BitVec 64))

(assert (=> b!1064123 (= lt!468840 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!468843 () (_ BitVec 64))

(assert (=> b!1064123 (= lt!468843 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1064123 (= lt!468860 (addApplyDifferent!492 lt!468854 lt!468840 minValue!907 lt!468843))))

(assert (=> b!1064123 (= (apply!928 (+!3139 lt!468854 (tuple2!16001 lt!468840 minValue!907)) lt!468843) (apply!928 lt!468854 lt!468843))))

(declare-fun bm!45001 () Bool)

(declare-fun call!45001 () Bool)

(assert (=> bm!45001 (= call!45001 (contains!6259 lt!468853 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064124 () Bool)

(declare-fun e!606299 () Bool)

(assert (=> b!1064124 (= e!606302 e!606299)))

(declare-fun res!710155 () Bool)

(assert (=> b!1064124 (= res!710155 call!45003)))

(assert (=> b!1064124 (=> (not res!710155) (not e!606299))))

(declare-fun bm!45002 () Bool)

(declare-fun c!107690 () Bool)

(assert (=> bm!45002 (= call!45005 (+!3139 (ite c!107688 call!45007 (ite c!107690 call!45004 call!45002)) (ite (or c!107688 c!107690) (tuple2!16001 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16001 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1064125 () Bool)

(declare-fun call!45006 () ListLongMap!13977)

(assert (=> b!1064125 (= e!606303 call!45006)))

(declare-fun bm!45003 () Bool)

(assert (=> bm!45003 (= call!45006 call!45005)))

(declare-fun b!1064126 () Bool)

(assert (=> b!1064126 (= e!606301 call!45006)))

(declare-fun b!1064127 () Bool)

(assert (=> b!1064127 (= e!606308 e!606303)))

(assert (=> b!1064127 (= c!107690 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1064128 () Bool)

(declare-fun e!606306 () Bool)

(assert (=> b!1064128 (= e!606305 e!606306)))

(declare-fun c!107692 () Bool)

(assert (=> b!1064128 (= c!107692 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1064129 () Bool)

(assert (=> b!1064129 (= e!606299 (= (apply!928 lt!468853 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1064130 () Bool)

(declare-fun res!710152 () Bool)

(assert (=> b!1064130 (=> (not res!710152) (not e!606305))))

(declare-fun e!606297 () Bool)

(assert (=> b!1064130 (= res!710152 e!606297)))

(declare-fun res!710156 () Bool)

(assert (=> b!1064130 (=> res!710156 e!606297)))

(assert (=> b!1064130 (= res!710156 (not e!606304))))

(declare-fun res!710151 () Bool)

(assert (=> b!1064130 (=> (not res!710151) (not e!606304))))

(assert (=> b!1064130 (= res!710151 (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun b!1064131 () Bool)

(assert (=> b!1064131 (= e!606306 (not call!45001))))

(declare-fun b!1064132 () Bool)

(assert (=> b!1064132 (= e!606301 call!45002)))

(declare-fun b!1064133 () Bool)

(declare-fun Unit!34818 () Unit!34811)

(assert (=> b!1064133 (= e!606300 Unit!34818)))

(declare-fun b!1064134 () Bool)

(declare-fun res!710153 () Bool)

(assert (=> b!1064134 (=> (not res!710153) (not e!606305))))

(assert (=> b!1064134 (= res!710153 e!606302)))

(declare-fun c!107687 () Bool)

(assert (=> b!1064134 (= c!107687 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064135 () Bool)

(assert (=> b!1064135 (= e!606297 e!606296)))

(declare-fun res!710150 () Bool)

(assert (=> b!1064135 (=> (not res!710150) (not e!606296))))

(assert (=> b!1064135 (= res!710150 (contains!6259 lt!468853 (select (arr!32441 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1064135 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32978 _keys!1163)))))

(declare-fun b!1064136 () Bool)

(assert (=> b!1064136 (= e!606306 e!606307)))

(declare-fun res!710154 () Bool)

(assert (=> b!1064136 (= res!710154 call!45001)))

(assert (=> b!1064136 (=> (not res!710154) (not e!606307))))

(declare-fun bm!45004 () Bool)

(assert (=> bm!45004 (= call!45007 (getCurrentListMapNoExtraKeys!3647 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and d!129349 c!107688) b!1064119))

(assert (= (and d!129349 (not c!107688)) b!1064127))

(assert (= (and b!1064127 c!107690) b!1064125))

(assert (= (and b!1064127 (not c!107690)) b!1064118))

(assert (= (and b!1064118 c!107689) b!1064126))

(assert (= (and b!1064118 (not c!107689)) b!1064132))

(assert (= (or b!1064126 b!1064132) bm!45000))

(assert (= (or b!1064125 bm!45000) bm!44999))

(assert (= (or b!1064125 b!1064126) bm!45003))

(assert (= (or b!1064119 bm!44999) bm!45004))

(assert (= (or b!1064119 bm!45003) bm!45002))

(assert (= (and d!129349 res!710157) b!1064116))

(assert (= (and d!129349 c!107691) b!1064123))

(assert (= (and d!129349 (not c!107691)) b!1064133))

(assert (= (and d!129349 res!710149) b!1064130))

(assert (= (and b!1064130 res!710151) b!1064121))

(assert (= (and b!1064130 (not res!710156)) b!1064135))

(assert (= (and b!1064135 res!710150) b!1064117))

(assert (= (and b!1064130 res!710152) b!1064134))

(assert (= (and b!1064134 c!107687) b!1064124))

(assert (= (and b!1064134 (not c!107687)) b!1064120))

(assert (= (and b!1064124 res!710155) b!1064129))

(assert (= (or b!1064124 b!1064120) bm!44998))

(assert (= (and b!1064134 res!710153) b!1064128))

(assert (= (and b!1064128 c!107692) b!1064136))

(assert (= (and b!1064128 (not c!107692)) b!1064131))

(assert (= (and b!1064136 res!710154) b!1064122))

(assert (= (or b!1064136 b!1064131) bm!45001))

(declare-fun b_lambda!16479 () Bool)

(assert (=> (not b_lambda!16479) (not b!1064117)))

(assert (=> b!1064117 t!31890))

(declare-fun b_and!34155 () Bool)

(assert (= b_and!34153 (and (=> t!31890 result!14699) b_and!34155)))

(declare-fun m!983173 () Bool)

(assert (=> b!1064119 m!983173))

(declare-fun m!983175 () Bool)

(assert (=> bm!45002 m!983175))

(assert (=> bm!45004 m!983041))

(declare-fun m!983177 () Bool)

(assert (=> bm!44998 m!983177))

(assert (=> d!129349 m!983025))

(assert (=> b!1064135 m!983095))

(assert (=> b!1064135 m!983095))

(declare-fun m!983179 () Bool)

(assert (=> b!1064135 m!983179))

(declare-fun m!983181 () Bool)

(assert (=> b!1064123 m!983181))

(declare-fun m!983183 () Bool)

(assert (=> b!1064123 m!983183))

(declare-fun m!983185 () Bool)

(assert (=> b!1064123 m!983185))

(declare-fun m!983187 () Bool)

(assert (=> b!1064123 m!983187))

(declare-fun m!983189 () Bool)

(assert (=> b!1064123 m!983189))

(assert (=> b!1064123 m!983041))

(declare-fun m!983191 () Bool)

(assert (=> b!1064123 m!983191))

(assert (=> b!1064123 m!983181))

(assert (=> b!1064123 m!983095))

(declare-fun m!983193 () Bool)

(assert (=> b!1064123 m!983193))

(declare-fun m!983195 () Bool)

(assert (=> b!1064123 m!983195))

(declare-fun m!983197 () Bool)

(assert (=> b!1064123 m!983197))

(declare-fun m!983199 () Bool)

(assert (=> b!1064123 m!983199))

(assert (=> b!1064123 m!983193))

(declare-fun m!983201 () Bool)

(assert (=> b!1064123 m!983201))

(declare-fun m!983203 () Bool)

(assert (=> b!1064123 m!983203))

(declare-fun m!983205 () Bool)

(assert (=> b!1064123 m!983205))

(assert (=> b!1064123 m!983205))

(declare-fun m!983207 () Bool)

(assert (=> b!1064123 m!983207))

(declare-fun m!983209 () Bool)

(assert (=> b!1064123 m!983209))

(assert (=> b!1064123 m!983187))

(declare-fun m!983211 () Bool)

(assert (=> b!1064129 m!983211))

(assert (=> b!1064121 m!983095))

(assert (=> b!1064121 m!983095))

(assert (=> b!1064121 m!983103))

(declare-fun m!983213 () Bool)

(assert (=> bm!45001 m!983213))

(declare-fun m!983215 () Bool)

(assert (=> b!1064122 m!983215))

(assert (=> b!1064116 m!983095))

(assert (=> b!1064116 m!983095))

(assert (=> b!1064116 m!983103))

(assert (=> b!1064117 m!983111))

(assert (=> b!1064117 m!983095))

(declare-fun m!983217 () Bool)

(assert (=> b!1064117 m!983217))

(assert (=> b!1064117 m!983111))

(assert (=> b!1064117 m!983113))

(assert (=> b!1064117 m!983119))

(assert (=> b!1064117 m!983113))

(assert (=> b!1064117 m!983095))

(assert (=> b!1063929 d!129349))

(declare-fun mapIsEmpty!39511 () Bool)

(declare-fun mapRes!39511 () Bool)

(assert (=> mapIsEmpty!39511 mapRes!39511))

(declare-fun b!1064143 () Bool)

(declare-fun e!606314 () Bool)

(assert (=> b!1064143 (= e!606314 tp_is_empty!25219)))

(declare-fun mapNonEmpty!39511 () Bool)

(declare-fun tp!75668 () Bool)

(assert (=> mapNonEmpty!39511 (= mapRes!39511 (and tp!75668 e!606314))))

(declare-fun mapValue!39511 () ValueCell!11906)

(declare-fun mapRest!39511 () (Array (_ BitVec 32) ValueCell!11906))

(declare-fun mapKey!39511 () (_ BitVec 32))

(assert (=> mapNonEmpty!39511 (= mapRest!39502 (store mapRest!39511 mapKey!39511 mapValue!39511))))

(declare-fun condMapEmpty!39511 () Bool)

(declare-fun mapDefault!39511 () ValueCell!11906)

(assert (=> mapNonEmpty!39502 (= condMapEmpty!39511 (= mapRest!39502 ((as const (Array (_ BitVec 32) ValueCell!11906)) mapDefault!39511)))))

(declare-fun e!606313 () Bool)

(assert (=> mapNonEmpty!39502 (= tp!75653 (and e!606313 mapRes!39511))))

(declare-fun b!1064144 () Bool)

(assert (=> b!1064144 (= e!606313 tp_is_empty!25219)))

(assert (= (and mapNonEmpty!39502 condMapEmpty!39511) mapIsEmpty!39511))

(assert (= (and mapNonEmpty!39502 (not condMapEmpty!39511)) mapNonEmpty!39511))

(assert (= (and mapNonEmpty!39511 ((_ is ValueCellFull!11906) mapValue!39511)) b!1064143))

(assert (= (and mapNonEmpty!39502 ((_ is ValueCellFull!11906) mapDefault!39511)) b!1064144))

(declare-fun m!983219 () Bool)

(assert (=> mapNonEmpty!39511 m!983219))

(declare-fun b_lambda!16481 () Bool)

(assert (= b_lambda!16473 (or (and start!94186 b_free!21409) b_lambda!16481)))

(declare-fun b_lambda!16483 () Bool)

(assert (= b_lambda!16471 (or (and start!94186 b_free!21409) b_lambda!16483)))

(declare-fun b_lambda!16485 () Bool)

(assert (= b_lambda!16475 (or (and start!94186 b_free!21409) b_lambda!16485)))

(declare-fun b_lambda!16487 () Bool)

(assert (= b_lambda!16479 (or (and start!94186 b_free!21409) b_lambda!16487)))

(declare-fun b_lambda!16489 () Bool)

(assert (= b_lambda!16477 (or (and start!94186 b_free!21409) b_lambda!16489)))

(check-sat (not b!1064123) (not b!1064043) (not b!1064040) (not b!1064064) (not b!1064135) (not bm!45002) (not b!1064061) (not d!129333) (not b!1064039) (not b!1064121) (not b!1064041) (not b!1064027) (not b!1064071) (not bm!45001) (not b!1064029) tp_is_empty!25219 (not b_lambda!16481) (not mapNonEmpty!39511) (not d!129347) (not b!1064026) (not b_next!21409) (not b!1064030) (not b!1064122) (not bm!44998) (not b!1064048) (not bm!44979) (not b!1064117) (not b!1063998) (not b_lambda!16483) (not d!129337) (not b!1064063) (not d!129335) (not b!1064047) (not b!1064129) (not bm!44980) b_and!34155 (not b_lambda!16489) (not b!1064116) (not bm!44983) (not b!1063996) (not b!1064034) (not b!1064073) (not bm!44976) (not b!1064035) (not d!129329) (not bm!45004) (not d!129331) (not b_lambda!16487) (not b_lambda!16485) (not d!129349) (not b!1064119) (not b!1064033) (not b!1064049) (not b!1064025) (not b!1064044))
(check-sat b_and!34155 (not b_next!21409))
