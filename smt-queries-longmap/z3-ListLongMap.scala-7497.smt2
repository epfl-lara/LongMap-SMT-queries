; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94968 () Bool)

(assert start!94968)

(declare-fun b_free!22161 () Bool)

(declare-fun b_next!22161 () Bool)

(assert (=> start!94968 (= b_free!22161 (not b_next!22161))))

(declare-fun tp!77950 () Bool)

(declare-fun b_and!35023 () Bool)

(assert (=> start!94968 (= tp!77950 b_and!35023)))

(declare-fun b!1073726 () Bool)

(declare-fun e!613460 () Bool)

(declare-fun e!613463 () Bool)

(declare-fun mapRes!40672 () Bool)

(assert (=> b!1073726 (= e!613460 (and e!613463 mapRes!40672))))

(declare-fun condMapEmpty!40672 () Bool)

(declare-datatypes ((V!39763 0))(
  ( (V!39764 (val!13036 Int)) )
))
(declare-datatypes ((ValueCell!12282 0))(
  ( (ValueCellFull!12282 (v!15654 V!39763)) (EmptyCell!12282) )
))
(declare-datatypes ((array!68903 0))(
  ( (array!68904 (arr!33144 (Array (_ BitVec 32) ValueCell!12282)) (size!33680 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68903)

(declare-fun mapDefault!40672 () ValueCell!12282)

(assert (=> b!1073726 (= condMapEmpty!40672 (= (arr!33144 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12282)) mapDefault!40672)))))

(declare-fun mapNonEmpty!40672 () Bool)

(declare-fun tp!77951 () Bool)

(declare-fun e!613464 () Bool)

(assert (=> mapNonEmpty!40672 (= mapRes!40672 (and tp!77951 e!613464))))

(declare-fun mapKey!40672 () (_ BitVec 32))

(declare-fun mapRest!40672 () (Array (_ BitVec 32) ValueCell!12282))

(declare-fun mapValue!40672 () ValueCell!12282)

(assert (=> mapNonEmpty!40672 (= (arr!33144 _values!955) (store mapRest!40672 mapKey!40672 mapValue!40672))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39763)

(declare-fun b!1073727 () Bool)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39763)

(declare-fun e!613462 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68905 0))(
  ( (array!68906 (arr!33145 (Array (_ BitVec 32) (_ BitVec 64))) (size!33681 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68905)

(declare-datatypes ((tuple2!16600 0))(
  ( (tuple2!16601 (_1!8311 (_ BitVec 64)) (_2!8311 V!39763)) )
))
(declare-datatypes ((List!23138 0))(
  ( (Nil!23135) (Cons!23134 (h!24343 tuple2!16600) (t!32477 List!23138)) )
))
(declare-datatypes ((ListLongMap!14569 0))(
  ( (ListLongMap!14570 (toList!7300 List!23138)) )
))
(declare-fun contains!6330 (ListLongMap!14569 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4172 (array!68905 array!68903 (_ BitVec 32) (_ BitVec 32) V!39763 V!39763 (_ BitVec 32) Int) ListLongMap!14569)

(assert (=> b!1073727 (= e!613462 (not (contains!6330 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1073728 () Bool)

(declare-fun e!613461 () Bool)

(assert (=> b!1073728 (= e!613461 (not e!613462))))

(declare-fun res!716093 () Bool)

(assert (=> b!1073728 (=> res!716093 e!613462)))

(assert (=> b!1073728 (= res!716093 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!476145 () ListLongMap!14569)

(declare-fun lt!476147 () ListLongMap!14569)

(assert (=> b!1073728 (= lt!476145 lt!476147)))

(declare-datatypes ((Unit!35356 0))(
  ( (Unit!35357) )
))
(declare-fun lt!476146 () Unit!35356)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39763)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!880 (array!68905 array!68903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39763 V!39763 V!39763 V!39763 (_ BitVec 32) Int) Unit!35356)

(assert (=> b!1073728 (= lt!476146 (lemmaNoChangeToArrayThenSameMapNoExtras!880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3864 (array!68905 array!68903 (_ BitVec 32) (_ BitVec 32) V!39763 V!39763 (_ BitVec 32) Int) ListLongMap!14569)

(assert (=> b!1073728 (= lt!476147 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073728 (= lt!476145 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073729 () Bool)

(declare-fun res!716091 () Bool)

(assert (=> b!1073729 (=> (not res!716091) (not e!613461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68905 (_ BitVec 32)) Bool)

(assert (=> b!1073729 (= res!716091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073730 () Bool)

(declare-fun res!716092 () Bool)

(assert (=> b!1073730 (=> (not res!716092) (not e!613461))))

(declare-datatypes ((List!23139 0))(
  ( (Nil!23136) (Cons!23135 (h!24344 (_ BitVec 64)) (t!32478 List!23139)) )
))
(declare-fun arrayNoDuplicates!0 (array!68905 (_ BitVec 32) List!23139) Bool)

(assert (=> b!1073730 (= res!716092 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23136))))

(declare-fun res!716089 () Bool)

(assert (=> start!94968 (=> (not res!716089) (not e!613461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94968 (= res!716089 (validMask!0 mask!1515))))

(assert (=> start!94968 e!613461))

(assert (=> start!94968 true))

(declare-fun tp_is_empty!25971 () Bool)

(assert (=> start!94968 tp_is_empty!25971))

(declare-fun array_inv!25616 (array!68903) Bool)

(assert (=> start!94968 (and (array_inv!25616 _values!955) e!613460)))

(assert (=> start!94968 tp!77950))

(declare-fun array_inv!25617 (array!68905) Bool)

(assert (=> start!94968 (array_inv!25617 _keys!1163)))

(declare-fun b!1073731 () Bool)

(assert (=> b!1073731 (= e!613463 tp_is_empty!25971)))

(declare-fun b!1073732 () Bool)

(assert (=> b!1073732 (= e!613464 tp_is_empty!25971)))

(declare-fun b!1073733 () Bool)

(declare-fun res!716090 () Bool)

(assert (=> b!1073733 (=> (not res!716090) (not e!613461))))

(assert (=> b!1073733 (= res!716090 (and (= (size!33680 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33681 _keys!1163) (size!33680 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40672 () Bool)

(assert (=> mapIsEmpty!40672 mapRes!40672))

(assert (= (and start!94968 res!716089) b!1073733))

(assert (= (and b!1073733 res!716090) b!1073729))

(assert (= (and b!1073729 res!716091) b!1073730))

(assert (= (and b!1073730 res!716092) b!1073728))

(assert (= (and b!1073728 (not res!716093)) b!1073727))

(assert (= (and b!1073726 condMapEmpty!40672) mapIsEmpty!40672))

(assert (= (and b!1073726 (not condMapEmpty!40672)) mapNonEmpty!40672))

(get-info :version)

(assert (= (and mapNonEmpty!40672 ((_ is ValueCellFull!12282) mapValue!40672)) b!1073732))

(assert (= (and b!1073726 ((_ is ValueCellFull!12282) mapDefault!40672)) b!1073731))

(assert (= start!94968 b!1073726))

(declare-fun m!992645 () Bool)

(assert (=> mapNonEmpty!40672 m!992645))

(declare-fun m!992647 () Bool)

(assert (=> b!1073727 m!992647))

(assert (=> b!1073727 m!992647))

(declare-fun m!992649 () Bool)

(assert (=> b!1073727 m!992649))

(declare-fun m!992651 () Bool)

(assert (=> start!94968 m!992651))

(declare-fun m!992653 () Bool)

(assert (=> start!94968 m!992653))

(declare-fun m!992655 () Bool)

(assert (=> start!94968 m!992655))

(declare-fun m!992657 () Bool)

(assert (=> b!1073730 m!992657))

(declare-fun m!992659 () Bool)

(assert (=> b!1073729 m!992659))

(declare-fun m!992661 () Bool)

(assert (=> b!1073728 m!992661))

(declare-fun m!992663 () Bool)

(assert (=> b!1073728 m!992663))

(declare-fun m!992665 () Bool)

(assert (=> b!1073728 m!992665))

(check-sat (not b!1073730) (not b!1073728) (not b!1073727) tp_is_empty!25971 (not b_next!22161) (not mapNonEmpty!40672) b_and!35023 (not b!1073729) (not start!94968))
(check-sat b_and!35023 (not b_next!22161))
(get-model)

(declare-fun bm!45287 () Bool)

(declare-fun call!45290 () Bool)

(declare-fun c!107766 () Bool)

(assert (=> bm!45287 (= call!45290 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107766 (Cons!23135 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000) Nil!23136) Nil!23136)))))

(declare-fun d!129439 () Bool)

(declare-fun res!716115 () Bool)

(declare-fun e!613491 () Bool)

(assert (=> d!129439 (=> res!716115 e!613491)))

(assert (=> d!129439 (= res!716115 (bvsge #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(assert (=> d!129439 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23136) e!613491)))

(declare-fun b!1073768 () Bool)

(declare-fun e!613493 () Bool)

(assert (=> b!1073768 (= e!613493 call!45290)))

(declare-fun b!1073769 () Bool)

(assert (=> b!1073769 (= e!613493 call!45290)))

(declare-fun b!1073770 () Bool)

(declare-fun e!613494 () Bool)

(assert (=> b!1073770 (= e!613491 e!613494)))

(declare-fun res!716116 () Bool)

(assert (=> b!1073770 (=> (not res!716116) (not e!613494))))

(declare-fun e!613492 () Bool)

(assert (=> b!1073770 (= res!716116 (not e!613492))))

(declare-fun res!716117 () Bool)

(assert (=> b!1073770 (=> (not res!716117) (not e!613492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1073770 (= res!716117 (validKeyInArray!0 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073771 () Bool)

(declare-fun contains!6331 (List!23139 (_ BitVec 64)) Bool)

(assert (=> b!1073771 (= e!613492 (contains!6331 Nil!23136 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073772 () Bool)

(assert (=> b!1073772 (= e!613494 e!613493)))

(assert (=> b!1073772 (= c!107766 (validKeyInArray!0 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129439 (not res!716115)) b!1073770))

(assert (= (and b!1073770 res!716117) b!1073771))

(assert (= (and b!1073770 res!716116) b!1073772))

(assert (= (and b!1073772 c!107766) b!1073768))

(assert (= (and b!1073772 (not c!107766)) b!1073769))

(assert (= (or b!1073768 b!1073769) bm!45287))

(declare-fun m!992689 () Bool)

(assert (=> bm!45287 m!992689))

(declare-fun m!992691 () Bool)

(assert (=> bm!45287 m!992691))

(assert (=> b!1073770 m!992689))

(assert (=> b!1073770 m!992689))

(declare-fun m!992693 () Bool)

(assert (=> b!1073770 m!992693))

(assert (=> b!1073771 m!992689))

(assert (=> b!1073771 m!992689))

(declare-fun m!992695 () Bool)

(assert (=> b!1073771 m!992695))

(assert (=> b!1073772 m!992689))

(assert (=> b!1073772 m!992689))

(assert (=> b!1073772 m!992693))

(assert (=> b!1073730 d!129439))

(declare-fun b!1073781 () Bool)

(declare-fun e!613502 () Bool)

(declare-fun e!613503 () Bool)

(assert (=> b!1073781 (= e!613502 e!613503)))

(declare-fun lt!476163 () (_ BitVec 64))

(assert (=> b!1073781 (= lt!476163 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476164 () Unit!35356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68905 (_ BitVec 64) (_ BitVec 32)) Unit!35356)

(assert (=> b!1073781 (= lt!476164 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476163 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1073781 (arrayContainsKey!0 _keys!1163 lt!476163 #b00000000000000000000000000000000)))

(declare-fun lt!476165 () Unit!35356)

(assert (=> b!1073781 (= lt!476165 lt!476164)))

(declare-fun res!716123 () Bool)

(declare-datatypes ((SeekEntryResult!9886 0))(
  ( (MissingZero!9886 (index!41915 (_ BitVec 32))) (Found!9886 (index!41916 (_ BitVec 32))) (Intermediate!9886 (undefined!10698 Bool) (index!41917 (_ BitVec 32)) (x!96246 (_ BitVec 32))) (Undefined!9886) (MissingVacant!9886 (index!41918 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68905 (_ BitVec 32)) SeekEntryResult!9886)

(assert (=> b!1073781 (= res!716123 (= (seekEntryOrOpen!0 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9886 #b00000000000000000000000000000000)))))

(assert (=> b!1073781 (=> (not res!716123) (not e!613503))))

(declare-fun b!1073782 () Bool)

(declare-fun call!45293 () Bool)

(assert (=> b!1073782 (= e!613503 call!45293)))

(declare-fun d!129441 () Bool)

(declare-fun res!716122 () Bool)

(declare-fun e!613501 () Bool)

(assert (=> d!129441 (=> res!716122 e!613501)))

(assert (=> d!129441 (= res!716122 (bvsge #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(assert (=> d!129441 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!613501)))

(declare-fun b!1073783 () Bool)

(assert (=> b!1073783 (= e!613502 call!45293)))

(declare-fun b!1073784 () Bool)

(assert (=> b!1073784 (= e!613501 e!613502)))

(declare-fun c!107769 () Bool)

(assert (=> b!1073784 (= c!107769 (validKeyInArray!0 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45290 () Bool)

(assert (=> bm!45290 (= call!45293 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129441 (not res!716122)) b!1073784))

(assert (= (and b!1073784 c!107769) b!1073781))

(assert (= (and b!1073784 (not c!107769)) b!1073783))

(assert (= (and b!1073781 res!716123) b!1073782))

(assert (= (or b!1073782 b!1073783) bm!45290))

(assert (=> b!1073781 m!992689))

(declare-fun m!992697 () Bool)

(assert (=> b!1073781 m!992697))

(declare-fun m!992699 () Bool)

(assert (=> b!1073781 m!992699))

(assert (=> b!1073781 m!992689))

(declare-fun m!992701 () Bool)

(assert (=> b!1073781 m!992701))

(assert (=> b!1073784 m!992689))

(assert (=> b!1073784 m!992689))

(assert (=> b!1073784 m!992693))

(declare-fun m!992703 () Bool)

(assert (=> bm!45290 m!992703))

(assert (=> b!1073729 d!129441))

(declare-fun d!129443 () Bool)

(assert (=> d!129443 (= (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476168 () Unit!35356)

(declare-fun choose!1747 (array!68905 array!68903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39763 V!39763 V!39763 V!39763 (_ BitVec 32) Int) Unit!35356)

(assert (=> d!129443 (= lt!476168 (choose!1747 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129443 (validMask!0 mask!1515)))

(assert (=> d!129443 (= (lemmaNoChangeToArrayThenSameMapNoExtras!880 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476168)))

(declare-fun bs!31651 () Bool)

(assert (= bs!31651 d!129443))

(assert (=> bs!31651 m!992665))

(assert (=> bs!31651 m!992663))

(declare-fun m!992705 () Bool)

(assert (=> bs!31651 m!992705))

(assert (=> bs!31651 m!992651))

(assert (=> b!1073728 d!129443))

(declare-fun b!1073809 () Bool)

(declare-fun e!613523 () ListLongMap!14569)

(declare-fun call!45296 () ListLongMap!14569)

(assert (=> b!1073809 (= e!613523 call!45296)))

(declare-fun b!1073810 () Bool)

(declare-fun lt!476185 () Unit!35356)

(declare-fun lt!476188 () Unit!35356)

(assert (=> b!1073810 (= lt!476185 lt!476188)))

(declare-fun lt!476186 () (_ BitVec 64))

(declare-fun lt!476189 () V!39763)

(declare-fun lt!476183 () (_ BitVec 64))

(declare-fun lt!476184 () ListLongMap!14569)

(declare-fun +!3213 (ListLongMap!14569 tuple2!16600) ListLongMap!14569)

(assert (=> b!1073810 (not (contains!6330 (+!3213 lt!476184 (tuple2!16601 lt!476186 lt!476189)) lt!476183))))

(declare-fun addStillNotContains!261 (ListLongMap!14569 (_ BitVec 64) V!39763 (_ BitVec 64)) Unit!35356)

(assert (=> b!1073810 (= lt!476188 (addStillNotContains!261 lt!476184 lt!476186 lt!476189 lt!476183))))

(assert (=> b!1073810 (= lt!476183 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17215 (ValueCell!12282 V!39763) V!39763)

(declare-fun dynLambda!2040 (Int (_ BitVec 64)) V!39763)

(assert (=> b!1073810 (= lt!476189 (get!17215 (select (arr!33144 _values!955) #b00000000000000000000000000000000) (dynLambda!2040 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073810 (= lt!476186 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073810 (= lt!476184 call!45296)))

(assert (=> b!1073810 (= e!613523 (+!3213 call!45296 (tuple2!16601 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000) (get!17215 (select (arr!33144 _values!955) #b00000000000000000000000000000000) (dynLambda!2040 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073811 () Bool)

(declare-fun e!613524 () ListLongMap!14569)

(assert (=> b!1073811 (= e!613524 (ListLongMap!14570 Nil!23135))))

(declare-fun b!1073812 () Bool)

(declare-fun e!613522 () Bool)

(declare-fun e!613520 () Bool)

(assert (=> b!1073812 (= e!613522 e!613520)))

(declare-fun c!107779 () Bool)

(assert (=> b!1073812 (= c!107779 (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(declare-fun b!1073813 () Bool)

(assert (=> b!1073813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(assert (=> b!1073813 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33680 _values!955)))))

(declare-fun lt!476187 () ListLongMap!14569)

(declare-fun e!613521 () Bool)

(declare-fun apply!933 (ListLongMap!14569 (_ BitVec 64)) V!39763)

(assert (=> b!1073813 (= e!613521 (= (apply!933 lt!476187 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)) (get!17215 (select (arr!33144 _values!955) #b00000000000000000000000000000000) (dynLambda!2040 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073814 () Bool)

(declare-fun res!716132 () Bool)

(declare-fun e!613518 () Bool)

(assert (=> b!1073814 (=> (not res!716132) (not e!613518))))

(assert (=> b!1073814 (= res!716132 (not (contains!6330 lt!476187 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129445 () Bool)

(assert (=> d!129445 e!613518))

(declare-fun res!716134 () Bool)

(assert (=> d!129445 (=> (not res!716134) (not e!613518))))

(assert (=> d!129445 (= res!716134 (not (contains!6330 lt!476187 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129445 (= lt!476187 e!613524)))

(declare-fun c!107780 () Bool)

(assert (=> d!129445 (= c!107780 (bvsge #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(assert (=> d!129445 (validMask!0 mask!1515)))

(assert (=> d!129445 (= (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476187)))

(declare-fun b!1073815 () Bool)

(assert (=> b!1073815 (= e!613518 e!613522)))

(declare-fun c!107781 () Bool)

(declare-fun e!613519 () Bool)

(assert (=> b!1073815 (= c!107781 e!613519)))

(declare-fun res!716133 () Bool)

(assert (=> b!1073815 (=> (not res!716133) (not e!613519))))

(assert (=> b!1073815 (= res!716133 (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(declare-fun b!1073816 () Bool)

(assert (=> b!1073816 (= e!613524 e!613523)))

(declare-fun c!107778 () Bool)

(assert (=> b!1073816 (= c!107778 (validKeyInArray!0 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073817 () Bool)

(assert (=> b!1073817 (= e!613522 e!613521)))

(assert (=> b!1073817 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(declare-fun res!716135 () Bool)

(assert (=> b!1073817 (= res!716135 (contains!6330 lt!476187 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073817 (=> (not res!716135) (not e!613521))))

(declare-fun b!1073818 () Bool)

(assert (=> b!1073818 (= e!613519 (validKeyInArray!0 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073818 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073819 () Bool)

(declare-fun isEmpty!951 (ListLongMap!14569) Bool)

(assert (=> b!1073819 (= e!613520 (isEmpty!951 lt!476187))))

(declare-fun b!1073820 () Bool)

(assert (=> b!1073820 (= e!613520 (= lt!476187 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45293 () Bool)

(assert (=> bm!45293 (= call!45296 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(assert (= (and d!129445 c!107780) b!1073811))

(assert (= (and d!129445 (not c!107780)) b!1073816))

(assert (= (and b!1073816 c!107778) b!1073810))

(assert (= (and b!1073816 (not c!107778)) b!1073809))

(assert (= (or b!1073810 b!1073809) bm!45293))

(assert (= (and d!129445 res!716134) b!1073814))

(assert (= (and b!1073814 res!716132) b!1073815))

(assert (= (and b!1073815 res!716133) b!1073818))

(assert (= (and b!1073815 c!107781) b!1073817))

(assert (= (and b!1073815 (not c!107781)) b!1073812))

(assert (= (and b!1073817 res!716135) b!1073813))

(assert (= (and b!1073812 c!107779) b!1073820))

(assert (= (and b!1073812 (not c!107779)) b!1073819))

(declare-fun b_lambda!16741 () Bool)

(assert (=> (not b_lambda!16741) (not b!1073810)))

(declare-fun t!32481 () Bool)

(declare-fun tb!7161 () Bool)

(assert (=> (and start!94968 (= defaultEntry!963 defaultEntry!963) t!32481) tb!7161))

(declare-fun result!14791 () Bool)

(assert (=> tb!7161 (= result!14791 tp_is_empty!25971)))

(assert (=> b!1073810 t!32481))

(declare-fun b_and!35027 () Bool)

(assert (= b_and!35023 (and (=> t!32481 result!14791) b_and!35027)))

(declare-fun b_lambda!16743 () Bool)

(assert (=> (not b_lambda!16743) (not b!1073813)))

(assert (=> b!1073813 t!32481))

(declare-fun b_and!35029 () Bool)

(assert (= b_and!35027 (and (=> t!32481 result!14791) b_and!35029)))

(assert (=> b!1073816 m!992689))

(assert (=> b!1073816 m!992689))

(assert (=> b!1073816 m!992693))

(declare-fun m!992707 () Bool)

(assert (=> b!1073813 m!992707))

(declare-fun m!992709 () Bool)

(assert (=> b!1073813 m!992709))

(declare-fun m!992711 () Bool)

(assert (=> b!1073813 m!992711))

(assert (=> b!1073813 m!992689))

(declare-fun m!992713 () Bool)

(assert (=> b!1073813 m!992713))

(assert (=> b!1073813 m!992707))

(assert (=> b!1073813 m!992689))

(assert (=> b!1073813 m!992709))

(declare-fun m!992715 () Bool)

(assert (=> b!1073820 m!992715))

(declare-fun m!992717 () Bool)

(assert (=> b!1073819 m!992717))

(declare-fun m!992719 () Bool)

(assert (=> d!129445 m!992719))

(assert (=> d!129445 m!992651))

(assert (=> b!1073817 m!992689))

(assert (=> b!1073817 m!992689))

(declare-fun m!992721 () Bool)

(assert (=> b!1073817 m!992721))

(declare-fun m!992723 () Bool)

(assert (=> b!1073814 m!992723))

(assert (=> b!1073818 m!992689))

(assert (=> b!1073818 m!992689))

(assert (=> b!1073818 m!992693))

(declare-fun m!992725 () Bool)

(assert (=> b!1073810 m!992725))

(assert (=> b!1073810 m!992707))

(assert (=> b!1073810 m!992709))

(assert (=> b!1073810 m!992711))

(assert (=> b!1073810 m!992689))

(assert (=> b!1073810 m!992709))

(declare-fun m!992727 () Bool)

(assert (=> b!1073810 m!992727))

(assert (=> b!1073810 m!992707))

(declare-fun m!992729 () Bool)

(assert (=> b!1073810 m!992729))

(assert (=> b!1073810 m!992729))

(declare-fun m!992731 () Bool)

(assert (=> b!1073810 m!992731))

(assert (=> bm!45293 m!992715))

(assert (=> b!1073728 d!129445))

(declare-fun b!1073823 () Bool)

(declare-fun e!613530 () ListLongMap!14569)

(declare-fun call!45297 () ListLongMap!14569)

(assert (=> b!1073823 (= e!613530 call!45297)))

(declare-fun b!1073824 () Bool)

(declare-fun lt!476192 () Unit!35356)

(declare-fun lt!476195 () Unit!35356)

(assert (=> b!1073824 (= lt!476192 lt!476195)))

(declare-fun lt!476193 () (_ BitVec 64))

(declare-fun lt!476191 () ListLongMap!14569)

(declare-fun lt!476196 () V!39763)

(declare-fun lt!476190 () (_ BitVec 64))

(assert (=> b!1073824 (not (contains!6330 (+!3213 lt!476191 (tuple2!16601 lt!476193 lt!476196)) lt!476190))))

(assert (=> b!1073824 (= lt!476195 (addStillNotContains!261 lt!476191 lt!476193 lt!476196 lt!476190))))

(assert (=> b!1073824 (= lt!476190 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1073824 (= lt!476196 (get!17215 (select (arr!33144 _values!955) #b00000000000000000000000000000000) (dynLambda!2040 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073824 (= lt!476193 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073824 (= lt!476191 call!45297)))

(assert (=> b!1073824 (= e!613530 (+!3213 call!45297 (tuple2!16601 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000) (get!17215 (select (arr!33144 _values!955) #b00000000000000000000000000000000) (dynLambda!2040 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073825 () Bool)

(declare-fun e!613531 () ListLongMap!14569)

(assert (=> b!1073825 (= e!613531 (ListLongMap!14570 Nil!23135))))

(declare-fun b!1073826 () Bool)

(declare-fun e!613529 () Bool)

(declare-fun e!613527 () Bool)

(assert (=> b!1073826 (= e!613529 e!613527)))

(declare-fun c!107783 () Bool)

(assert (=> b!1073826 (= c!107783 (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(declare-fun b!1073827 () Bool)

(assert (=> b!1073827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(assert (=> b!1073827 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33680 _values!955)))))

(declare-fun lt!476194 () ListLongMap!14569)

(declare-fun e!613528 () Bool)

(assert (=> b!1073827 (= e!613528 (= (apply!933 lt!476194 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)) (get!17215 (select (arr!33144 _values!955) #b00000000000000000000000000000000) (dynLambda!2040 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073828 () Bool)

(declare-fun res!716136 () Bool)

(declare-fun e!613525 () Bool)

(assert (=> b!1073828 (=> (not res!716136) (not e!613525))))

(assert (=> b!1073828 (= res!716136 (not (contains!6330 lt!476194 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129447 () Bool)

(assert (=> d!129447 e!613525))

(declare-fun res!716138 () Bool)

(assert (=> d!129447 (=> (not res!716138) (not e!613525))))

(assert (=> d!129447 (= res!716138 (not (contains!6330 lt!476194 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129447 (= lt!476194 e!613531)))

(declare-fun c!107784 () Bool)

(assert (=> d!129447 (= c!107784 (bvsge #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(assert (=> d!129447 (validMask!0 mask!1515)))

(assert (=> d!129447 (= (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476194)))

(declare-fun b!1073829 () Bool)

(assert (=> b!1073829 (= e!613525 e!613529)))

(declare-fun c!107785 () Bool)

(declare-fun e!613526 () Bool)

(assert (=> b!1073829 (= c!107785 e!613526)))

(declare-fun res!716137 () Bool)

(assert (=> b!1073829 (=> (not res!716137) (not e!613526))))

(assert (=> b!1073829 (= res!716137 (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(declare-fun b!1073830 () Bool)

(assert (=> b!1073830 (= e!613531 e!613530)))

(declare-fun c!107782 () Bool)

(assert (=> b!1073830 (= c!107782 (validKeyInArray!0 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073831 () Bool)

(assert (=> b!1073831 (= e!613529 e!613528)))

(assert (=> b!1073831 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(declare-fun res!716139 () Bool)

(assert (=> b!1073831 (= res!716139 (contains!6330 lt!476194 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073831 (=> (not res!716139) (not e!613528))))

(declare-fun b!1073832 () Bool)

(assert (=> b!1073832 (= e!613526 (validKeyInArray!0 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073832 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073833 () Bool)

(assert (=> b!1073833 (= e!613527 (isEmpty!951 lt!476194))))

(declare-fun b!1073834 () Bool)

(assert (=> b!1073834 (= e!613527 (= lt!476194 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun bm!45294 () Bool)

(assert (=> bm!45294 (= call!45297 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(assert (= (and d!129447 c!107784) b!1073825))

(assert (= (and d!129447 (not c!107784)) b!1073830))

(assert (= (and b!1073830 c!107782) b!1073824))

(assert (= (and b!1073830 (not c!107782)) b!1073823))

(assert (= (or b!1073824 b!1073823) bm!45294))

(assert (= (and d!129447 res!716138) b!1073828))

(assert (= (and b!1073828 res!716136) b!1073829))

(assert (= (and b!1073829 res!716137) b!1073832))

(assert (= (and b!1073829 c!107785) b!1073831))

(assert (= (and b!1073829 (not c!107785)) b!1073826))

(assert (= (and b!1073831 res!716139) b!1073827))

(assert (= (and b!1073826 c!107783) b!1073834))

(assert (= (and b!1073826 (not c!107783)) b!1073833))

(declare-fun b_lambda!16745 () Bool)

(assert (=> (not b_lambda!16745) (not b!1073824)))

(assert (=> b!1073824 t!32481))

(declare-fun b_and!35031 () Bool)

(assert (= b_and!35029 (and (=> t!32481 result!14791) b_and!35031)))

(declare-fun b_lambda!16747 () Bool)

(assert (=> (not b_lambda!16747) (not b!1073827)))

(assert (=> b!1073827 t!32481))

(declare-fun b_and!35033 () Bool)

(assert (= b_and!35031 (and (=> t!32481 result!14791) b_and!35033)))

(assert (=> b!1073830 m!992689))

(assert (=> b!1073830 m!992689))

(assert (=> b!1073830 m!992693))

(assert (=> b!1073827 m!992707))

(assert (=> b!1073827 m!992709))

(assert (=> b!1073827 m!992711))

(assert (=> b!1073827 m!992689))

(declare-fun m!992733 () Bool)

(assert (=> b!1073827 m!992733))

(assert (=> b!1073827 m!992707))

(assert (=> b!1073827 m!992689))

(assert (=> b!1073827 m!992709))

(declare-fun m!992735 () Bool)

(assert (=> b!1073834 m!992735))

(declare-fun m!992737 () Bool)

(assert (=> b!1073833 m!992737))

(declare-fun m!992739 () Bool)

(assert (=> d!129447 m!992739))

(assert (=> d!129447 m!992651))

(assert (=> b!1073831 m!992689))

(assert (=> b!1073831 m!992689))

(declare-fun m!992741 () Bool)

(assert (=> b!1073831 m!992741))

(declare-fun m!992743 () Bool)

(assert (=> b!1073828 m!992743))

(assert (=> b!1073832 m!992689))

(assert (=> b!1073832 m!992689))

(assert (=> b!1073832 m!992693))

(declare-fun m!992745 () Bool)

(assert (=> b!1073824 m!992745))

(assert (=> b!1073824 m!992707))

(assert (=> b!1073824 m!992709))

(assert (=> b!1073824 m!992711))

(assert (=> b!1073824 m!992689))

(assert (=> b!1073824 m!992709))

(declare-fun m!992747 () Bool)

(assert (=> b!1073824 m!992747))

(assert (=> b!1073824 m!992707))

(declare-fun m!992749 () Bool)

(assert (=> b!1073824 m!992749))

(assert (=> b!1073824 m!992749))

(declare-fun m!992751 () Bool)

(assert (=> b!1073824 m!992751))

(assert (=> bm!45294 m!992735))

(assert (=> b!1073728 d!129447))

(declare-fun d!129449 () Bool)

(declare-fun e!613537 () Bool)

(assert (=> d!129449 e!613537))

(declare-fun res!716142 () Bool)

(assert (=> d!129449 (=> res!716142 e!613537)))

(declare-fun lt!476206 () Bool)

(assert (=> d!129449 (= res!716142 (not lt!476206))))

(declare-fun lt!476208 () Bool)

(assert (=> d!129449 (= lt!476206 lt!476208)))

(declare-fun lt!476205 () Unit!35356)

(declare-fun e!613536 () Unit!35356)

(assert (=> d!129449 (= lt!476205 e!613536)))

(declare-fun c!107788 () Bool)

(assert (=> d!129449 (= c!107788 lt!476208)))

(declare-fun containsKey!576 (List!23138 (_ BitVec 64)) Bool)

(assert (=> d!129449 (= lt!476208 (containsKey!576 (toList!7300 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129449 (= (contains!6330 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) #b0000000000000000000000000000000000000000000000000000000000000000) lt!476206)))

(declare-fun b!1073841 () Bool)

(declare-fun lt!476207 () Unit!35356)

(assert (=> b!1073841 (= e!613536 lt!476207)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!409 (List!23138 (_ BitVec 64)) Unit!35356)

(assert (=> b!1073841 (= lt!476207 (lemmaContainsKeyImpliesGetValueByKeyDefined!409 (toList!7300 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!656 0))(
  ( (Some!655 (v!15656 V!39763)) (None!654) )
))
(declare-fun isDefined!448 (Option!656) Bool)

(declare-fun getValueByKey!605 (List!23138 (_ BitVec 64)) Option!656)

(assert (=> b!1073841 (isDefined!448 (getValueByKey!605 (toList!7300 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073842 () Bool)

(declare-fun Unit!35360 () Unit!35356)

(assert (=> b!1073842 (= e!613536 Unit!35360)))

(declare-fun b!1073843 () Bool)

(assert (=> b!1073843 (= e!613537 (isDefined!448 (getValueByKey!605 (toList!7300 (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129449 c!107788) b!1073841))

(assert (= (and d!129449 (not c!107788)) b!1073842))

(assert (= (and d!129449 (not res!716142)) b!1073843))

(declare-fun m!992753 () Bool)

(assert (=> d!129449 m!992753))

(declare-fun m!992755 () Bool)

(assert (=> b!1073841 m!992755))

(declare-fun m!992757 () Bool)

(assert (=> b!1073841 m!992757))

(assert (=> b!1073841 m!992757))

(declare-fun m!992759 () Bool)

(assert (=> b!1073841 m!992759))

(assert (=> b!1073843 m!992757))

(assert (=> b!1073843 m!992757))

(assert (=> b!1073843 m!992759))

(assert (=> b!1073727 d!129449))

(declare-fun bm!45309 () Bool)

(declare-fun call!45314 () Bool)

(declare-fun lt!476267 () ListLongMap!14569)

(assert (=> bm!45309 (= call!45314 (contains!6330 lt!476267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073886 () Bool)

(declare-fun e!613573 () Bool)

(assert (=> b!1073886 (= e!613573 (= (apply!933 lt!476267 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1073887 () Bool)

(declare-fun e!613575 () ListLongMap!14569)

(declare-fun call!45313 () ListLongMap!14569)

(assert (=> b!1073887 (= e!613575 call!45313)))

(declare-fun b!1073888 () Bool)

(declare-fun e!613567 () Bool)

(assert (=> b!1073888 (= e!613567 e!613573)))

(declare-fun res!716167 () Bool)

(declare-fun call!45312 () Bool)

(assert (=> b!1073888 (= res!716167 call!45312)))

(assert (=> b!1073888 (=> (not res!716167) (not e!613573))))

(declare-fun d!129451 () Bool)

(declare-fun e!613570 () Bool)

(assert (=> d!129451 e!613570))

(declare-fun res!716161 () Bool)

(assert (=> d!129451 (=> (not res!716161) (not e!613570))))

(assert (=> d!129451 (= res!716161 (or (bvsge #b00000000000000000000000000000000 (size!33681 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))))

(declare-fun lt!476256 () ListLongMap!14569)

(assert (=> d!129451 (= lt!476267 lt!476256)))

(declare-fun lt!476260 () Unit!35356)

(declare-fun e!613565 () Unit!35356)

(assert (=> d!129451 (= lt!476260 e!613565)))

(declare-fun c!107806 () Bool)

(declare-fun e!613569 () Bool)

(assert (=> d!129451 (= c!107806 e!613569)))

(declare-fun res!716162 () Bool)

(assert (=> d!129451 (=> (not res!716162) (not e!613569))))

(assert (=> d!129451 (= res!716162 (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(declare-fun e!613576 () ListLongMap!14569)

(assert (=> d!129451 (= lt!476256 e!613576)))

(declare-fun c!107803 () Bool)

(assert (=> d!129451 (= c!107803 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129451 (validMask!0 mask!1515)))

(assert (=> d!129451 (= (getCurrentListMap!4172 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476267)))

(declare-fun b!1073889 () Bool)

(declare-fun e!613572 () Bool)

(assert (=> b!1073889 (= e!613572 (not call!45314))))

(declare-fun b!1073890 () Bool)

(declare-fun call!45318 () ListLongMap!14569)

(assert (=> b!1073890 (= e!613576 (+!3213 call!45318 (tuple2!16601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1073891 () Bool)

(declare-fun Unit!35361 () Unit!35356)

(assert (=> b!1073891 (= e!613565 Unit!35361)))

(declare-fun b!1073892 () Bool)

(declare-fun res!716166 () Bool)

(assert (=> b!1073892 (=> (not res!716166) (not e!613570))))

(assert (=> b!1073892 (= res!716166 e!613572)))

(declare-fun c!107805 () Bool)

(assert (=> b!1073892 (= c!107805 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073893 () Bool)

(declare-fun e!613571 () Bool)

(assert (=> b!1073893 (= e!613572 e!613571)))

(declare-fun res!716169 () Bool)

(assert (=> b!1073893 (= res!716169 call!45314)))

(assert (=> b!1073893 (=> (not res!716169) (not e!613571))))

(declare-fun b!1073894 () Bool)

(declare-fun lt!476270 () Unit!35356)

(assert (=> b!1073894 (= e!613565 lt!476270)))

(declare-fun lt!476268 () ListLongMap!14569)

(assert (=> b!1073894 (= lt!476268 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476262 () (_ BitVec 64))

(assert (=> b!1073894 (= lt!476262 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476257 () (_ BitVec 64))

(assert (=> b!1073894 (= lt!476257 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476255 () Unit!35356)

(declare-fun addStillContains!646 (ListLongMap!14569 (_ BitVec 64) V!39763 (_ BitVec 64)) Unit!35356)

(assert (=> b!1073894 (= lt!476255 (addStillContains!646 lt!476268 lt!476262 zeroValueBefore!47 lt!476257))))

(assert (=> b!1073894 (contains!6330 (+!3213 lt!476268 (tuple2!16601 lt!476262 zeroValueBefore!47)) lt!476257)))

(declare-fun lt!476274 () Unit!35356)

(assert (=> b!1073894 (= lt!476274 lt!476255)))

(declare-fun lt!476272 () ListLongMap!14569)

(assert (=> b!1073894 (= lt!476272 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476273 () (_ BitVec 64))

(assert (=> b!1073894 (= lt!476273 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476261 () (_ BitVec 64))

(assert (=> b!1073894 (= lt!476261 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476253 () Unit!35356)

(declare-fun addApplyDifferent!506 (ListLongMap!14569 (_ BitVec 64) V!39763 (_ BitVec 64)) Unit!35356)

(assert (=> b!1073894 (= lt!476253 (addApplyDifferent!506 lt!476272 lt!476273 minValue!907 lt!476261))))

(assert (=> b!1073894 (= (apply!933 (+!3213 lt!476272 (tuple2!16601 lt!476273 minValue!907)) lt!476261) (apply!933 lt!476272 lt!476261))))

(declare-fun lt!476259 () Unit!35356)

(assert (=> b!1073894 (= lt!476259 lt!476253)))

(declare-fun lt!476264 () ListLongMap!14569)

(assert (=> b!1073894 (= lt!476264 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476266 () (_ BitVec 64))

(assert (=> b!1073894 (= lt!476266 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476271 () (_ BitVec 64))

(assert (=> b!1073894 (= lt!476271 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476269 () Unit!35356)

(assert (=> b!1073894 (= lt!476269 (addApplyDifferent!506 lt!476264 lt!476266 zeroValueBefore!47 lt!476271))))

(assert (=> b!1073894 (= (apply!933 (+!3213 lt!476264 (tuple2!16601 lt!476266 zeroValueBefore!47)) lt!476271) (apply!933 lt!476264 lt!476271))))

(declare-fun lt!476258 () Unit!35356)

(assert (=> b!1073894 (= lt!476258 lt!476269)))

(declare-fun lt!476265 () ListLongMap!14569)

(assert (=> b!1073894 (= lt!476265 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476254 () (_ BitVec 64))

(assert (=> b!1073894 (= lt!476254 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476263 () (_ BitVec 64))

(assert (=> b!1073894 (= lt!476263 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073894 (= lt!476270 (addApplyDifferent!506 lt!476265 lt!476254 minValue!907 lt!476263))))

(assert (=> b!1073894 (= (apply!933 (+!3213 lt!476265 (tuple2!16601 lt!476254 minValue!907)) lt!476263) (apply!933 lt!476265 lt!476263))))

(declare-fun bm!45310 () Bool)

(assert (=> bm!45310 (= call!45312 (contains!6330 lt!476267 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073895 () Bool)

(declare-fun e!613564 () ListLongMap!14569)

(declare-fun call!45316 () ListLongMap!14569)

(assert (=> b!1073895 (= e!613564 call!45316)))

(declare-fun b!1073896 () Bool)

(declare-fun e!613568 () Bool)

(declare-fun e!613574 () Bool)

(assert (=> b!1073896 (= e!613568 e!613574)))

(declare-fun res!716164 () Bool)

(assert (=> b!1073896 (=> (not res!716164) (not e!613574))))

(assert (=> b!1073896 (= res!716164 (contains!6330 lt!476267 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(declare-fun b!1073897 () Bool)

(assert (=> b!1073897 (= e!613564 call!45313)))

(declare-fun b!1073898 () Bool)

(assert (=> b!1073898 (= e!613569 (validKeyInArray!0 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45311 () Bool)

(declare-fun call!45315 () ListLongMap!14569)

(assert (=> bm!45311 (= call!45316 call!45315)))

(declare-fun bm!45312 () Bool)

(assert (=> bm!45312 (= call!45313 call!45318)))

(declare-fun bm!45313 () Bool)

(declare-fun call!45317 () ListLongMap!14569)

(assert (=> bm!45313 (= call!45315 call!45317)))

(declare-fun c!107802 () Bool)

(declare-fun bm!45314 () Bool)

(assert (=> bm!45314 (= call!45318 (+!3213 (ite c!107803 call!45317 (ite c!107802 call!45315 call!45316)) (ite (or c!107803 c!107802) (tuple2!16601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1073899 () Bool)

(assert (=> b!1073899 (= e!613570 e!613567)))

(declare-fun c!107804 () Bool)

(assert (=> b!1073899 (= c!107804 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1073900 () Bool)

(assert (=> b!1073900 (= e!613576 e!613575)))

(assert (=> b!1073900 (= c!107802 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45315 () Bool)

(assert (=> bm!45315 (= call!45317 (getCurrentListMapNoExtraKeys!3864 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073901 () Bool)

(declare-fun e!613566 () Bool)

(assert (=> b!1073901 (= e!613566 (validKeyInArray!0 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073902 () Bool)

(assert (=> b!1073902 (= e!613571 (= (apply!933 lt!476267 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1073903 () Bool)

(declare-fun c!107801 () Bool)

(assert (=> b!1073903 (= c!107801 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1073903 (= e!613575 e!613564)))

(declare-fun b!1073904 () Bool)

(declare-fun res!716163 () Bool)

(assert (=> b!1073904 (=> (not res!716163) (not e!613570))))

(assert (=> b!1073904 (= res!716163 e!613568)))

(declare-fun res!716168 () Bool)

(assert (=> b!1073904 (=> res!716168 e!613568)))

(assert (=> b!1073904 (= res!716168 (not e!613566))))

(declare-fun res!716165 () Bool)

(assert (=> b!1073904 (=> (not res!716165) (not e!613566))))

(assert (=> b!1073904 (= res!716165 (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(declare-fun b!1073905 () Bool)

(assert (=> b!1073905 (= e!613567 (not call!45312))))

(declare-fun b!1073906 () Bool)

(assert (=> b!1073906 (= e!613574 (= (apply!933 lt!476267 (select (arr!33145 _keys!1163) #b00000000000000000000000000000000)) (get!17215 (select (arr!33144 _values!955) #b00000000000000000000000000000000) (dynLambda!2040 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1073906 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33680 _values!955)))))

(assert (=> b!1073906 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33681 _keys!1163)))))

(assert (= (and d!129451 c!107803) b!1073890))

(assert (= (and d!129451 (not c!107803)) b!1073900))

(assert (= (and b!1073900 c!107802) b!1073887))

(assert (= (and b!1073900 (not c!107802)) b!1073903))

(assert (= (and b!1073903 c!107801) b!1073897))

(assert (= (and b!1073903 (not c!107801)) b!1073895))

(assert (= (or b!1073897 b!1073895) bm!45311))

(assert (= (or b!1073887 bm!45311) bm!45313))

(assert (= (or b!1073887 b!1073897) bm!45312))

(assert (= (or b!1073890 bm!45313) bm!45315))

(assert (= (or b!1073890 bm!45312) bm!45314))

(assert (= (and d!129451 res!716162) b!1073898))

(assert (= (and d!129451 c!107806) b!1073894))

(assert (= (and d!129451 (not c!107806)) b!1073891))

(assert (= (and d!129451 res!716161) b!1073904))

(assert (= (and b!1073904 res!716165) b!1073901))

(assert (= (and b!1073904 (not res!716168)) b!1073896))

(assert (= (and b!1073896 res!716164) b!1073906))

(assert (= (and b!1073904 res!716163) b!1073892))

(assert (= (and b!1073892 c!107805) b!1073893))

(assert (= (and b!1073892 (not c!107805)) b!1073889))

(assert (= (and b!1073893 res!716169) b!1073902))

(assert (= (or b!1073893 b!1073889) bm!45309))

(assert (= (and b!1073892 res!716166) b!1073899))

(assert (= (and b!1073899 c!107804) b!1073888))

(assert (= (and b!1073899 (not c!107804)) b!1073905))

(assert (= (and b!1073888 res!716167) b!1073886))

(assert (= (or b!1073888 b!1073905) bm!45310))

(declare-fun b_lambda!16749 () Bool)

(assert (=> (not b_lambda!16749) (not b!1073906)))

(assert (=> b!1073906 t!32481))

(declare-fun b_and!35035 () Bool)

(assert (= b_and!35033 (and (=> t!32481 result!14791) b_and!35035)))

(assert (=> b!1073901 m!992689))

(assert (=> b!1073901 m!992689))

(assert (=> b!1073901 m!992693))

(declare-fun m!992761 () Bool)

(assert (=> bm!45310 m!992761))

(declare-fun m!992763 () Bool)

(assert (=> b!1073886 m!992763))

(assert (=> b!1073898 m!992689))

(assert (=> b!1073898 m!992689))

(assert (=> b!1073898 m!992693))

(declare-fun m!992765 () Bool)

(assert (=> b!1073890 m!992765))

(assert (=> b!1073906 m!992709))

(assert (=> b!1073906 m!992689))

(assert (=> b!1073906 m!992689))

(declare-fun m!992767 () Bool)

(assert (=> b!1073906 m!992767))

(assert (=> b!1073906 m!992707))

(assert (=> b!1073906 m!992707))

(assert (=> b!1073906 m!992709))

(assert (=> b!1073906 m!992711))

(assert (=> d!129451 m!992651))

(assert (=> bm!45315 m!992665))

(declare-fun m!992769 () Bool)

(assert (=> bm!45309 m!992769))

(declare-fun m!992771 () Bool)

(assert (=> b!1073902 m!992771))

(assert (=> b!1073896 m!992689))

(assert (=> b!1073896 m!992689))

(declare-fun m!992773 () Bool)

(assert (=> b!1073896 m!992773))

(declare-fun m!992775 () Bool)

(assert (=> bm!45314 m!992775))

(declare-fun m!992777 () Bool)

(assert (=> b!1073894 m!992777))

(declare-fun m!992779 () Bool)

(assert (=> b!1073894 m!992779))

(declare-fun m!992781 () Bool)

(assert (=> b!1073894 m!992781))

(assert (=> b!1073894 m!992779))

(declare-fun m!992783 () Bool)

(assert (=> b!1073894 m!992783))

(assert (=> b!1073894 m!992665))

(declare-fun m!992785 () Bool)

(assert (=> b!1073894 m!992785))

(declare-fun m!992787 () Bool)

(assert (=> b!1073894 m!992787))

(declare-fun m!992789 () Bool)

(assert (=> b!1073894 m!992789))

(declare-fun m!992791 () Bool)

(assert (=> b!1073894 m!992791))

(declare-fun m!992793 () Bool)

(assert (=> b!1073894 m!992793))

(assert (=> b!1073894 m!992789))

(assert (=> b!1073894 m!992781))

(declare-fun m!992795 () Bool)

(assert (=> b!1073894 m!992795))

(declare-fun m!992797 () Bool)

(assert (=> b!1073894 m!992797))

(declare-fun m!992799 () Bool)

(assert (=> b!1073894 m!992799))

(assert (=> b!1073894 m!992689))

(assert (=> b!1073894 m!992785))

(declare-fun m!992801 () Bool)

(assert (=> b!1073894 m!992801))

(declare-fun m!992803 () Bool)

(assert (=> b!1073894 m!992803))

(declare-fun m!992805 () Bool)

(assert (=> b!1073894 m!992805))

(assert (=> b!1073727 d!129451))

(declare-fun d!129453 () Bool)

(assert (=> d!129453 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94968 d!129453))

(declare-fun d!129455 () Bool)

(assert (=> d!129455 (= (array_inv!25616 _values!955) (bvsge (size!33680 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94968 d!129455))

(declare-fun d!129457 () Bool)

(assert (=> d!129457 (= (array_inv!25617 _keys!1163) (bvsge (size!33681 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94968 d!129457))

(declare-fun mapNonEmpty!40678 () Bool)

(declare-fun mapRes!40678 () Bool)

(declare-fun tp!77960 () Bool)

(declare-fun e!613582 () Bool)

(assert (=> mapNonEmpty!40678 (= mapRes!40678 (and tp!77960 e!613582))))

(declare-fun mapKey!40678 () (_ BitVec 32))

(declare-fun mapRest!40678 () (Array (_ BitVec 32) ValueCell!12282))

(declare-fun mapValue!40678 () ValueCell!12282)

(assert (=> mapNonEmpty!40678 (= mapRest!40672 (store mapRest!40678 mapKey!40678 mapValue!40678))))

(declare-fun b!1073914 () Bool)

(declare-fun e!613581 () Bool)

(assert (=> b!1073914 (= e!613581 tp_is_empty!25971)))

(declare-fun b!1073913 () Bool)

(assert (=> b!1073913 (= e!613582 tp_is_empty!25971)))

(declare-fun mapIsEmpty!40678 () Bool)

(assert (=> mapIsEmpty!40678 mapRes!40678))

(declare-fun condMapEmpty!40678 () Bool)

(declare-fun mapDefault!40678 () ValueCell!12282)

(assert (=> mapNonEmpty!40672 (= condMapEmpty!40678 (= mapRest!40672 ((as const (Array (_ BitVec 32) ValueCell!12282)) mapDefault!40678)))))

(assert (=> mapNonEmpty!40672 (= tp!77951 (and e!613581 mapRes!40678))))

(assert (= (and mapNonEmpty!40672 condMapEmpty!40678) mapIsEmpty!40678))

(assert (= (and mapNonEmpty!40672 (not condMapEmpty!40678)) mapNonEmpty!40678))

(assert (= (and mapNonEmpty!40678 ((_ is ValueCellFull!12282) mapValue!40678)) b!1073913))

(assert (= (and mapNonEmpty!40672 ((_ is ValueCellFull!12282) mapDefault!40678)) b!1073914))

(declare-fun m!992807 () Bool)

(assert (=> mapNonEmpty!40678 m!992807))

(declare-fun b_lambda!16751 () Bool)

(assert (= b_lambda!16749 (or (and start!94968 b_free!22161) b_lambda!16751)))

(declare-fun b_lambda!16753 () Bool)

(assert (= b_lambda!16747 (or (and start!94968 b_free!22161) b_lambda!16753)))

(declare-fun b_lambda!16755 () Bool)

(assert (= b_lambda!16745 (or (and start!94968 b_free!22161) b_lambda!16755)))

(declare-fun b_lambda!16757 () Bool)

(assert (= b_lambda!16743 (or (and start!94968 b_free!22161) b_lambda!16757)))

(declare-fun b_lambda!16759 () Bool)

(assert (= b_lambda!16741 (or (and start!94968 b_free!22161) b_lambda!16759)))

(check-sat (not b!1073830) (not b!1073834) (not b_lambda!16751) (not b!1073817) (not mapNonEmpty!40678) (not d!129451) (not b!1073819) (not b!1073781) (not b!1073784) (not d!129447) (not b!1073771) (not bm!45310) (not b!1073894) (not bm!45315) (not b_lambda!16753) (not b!1073832) (not bm!45314) (not bm!45287) (not b!1073906) (not bm!45294) (not b_lambda!16757) (not b!1073818) (not bm!45290) (not b!1073831) (not b_lambda!16755) (not d!129449) (not bm!45293) tp_is_empty!25971 (not d!129443) (not b_next!22161) (not b!1073896) (not b_lambda!16759) (not b!1073841) (not b!1073816) (not b!1073901) (not b!1073843) (not b!1073828) b_and!35035 (not b!1073890) (not b!1073814) (not bm!45309) (not b!1073833) (not b!1073810) (not b!1073820) (not b!1073898) (not b!1073770) (not d!129445) (not b!1073813) (not b!1073902) (not b!1073827) (not b!1073886) (not b!1073824) (not b!1073772))
(check-sat b_and!35035 (not b_next!22161))
