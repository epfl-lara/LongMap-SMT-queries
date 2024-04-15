; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94240 () Bool)

(assert start!94240)

(declare-fun b_free!21631 () Bool)

(declare-fun b_next!21631 () Bool)

(assert (=> start!94240 (= b_free!21631 (not b_next!21631))))

(declare-fun tp!76330 () Bool)

(declare-fun b_and!34365 () Bool)

(assert (=> start!94240 (= tp!76330 b_and!34365)))

(declare-fun b!1065674 () Bool)

(declare-fun e!607583 () Bool)

(declare-fun tp_is_empty!25441 () Bool)

(assert (=> b!1065674 (= e!607583 tp_is_empty!25441)))

(declare-fun b!1065675 () Bool)

(declare-fun e!607586 () Bool)

(declare-fun e!607587 () Bool)

(assert (=> b!1065675 (= e!607586 e!607587)))

(declare-fun res!711359 () Bool)

(assert (=> b!1065675 (=> res!711359 e!607587)))

(declare-datatypes ((V!39057 0))(
  ( (V!39058 (val!12771 Int)) )
))
(declare-datatypes ((tuple2!16246 0))(
  ( (tuple2!16247 (_1!8134 (_ BitVec 64)) (_2!8134 V!39057)) )
))
(declare-datatypes ((List!22792 0))(
  ( (Nil!22789) (Cons!22788 (h!23997 tuple2!16246) (t!32102 List!22792)) )
))
(declare-datatypes ((ListLongMap!14215 0))(
  ( (ListLongMap!14216 (toList!7123 List!22792)) )
))
(declare-fun lt!470035 () ListLongMap!14215)

(declare-fun lt!470033 () ListLongMap!14215)

(declare-fun -!598 (ListLongMap!14215 (_ BitVec 64)) ListLongMap!14215)

