; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93980 () Bool)

(assert start!93980)

(declare-fun b_free!21229 () Bool)

(declare-fun b_next!21229 () Bool)

(assert (=> start!93980 (= b_free!21229 (not b_next!21229))))

(declare-fun tp!75106 () Bool)

(declare-fun b_and!33949 () Bool)

(assert (=> start!93980 (= tp!75106 b_and!33949)))

(declare-fun mapNonEmpty!39226 () Bool)

(declare-fun mapRes!39226 () Bool)

(declare-fun tp!75107 () Bool)

(declare-fun e!604560 () Bool)

(assert (=> mapNonEmpty!39226 (= mapRes!39226 (and tp!75107 e!604560))))

(declare-datatypes ((V!38521 0))(
  ( (V!38522 (val!12570 Int)) )
))
(declare-datatypes ((ValueCell!11816 0))(
  ( (ValueCellFull!11816 (v!15176 V!38521)) (EmptyCell!11816) )
))
(declare-fun mapRest!39226 () (Array (_ BitVec 32) ValueCell!11816))

(declare-fun mapKey!39226 () (_ BitVec 32))

(declare-fun mapValue!39226 () ValueCell!11816)

(declare-datatypes ((array!67143 0))(
  ( (array!67144 (arr!32274 (Array (_ BitVec 32) ValueCell!11816)) (size!32811 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67143)

(assert (=> mapNonEmpty!39226 (= (arr!32274 _values!955) (store mapRest!39226 mapKey!39226 mapValue!39226))))

(declare-fun b!1061720 () Bool)

(declare-fun e!604559 () Bool)

(declare-fun tp_is_empty!25039 () Bool)

(assert (=> b!1061720 (= e!604559 tp_is_empty!25039)))

(declare-fun b!1061721 () Bool)

(declare-fun e!604557 () Bool)

(assert (=> b!1061721 (= e!604557 (and e!604559 mapRes!39226))))

(declare-fun condMapEmpty!39226 () Bool)

(declare-fun mapDefault!39226 () ValueCell!11816)

(assert (=> b!1061721 (= condMapEmpty!39226 (= (arr!32274 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11816)) mapDefault!39226)))))

(declare-fun b!1061722 () Bool)

(assert (=> b!1061722 (= e!604560 tp_is_empty!25039)))

(declare-fun b!1061723 () Bool)

(declare-fun e!604558 () Bool)

(declare-datatypes ((array!67145 0))(
  ( (array!67146 (arr!32275 (Array (_ BitVec 32) (_ BitVec 64))) (size!32812 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67145)

(assert (=> b!1061723 (= e!604558 (bvsgt #b00000000000000000000000000000000 (size!32812 _keys!1163)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38521)

(declare-datatypes ((tuple2!15878 0))(
  ( (tuple2!15879 (_1!7950 (_ BitVec 64)) (_2!7950 V!38521)) )
))
(declare-datatypes ((List!22463 0))(
  ( (Nil!22460) (Cons!22459 (h!23677 tuple2!15878) (t!31762 List!22463)) )
))
(declare-datatypes ((ListLongMap!13855 0))(
  ( (ListLongMap!13856 (toList!6943 List!22463)) )
))
(declare-fun lt!467778 () ListLongMap!13855)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38521)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3591 (array!67145 array!67143 (_ BitVec 32) (_ BitVec 32) V!38521 V!38521 (_ BitVec 32) Int) ListLongMap!13855)

(assert (=> b!1061723 (= lt!467778 (getCurrentListMapNoExtraKeys!3591 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061724 () Bool)

(declare-fun res!708760 () Bool)

(assert (=> b!1061724 (=> (not res!708760) (not e!604558))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1061724 (= res!708760 (and (= (size!32811 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32812 _keys!1163) (size!32811 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39226 () Bool)

(assert (=> mapIsEmpty!39226 mapRes!39226))

(declare-fun res!708762 () Bool)

(assert (=> start!93980 (=> (not res!708762) (not e!604558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93980 (= res!708762 (validMask!0 mask!1515))))

(assert (=> start!93980 e!604558))

(assert (=> start!93980 true))

(assert (=> start!93980 tp_is_empty!25039))

(declare-fun array_inv!25028 (array!67143) Bool)

(assert (=> start!93980 (and (array_inv!25028 _values!955) e!604557)))

(assert (=> start!93980 tp!75106))

(declare-fun array_inv!25029 (array!67145) Bool)

(assert (=> start!93980 (array_inv!25029 _keys!1163)))

(declare-fun b!1061725 () Bool)

(declare-fun res!708761 () Bool)

(assert (=> b!1061725 (=> (not res!708761) (not e!604558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67145 (_ BitVec 32)) Bool)

(assert (=> b!1061725 (= res!708761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061726 () Bool)

(declare-fun res!708763 () Bool)

(assert (=> b!1061726 (=> (not res!708763) (not e!604558))))

(declare-datatypes ((List!22464 0))(
  ( (Nil!22461) (Cons!22460 (h!23678 (_ BitVec 64)) (t!31763 List!22464)) )
))
(declare-fun arrayNoDuplicates!0 (array!67145 (_ BitVec 32) List!22464) Bool)

(assert (=> b!1061726 (= res!708763 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22461))))

(assert (= (and start!93980 res!708762) b!1061724))

(assert (= (and b!1061724 res!708760) b!1061725))

(assert (= (and b!1061725 res!708761) b!1061726))

(assert (= (and b!1061726 res!708763) b!1061723))

(assert (= (and b!1061721 condMapEmpty!39226) mapIsEmpty!39226))

(assert (= (and b!1061721 (not condMapEmpty!39226)) mapNonEmpty!39226))

(get-info :version)

(assert (= (and mapNonEmpty!39226 ((_ is ValueCellFull!11816) mapValue!39226)) b!1061722))

(assert (= (and b!1061721 ((_ is ValueCellFull!11816) mapDefault!39226)) b!1061720))

(assert (= start!93980 b!1061721))

(declare-fun m!981161 () Bool)

(assert (=> b!1061723 m!981161))

(declare-fun m!981163 () Bool)

(assert (=> b!1061726 m!981163))

(declare-fun m!981165 () Bool)

(assert (=> b!1061725 m!981165))

(declare-fun m!981167 () Bool)

(assert (=> mapNonEmpty!39226 m!981167))

(declare-fun m!981169 () Bool)

(assert (=> start!93980 m!981169))

(declare-fun m!981171 () Bool)

(assert (=> start!93980 m!981171))

(declare-fun m!981173 () Bool)

(assert (=> start!93980 m!981173))

(check-sat (not b!1061723) (not start!93980) (not b!1061725) (not mapNonEmpty!39226) (not b!1061726) b_and!33949 (not b_next!21229) tp_is_empty!25039)
(check-sat b_and!33949 (not b_next!21229))
(get-model)

(declare-fun b!1061779 () Bool)

(declare-fun e!604599 () Bool)

(declare-fun e!604600 () Bool)

(assert (=> b!1061779 (= e!604599 e!604600)))

(declare-fun res!708794 () Bool)

(assert (=> b!1061779 (=> (not res!708794) (not e!604600))))

(declare-fun e!604602 () Bool)

(assert (=> b!1061779 (= res!708794 (not e!604602))))

(declare-fun res!708795 () Bool)

(assert (=> b!1061779 (=> (not res!708795) (not e!604602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1061779 (= res!708795 (validKeyInArray!0 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061780 () Bool)

(declare-fun contains!6240 (List!22464 (_ BitVec 64)) Bool)

(assert (=> b!1061780 (= e!604602 (contains!6240 Nil!22461 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061781 () Bool)

(declare-fun e!604601 () Bool)

(declare-fun call!44960 () Bool)

(assert (=> b!1061781 (= e!604601 call!44960)))

(declare-fun bm!44957 () Bool)

(declare-fun c!107612 () Bool)

(assert (=> bm!44957 (= call!44960 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107612 (Cons!22460 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000) Nil!22461) Nil!22461)))))

(declare-fun d!129239 () Bool)

(declare-fun res!708796 () Bool)

(assert (=> d!129239 (=> res!708796 e!604599)))

(assert (=> d!129239 (= res!708796 (bvsge #b00000000000000000000000000000000 (size!32812 _keys!1163)))))

(assert (=> d!129239 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22461) e!604599)))

(declare-fun b!1061782 () Bool)

(assert (=> b!1061782 (= e!604601 call!44960)))

(declare-fun b!1061783 () Bool)

(assert (=> b!1061783 (= e!604600 e!604601)))

(assert (=> b!1061783 (= c!107612 (validKeyInArray!0 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129239 (not res!708796)) b!1061779))

(assert (= (and b!1061779 res!708795) b!1061780))

(assert (= (and b!1061779 res!708794) b!1061783))

(assert (= (and b!1061783 c!107612) b!1061782))

(assert (= (and b!1061783 (not c!107612)) b!1061781))

(assert (= (or b!1061782 b!1061781) bm!44957))

(declare-fun m!981203 () Bool)

(assert (=> b!1061779 m!981203))

(assert (=> b!1061779 m!981203))

(declare-fun m!981205 () Bool)

(assert (=> b!1061779 m!981205))

(assert (=> b!1061780 m!981203))

(assert (=> b!1061780 m!981203))

(declare-fun m!981207 () Bool)

(assert (=> b!1061780 m!981207))

(assert (=> bm!44957 m!981203))

(declare-fun m!981209 () Bool)

(assert (=> bm!44957 m!981209))

(assert (=> b!1061783 m!981203))

(assert (=> b!1061783 m!981203))

(assert (=> b!1061783 m!981205))

(assert (=> b!1061726 d!129239))

(declare-fun b!1061792 () Bool)

(declare-fun e!604609 () Bool)

(declare-fun e!604611 () Bool)

(assert (=> b!1061792 (= e!604609 e!604611)))

(declare-fun lt!467793 () (_ BitVec 64))

(assert (=> b!1061792 (= lt!467793 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34733 0))(
  ( (Unit!34734) )
))
(declare-fun lt!467791 () Unit!34733)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67145 (_ BitVec 64) (_ BitVec 32)) Unit!34733)

(assert (=> b!1061792 (= lt!467791 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467793 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1061792 (arrayContainsKey!0 _keys!1163 lt!467793 #b00000000000000000000000000000000)))

(declare-fun lt!467792 () Unit!34733)

(assert (=> b!1061792 (= lt!467792 lt!467791)))

(declare-fun res!708802 () Bool)

(declare-datatypes ((SeekEntryResult!9826 0))(
  ( (MissingZero!9826 (index!41675 (_ BitVec 32))) (Found!9826 (index!41676 (_ BitVec 32))) (Intermediate!9826 (undefined!10638 Bool) (index!41677 (_ BitVec 32)) (x!94792 (_ BitVec 32))) (Undefined!9826) (MissingVacant!9826 (index!41678 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67145 (_ BitVec 32)) SeekEntryResult!9826)

(assert (=> b!1061792 (= res!708802 (= (seekEntryOrOpen!0 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9826 #b00000000000000000000000000000000)))))

(assert (=> b!1061792 (=> (not res!708802) (not e!604611))))

(declare-fun d!129241 () Bool)

(declare-fun res!708801 () Bool)

(declare-fun e!604610 () Bool)

(assert (=> d!129241 (=> res!708801 e!604610)))

(assert (=> d!129241 (= res!708801 (bvsge #b00000000000000000000000000000000 (size!32812 _keys!1163)))))

(assert (=> d!129241 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!604610)))

(declare-fun b!1061793 () Bool)

(declare-fun call!44963 () Bool)

(assert (=> b!1061793 (= e!604609 call!44963)))

(declare-fun b!1061794 () Bool)

(assert (=> b!1061794 (= e!604610 e!604609)))

(declare-fun c!107615 () Bool)

(assert (=> b!1061794 (= c!107615 (validKeyInArray!0 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061795 () Bool)

(assert (=> b!1061795 (= e!604611 call!44963)))

(declare-fun bm!44960 () Bool)

(assert (=> bm!44960 (= call!44963 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129241 (not res!708801)) b!1061794))

(assert (= (and b!1061794 c!107615) b!1061792))

(assert (= (and b!1061794 (not c!107615)) b!1061793))

(assert (= (and b!1061792 res!708802) b!1061795))

(assert (= (or b!1061795 b!1061793) bm!44960))

(assert (=> b!1061792 m!981203))

(declare-fun m!981211 () Bool)

(assert (=> b!1061792 m!981211))

(declare-fun m!981213 () Bool)

(assert (=> b!1061792 m!981213))

(assert (=> b!1061792 m!981203))

(declare-fun m!981215 () Bool)

(assert (=> b!1061792 m!981215))

(assert (=> b!1061794 m!981203))

(assert (=> b!1061794 m!981203))

(assert (=> b!1061794 m!981205))

(declare-fun m!981217 () Bool)

(assert (=> bm!44960 m!981217))

(assert (=> b!1061725 d!129241))

(declare-fun b!1061820 () Bool)

(declare-fun res!708813 () Bool)

(declare-fun e!604627 () Bool)

(assert (=> b!1061820 (=> (not res!708813) (not e!604627))))

(declare-fun lt!467810 () ListLongMap!13855)

(declare-fun contains!6241 (ListLongMap!13855 (_ BitVec 64)) Bool)

(assert (=> b!1061820 (= res!708813 (not (contains!6241 lt!467810 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1061821 () Bool)

(declare-fun e!604631 () Bool)

(assert (=> b!1061821 (= e!604631 (validKeyInArray!0 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1061821 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1061822 () Bool)

(declare-fun e!604630 () ListLongMap!13855)

(assert (=> b!1061822 (= e!604630 (ListLongMap!13856 Nil!22460))))

(declare-fun b!1061823 () Bool)

(declare-fun e!604626 () Bool)

(declare-fun isEmpty!939 (ListLongMap!13855) Bool)

(assert (=> b!1061823 (= e!604626 (isEmpty!939 lt!467810))))

(declare-fun b!1061824 () Bool)

(declare-fun e!604632 () Bool)

(declare-fun e!604628 () Bool)

(assert (=> b!1061824 (= e!604632 e!604628)))

(assert (=> b!1061824 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32812 _keys!1163)))))

(declare-fun res!708811 () Bool)

(assert (=> b!1061824 (= res!708811 (contains!6241 lt!467810 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1061824 (=> (not res!708811) (not e!604628))))

(declare-fun b!1061825 () Bool)

(assert (=> b!1061825 (= e!604632 e!604626)))

(declare-fun c!107625 () Bool)

(assert (=> b!1061825 (= c!107625 (bvslt #b00000000000000000000000000000000 (size!32812 _keys!1163)))))

(declare-fun d!129243 () Bool)

(assert (=> d!129243 e!604627))

(declare-fun res!708812 () Bool)

(assert (=> d!129243 (=> (not res!708812) (not e!604627))))

(assert (=> d!129243 (= res!708812 (not (contains!6241 lt!467810 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129243 (= lt!467810 e!604630)))

(declare-fun c!107627 () Bool)

(assert (=> d!129243 (= c!107627 (bvsge #b00000000000000000000000000000000 (size!32812 _keys!1163)))))

(assert (=> d!129243 (validMask!0 mask!1515)))

(assert (=> d!129243 (= (getCurrentListMapNoExtraKeys!3591 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!467810)))

(declare-fun bm!44963 () Bool)

(declare-fun call!44966 () ListLongMap!13855)

(assert (=> bm!44963 (= call!44966 (getCurrentListMapNoExtraKeys!3591 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1061826 () Bool)

(declare-fun e!604629 () ListLongMap!13855)

(assert (=> b!1061826 (= e!604629 call!44966)))

(declare-fun b!1061827 () Bool)

(declare-fun lt!467808 () Unit!34733)

(declare-fun lt!467809 () Unit!34733)

(assert (=> b!1061827 (= lt!467808 lt!467809)))

(declare-fun lt!467811 () (_ BitVec 64))

(declare-fun lt!467813 () ListLongMap!13855)

(declare-fun lt!467812 () (_ BitVec 64))

(declare-fun lt!467814 () V!38521)

(declare-fun +!3137 (ListLongMap!13855 tuple2!15878) ListLongMap!13855)

(assert (=> b!1061827 (not (contains!6241 (+!3137 lt!467813 (tuple2!15879 lt!467812 lt!467814)) lt!467811))))

(declare-fun addStillNotContains!247 (ListLongMap!13855 (_ BitVec 64) V!38521 (_ BitVec 64)) Unit!34733)

(assert (=> b!1061827 (= lt!467809 (addStillNotContains!247 lt!467813 lt!467812 lt!467814 lt!467811))))

(assert (=> b!1061827 (= lt!467811 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!16918 (ValueCell!11816 V!38521) V!38521)

(declare-fun dynLambda!2041 (Int (_ BitVec 64)) V!38521)

(assert (=> b!1061827 (= lt!467814 (get!16918 (select (arr!32274 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1061827 (= lt!467812 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1061827 (= lt!467813 call!44966)))

(assert (=> b!1061827 (= e!604629 (+!3137 call!44966 (tuple2!15879 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000) (get!16918 (select (arr!32274 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1061828 () Bool)

(assert (=> b!1061828 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32812 _keys!1163)))))

(assert (=> b!1061828 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32811 _values!955)))))

(declare-fun apply!926 (ListLongMap!13855 (_ BitVec 64)) V!38521)

(assert (=> b!1061828 (= e!604628 (= (apply!926 lt!467810 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000)) (get!16918 (select (arr!32274 _values!955) #b00000000000000000000000000000000) (dynLambda!2041 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1061829 () Bool)

(assert (=> b!1061829 (= e!604627 e!604632)))

(declare-fun c!107626 () Bool)

(assert (=> b!1061829 (= c!107626 e!604631)))

(declare-fun res!708814 () Bool)

(assert (=> b!1061829 (=> (not res!708814) (not e!604631))))

(assert (=> b!1061829 (= res!708814 (bvslt #b00000000000000000000000000000000 (size!32812 _keys!1163)))))

(declare-fun b!1061830 () Bool)

(assert (=> b!1061830 (= e!604626 (= lt!467810 (getCurrentListMapNoExtraKeys!3591 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1061831 () Bool)

(assert (=> b!1061831 (= e!604630 e!604629)))

(declare-fun c!107624 () Bool)

(assert (=> b!1061831 (= c!107624 (validKeyInArray!0 (select (arr!32275 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129243 c!107627) b!1061822))

(assert (= (and d!129243 (not c!107627)) b!1061831))

(assert (= (and b!1061831 c!107624) b!1061827))

(assert (= (and b!1061831 (not c!107624)) b!1061826))

(assert (= (or b!1061827 b!1061826) bm!44963))

(assert (= (and d!129243 res!708812) b!1061820))

(assert (= (and b!1061820 res!708813) b!1061829))

(assert (= (and b!1061829 res!708814) b!1061821))

(assert (= (and b!1061829 c!107626) b!1061824))

(assert (= (and b!1061829 (not c!107626)) b!1061825))

(assert (= (and b!1061824 res!708811) b!1061828))

(assert (= (and b!1061825 c!107625) b!1061830))

(assert (= (and b!1061825 (not c!107625)) b!1061823))

(declare-fun b_lambda!16447 () Bool)

(assert (=> (not b_lambda!16447) (not b!1061827)))

(declare-fun t!31767 () Bool)

(declare-fun tb!7121 () Bool)

(assert (=> (and start!93980 (= defaultEntry!963 defaultEntry!963) t!31767) tb!7121))

(declare-fun result!14687 () Bool)

(assert (=> tb!7121 (= result!14687 tp_is_empty!25039)))

(assert (=> b!1061827 t!31767))

(declare-fun b_and!33955 () Bool)

(assert (= b_and!33949 (and (=> t!31767 result!14687) b_and!33955)))

(declare-fun b_lambda!16449 () Bool)

(assert (=> (not b_lambda!16449) (not b!1061828)))

(assert (=> b!1061828 t!31767))

(declare-fun b_and!33957 () Bool)

(assert (= b_and!33955 (and (=> t!31767 result!14687) b_and!33957)))

(declare-fun m!981219 () Bool)

(assert (=> d!129243 m!981219))

(assert (=> d!129243 m!981169))

(declare-fun m!981221 () Bool)

(assert (=> b!1061820 m!981221))

(assert (=> b!1061824 m!981203))

(assert (=> b!1061824 m!981203))

(declare-fun m!981223 () Bool)

(assert (=> b!1061824 m!981223))

(assert (=> b!1061821 m!981203))

(assert (=> b!1061821 m!981203))

(assert (=> b!1061821 m!981205))

(declare-fun m!981225 () Bool)

(assert (=> b!1061823 m!981225))

(declare-fun m!981227 () Bool)

(assert (=> b!1061827 m!981227))

(assert (=> b!1061827 m!981227))

(declare-fun m!981229 () Bool)

(assert (=> b!1061827 m!981229))

(declare-fun m!981231 () Bool)

(assert (=> b!1061827 m!981231))

(declare-fun m!981233 () Bool)

(assert (=> b!1061827 m!981233))

(assert (=> b!1061827 m!981229))

(declare-fun m!981235 () Bool)

(assert (=> b!1061827 m!981235))

(declare-fun m!981237 () Bool)

(assert (=> b!1061827 m!981237))

(assert (=> b!1061827 m!981233))

(declare-fun m!981239 () Bool)

(assert (=> b!1061827 m!981239))

(assert (=> b!1061827 m!981203))

(assert (=> b!1061828 m!981227))

(assert (=> b!1061828 m!981227))

(assert (=> b!1061828 m!981229))

(assert (=> b!1061828 m!981231))

(assert (=> b!1061828 m!981203))

(declare-fun m!981241 () Bool)

(assert (=> b!1061828 m!981241))

(assert (=> b!1061828 m!981229))

(assert (=> b!1061828 m!981203))

(declare-fun m!981243 () Bool)

(assert (=> bm!44963 m!981243))

(assert (=> b!1061831 m!981203))

(assert (=> b!1061831 m!981203))

(assert (=> b!1061831 m!981205))

(assert (=> b!1061830 m!981243))

(assert (=> b!1061723 d!129243))

(declare-fun d!129245 () Bool)

(assert (=> d!129245 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93980 d!129245))

(declare-fun d!129247 () Bool)

(assert (=> d!129247 (= (array_inv!25028 _values!955) (bvsge (size!32811 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93980 d!129247))

(declare-fun d!129249 () Bool)

(assert (=> d!129249 (= (array_inv!25029 _keys!1163) (bvsge (size!32812 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93980 d!129249))

(declare-fun b!1061841 () Bool)

(declare-fun e!604638 () Bool)

(assert (=> b!1061841 (= e!604638 tp_is_empty!25039)))

(declare-fun b!1061840 () Bool)

(declare-fun e!604637 () Bool)

(assert (=> b!1061840 (= e!604637 tp_is_empty!25039)))

(declare-fun mapIsEmpty!39235 () Bool)

(declare-fun mapRes!39235 () Bool)

(assert (=> mapIsEmpty!39235 mapRes!39235))

(declare-fun condMapEmpty!39235 () Bool)

(declare-fun mapDefault!39235 () ValueCell!11816)

(assert (=> mapNonEmpty!39226 (= condMapEmpty!39235 (= mapRest!39226 ((as const (Array (_ BitVec 32) ValueCell!11816)) mapDefault!39235)))))

(assert (=> mapNonEmpty!39226 (= tp!75107 (and e!604638 mapRes!39235))))

(declare-fun mapNonEmpty!39235 () Bool)

(declare-fun tp!75122 () Bool)

(assert (=> mapNonEmpty!39235 (= mapRes!39235 (and tp!75122 e!604637))))

(declare-fun mapRest!39235 () (Array (_ BitVec 32) ValueCell!11816))

(declare-fun mapKey!39235 () (_ BitVec 32))

(declare-fun mapValue!39235 () ValueCell!11816)

(assert (=> mapNonEmpty!39235 (= mapRest!39226 (store mapRest!39235 mapKey!39235 mapValue!39235))))

(assert (= (and mapNonEmpty!39226 condMapEmpty!39235) mapIsEmpty!39235))

(assert (= (and mapNonEmpty!39226 (not condMapEmpty!39235)) mapNonEmpty!39235))

(assert (= (and mapNonEmpty!39235 ((_ is ValueCellFull!11816) mapValue!39235)) b!1061840))

(assert (= (and mapNonEmpty!39226 ((_ is ValueCellFull!11816) mapDefault!39235)) b!1061841))

(declare-fun m!981245 () Bool)

(assert (=> mapNonEmpty!39235 m!981245))

(declare-fun b_lambda!16451 () Bool)

(assert (= b_lambda!16447 (or (and start!93980 b_free!21229) b_lambda!16451)))

(declare-fun b_lambda!16453 () Bool)

(assert (= b_lambda!16449 (or (and start!93980 b_free!21229) b_lambda!16453)))

(check-sat (not b!1061820) (not b!1061794) (not mapNonEmpty!39235) (not b!1061783) (not bm!44957) (not b!1061824) (not d!129243) (not b!1061831) (not b!1061830) (not b!1061827) (not bm!44960) (not b_lambda!16453) (not b!1061780) (not b!1061821) (not b!1061792) (not b!1061823) (not b!1061828) (not b_next!21229) tp_is_empty!25039 (not bm!44963) b_and!33957 (not b!1061779) (not b_lambda!16451))
(check-sat b_and!33957 (not b_next!21229))