(assert (=> b!1065675 (= res!711359 (not (= (-!598 lt!470035 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470033)))))

(declare-fun lt!470038 () ListLongMap!14215)

(declare-fun lt!470037 () ListLongMap!14215)

(assert (=> b!1065675 (= (-!598 lt!470038 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470037)))

(declare-datatypes ((Unit!34832 0))(
  ( (Unit!34833) )
))
(declare-fun lt!470036 () Unit!34832)

(declare-fun zeroValueBefore!47 () V!39057)

(declare-fun addThenRemoveForNewKeyIsSame!16 (ListLongMap!14215 (_ BitVec 64) V!39057) Unit!34832)

(assert (=> b!1065675 (= lt!470036 (addThenRemoveForNewKeyIsSame!16 lt!470037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470032 () ListLongMap!14215)

(assert (=> b!1065675 (and (= lt!470035 lt!470038) (= lt!470033 lt!470032))))

(declare-fun +!3164 (ListLongMap!14215 tuple2!16246) ListLongMap!14215)

(assert (=> b!1065675 (= lt!470038 (+!3164 lt!470037 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12017 0))(
  ( (ValueCellFull!12017 (v!15382 V!39057)) (EmptyCell!12017) )
))
(declare-datatypes ((array!67808 0))(
  ( (array!67809 (arr!32607 (Array (_ BitVec 32) ValueCell!12017)) (size!33145 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67808)

(declare-fun minValue!907 () V!39057)

(declare-datatypes ((array!67810 0))(
  ( (array!67811 (arr!32608 (Array (_ BitVec 32) (_ BitVec 64))) (size!33146 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67810)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39057)

(declare-fun getCurrentListMap!3996 (array!67810 array!67808 (_ BitVec 32) (_ BitVec 32) V!39057 V!39057 (_ BitVec 32) Int) ListLongMap!14215)

(assert (=> b!1065675 (= lt!470033 (getCurrentListMap!3996 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065675 (= lt!470035 (getCurrentListMap!3996 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711362 () Bool)

(declare-fun e!607585 () Bool)

(assert (=> start!94240 (=> (not res!711362) (not e!607585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94240 (= res!711362 (validMask!0 mask!1515))))

(assert (=> start!94240 e!607585))

(assert (=> start!94240 true))

(assert (=> start!94240 tp_is_empty!25441))

(declare-fun e!607584 () Bool)

(declare-fun array_inv!25246 (array!67808) Bool)

(assert (=> start!94240 (and (array_inv!25246 _values!955) e!607584)))

(assert (=> start!94240 tp!76330))

(declare-fun array_inv!25247 (array!67810) Bool)

(assert (=> start!94240 (array_inv!25247 _keys!1163)))

(declare-fun mapNonEmpty!39847 () Bool)

(declare-fun mapRes!39847 () Bool)

(declare-fun tp!76331 () Bool)

(assert (=> mapNonEmpty!39847 (= mapRes!39847 (and tp!76331 e!607583))))

(declare-fun mapRest!39847 () (Array (_ BitVec 32) ValueCell!12017))

(declare-fun mapKey!39847 () (_ BitVec 32))

(declare-fun mapValue!39847 () ValueCell!12017)

(assert (=> mapNonEmpty!39847 (= (arr!32607 _values!955) (store mapRest!39847 mapKey!39847 mapValue!39847))))

(declare-fun b!1065676 () Bool)

(assert (=> b!1065676 (= e!607585 (not e!607586))))

(declare-fun res!711358 () Bool)

(assert (=> b!1065676 (=> res!711358 e!607586)))

(assert (=> b!1065676 (= res!711358 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065676 (= lt!470037 lt!470032)))

(declare-fun lt!470034 () Unit!34832)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!716 (array!67810 array!67808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39057 V!39057 V!39057 V!39057 (_ BitVec 32) Int) Unit!34832)

(assert (=> b!1065676 (= lt!470034 (lemmaNoChangeToArrayThenSameMapNoExtras!716 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3722 (array!67810 array!67808 (_ BitVec 32) (_ BitVec 32) V!39057 V!39057 (_ BitVec 32) Int) ListLongMap!14215)

(assert (=> b!1065676 (= lt!470032 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065676 (= lt!470037 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065677 () Bool)

(assert (=> b!1065677 (= e!607587 (bvsle #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun b!1065678 () Bool)

(declare-fun res!711361 () Bool)

(assert (=> b!1065678 (=> (not res!711361) (not e!607585))))

(assert (=> b!1065678 (= res!711361 (and (= (size!33145 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33146 _keys!1163) (size!33145 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065679 () Bool)

(declare-fun res!711360 () Bool)

(assert (=> b!1065679 (=> (not res!711360) (not e!607585))))

(declare-datatypes ((List!22793 0))(
  ( (Nil!22790) (Cons!22789 (h!23998 (_ BitVec 64)) (t!32103 List!22793)) )
))
(declare-fun arrayNoDuplicates!0 (array!67810 (_ BitVec 32) List!22793) Bool)

(assert (=> b!1065679 (= res!711360 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22790))))

(declare-fun b!1065680 () Bool)

(declare-fun e!607588 () Bool)

(assert (=> b!1065680 (= e!607588 tp_is_empty!25441)))

(declare-fun b!1065681 () Bool)

(assert (=> b!1065681 (= e!607584 (and e!607588 mapRes!39847))))

(declare-fun condMapEmpty!39847 () Bool)

(declare-fun mapDefault!39847 () ValueCell!12017)

(assert (=> b!1065681 (= condMapEmpty!39847 (= (arr!32607 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12017)) mapDefault!39847)))))

(declare-fun b!1065682 () Bool)

(declare-fun res!711363 () Bool)

(assert (=> b!1065682 (=> (not res!711363) (not e!607585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67810 (_ BitVec 32)) Bool)

(assert (=> b!1065682 (= res!711363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39847 () Bool)

(assert (=> mapIsEmpty!39847 mapRes!39847))

(assert (= (and start!94240 res!711362) b!1065678))

(assert (= (and b!1065678 res!711361) b!1065682))

(assert (= (and b!1065682 res!711363) b!1065679))

(assert (= (and b!1065679 res!711360) b!1065676))

(assert (= (and b!1065676 (not res!711358)) b!1065675))

(assert (= (and b!1065675 (not res!711359)) b!1065677))

(assert (= (and b!1065681 condMapEmpty!39847) mapIsEmpty!39847))

(assert (= (and b!1065681 (not condMapEmpty!39847)) mapNonEmpty!39847))

(get-info :version)

(assert (= (and mapNonEmpty!39847 ((_ is ValueCellFull!12017) mapValue!39847)) b!1065674))

(assert (= (and b!1065681 ((_ is ValueCellFull!12017) mapDefault!39847)) b!1065680))

(assert (= start!94240 b!1065681))

(declare-fun m!983753 () Bool)

(assert (=> mapNonEmpty!39847 m!983753))

(declare-fun m!983755 () Bool)

(assert (=> b!1065675 m!983755))

(declare-fun m!983757 () Bool)

(assert (=> b!1065675 m!983757))

(declare-fun m!983759 () Bool)

(assert (=> b!1065675 m!983759))

(declare-fun m!983761 () Bool)

(assert (=> b!1065675 m!983761))

(declare-fun m!983763 () Bool)

(assert (=> b!1065675 m!983763))

(declare-fun m!983765 () Bool)

(assert (=> b!1065675 m!983765))

(declare-fun m!983767 () Bool)

(assert (=> b!1065679 m!983767))

(declare-fun m!983769 () Bool)

(assert (=> b!1065682 m!983769))

(declare-fun m!983771 () Bool)

(assert (=> b!1065676 m!983771))

(declare-fun m!983773 () Bool)

(assert (=> b!1065676 m!983773))

(declare-fun m!983775 () Bool)

(assert (=> b!1065676 m!983775))

(declare-fun m!983777 () Bool)

(assert (=> start!94240 m!983777))

(declare-fun m!983779 () Bool)

(assert (=> start!94240 m!983779))

(declare-fun m!983781 () Bool)

(assert (=> start!94240 m!983781))

(check-sat tp_is_empty!25441 (not b!1065675) (not b!1065679) b_and!34365 (not b!1065682) (not b!1065676) (not start!94240) (not b_next!21631) (not mapNonEmpty!39847))
(check-sat b_and!34365 (not b_next!21631))
(get-model)

(declare-fun b!1065745 () Bool)

(declare-fun e!607638 () Bool)

(declare-fun e!607640 () Bool)

(assert (=> b!1065745 (= e!607638 e!607640)))

(declare-fun lt!470087 () (_ BitVec 64))

(assert (=> b!1065745 (= lt!470087 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470089 () Unit!34832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67810 (_ BitVec 64) (_ BitVec 32)) Unit!34832)

(assert (=> b!1065745 (= lt!470089 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!470087 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1065745 (arrayContainsKey!0 _keys!1163 lt!470087 #b00000000000000000000000000000000)))

(declare-fun lt!470088 () Unit!34832)

(assert (=> b!1065745 (= lt!470088 lt!470089)))

(declare-fun res!711405 () Bool)

(declare-datatypes ((SeekEntryResult!9875 0))(
  ( (MissingZero!9875 (index!41871 (_ BitVec 32))) (Found!9875 (index!41872 (_ BitVec 32))) (Intermediate!9875 (undefined!10687 Bool) (index!41873 (_ BitVec 32)) (x!95418 (_ BitVec 32))) (Undefined!9875) (MissingVacant!9875 (index!41874 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67810 (_ BitVec 32)) SeekEntryResult!9875)

(assert (=> b!1065745 (= res!711405 (= (seekEntryOrOpen!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9875 #b00000000000000000000000000000000)))))

(assert (=> b!1065745 (=> (not res!711405) (not e!607640))))

(declare-fun bm!44989 () Bool)

(declare-fun call!44992 () Bool)

(assert (=> bm!44989 (= call!44992 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1065746 () Bool)

(declare-fun e!607639 () Bool)

(assert (=> b!1065746 (= e!607639 e!607638)))

(declare-fun c!107351 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1065746 (= c!107351 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065747 () Bool)

(assert (=> b!1065747 (= e!607638 call!44992)))

(declare-fun b!1065748 () Bool)

(assert (=> b!1065748 (= e!607640 call!44992)))

(declare-fun d!128863 () Bool)

(declare-fun res!711404 () Bool)

(assert (=> d!128863 (=> res!711404 e!607639)))

(assert (=> d!128863 (= res!711404 (bvsge #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(assert (=> d!128863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!607639)))

(assert (= (and d!128863 (not res!711404)) b!1065746))

(assert (= (and b!1065746 c!107351) b!1065745))

(assert (= (and b!1065746 (not c!107351)) b!1065747))

(assert (= (and b!1065745 res!711405) b!1065748))

(assert (= (or b!1065748 b!1065747) bm!44989))

(declare-fun m!983843 () Bool)

(assert (=> b!1065745 m!983843))

(declare-fun m!983845 () Bool)

(assert (=> b!1065745 m!983845))

(declare-fun m!983847 () Bool)

(assert (=> b!1065745 m!983847))

(assert (=> b!1065745 m!983843))

(declare-fun m!983849 () Bool)

(assert (=> b!1065745 m!983849))

(declare-fun m!983851 () Bool)

(assert (=> bm!44989 m!983851))

(assert (=> b!1065746 m!983843))

(assert (=> b!1065746 m!983843))

(declare-fun m!983853 () Bool)

(assert (=> b!1065746 m!983853))

(assert (=> b!1065682 d!128863))

(declare-fun d!128865 () Bool)

(assert (=> d!128865 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94240 d!128865))

(declare-fun d!128867 () Bool)

(assert (=> d!128867 (= (array_inv!25246 _values!955) (bvsge (size!33145 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94240 d!128867))

(declare-fun d!128869 () Bool)

(assert (=> d!128869 (= (array_inv!25247 _keys!1163) (bvsge (size!33146 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94240 d!128869))

(declare-fun d!128871 () Bool)

(assert (=> d!128871 (= (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470092 () Unit!34832)

(declare-fun choose!1737 (array!67810 array!67808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39057 V!39057 V!39057 V!39057 (_ BitVec 32) Int) Unit!34832)

(assert (=> d!128871 (= lt!470092 (choose!1737 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128871 (validMask!0 mask!1515)))

(assert (=> d!128871 (= (lemmaNoChangeToArrayThenSameMapNoExtras!716 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470092)))

(declare-fun bs!31331 () Bool)

(assert (= bs!31331 d!128871))

(assert (=> bs!31331 m!983775))

(assert (=> bs!31331 m!983773))

(declare-fun m!983855 () Bool)

(assert (=> bs!31331 m!983855))

(assert (=> bs!31331 m!983777))

(assert (=> b!1065676 d!128871))

(declare-fun b!1065773 () Bool)

(declare-fun lt!470109 () Unit!34832)

(declare-fun lt!470107 () Unit!34832)

(assert (=> b!1065773 (= lt!470109 lt!470107)))

(declare-fun lt!470108 () ListLongMap!14215)

(declare-fun lt!470111 () (_ BitVec 64))

(declare-fun lt!470112 () (_ BitVec 64))

(declare-fun lt!470110 () V!39057)

(declare-fun contains!6239 (ListLongMap!14215 (_ BitVec 64)) Bool)

(assert (=> b!1065773 (not (contains!6239 (+!3164 lt!470108 (tuple2!16247 lt!470112 lt!470110)) lt!470111))))

(declare-fun addStillNotContains!252 (ListLongMap!14215 (_ BitVec 64) V!39057 (_ BitVec 64)) Unit!34832)

(assert (=> b!1065773 (= lt!470107 (addStillNotContains!252 lt!470108 lt!470112 lt!470110 lt!470111))))

(assert (=> b!1065773 (= lt!470111 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17024 (ValueCell!12017 V!39057) V!39057)

(declare-fun dynLambda!2015 (Int (_ BitVec 64)) V!39057)

(assert (=> b!1065773 (= lt!470110 (get!17024 (select (arr!32607 _values!955) #b00000000000000000000000000000000) (dynLambda!2015 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1065773 (= lt!470112 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44995 () ListLongMap!14215)

(assert (=> b!1065773 (= lt!470108 call!44995)))

(declare-fun e!607658 () ListLongMap!14215)

(assert (=> b!1065773 (= e!607658 (+!3164 call!44995 (tuple2!16247 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000) (get!17024 (select (arr!32607 _values!955) #b00000000000000000000000000000000) (dynLambda!2015 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1065774 () Bool)

(declare-fun e!607660 () Bool)

(declare-fun e!607661 () Bool)

(assert (=> b!1065774 (= e!607660 e!607661)))

(declare-fun c!107362 () Bool)

(declare-fun e!607655 () Bool)

(assert (=> b!1065774 (= c!107362 e!607655)))

(declare-fun res!711417 () Bool)

(assert (=> b!1065774 (=> (not res!711417) (not e!607655))))

(assert (=> b!1065774 (= res!711417 (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun b!1065775 () Bool)

(assert (=> b!1065775 (= e!607658 call!44995)))

(declare-fun b!1065776 () Bool)

(declare-fun e!607656 () ListLongMap!14215)

(assert (=> b!1065776 (= e!607656 e!607658)))

(declare-fun c!107360 () Bool)

(assert (=> b!1065776 (= c!107360 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065777 () Bool)

(assert (=> b!1065777 (= e!607656 (ListLongMap!14216 Nil!22789))))

(declare-fun b!1065778 () Bool)

(declare-fun e!607659 () Bool)

(assert (=> b!1065778 (= e!607661 e!607659)))

(assert (=> b!1065778 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun res!711416 () Bool)

(declare-fun lt!470113 () ListLongMap!14215)

(assert (=> b!1065778 (= res!711416 (contains!6239 lt!470113 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065778 (=> (not res!711416) (not e!607659))))

(declare-fun b!1065779 () Bool)

(declare-fun e!607657 () Bool)

(declare-fun isEmpty!946 (ListLongMap!14215) Bool)

(assert (=> b!1065779 (= e!607657 (isEmpty!946 lt!470113))))

(declare-fun bm!44992 () Bool)

(assert (=> bm!44992 (= call!44995 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1065780 () Bool)

(assert (=> b!1065780 (= e!607661 e!607657)))

(declare-fun c!107361 () Bool)

(assert (=> b!1065780 (= c!107361 (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun d!128873 () Bool)

(assert (=> d!128873 e!607660))

(declare-fun res!711414 () Bool)

(assert (=> d!128873 (=> (not res!711414) (not e!607660))))

(assert (=> d!128873 (= res!711414 (not (contains!6239 lt!470113 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128873 (= lt!470113 e!607656)))

(declare-fun c!107363 () Bool)

(assert (=> d!128873 (= c!107363 (bvsge #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(assert (=> d!128873 (validMask!0 mask!1515)))

(assert (=> d!128873 (= (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470113)))

(declare-fun b!1065781 () Bool)

(assert (=> b!1065781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(assert (=> b!1065781 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33145 _values!955)))))

(declare-fun apply!916 (ListLongMap!14215 (_ BitVec 64)) V!39057)

(assert (=> b!1065781 (= e!607659 (= (apply!916 lt!470113 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)) (get!17024 (select (arr!32607 _values!955) #b00000000000000000000000000000000) (dynLambda!2015 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1065782 () Bool)

(assert (=> b!1065782 (= e!607655 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065782 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1065783 () Bool)

(assert (=> b!1065783 (= e!607657 (= lt!470113 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1065784 () Bool)

(declare-fun res!711415 () Bool)

(assert (=> b!1065784 (=> (not res!711415) (not e!607660))))

(assert (=> b!1065784 (= res!711415 (not (contains!6239 lt!470113 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128873 c!107363) b!1065777))

(assert (= (and d!128873 (not c!107363)) b!1065776))

(assert (= (and b!1065776 c!107360) b!1065773))

(assert (= (and b!1065776 (not c!107360)) b!1065775))

(assert (= (or b!1065773 b!1065775) bm!44992))

(assert (= (and d!128873 res!711414) b!1065784))

(assert (= (and b!1065784 res!711415) b!1065774))

(assert (= (and b!1065774 res!711417) b!1065782))

(assert (= (and b!1065774 c!107362) b!1065778))

(assert (= (and b!1065774 (not c!107362)) b!1065780))

(assert (= (and b!1065778 res!711416) b!1065781))

(assert (= (and b!1065780 c!107361) b!1065783))

(assert (= (and b!1065780 (not c!107361)) b!1065779))

(declare-fun b_lambda!16515 () Bool)

(assert (=> (not b_lambda!16515) (not b!1065773)))

(declare-fun t!32107 () Bool)

(declare-fun tb!7133 () Bool)

(assert (=> (and start!94240 (= defaultEntry!963 defaultEntry!963) t!32107) tb!7133))

(declare-fun result!14723 () Bool)

(assert (=> tb!7133 (= result!14723 tp_is_empty!25441)))

(assert (=> b!1065773 t!32107))

(declare-fun b_and!34371 () Bool)

(assert (= b_and!34365 (and (=> t!32107 result!14723) b_and!34371)))

(declare-fun b_lambda!16517 () Bool)

(assert (=> (not b_lambda!16517) (not b!1065781)))

(assert (=> b!1065781 t!32107))

(declare-fun b_and!34373 () Bool)

(assert (= b_and!34371 (and (=> t!32107 result!14723) b_and!34373)))

(declare-fun m!983857 () Bool)

(assert (=> b!1065783 m!983857))

(assert (=> b!1065782 m!983843))

(assert (=> b!1065782 m!983843))

(assert (=> b!1065782 m!983853))

(declare-fun m!983859 () Bool)

(assert (=> b!1065781 m!983859))

(assert (=> b!1065781 m!983843))

(assert (=> b!1065781 m!983843))

(declare-fun m!983861 () Bool)

(assert (=> b!1065781 m!983861))

(declare-fun m!983863 () Bool)

(assert (=> b!1065781 m!983863))

(assert (=> b!1065781 m!983859))

(assert (=> b!1065781 m!983863))

(declare-fun m!983865 () Bool)

(assert (=> b!1065781 m!983865))

(assert (=> b!1065773 m!983859))

(assert (=> b!1065773 m!983843))

(declare-fun m!983867 () Bool)

(assert (=> b!1065773 m!983867))

(declare-fun m!983869 () Bool)

(assert (=> b!1065773 m!983869))

(assert (=> b!1065773 m!983863))

(assert (=> b!1065773 m!983869))

(declare-fun m!983871 () Bool)

(assert (=> b!1065773 m!983871))

(assert (=> b!1065773 m!983859))

(assert (=> b!1065773 m!983863))

(assert (=> b!1065773 m!983865))

(declare-fun m!983873 () Bool)

(assert (=> b!1065773 m!983873))

(assert (=> bm!44992 m!983857))

(assert (=> b!1065778 m!983843))

(assert (=> b!1065778 m!983843))

(declare-fun m!983875 () Bool)

(assert (=> b!1065778 m!983875))

(declare-fun m!983877 () Bool)

(assert (=> b!1065784 m!983877))

(assert (=> b!1065776 m!983843))

(assert (=> b!1065776 m!983843))

(assert (=> b!1065776 m!983853))

(declare-fun m!983879 () Bool)

(assert (=> b!1065779 m!983879))

(declare-fun m!983881 () Bool)

(assert (=> d!128873 m!983881))

(assert (=> d!128873 m!983777))

(assert (=> b!1065676 d!128873))

(declare-fun b!1065787 () Bool)

(declare-fun lt!470116 () Unit!34832)

(declare-fun lt!470114 () Unit!34832)

(assert (=> b!1065787 (= lt!470116 lt!470114)))

(declare-fun lt!470115 () ListLongMap!14215)

(declare-fun lt!470119 () (_ BitVec 64))

(declare-fun lt!470118 () (_ BitVec 64))

(declare-fun lt!470117 () V!39057)

(assert (=> b!1065787 (not (contains!6239 (+!3164 lt!470115 (tuple2!16247 lt!470119 lt!470117)) lt!470118))))

(assert (=> b!1065787 (= lt!470114 (addStillNotContains!252 lt!470115 lt!470119 lt!470117 lt!470118))))

(assert (=> b!1065787 (= lt!470118 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1065787 (= lt!470117 (get!17024 (select (arr!32607 _values!955) #b00000000000000000000000000000000) (dynLambda!2015 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1065787 (= lt!470119 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44996 () ListLongMap!14215)

(assert (=> b!1065787 (= lt!470115 call!44996)))

(declare-fun e!607665 () ListLongMap!14215)

(assert (=> b!1065787 (= e!607665 (+!3164 call!44996 (tuple2!16247 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000) (get!17024 (select (arr!32607 _values!955) #b00000000000000000000000000000000) (dynLambda!2015 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1065788 () Bool)

(declare-fun e!607667 () Bool)

(declare-fun e!607668 () Bool)

(assert (=> b!1065788 (= e!607667 e!607668)))

(declare-fun c!107366 () Bool)

(declare-fun e!607662 () Bool)

(assert (=> b!1065788 (= c!107366 e!607662)))

(declare-fun res!711421 () Bool)

(assert (=> b!1065788 (=> (not res!711421) (not e!607662))))

(assert (=> b!1065788 (= res!711421 (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun b!1065789 () Bool)

(assert (=> b!1065789 (= e!607665 call!44996)))

(declare-fun b!1065790 () Bool)

(declare-fun e!607663 () ListLongMap!14215)

(assert (=> b!1065790 (= e!607663 e!607665)))

(declare-fun c!107364 () Bool)

(assert (=> b!1065790 (= c!107364 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065791 () Bool)

(assert (=> b!1065791 (= e!607663 (ListLongMap!14216 Nil!22789))))

(declare-fun b!1065792 () Bool)

(declare-fun e!607666 () Bool)

(assert (=> b!1065792 (= e!607668 e!607666)))

(assert (=> b!1065792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun res!711420 () Bool)

(declare-fun lt!470120 () ListLongMap!14215)

(assert (=> b!1065792 (= res!711420 (contains!6239 lt!470120 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065792 (=> (not res!711420) (not e!607666))))

(declare-fun b!1065793 () Bool)

(declare-fun e!607664 () Bool)

(assert (=> b!1065793 (= e!607664 (isEmpty!946 lt!470120))))

(declare-fun bm!44993 () Bool)

(assert (=> bm!44993 (= call!44996 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1065794 () Bool)

(assert (=> b!1065794 (= e!607668 e!607664)))

(declare-fun c!107365 () Bool)

(assert (=> b!1065794 (= c!107365 (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun d!128875 () Bool)

(assert (=> d!128875 e!607667))

(declare-fun res!711418 () Bool)

(assert (=> d!128875 (=> (not res!711418) (not e!607667))))

(assert (=> d!128875 (= res!711418 (not (contains!6239 lt!470120 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128875 (= lt!470120 e!607663)))

(declare-fun c!107367 () Bool)

(assert (=> d!128875 (= c!107367 (bvsge #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(assert (=> d!128875 (validMask!0 mask!1515)))

(assert (=> d!128875 (= (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470120)))

(declare-fun b!1065795 () Bool)

(assert (=> b!1065795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(assert (=> b!1065795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33145 _values!955)))))

(assert (=> b!1065795 (= e!607666 (= (apply!916 lt!470120 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)) (get!17024 (select (arr!32607 _values!955) #b00000000000000000000000000000000) (dynLambda!2015 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1065796 () Bool)

(assert (=> b!1065796 (= e!607662 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065796 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1065797 () Bool)

(assert (=> b!1065797 (= e!607664 (= lt!470120 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1065798 () Bool)

(declare-fun res!711419 () Bool)

(assert (=> b!1065798 (=> (not res!711419) (not e!607667))))

(assert (=> b!1065798 (= res!711419 (not (contains!6239 lt!470120 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!128875 c!107367) b!1065791))

(assert (= (and d!128875 (not c!107367)) b!1065790))

(assert (= (and b!1065790 c!107364) b!1065787))

(assert (= (and b!1065790 (not c!107364)) b!1065789))

(assert (= (or b!1065787 b!1065789) bm!44993))

(assert (= (and d!128875 res!711418) b!1065798))

(assert (= (and b!1065798 res!711419) b!1065788))

(assert (= (and b!1065788 res!711421) b!1065796))

(assert (= (and b!1065788 c!107366) b!1065792))

(assert (= (and b!1065788 (not c!107366)) b!1065794))

(assert (= (and b!1065792 res!711420) b!1065795))

(assert (= (and b!1065794 c!107365) b!1065797))

(assert (= (and b!1065794 (not c!107365)) b!1065793))

(declare-fun b_lambda!16519 () Bool)

(assert (=> (not b_lambda!16519) (not b!1065787)))

(assert (=> b!1065787 t!32107))

(declare-fun b_and!34375 () Bool)

(assert (= b_and!34373 (and (=> t!32107 result!14723) b_and!34375)))

(declare-fun b_lambda!16521 () Bool)

(assert (=> (not b_lambda!16521) (not b!1065795)))

(assert (=> b!1065795 t!32107))

(declare-fun b_and!34377 () Bool)

(assert (= b_and!34375 (and (=> t!32107 result!14723) b_and!34377)))

(declare-fun m!983883 () Bool)

(assert (=> b!1065797 m!983883))

(assert (=> b!1065796 m!983843))

(assert (=> b!1065796 m!983843))

(assert (=> b!1065796 m!983853))

(assert (=> b!1065795 m!983859))

(assert (=> b!1065795 m!983843))

(assert (=> b!1065795 m!983843))

(declare-fun m!983885 () Bool)

(assert (=> b!1065795 m!983885))

(assert (=> b!1065795 m!983863))

(assert (=> b!1065795 m!983859))

(assert (=> b!1065795 m!983863))

(assert (=> b!1065795 m!983865))

(assert (=> b!1065787 m!983859))

(assert (=> b!1065787 m!983843))

(declare-fun m!983887 () Bool)

(assert (=> b!1065787 m!983887))

(declare-fun m!983889 () Bool)

(assert (=> b!1065787 m!983889))

(assert (=> b!1065787 m!983863))

(assert (=> b!1065787 m!983889))

(declare-fun m!983891 () Bool)

(assert (=> b!1065787 m!983891))

(assert (=> b!1065787 m!983859))

(assert (=> b!1065787 m!983863))

(assert (=> b!1065787 m!983865))

(declare-fun m!983893 () Bool)

(assert (=> b!1065787 m!983893))

(assert (=> bm!44993 m!983883))

(assert (=> b!1065792 m!983843))

(assert (=> b!1065792 m!983843))

(declare-fun m!983895 () Bool)

(assert (=> b!1065792 m!983895))

(declare-fun m!983897 () Bool)

(assert (=> b!1065798 m!983897))

(assert (=> b!1065790 m!983843))

(assert (=> b!1065790 m!983843))

(assert (=> b!1065790 m!983853))

(declare-fun m!983899 () Bool)

(assert (=> b!1065793 m!983899))

(declare-fun m!983901 () Bool)

(assert (=> d!128875 m!983901))

(assert (=> d!128875 m!983777))

(assert (=> b!1065676 d!128875))

(declare-fun d!128877 () Bool)

(declare-fun lt!470123 () ListLongMap!14215)

(assert (=> d!128877 (not (contains!6239 lt!470123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!69 (List!22792 (_ BitVec 64)) List!22792)

(assert (=> d!128877 (= lt!470123 (ListLongMap!14216 (removeStrictlySorted!69 (toList!7123 lt!470038) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128877 (= (-!598 lt!470038 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470123)))

(declare-fun bs!31332 () Bool)

(assert (= bs!31332 d!128877))

(declare-fun m!983903 () Bool)

(assert (=> bs!31332 m!983903))

(declare-fun m!983905 () Bool)

(assert (=> bs!31332 m!983905))

(assert (=> b!1065675 d!128877))

(declare-fun d!128879 () Bool)

(assert (=> d!128879 (= (-!598 (+!3164 lt!470037 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!470037)))

(declare-fun lt!470126 () Unit!34832)

(declare-fun choose!1738 (ListLongMap!14215 (_ BitVec 64) V!39057) Unit!34832)

(assert (=> d!128879 (= lt!470126 (choose!1738 lt!470037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> d!128879 (not (contains!6239 lt!470037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128879 (= (addThenRemoveForNewKeyIsSame!16 lt!470037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!470126)))

(declare-fun bs!31333 () Bool)

(assert (= bs!31333 d!128879))

(assert (=> bs!31333 m!983763))

(assert (=> bs!31333 m!983763))

(declare-fun m!983907 () Bool)

(assert (=> bs!31333 m!983907))

(declare-fun m!983909 () Bool)

(assert (=> bs!31333 m!983909))

(declare-fun m!983911 () Bool)

(assert (=> bs!31333 m!983911))

(assert (=> b!1065675 d!128879))

(declare-fun b!1065841 () Bool)

(declare-fun c!107383 () Bool)

(assert (=> b!1065841 (= c!107383 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!607707 () ListLongMap!14215)

(declare-fun e!607696 () ListLongMap!14215)

(assert (=> b!1065841 (= e!607707 e!607696)))

(declare-fun b!1065842 () Bool)

(declare-fun e!607699 () Bool)

(declare-fun e!607697 () Bool)

(assert (=> b!1065842 (= e!607699 e!607697)))

(declare-fun res!711445 () Bool)

(declare-fun call!45016 () Bool)

(assert (=> b!1065842 (= res!711445 call!45016)))

(assert (=> b!1065842 (=> (not res!711445) (not e!607697))))

(declare-fun b!1065843 () Bool)

(declare-fun e!607695 () Bool)

(assert (=> b!1065843 (= e!607695 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45008 () Bool)

(declare-fun call!45015 () ListLongMap!14215)

(declare-fun call!45013 () ListLongMap!14215)

(assert (=> bm!45008 (= call!45015 call!45013)))

(declare-fun b!1065844 () Bool)

(declare-fun res!711441 () Bool)

(declare-fun e!607702 () Bool)

(assert (=> b!1065844 (=> (not res!711441) (not e!607702))))

(declare-fun e!607703 () Bool)

(assert (=> b!1065844 (= res!711441 e!607703)))

(declare-fun c!107381 () Bool)

(assert (=> b!1065844 (= c!107381 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065845 () Bool)

(declare-fun res!711443 () Bool)

(assert (=> b!1065845 (=> (not res!711443) (not e!607702))))

(declare-fun e!607705 () Bool)

(assert (=> b!1065845 (= res!711443 e!607705)))

(declare-fun res!711440 () Bool)

(assert (=> b!1065845 (=> res!711440 e!607705)))

(assert (=> b!1065845 (= res!711440 (not e!607695))))

(declare-fun res!711444 () Bool)

(assert (=> b!1065845 (=> (not res!711444) (not e!607695))))

(assert (=> b!1065845 (= res!711444 (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun bm!45009 () Bool)

(declare-fun call!45011 () ListLongMap!14215)

(declare-fun call!45017 () ListLongMap!14215)

(assert (=> bm!45009 (= call!45011 call!45017)))

(declare-fun bm!45010 () Bool)

(declare-fun call!45014 () ListLongMap!14215)

(assert (=> bm!45010 (= call!45014 call!45011)))

(declare-fun b!1065846 () Bool)

(assert (=> b!1065846 (= e!607702 e!607699)))

(declare-fun c!107380 () Bool)

(assert (=> b!1065846 (= c!107380 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1065847 () Bool)

(declare-fun call!45012 () Bool)

(assert (=> b!1065847 (= e!607703 (not call!45012))))

(declare-fun b!1065848 () Bool)

(assert (=> b!1065848 (= e!607696 call!45014)))

(declare-fun b!1065849 () Bool)

(declare-fun e!607706 () Bool)

(assert (=> b!1065849 (= e!607703 e!607706)))

(declare-fun res!711447 () Bool)

(assert (=> b!1065849 (= res!711447 call!45012)))

(assert (=> b!1065849 (=> (not res!711447) (not e!607706))))

(declare-fun b!1065850 () Bool)

(declare-fun lt!470176 () ListLongMap!14215)

(assert (=> b!1065850 (= e!607697 (= (apply!916 lt!470176 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45011 () Bool)

(assert (=> bm!45011 (= call!45016 (contains!6239 lt!470176 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45012 () Bool)

(assert (=> bm!45012 (= call!45012 (contains!6239 lt!470176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1065851 () Bool)

(assert (=> b!1065851 (= e!607707 call!45015)))

(declare-fun b!1065852 () Bool)

(assert (=> b!1065852 (= e!607706 (= (apply!916 lt!470176 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1065853 () Bool)

(assert (=> b!1065853 (= e!607696 call!45015)))

(declare-fun b!1065854 () Bool)

(declare-fun e!607701 () Bool)

(assert (=> b!1065854 (= e!607701 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065855 () Bool)

(assert (=> b!1065855 (= e!607699 (not call!45016))))

(declare-fun d!128881 () Bool)

(assert (=> d!128881 e!607702))

(declare-fun res!711442 () Bool)

(assert (=> d!128881 (=> (not res!711442) (not e!607702))))

(assert (=> d!128881 (= res!711442 (or (bvsge #b00000000000000000000000000000000 (size!33146 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))))

(declare-fun lt!470186 () ListLongMap!14215)

(assert (=> d!128881 (= lt!470176 lt!470186)))

(declare-fun lt!470178 () Unit!34832)

(declare-fun e!607698 () Unit!34832)

(assert (=> d!128881 (= lt!470178 e!607698)))

(declare-fun c!107385 () Bool)

(assert (=> d!128881 (= c!107385 e!607701)))

(declare-fun res!711448 () Bool)

(assert (=> d!128881 (=> (not res!711448) (not e!607701))))

(assert (=> d!128881 (= res!711448 (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun e!607704 () ListLongMap!14215)

(assert (=> d!128881 (= lt!470186 e!607704)))

(declare-fun c!107384 () Bool)

(assert (=> d!128881 (= c!107384 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!128881 (validMask!0 mask!1515)))

(assert (=> d!128881 (= (getCurrentListMap!3996 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470176)))

(declare-fun b!1065856 () Bool)

(declare-fun lt!470185 () Unit!34832)

(assert (=> b!1065856 (= e!607698 lt!470185)))

(declare-fun lt!470179 () ListLongMap!14215)

(assert (=> b!1065856 (= lt!470179 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470172 () (_ BitVec 64))

(assert (=> b!1065856 (= lt!470172 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470182 () (_ BitVec 64))

(assert (=> b!1065856 (= lt!470182 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470189 () Unit!34832)

(declare-fun addStillContains!632 (ListLongMap!14215 (_ BitVec 64) V!39057 (_ BitVec 64)) Unit!34832)

(assert (=> b!1065856 (= lt!470189 (addStillContains!632 lt!470179 lt!470172 zeroValueAfter!47 lt!470182))))

(assert (=> b!1065856 (contains!6239 (+!3164 lt!470179 (tuple2!16247 lt!470172 zeroValueAfter!47)) lt!470182)))

(declare-fun lt!470171 () Unit!34832)

(assert (=> b!1065856 (= lt!470171 lt!470189)))

(declare-fun lt!470175 () ListLongMap!14215)

(assert (=> b!1065856 (= lt!470175 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470192 () (_ BitVec 64))

(assert (=> b!1065856 (= lt!470192 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470174 () (_ BitVec 64))

(assert (=> b!1065856 (= lt!470174 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470183 () Unit!34832)

(declare-fun addApplyDifferent!488 (ListLongMap!14215 (_ BitVec 64) V!39057 (_ BitVec 64)) Unit!34832)

(assert (=> b!1065856 (= lt!470183 (addApplyDifferent!488 lt!470175 lt!470192 minValue!907 lt!470174))))

(assert (=> b!1065856 (= (apply!916 (+!3164 lt!470175 (tuple2!16247 lt!470192 minValue!907)) lt!470174) (apply!916 lt!470175 lt!470174))))

(declare-fun lt!470180 () Unit!34832)

(assert (=> b!1065856 (= lt!470180 lt!470183)))

(declare-fun lt!470181 () ListLongMap!14215)

(assert (=> b!1065856 (= lt!470181 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470184 () (_ BitVec 64))

(assert (=> b!1065856 (= lt!470184 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470188 () (_ BitVec 64))

(assert (=> b!1065856 (= lt!470188 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470173 () Unit!34832)

(assert (=> b!1065856 (= lt!470173 (addApplyDifferent!488 lt!470181 lt!470184 zeroValueAfter!47 lt!470188))))

(assert (=> b!1065856 (= (apply!916 (+!3164 lt!470181 (tuple2!16247 lt!470184 zeroValueAfter!47)) lt!470188) (apply!916 lt!470181 lt!470188))))

(declare-fun lt!470177 () Unit!34832)

(assert (=> b!1065856 (= lt!470177 lt!470173)))

(declare-fun lt!470187 () ListLongMap!14215)

(assert (=> b!1065856 (= lt!470187 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470190 () (_ BitVec 64))

(assert (=> b!1065856 (= lt!470190 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470191 () (_ BitVec 64))

(assert (=> b!1065856 (= lt!470191 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1065856 (= lt!470185 (addApplyDifferent!488 lt!470187 lt!470190 minValue!907 lt!470191))))

(assert (=> b!1065856 (= (apply!916 (+!3164 lt!470187 (tuple2!16247 lt!470190 minValue!907)) lt!470191) (apply!916 lt!470187 lt!470191))))

(declare-fun b!1065857 () Bool)

(declare-fun e!607700 () Bool)

(assert (=> b!1065857 (= e!607705 e!607700)))

(declare-fun res!711446 () Bool)

(assert (=> b!1065857 (=> (not res!711446) (not e!607700))))

(assert (=> b!1065857 (= res!711446 (contains!6239 lt!470176 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065857 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun b!1065858 () Bool)

(assert (=> b!1065858 (= e!607700 (= (apply!916 lt!470176 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)) (get!17024 (select (arr!32607 _values!955) #b00000000000000000000000000000000) (dynLambda!2015 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1065858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33145 _values!955)))))

(assert (=> b!1065858 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun b!1065859 () Bool)

(assert (=> b!1065859 (= e!607704 (+!3164 call!45013 (tuple2!16247 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45013 () Bool)

(assert (=> bm!45013 (= call!45017 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45014 () Bool)

(declare-fun c!107382 () Bool)

(assert (=> bm!45014 (= call!45013 (+!3164 (ite c!107384 call!45017 (ite c!107382 call!45011 call!45014)) (ite (or c!107384 c!107382) (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16247 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1065860 () Bool)

(declare-fun Unit!34836 () Unit!34832)

(assert (=> b!1065860 (= e!607698 Unit!34836)))

(declare-fun b!1065861 () Bool)

(assert (=> b!1065861 (= e!607704 e!607707)))

(assert (=> b!1065861 (= c!107382 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!128881 c!107384) b!1065859))

(assert (= (and d!128881 (not c!107384)) b!1065861))

(assert (= (and b!1065861 c!107382) b!1065851))

(assert (= (and b!1065861 (not c!107382)) b!1065841))

(assert (= (and b!1065841 c!107383) b!1065853))

(assert (= (and b!1065841 (not c!107383)) b!1065848))

(assert (= (or b!1065853 b!1065848) bm!45010))

(assert (= (or b!1065851 bm!45010) bm!45009))

(assert (= (or b!1065851 b!1065853) bm!45008))

(assert (= (or b!1065859 bm!45009) bm!45013))

(assert (= (or b!1065859 bm!45008) bm!45014))

(assert (= (and d!128881 res!711448) b!1065854))

(assert (= (and d!128881 c!107385) b!1065856))

(assert (= (and d!128881 (not c!107385)) b!1065860))

(assert (= (and d!128881 res!711442) b!1065845))

(assert (= (and b!1065845 res!711444) b!1065843))

(assert (= (and b!1065845 (not res!711440)) b!1065857))

(assert (= (and b!1065857 res!711446) b!1065858))

(assert (= (and b!1065845 res!711443) b!1065844))

(assert (= (and b!1065844 c!107381) b!1065849))

(assert (= (and b!1065844 (not c!107381)) b!1065847))

(assert (= (and b!1065849 res!711447) b!1065852))

(assert (= (or b!1065849 b!1065847) bm!45012))

(assert (= (and b!1065844 res!711441) b!1065846))

(assert (= (and b!1065846 c!107380) b!1065842))

(assert (= (and b!1065846 (not c!107380)) b!1065855))

(assert (= (and b!1065842 res!711445) b!1065850))

(assert (= (or b!1065842 b!1065855) bm!45011))

(declare-fun b_lambda!16523 () Bool)

(assert (=> (not b_lambda!16523) (not b!1065858)))

(assert (=> b!1065858 t!32107))

(declare-fun b_and!34379 () Bool)

(assert (= b_and!34377 (and (=> t!32107 result!14723) b_and!34379)))

(assert (=> b!1065857 m!983843))

(assert (=> b!1065857 m!983843))

(declare-fun m!983913 () Bool)

(assert (=> b!1065857 m!983913))

(assert (=> bm!45013 m!983773))

(declare-fun m!983915 () Bool)

(assert (=> b!1065850 m!983915))

(assert (=> b!1065843 m!983843))

(assert (=> b!1065843 m!983843))

(assert (=> b!1065843 m!983853))

(declare-fun m!983917 () Bool)

(assert (=> bm!45011 m!983917))

(declare-fun m!983919 () Bool)

(assert (=> b!1065852 m!983919))

(assert (=> b!1065854 m!983843))

(assert (=> b!1065854 m!983843))

(assert (=> b!1065854 m!983853))

(declare-fun m!983921 () Bool)

(assert (=> bm!45014 m!983921))

(assert (=> d!128881 m!983777))

(declare-fun m!983923 () Bool)

(assert (=> bm!45012 m!983923))

(assert (=> b!1065858 m!983859))

(assert (=> b!1065858 m!983863))

(assert (=> b!1065858 m!983843))

(assert (=> b!1065858 m!983859))

(assert (=> b!1065858 m!983863))

(assert (=> b!1065858 m!983865))

(assert (=> b!1065858 m!983843))

(declare-fun m!983925 () Bool)

(assert (=> b!1065858 m!983925))

(declare-fun m!983927 () Bool)

(assert (=> b!1065859 m!983927))

(declare-fun m!983929 () Bool)

(assert (=> b!1065856 m!983929))

(declare-fun m!983931 () Bool)

(assert (=> b!1065856 m!983931))

(declare-fun m!983933 () Bool)

(assert (=> b!1065856 m!983933))

(declare-fun m!983935 () Bool)

(assert (=> b!1065856 m!983935))

(declare-fun m!983937 () Bool)

(assert (=> b!1065856 m!983937))

(declare-fun m!983939 () Bool)

(assert (=> b!1065856 m!983939))

(declare-fun m!983941 () Bool)

(assert (=> b!1065856 m!983941))

(assert (=> b!1065856 m!983929))

(declare-fun m!983943 () Bool)

(assert (=> b!1065856 m!983943))

(declare-fun m!983945 () Bool)

(assert (=> b!1065856 m!983945))

(declare-fun m!983947 () Bool)

(assert (=> b!1065856 m!983947))

(declare-fun m!983949 () Bool)

(assert (=> b!1065856 m!983949))

(assert (=> b!1065856 m!983935))

(declare-fun m!983951 () Bool)

(assert (=> b!1065856 m!983951))

(declare-fun m!983953 () Bool)

(assert (=> b!1065856 m!983953))

(declare-fun m!983955 () Bool)

(assert (=> b!1065856 m!983955))

(assert (=> b!1065856 m!983843))

(declare-fun m!983957 () Bool)

(assert (=> b!1065856 m!983957))

(assert (=> b!1065856 m!983773))

(assert (=> b!1065856 m!983953))

(assert (=> b!1065856 m!983945))

(assert (=> b!1065675 d!128881))

(declare-fun b!1065862 () Bool)

(declare-fun c!107389 () Bool)

(assert (=> b!1065862 (= c!107389 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!607720 () ListLongMap!14215)

(declare-fun e!607709 () ListLongMap!14215)

(assert (=> b!1065862 (= e!607720 e!607709)))

(declare-fun b!1065863 () Bool)

(declare-fun e!607712 () Bool)

(declare-fun e!607710 () Bool)

(assert (=> b!1065863 (= e!607712 e!607710)))

(declare-fun res!711454 () Bool)

(declare-fun call!45023 () Bool)

(assert (=> b!1065863 (= res!711454 call!45023)))

(assert (=> b!1065863 (=> (not res!711454) (not e!607710))))

(declare-fun b!1065864 () Bool)

(declare-fun e!607708 () Bool)

(assert (=> b!1065864 (= e!607708 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45015 () Bool)

(declare-fun call!45022 () ListLongMap!14215)

(declare-fun call!45020 () ListLongMap!14215)

(assert (=> bm!45015 (= call!45022 call!45020)))

(declare-fun b!1065865 () Bool)

(declare-fun res!711450 () Bool)

(declare-fun e!607715 () Bool)

(assert (=> b!1065865 (=> (not res!711450) (not e!607715))))

(declare-fun e!607716 () Bool)

(assert (=> b!1065865 (= res!711450 e!607716)))

(declare-fun c!107387 () Bool)

(assert (=> b!1065865 (= c!107387 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065866 () Bool)

(declare-fun res!711452 () Bool)

(assert (=> b!1065866 (=> (not res!711452) (not e!607715))))

(declare-fun e!607718 () Bool)

(assert (=> b!1065866 (= res!711452 e!607718)))

(declare-fun res!711449 () Bool)

(assert (=> b!1065866 (=> res!711449 e!607718)))

(assert (=> b!1065866 (= res!711449 (not e!607708))))

(declare-fun res!711453 () Bool)

(assert (=> b!1065866 (=> (not res!711453) (not e!607708))))

(assert (=> b!1065866 (= res!711453 (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun bm!45016 () Bool)

(declare-fun call!45018 () ListLongMap!14215)

(declare-fun call!45024 () ListLongMap!14215)

(assert (=> bm!45016 (= call!45018 call!45024)))

(declare-fun bm!45017 () Bool)

(declare-fun call!45021 () ListLongMap!14215)

(assert (=> bm!45017 (= call!45021 call!45018)))

(declare-fun b!1065867 () Bool)

(assert (=> b!1065867 (= e!607715 e!607712)))

(declare-fun c!107386 () Bool)

(assert (=> b!1065867 (= c!107386 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1065868 () Bool)

(declare-fun call!45019 () Bool)

(assert (=> b!1065868 (= e!607716 (not call!45019))))

(declare-fun b!1065869 () Bool)

(assert (=> b!1065869 (= e!607709 call!45021)))

(declare-fun b!1065870 () Bool)

(declare-fun e!607719 () Bool)

(assert (=> b!1065870 (= e!607716 e!607719)))

(declare-fun res!711456 () Bool)

(assert (=> b!1065870 (= res!711456 call!45019)))

(assert (=> b!1065870 (=> (not res!711456) (not e!607719))))

(declare-fun b!1065871 () Bool)

(declare-fun lt!470198 () ListLongMap!14215)

(assert (=> b!1065871 (= e!607710 (= (apply!916 lt!470198 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45018 () Bool)

(assert (=> bm!45018 (= call!45023 (contains!6239 lt!470198 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!45019 () Bool)

(assert (=> bm!45019 (= call!45019 (contains!6239 lt!470198 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1065872 () Bool)

(assert (=> b!1065872 (= e!607720 call!45022)))

(declare-fun b!1065873 () Bool)

(assert (=> b!1065873 (= e!607719 (= (apply!916 lt!470198 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1065874 () Bool)

(assert (=> b!1065874 (= e!607709 call!45022)))

(declare-fun b!1065875 () Bool)

(declare-fun e!607714 () Bool)

(assert (=> b!1065875 (= e!607714 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065876 () Bool)

(assert (=> b!1065876 (= e!607712 (not call!45023))))

(declare-fun d!128883 () Bool)

(assert (=> d!128883 e!607715))

(declare-fun res!711451 () Bool)

(assert (=> d!128883 (=> (not res!711451) (not e!607715))))

(assert (=> d!128883 (= res!711451 (or (bvsge #b00000000000000000000000000000000 (size!33146 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))))

(declare-fun lt!470208 () ListLongMap!14215)

(assert (=> d!128883 (= lt!470198 lt!470208)))

(declare-fun lt!470200 () Unit!34832)

(declare-fun e!607711 () Unit!34832)

(assert (=> d!128883 (= lt!470200 e!607711)))

(declare-fun c!107391 () Bool)

(assert (=> d!128883 (= c!107391 e!607714)))

(declare-fun res!711457 () Bool)

(assert (=> d!128883 (=> (not res!711457) (not e!607714))))

(assert (=> d!128883 (= res!711457 (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun e!607717 () ListLongMap!14215)

(assert (=> d!128883 (= lt!470208 e!607717)))

(declare-fun c!107390 () Bool)

(assert (=> d!128883 (= c!107390 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!128883 (validMask!0 mask!1515)))

(assert (=> d!128883 (= (getCurrentListMap!3996 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470198)))

(declare-fun b!1065877 () Bool)

(declare-fun lt!470207 () Unit!34832)

(assert (=> b!1065877 (= e!607711 lt!470207)))

(declare-fun lt!470201 () ListLongMap!14215)

(assert (=> b!1065877 (= lt!470201 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470194 () (_ BitVec 64))

(assert (=> b!1065877 (= lt!470194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470204 () (_ BitVec 64))

(assert (=> b!1065877 (= lt!470204 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470211 () Unit!34832)

(assert (=> b!1065877 (= lt!470211 (addStillContains!632 lt!470201 lt!470194 zeroValueBefore!47 lt!470204))))

(assert (=> b!1065877 (contains!6239 (+!3164 lt!470201 (tuple2!16247 lt!470194 zeroValueBefore!47)) lt!470204)))

(declare-fun lt!470193 () Unit!34832)

(assert (=> b!1065877 (= lt!470193 lt!470211)))

(declare-fun lt!470197 () ListLongMap!14215)

(assert (=> b!1065877 (= lt!470197 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470214 () (_ BitVec 64))

(assert (=> b!1065877 (= lt!470214 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470196 () (_ BitVec 64))

(assert (=> b!1065877 (= lt!470196 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470205 () Unit!34832)

(assert (=> b!1065877 (= lt!470205 (addApplyDifferent!488 lt!470197 lt!470214 minValue!907 lt!470196))))

(assert (=> b!1065877 (= (apply!916 (+!3164 lt!470197 (tuple2!16247 lt!470214 minValue!907)) lt!470196) (apply!916 lt!470197 lt!470196))))

(declare-fun lt!470202 () Unit!34832)

(assert (=> b!1065877 (= lt!470202 lt!470205)))

(declare-fun lt!470203 () ListLongMap!14215)

(assert (=> b!1065877 (= lt!470203 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470206 () (_ BitVec 64))

(assert (=> b!1065877 (= lt!470206 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470210 () (_ BitVec 64))

(assert (=> b!1065877 (= lt!470210 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470195 () Unit!34832)

(assert (=> b!1065877 (= lt!470195 (addApplyDifferent!488 lt!470203 lt!470206 zeroValueBefore!47 lt!470210))))

(assert (=> b!1065877 (= (apply!916 (+!3164 lt!470203 (tuple2!16247 lt!470206 zeroValueBefore!47)) lt!470210) (apply!916 lt!470203 lt!470210))))

(declare-fun lt!470199 () Unit!34832)

(assert (=> b!1065877 (= lt!470199 lt!470195)))

(declare-fun lt!470209 () ListLongMap!14215)

(assert (=> b!1065877 (= lt!470209 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470212 () (_ BitVec 64))

(assert (=> b!1065877 (= lt!470212 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470213 () (_ BitVec 64))

(assert (=> b!1065877 (= lt!470213 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1065877 (= lt!470207 (addApplyDifferent!488 lt!470209 lt!470212 minValue!907 lt!470213))))

(assert (=> b!1065877 (= (apply!916 (+!3164 lt!470209 (tuple2!16247 lt!470212 minValue!907)) lt!470213) (apply!916 lt!470209 lt!470213))))

(declare-fun b!1065878 () Bool)

(declare-fun e!607713 () Bool)

(assert (=> b!1065878 (= e!607718 e!607713)))

(declare-fun res!711455 () Bool)

(assert (=> b!1065878 (=> (not res!711455) (not e!607713))))

(assert (=> b!1065878 (= res!711455 (contains!6239 lt!470198 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun b!1065879 () Bool)

(assert (=> b!1065879 (= e!607713 (= (apply!916 lt!470198 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)) (get!17024 (select (arr!32607 _values!955) #b00000000000000000000000000000000) (dynLambda!2015 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1065879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33145 _values!955)))))

(assert (=> b!1065879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(declare-fun b!1065880 () Bool)

(assert (=> b!1065880 (= e!607717 (+!3164 call!45020 (tuple2!16247 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45020 () Bool)

(assert (=> bm!45020 (= call!45024 (getCurrentListMapNoExtraKeys!3722 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45021 () Bool)

(declare-fun c!107388 () Bool)

(assert (=> bm!45021 (= call!45020 (+!3164 (ite c!107390 call!45024 (ite c!107388 call!45018 call!45021)) (ite (or c!107390 c!107388) (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16247 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1065881 () Bool)

(declare-fun Unit!34837 () Unit!34832)

(assert (=> b!1065881 (= e!607711 Unit!34837)))

(declare-fun b!1065882 () Bool)

(assert (=> b!1065882 (= e!607717 e!607720)))

(assert (=> b!1065882 (= c!107388 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!128883 c!107390) b!1065880))

(assert (= (and d!128883 (not c!107390)) b!1065882))

(assert (= (and b!1065882 c!107388) b!1065872))

(assert (= (and b!1065882 (not c!107388)) b!1065862))

(assert (= (and b!1065862 c!107389) b!1065874))

(assert (= (and b!1065862 (not c!107389)) b!1065869))

(assert (= (or b!1065874 b!1065869) bm!45017))

(assert (= (or b!1065872 bm!45017) bm!45016))

(assert (= (or b!1065872 b!1065874) bm!45015))

(assert (= (or b!1065880 bm!45016) bm!45020))

(assert (= (or b!1065880 bm!45015) bm!45021))

(assert (= (and d!128883 res!711457) b!1065875))

(assert (= (and d!128883 c!107391) b!1065877))

(assert (= (and d!128883 (not c!107391)) b!1065881))

(assert (= (and d!128883 res!711451) b!1065866))

(assert (= (and b!1065866 res!711453) b!1065864))

(assert (= (and b!1065866 (not res!711449)) b!1065878))

(assert (= (and b!1065878 res!711455) b!1065879))

(assert (= (and b!1065866 res!711452) b!1065865))

(assert (= (and b!1065865 c!107387) b!1065870))

(assert (= (and b!1065865 (not c!107387)) b!1065868))

(assert (= (and b!1065870 res!711456) b!1065873))

(assert (= (or b!1065870 b!1065868) bm!45019))

(assert (= (and b!1065865 res!711450) b!1065867))

(assert (= (and b!1065867 c!107386) b!1065863))

(assert (= (and b!1065867 (not c!107386)) b!1065876))

(assert (= (and b!1065863 res!711454) b!1065871))

(assert (= (or b!1065863 b!1065876) bm!45018))

(declare-fun b_lambda!16525 () Bool)

(assert (=> (not b_lambda!16525) (not b!1065879)))

(assert (=> b!1065879 t!32107))

(declare-fun b_and!34381 () Bool)

(assert (= b_and!34379 (and (=> t!32107 result!14723) b_and!34381)))

(assert (=> b!1065878 m!983843))

(assert (=> b!1065878 m!983843))

(declare-fun m!983959 () Bool)

(assert (=> b!1065878 m!983959))

(assert (=> bm!45020 m!983775))

(declare-fun m!983961 () Bool)

(assert (=> b!1065871 m!983961))

(assert (=> b!1065864 m!983843))

(assert (=> b!1065864 m!983843))

(assert (=> b!1065864 m!983853))

(declare-fun m!983963 () Bool)

(assert (=> bm!45018 m!983963))

(declare-fun m!983965 () Bool)

(assert (=> b!1065873 m!983965))

(assert (=> b!1065875 m!983843))

(assert (=> b!1065875 m!983843))

(assert (=> b!1065875 m!983853))

(declare-fun m!983967 () Bool)

(assert (=> bm!45021 m!983967))

(assert (=> d!128883 m!983777))

(declare-fun m!983969 () Bool)

(assert (=> bm!45019 m!983969))

(assert (=> b!1065879 m!983859))

(assert (=> b!1065879 m!983863))

(assert (=> b!1065879 m!983843))

(assert (=> b!1065879 m!983859))

(assert (=> b!1065879 m!983863))

(assert (=> b!1065879 m!983865))

(assert (=> b!1065879 m!983843))

(declare-fun m!983971 () Bool)

(assert (=> b!1065879 m!983971))

(declare-fun m!983973 () Bool)

(assert (=> b!1065880 m!983973))

(declare-fun m!983975 () Bool)

(assert (=> b!1065877 m!983975))

(declare-fun m!983977 () Bool)

(assert (=> b!1065877 m!983977))

(declare-fun m!983979 () Bool)

(assert (=> b!1065877 m!983979))

(declare-fun m!983981 () Bool)

(assert (=> b!1065877 m!983981))

(declare-fun m!983983 () Bool)

(assert (=> b!1065877 m!983983))

(declare-fun m!983985 () Bool)

(assert (=> b!1065877 m!983985))

(declare-fun m!983987 () Bool)

(assert (=> b!1065877 m!983987))

(assert (=> b!1065877 m!983975))

(declare-fun m!983989 () Bool)

(assert (=> b!1065877 m!983989))

(declare-fun m!983991 () Bool)

(assert (=> b!1065877 m!983991))

(declare-fun m!983993 () Bool)

(assert (=> b!1065877 m!983993))

(declare-fun m!983995 () Bool)

(assert (=> b!1065877 m!983995))

(assert (=> b!1065877 m!983981))

(declare-fun m!983997 () Bool)

(assert (=> b!1065877 m!983997))

(declare-fun m!983999 () Bool)

(assert (=> b!1065877 m!983999))

(declare-fun m!984001 () Bool)

(assert (=> b!1065877 m!984001))

(assert (=> b!1065877 m!983843))

(declare-fun m!984003 () Bool)

(assert (=> b!1065877 m!984003))

(assert (=> b!1065877 m!983775))

(assert (=> b!1065877 m!983999))

(assert (=> b!1065877 m!983991))

(assert (=> b!1065675 d!128883))

(declare-fun d!128885 () Bool)

(declare-fun lt!470215 () ListLongMap!14215)

(assert (=> d!128885 (not (contains!6239 lt!470215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!128885 (= lt!470215 (ListLongMap!14216 (removeStrictlySorted!69 (toList!7123 lt!470035) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!128885 (= (-!598 lt!470035 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470215)))

(declare-fun bs!31334 () Bool)

(assert (= bs!31334 d!128885))

(declare-fun m!984005 () Bool)

(assert (=> bs!31334 m!984005))

(declare-fun m!984007 () Bool)

(assert (=> bs!31334 m!984007))

(assert (=> b!1065675 d!128885))

(declare-fun d!128887 () Bool)

(declare-fun e!607723 () Bool)

(assert (=> d!128887 e!607723))

(declare-fun res!711462 () Bool)

(assert (=> d!128887 (=> (not res!711462) (not e!607723))))

(declare-fun lt!470226 () ListLongMap!14215)

(assert (=> d!128887 (= res!711462 (contains!6239 lt!470226 (_1!8134 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!470224 () List!22792)

(assert (=> d!128887 (= lt!470226 (ListLongMap!14216 lt!470224))))

(declare-fun lt!470225 () Unit!34832)

(declare-fun lt!470227 () Unit!34832)

(assert (=> d!128887 (= lt!470225 lt!470227)))

(declare-datatypes ((Option!652 0))(
  ( (Some!651 (v!15385 V!39057)) (None!650) )
))
(declare-fun getValueByKey!601 (List!22792 (_ BitVec 64)) Option!652)

(assert (=> d!128887 (= (getValueByKey!601 lt!470224 (_1!8134 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!651 (_2!8134 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!283 (List!22792 (_ BitVec 64) V!39057) Unit!34832)

(assert (=> d!128887 (= lt!470227 (lemmaContainsTupThenGetReturnValue!283 lt!470224 (_1!8134 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8134 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!376 (List!22792 (_ BitVec 64) V!39057) List!22792)

(assert (=> d!128887 (= lt!470224 (insertStrictlySorted!376 (toList!7123 lt!470037) (_1!8134 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8134 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!128887 (= (+!3164 lt!470037 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!470226)))

(declare-fun b!1065887 () Bool)

(declare-fun res!711463 () Bool)

(assert (=> b!1065887 (=> (not res!711463) (not e!607723))))

(assert (=> b!1065887 (= res!711463 (= (getValueByKey!601 (toList!7123 lt!470226) (_1!8134 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!651 (_2!8134 (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1065888 () Bool)

(declare-fun contains!6240 (List!22792 tuple2!16246) Bool)

(assert (=> b!1065888 (= e!607723 (contains!6240 (toList!7123 lt!470226) (tuple2!16247 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!128887 res!711462) b!1065887))

(assert (= (and b!1065887 res!711463) b!1065888))

(declare-fun m!984009 () Bool)

(assert (=> d!128887 m!984009))

(declare-fun m!984011 () Bool)

(assert (=> d!128887 m!984011))

(declare-fun m!984013 () Bool)

(assert (=> d!128887 m!984013))

(declare-fun m!984015 () Bool)

(assert (=> d!128887 m!984015))

(declare-fun m!984017 () Bool)

(assert (=> b!1065887 m!984017))

(declare-fun m!984019 () Bool)

(assert (=> b!1065888 m!984019))

(assert (=> b!1065675 d!128887))

(declare-fun b!1065899 () Bool)

(declare-fun e!607732 () Bool)

(declare-fun e!607734 () Bool)

(assert (=> b!1065899 (= e!607732 e!607734)))

(declare-fun res!711470 () Bool)

(assert (=> b!1065899 (=> (not res!711470) (not e!607734))))

(declare-fun e!607735 () Bool)

(assert (=> b!1065899 (= res!711470 (not e!607735))))

(declare-fun res!711472 () Bool)

(assert (=> b!1065899 (=> (not res!711472) (not e!607735))))

(assert (=> b!1065899 (= res!711472 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45024 () Bool)

(declare-fun call!45027 () Bool)

(declare-fun c!107394 () Bool)

(assert (=> bm!45024 (= call!45027 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107394 (Cons!22789 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000) Nil!22790) Nil!22790)))))

(declare-fun b!1065900 () Bool)

(declare-fun e!607733 () Bool)

(assert (=> b!1065900 (= e!607734 e!607733)))

(assert (=> b!1065900 (= c!107394 (validKeyInArray!0 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065901 () Bool)

(assert (=> b!1065901 (= e!607733 call!45027)))

(declare-fun d!128889 () Bool)

(declare-fun res!711471 () Bool)

(assert (=> d!128889 (=> res!711471 e!607732)))

(assert (=> d!128889 (= res!711471 (bvsge #b00000000000000000000000000000000 (size!33146 _keys!1163)))))

(assert (=> d!128889 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22790) e!607732)))

(declare-fun b!1065902 () Bool)

(assert (=> b!1065902 (= e!607733 call!45027)))

(declare-fun b!1065903 () Bool)

(declare-fun contains!6241 (List!22793 (_ BitVec 64)) Bool)

(assert (=> b!1065903 (= e!607735 (contains!6241 Nil!22790 (select (arr!32608 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!128889 (not res!711471)) b!1065899))

(assert (= (and b!1065899 res!711472) b!1065903))

(assert (= (and b!1065899 res!711470) b!1065900))

(assert (= (and b!1065900 c!107394) b!1065902))

(assert (= (and b!1065900 (not c!107394)) b!1065901))

(assert (= (or b!1065902 b!1065901) bm!45024))

(assert (=> b!1065899 m!983843))

(assert (=> b!1065899 m!983843))

(assert (=> b!1065899 m!983853))

(assert (=> bm!45024 m!983843))

(declare-fun m!984021 () Bool)

(assert (=> bm!45024 m!984021))

(assert (=> b!1065900 m!983843))

(assert (=> b!1065900 m!983843))

(assert (=> b!1065900 m!983853))

(assert (=> b!1065903 m!983843))

(assert (=> b!1065903 m!983843))

(declare-fun m!984023 () Bool)

(assert (=> b!1065903 m!984023))

(assert (=> b!1065679 d!128889))

(declare-fun b!1065910 () Bool)

(declare-fun e!607741 () Bool)

(assert (=> b!1065910 (= e!607741 tp_is_empty!25441)))

(declare-fun mapNonEmpty!39856 () Bool)

(declare-fun mapRes!39856 () Bool)

(declare-fun tp!76346 () Bool)

(assert (=> mapNonEmpty!39856 (= mapRes!39856 (and tp!76346 e!607741))))

(declare-fun mapRest!39856 () (Array (_ BitVec 32) ValueCell!12017))

(declare-fun mapValue!39856 () ValueCell!12017)

(declare-fun mapKey!39856 () (_ BitVec 32))

(assert (=> mapNonEmpty!39856 (= mapRest!39847 (store mapRest!39856 mapKey!39856 mapValue!39856))))

(declare-fun b!1065911 () Bool)

(declare-fun e!607740 () Bool)

(assert (=> b!1065911 (= e!607740 tp_is_empty!25441)))

(declare-fun condMapEmpty!39856 () Bool)

(declare-fun mapDefault!39856 () ValueCell!12017)

(assert (=> mapNonEmpty!39847 (= condMapEmpty!39856 (= mapRest!39847 ((as const (Array (_ BitVec 32) ValueCell!12017)) mapDefault!39856)))))

(assert (=> mapNonEmpty!39847 (= tp!76331 (and e!607740 mapRes!39856))))

(declare-fun mapIsEmpty!39856 () Bool)

(assert (=> mapIsEmpty!39856 mapRes!39856))

(assert (= (and mapNonEmpty!39847 condMapEmpty!39856) mapIsEmpty!39856))

(assert (= (and mapNonEmpty!39847 (not condMapEmpty!39856)) mapNonEmpty!39856))

(assert (= (and mapNonEmpty!39856 ((_ is ValueCellFull!12017) mapValue!39856)) b!1065910))

(assert (= (and mapNonEmpty!39847 ((_ is ValueCellFull!12017) mapDefault!39856)) b!1065911))

(declare-fun m!984025 () Bool)

(assert (=> mapNonEmpty!39856 m!984025))

(declare-fun b_lambda!16527 () Bool)

(assert (= b_lambda!16517 (or (and start!94240 b_free!21631) b_lambda!16527)))

(declare-fun b_lambda!16529 () Bool)

(assert (= b_lambda!16519 (or (and start!94240 b_free!21631) b_lambda!16529)))

(declare-fun b_lambda!16531 () Bool)

(assert (= b_lambda!16523 (or (and start!94240 b_free!21631) b_lambda!16531)))

(declare-fun b_lambda!16533 () Bool)

(assert (= b_lambda!16521 (or (and start!94240 b_free!21631) b_lambda!16533)))

(declare-fun b_lambda!16535 () Bool)

(assert (= b_lambda!16515 (or (and start!94240 b_free!21631) b_lambda!16535)))

(declare-fun b_lambda!16537 () Bool)

(assert (= b_lambda!16525 (or (and start!94240 b_free!21631) b_lambda!16537)))

(check-sat (not b!1065887) (not d!128873) (not b!1065773) (not bm!45014) (not d!128881) (not b!1065888) (not d!128887) (not b!1065746) (not b!1065859) (not b!1065792) (not d!128871) (not b!1065879) (not bm!45018) (not b!1065793) tp_is_empty!25441 (not b!1065798) (not b_lambda!16527) (not bm!45019) (not b_lambda!16537) (not b!1065783) (not b!1065864) (not b!1065778) (not b!1065779) (not d!128883) (not bm!45012) (not b!1065787) (not b!1065877) (not b!1065797) (not b!1065899) (not b!1065784) b_and!34381 (not b!1065878) (not b_lambda!16529) (not b!1065900) (not b!1065782) (not b!1065745) (not b!1065873) (not bm!45024) (not b!1065858) (not b!1065850) (not d!128885) (not bm!45013) (not b_lambda!16533) (not bm!45020) (not b!1065790) (not b!1065857) (not d!128879) (not b!1065856) (not b_lambda!16531) (not b!1065871) (not d!128877) (not b!1065795) (not bm!45011) (not b!1065854) (not bm!44993) (not d!128875) (not b!1065796) (not b!1065903) (not b_next!21631) (not b!1065852) (not bm!44989) (not bm!45021) (not b!1065875) (not b!1065776) (not b_lambda!16535) (not b!1065880) (not bm!44992) (not b!1065781) (not mapNonEmpty!39856) (not b!1065843))
(check-sat b_and!34381 (not b_next!21631))
