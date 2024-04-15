; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94618 () Bool)

(assert start!94618)

(declare-fun b_free!21907 () Bool)

(declare-fun b_next!21907 () Bool)

(assert (=> start!94618 (= b_free!21907 (not b_next!21907))))

(declare-fun tp!77174 () Bool)

(declare-fun b_and!34693 () Bool)

(assert (=> start!94618 (= tp!77174 b_and!34693)))

(declare-fun b!1069758 () Bool)

(declare-fun res!713751 () Bool)

(declare-fun e!610568 () Bool)

(assert (=> b!1069758 (=> (not res!713751) (not e!610568))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39425 0))(
  ( (V!39426 (val!12909 Int)) )
))
(declare-datatypes ((ValueCell!12155 0))(
  ( (ValueCellFull!12155 (v!15524 V!39425)) (EmptyCell!12155) )
))
(declare-datatypes ((array!68350 0))(
  ( (array!68351 (arr!32873 (Array (_ BitVec 32) ValueCell!12155)) (size!33411 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68350)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68352 0))(
  ( (array!68353 (arr!32874 (Array (_ BitVec 32) (_ BitVec 64))) (size!33412 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68352)

(assert (=> b!1069758 (= res!713751 (and (= (size!33411 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33412 _keys!1163) (size!33411 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40276 () Bool)

(declare-fun mapRes!40276 () Bool)

(declare-fun tp!77173 () Bool)

(declare-fun e!610569 () Bool)

(assert (=> mapNonEmpty!40276 (= mapRes!40276 (and tp!77173 e!610569))))

(declare-fun mapRest!40276 () (Array (_ BitVec 32) ValueCell!12155))

(declare-fun mapKey!40276 () (_ BitVec 32))

(declare-fun mapValue!40276 () ValueCell!12155)

(assert (=> mapNonEmpty!40276 (= (arr!32873 _values!955) (store mapRest!40276 mapKey!40276 mapValue!40276))))

(declare-fun res!713753 () Bool)

(assert (=> start!94618 (=> (not res!713753) (not e!610568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94618 (= res!713753 (validMask!0 mask!1515))))

(assert (=> start!94618 e!610568))

(assert (=> start!94618 true))

(declare-fun tp_is_empty!25717 () Bool)

(assert (=> start!94618 tp_is_empty!25717))

(declare-fun e!610566 () Bool)

(declare-fun array_inv!25436 (array!68350) Bool)

(assert (=> start!94618 (and (array_inv!25436 _values!955) e!610566)))

(assert (=> start!94618 tp!77174))

(declare-fun array_inv!25437 (array!68352) Bool)

(assert (=> start!94618 (array_inv!25437 _keys!1163)))

(declare-fun mapIsEmpty!40276 () Bool)

(assert (=> mapIsEmpty!40276 mapRes!40276))

(declare-fun b!1069759 () Bool)

(declare-fun e!610567 () Bool)

(assert (=> b!1069759 (= e!610567 tp_is_empty!25717)))

(declare-fun b!1069760 () Bool)

(assert (=> b!1069760 (= e!610569 tp_is_empty!25717)))

(declare-fun b!1069761 () Bool)

(assert (=> b!1069761 (= e!610568 (not (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!33412 _keys!1163)))))))

(declare-datatypes ((tuple2!16466 0))(
  ( (tuple2!16467 (_1!8244 (_ BitVec 64)) (_2!8244 V!39425)) )
))
(declare-datatypes ((List!22995 0))(
  ( (Nil!22992) (Cons!22991 (h!24200 tuple2!16466) (t!32315 List!22995)) )
))
(declare-datatypes ((ListLongMap!14435 0))(
  ( (ListLongMap!14436 (toList!7233 List!22995)) )
))
(declare-fun lt!472614 () ListLongMap!14435)

(declare-fun lt!472613 () ListLongMap!14435)

(assert (=> b!1069761 (= lt!472614 lt!472613)))

(declare-fun zeroValueBefore!47 () V!39425)

(declare-fun minValue!907 () V!39425)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39425)

(declare-datatypes ((Unit!35054 0))(
  ( (Unit!35055) )
))
(declare-fun lt!472615 () Unit!35054)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!816 (array!68352 array!68350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39425 V!39425 V!39425 V!39425 (_ BitVec 32) Int) Unit!35054)

(assert (=> b!1069761 (= lt!472615 (lemmaNoChangeToArrayThenSameMapNoExtras!816 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3822 (array!68352 array!68350 (_ BitVec 32) (_ BitVec 32) V!39425 V!39425 (_ BitVec 32) Int) ListLongMap!14435)

(assert (=> b!1069761 (= lt!472613 (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069761 (= lt!472614 (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069762 () Bool)

(declare-fun res!713750 () Bool)

(assert (=> b!1069762 (=> (not res!713750) (not e!610568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68352 (_ BitVec 32)) Bool)

(assert (=> b!1069762 (= res!713750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069763 () Bool)

(assert (=> b!1069763 (= e!610566 (and e!610567 mapRes!40276))))

(declare-fun condMapEmpty!40276 () Bool)

(declare-fun mapDefault!40276 () ValueCell!12155)

(assert (=> b!1069763 (= condMapEmpty!40276 (= (arr!32873 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12155)) mapDefault!40276)))))

(declare-fun b!1069764 () Bool)

(declare-fun res!713752 () Bool)

(assert (=> b!1069764 (=> (not res!713752) (not e!610568))))

(declare-datatypes ((List!22996 0))(
  ( (Nil!22993) (Cons!22992 (h!24201 (_ BitVec 64)) (t!32316 List!22996)) )
))
(declare-fun arrayNoDuplicates!0 (array!68352 (_ BitVec 32) List!22996) Bool)

(assert (=> b!1069764 (= res!713752 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22993))))

(assert (= (and start!94618 res!713753) b!1069758))

(assert (= (and b!1069758 res!713751) b!1069762))

(assert (= (and b!1069762 res!713750) b!1069764))

(assert (= (and b!1069764 res!713752) b!1069761))

(assert (= (and b!1069763 condMapEmpty!40276) mapIsEmpty!40276))

(assert (= (and b!1069763 (not condMapEmpty!40276)) mapNonEmpty!40276))

(get-info :version)

(assert (= (and mapNonEmpty!40276 ((_ is ValueCellFull!12155) mapValue!40276)) b!1069760))

(assert (= (and b!1069763 ((_ is ValueCellFull!12155) mapDefault!40276)) b!1069759))

(assert (= start!94618 b!1069763))

(declare-fun m!987727 () Bool)

(assert (=> start!94618 m!987727))

(declare-fun m!987729 () Bool)

(assert (=> start!94618 m!987729))

(declare-fun m!987731 () Bool)

(assert (=> start!94618 m!987731))

(declare-fun m!987733 () Bool)

(assert (=> b!1069762 m!987733))

(declare-fun m!987735 () Bool)

(assert (=> b!1069761 m!987735))

(declare-fun m!987737 () Bool)

(assert (=> b!1069761 m!987737))

(declare-fun m!987739 () Bool)

(assert (=> b!1069761 m!987739))

(declare-fun m!987741 () Bool)

(assert (=> b!1069764 m!987741))

(declare-fun m!987743 () Bool)

(assert (=> mapNonEmpty!40276 m!987743))

(check-sat (not b!1069761) b_and!34693 (not b_next!21907) (not start!94618) (not b!1069764) (not b!1069762) tp_is_empty!25717 (not mapNonEmpty!40276))
(check-sat b_and!34693 (not b_next!21907))
(get-model)

(declare-fun d!129075 () Bool)

(declare-fun res!713784 () Bool)

(declare-fun e!610608 () Bool)

(assert (=> d!129075 (=> res!713784 e!610608)))

(assert (=> d!129075 (= res!713784 (bvsge #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(assert (=> d!129075 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22993) e!610608)))

(declare-fun b!1069817 () Bool)

(declare-fun e!610611 () Bool)

(declare-fun call!45140 () Bool)

(assert (=> b!1069817 (= e!610611 call!45140)))

(declare-fun b!1069818 () Bool)

(declare-fun e!610609 () Bool)

(declare-fun contains!6284 (List!22996 (_ BitVec 64)) Bool)

(assert (=> b!1069818 (= e!610609 (contains!6284 Nil!22993 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069819 () Bool)

(declare-fun e!610610 () Bool)

(assert (=> b!1069819 (= e!610610 e!610611)))

(declare-fun c!107551 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1069819 (= c!107551 (validKeyInArray!0 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069820 () Bool)

(assert (=> b!1069820 (= e!610608 e!610610)))

(declare-fun res!713785 () Bool)

(assert (=> b!1069820 (=> (not res!713785) (not e!610610))))

(assert (=> b!1069820 (= res!713785 (not e!610609))))

(declare-fun res!713786 () Bool)

(assert (=> b!1069820 (=> (not res!713786) (not e!610609))))

(assert (=> b!1069820 (= res!713786 (validKeyInArray!0 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45137 () Bool)

(assert (=> bm!45137 (= call!45140 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107551 (Cons!22992 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000) Nil!22993) Nil!22993)))))

(declare-fun b!1069821 () Bool)

(assert (=> b!1069821 (= e!610611 call!45140)))

(assert (= (and d!129075 (not res!713784)) b!1069820))

(assert (= (and b!1069820 res!713786) b!1069818))

(assert (= (and b!1069820 res!713785) b!1069819))

(assert (= (and b!1069819 c!107551) b!1069817))

(assert (= (and b!1069819 (not c!107551)) b!1069821))

(assert (= (or b!1069817 b!1069821) bm!45137))

(declare-fun m!987781 () Bool)

(assert (=> b!1069818 m!987781))

(assert (=> b!1069818 m!987781))

(declare-fun m!987783 () Bool)

(assert (=> b!1069818 m!987783))

(assert (=> b!1069819 m!987781))

(assert (=> b!1069819 m!987781))

(declare-fun m!987785 () Bool)

(assert (=> b!1069819 m!987785))

(assert (=> b!1069820 m!987781))

(assert (=> b!1069820 m!987781))

(assert (=> b!1069820 m!987785))

(assert (=> bm!45137 m!987781))

(declare-fun m!987787 () Bool)

(assert (=> bm!45137 m!987787))

(assert (=> b!1069764 d!129075))

(declare-fun d!129077 () Bool)

(declare-fun res!713792 () Bool)

(declare-fun e!610619 () Bool)

(assert (=> d!129077 (=> res!713792 e!610619)))

(assert (=> d!129077 (= res!713792 (bvsge #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(assert (=> d!129077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!610619)))

(declare-fun b!1069830 () Bool)

(declare-fun e!610620 () Bool)

(declare-fun call!45143 () Bool)

(assert (=> b!1069830 (= e!610620 call!45143)))

(declare-fun b!1069831 () Bool)

(declare-fun e!610618 () Bool)

(assert (=> b!1069831 (= e!610618 call!45143)))

(declare-fun b!1069832 () Bool)

(assert (=> b!1069832 (= e!610619 e!610620)))

(declare-fun c!107554 () Bool)

(assert (=> b!1069832 (= c!107554 (validKeyInArray!0 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1069833 () Bool)

(assert (=> b!1069833 (= e!610620 e!610618)))

(declare-fun lt!472641 () (_ BitVec 64))

(assert (=> b!1069833 (= lt!472641 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!472640 () Unit!35054)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68352 (_ BitVec 64) (_ BitVec 32)) Unit!35054)

(assert (=> b!1069833 (= lt!472640 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!472641 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1069833 (arrayContainsKey!0 _keys!1163 lt!472641 #b00000000000000000000000000000000)))

(declare-fun lt!472642 () Unit!35054)

(assert (=> b!1069833 (= lt!472642 lt!472640)))

(declare-fun res!713791 () Bool)

(declare-datatypes ((SeekEntryResult!9880 0))(
  ( (MissingZero!9880 (index!41891 (_ BitVec 32))) (Found!9880 (index!41892 (_ BitVec 32))) (Intermediate!9880 (undefined!10692 Bool) (index!41893 (_ BitVec 32)) (x!95846 (_ BitVec 32))) (Undefined!9880) (MissingVacant!9880 (index!41894 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68352 (_ BitVec 32)) SeekEntryResult!9880)

(assert (=> b!1069833 (= res!713791 (= (seekEntryOrOpen!0 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9880 #b00000000000000000000000000000000)))))

(assert (=> b!1069833 (=> (not res!713791) (not e!610618))))

(declare-fun bm!45140 () Bool)

(assert (=> bm!45140 (= call!45143 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(assert (= (and d!129077 (not res!713792)) b!1069832))

(assert (= (and b!1069832 c!107554) b!1069833))

(assert (= (and b!1069832 (not c!107554)) b!1069830))

(assert (= (and b!1069833 res!713791) b!1069831))

(assert (= (or b!1069831 b!1069830) bm!45140))

(assert (=> b!1069832 m!987781))

(assert (=> b!1069832 m!987781))

(assert (=> b!1069832 m!987785))

(assert (=> b!1069833 m!987781))

(declare-fun m!987789 () Bool)

(assert (=> b!1069833 m!987789))

(declare-fun m!987791 () Bool)

(assert (=> b!1069833 m!987791))

(assert (=> b!1069833 m!987781))

(declare-fun m!987793 () Bool)

(assert (=> b!1069833 m!987793))

(declare-fun m!987795 () Bool)

(assert (=> bm!45140 m!987795))

(assert (=> b!1069762 d!129077))

(declare-fun d!129079 () Bool)

(assert (=> d!129079 (= (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!472645 () Unit!35054)

(declare-fun choose!1746 (array!68352 array!68350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39425 V!39425 V!39425 V!39425 (_ BitVec 32) Int) Unit!35054)

(assert (=> d!129079 (= lt!472645 (choose!1746 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129079 (validMask!0 mask!1515)))

(assert (=> d!129079 (= (lemmaNoChangeToArrayThenSameMapNoExtras!816 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472645)))

(declare-fun bs!31484 () Bool)

(assert (= bs!31484 d!129079))

(assert (=> bs!31484 m!987739))

(assert (=> bs!31484 m!987737))

(declare-fun m!987797 () Bool)

(assert (=> bs!31484 m!987797))

(assert (=> bs!31484 m!987727))

(assert (=> b!1069761 d!129079))

(declare-fun b!1069858 () Bool)

(declare-fun e!610638 () ListLongMap!14435)

(assert (=> b!1069858 (= e!610638 (ListLongMap!14436 Nil!22992))))

(declare-fun b!1069859 () Bool)

(declare-fun lt!472661 () Unit!35054)

(declare-fun lt!472665 () Unit!35054)

(assert (=> b!1069859 (= lt!472661 lt!472665)))

(declare-fun lt!472666 () (_ BitVec 64))

(declare-fun lt!472662 () ListLongMap!14435)

(declare-fun lt!472664 () V!39425)

(declare-fun lt!472663 () (_ BitVec 64))

(declare-fun contains!6285 (ListLongMap!14435 (_ BitVec 64)) Bool)

(declare-fun +!3187 (ListLongMap!14435 tuple2!16466) ListLongMap!14435)

(assert (=> b!1069859 (not (contains!6285 (+!3187 lt!472662 (tuple2!16467 lt!472663 lt!472664)) lt!472666))))

(declare-fun addStillNotContains!257 (ListLongMap!14435 (_ BitVec 64) V!39425 (_ BitVec 64)) Unit!35054)

(assert (=> b!1069859 (= lt!472665 (addStillNotContains!257 lt!472662 lt!472663 lt!472664 lt!472666))))

(assert (=> b!1069859 (= lt!472666 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17121 (ValueCell!12155 V!39425) V!39425)

(declare-fun dynLambda!2020 (Int (_ BitVec 64)) V!39425)

(assert (=> b!1069859 (= lt!472664 (get!17121 (select (arr!32873 _values!955) #b00000000000000000000000000000000) (dynLambda!2020 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1069859 (= lt!472663 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45146 () ListLongMap!14435)

(assert (=> b!1069859 (= lt!472662 call!45146)))

(declare-fun e!610636 () ListLongMap!14435)

(assert (=> b!1069859 (= e!610636 (+!3187 call!45146 (tuple2!16467 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000) (get!17121 (select (arr!32873 _values!955) #b00000000000000000000000000000000) (dynLambda!2020 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1069860 () Bool)

(declare-fun e!610637 () Bool)

(declare-fun e!610641 () Bool)

(assert (=> b!1069860 (= e!610637 e!610641)))

(declare-fun c!107566 () Bool)

(assert (=> b!1069860 (= c!107566 (bvslt #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(declare-fun b!1069861 () Bool)

(assert (=> b!1069861 (= e!610636 call!45146)))

(declare-fun b!1069862 () Bool)

(declare-fun res!713801 () Bool)

(declare-fun e!610640 () Bool)

(assert (=> b!1069862 (=> (not res!713801) (not e!610640))))

(declare-fun lt!472660 () ListLongMap!14435)

(assert (=> b!1069862 (= res!713801 (not (contains!6285 lt!472660 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129081 () Bool)

(assert (=> d!129081 e!610640))

(declare-fun res!713804 () Bool)

(assert (=> d!129081 (=> (not res!713804) (not e!610640))))

(assert (=> d!129081 (= res!713804 (not (contains!6285 lt!472660 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129081 (= lt!472660 e!610638)))

(declare-fun c!107564 () Bool)

(assert (=> d!129081 (= c!107564 (bvsge #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(assert (=> d!129081 (validMask!0 mask!1515)))

(assert (=> d!129081 (= (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472660)))

(declare-fun b!1069863 () Bool)

(declare-fun e!610639 () Bool)

(assert (=> b!1069863 (= e!610637 e!610639)))

(assert (=> b!1069863 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(declare-fun res!713803 () Bool)

(assert (=> b!1069863 (= res!713803 (contains!6285 lt!472660 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069863 (=> (not res!713803) (not e!610639))))

(declare-fun b!1069864 () Bool)

(declare-fun isEmpty!951 (ListLongMap!14435) Bool)

(assert (=> b!1069864 (= e!610641 (isEmpty!951 lt!472660))))

(declare-fun bm!45143 () Bool)

(assert (=> bm!45143 (= call!45146 (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1069865 () Bool)

(assert (=> b!1069865 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(assert (=> b!1069865 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33411 _values!955)))))

(declare-fun apply!921 (ListLongMap!14435 (_ BitVec 64)) V!39425)

(assert (=> b!1069865 (= e!610639 (= (apply!921 lt!472660 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)) (get!17121 (select (arr!32873 _values!955) #b00000000000000000000000000000000) (dynLambda!2020 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1069866 () Bool)

(assert (=> b!1069866 (= e!610640 e!610637)))

(declare-fun c!107565 () Bool)

(declare-fun e!610635 () Bool)

(assert (=> b!1069866 (= c!107565 e!610635)))

(declare-fun res!713802 () Bool)

(assert (=> b!1069866 (=> (not res!713802) (not e!610635))))

(assert (=> b!1069866 (= res!713802 (bvslt #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(declare-fun b!1069867 () Bool)

(assert (=> b!1069867 (= e!610635 (validKeyInArray!0 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069867 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1069868 () Bool)

(assert (=> b!1069868 (= e!610641 (= lt!472660 (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1069869 () Bool)

(assert (=> b!1069869 (= e!610638 e!610636)))

(declare-fun c!107563 () Bool)

(assert (=> b!1069869 (= c!107563 (validKeyInArray!0 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129081 c!107564) b!1069858))

(assert (= (and d!129081 (not c!107564)) b!1069869))

(assert (= (and b!1069869 c!107563) b!1069859))

(assert (= (and b!1069869 (not c!107563)) b!1069861))

(assert (= (or b!1069859 b!1069861) bm!45143))

(assert (= (and d!129081 res!713804) b!1069862))

(assert (= (and b!1069862 res!713801) b!1069866))

(assert (= (and b!1069866 res!713802) b!1069867))

(assert (= (and b!1069866 c!107565) b!1069863))

(assert (= (and b!1069866 (not c!107565)) b!1069860))

(assert (= (and b!1069863 res!713803) b!1069865))

(assert (= (and b!1069860 c!107566) b!1069868))

(assert (= (and b!1069860 (not c!107566)) b!1069864))

(declare-fun b_lambda!16619 () Bool)

(assert (=> (not b_lambda!16619) (not b!1069859)))

(declare-fun t!32319 () Bool)

(declare-fun tb!7143 () Bool)

(assert (=> (and start!94618 (= defaultEntry!963 defaultEntry!963) t!32319) tb!7143))

(declare-fun result!14753 () Bool)

(assert (=> tb!7143 (= result!14753 tp_is_empty!25717)))

(assert (=> b!1069859 t!32319))

(declare-fun b_and!34699 () Bool)

(assert (= b_and!34693 (and (=> t!32319 result!14753) b_and!34699)))

(declare-fun b_lambda!16621 () Bool)

(assert (=> (not b_lambda!16621) (not b!1069865)))

(assert (=> b!1069865 t!32319))

(declare-fun b_and!34701 () Bool)

(assert (= b_and!34699 (and (=> t!32319 result!14753) b_and!34701)))

(assert (=> b!1069867 m!987781))

(assert (=> b!1069867 m!987781))

(assert (=> b!1069867 m!987785))

(declare-fun m!987799 () Bool)

(assert (=> b!1069864 m!987799))

(assert (=> b!1069863 m!987781))

(assert (=> b!1069863 m!987781))

(declare-fun m!987801 () Bool)

(assert (=> b!1069863 m!987801))

(declare-fun m!987803 () Bool)

(assert (=> b!1069862 m!987803))

(declare-fun m!987805 () Bool)

(assert (=> bm!45143 m!987805))

(declare-fun m!987807 () Bool)

(assert (=> b!1069859 m!987807))

(assert (=> b!1069859 m!987781))

(declare-fun m!987809 () Bool)

(assert (=> b!1069859 m!987809))

(declare-fun m!987811 () Bool)

(assert (=> b!1069859 m!987811))

(declare-fun m!987813 () Bool)

(assert (=> b!1069859 m!987813))

(assert (=> b!1069859 m!987811))

(assert (=> b!1069859 m!987809))

(declare-fun m!987815 () Bool)

(assert (=> b!1069859 m!987815))

(assert (=> b!1069859 m!987813))

(declare-fun m!987817 () Bool)

(assert (=> b!1069859 m!987817))

(declare-fun m!987819 () Bool)

(assert (=> b!1069859 m!987819))

(declare-fun m!987821 () Bool)

(assert (=> d!129081 m!987821))

(assert (=> d!129081 m!987727))

(assert (=> b!1069869 m!987781))

(assert (=> b!1069869 m!987781))

(assert (=> b!1069869 m!987785))

(assert (=> b!1069868 m!987805))

(assert (=> b!1069865 m!987781))

(assert (=> b!1069865 m!987809))

(assert (=> b!1069865 m!987811))

(assert (=> b!1069865 m!987781))

(declare-fun m!987823 () Bool)

(assert (=> b!1069865 m!987823))

(assert (=> b!1069865 m!987811))

(assert (=> b!1069865 m!987809))

(assert (=> b!1069865 m!987815))

(assert (=> b!1069761 d!129081))

(declare-fun b!1069872 () Bool)

(declare-fun e!610645 () ListLongMap!14435)

(assert (=> b!1069872 (= e!610645 (ListLongMap!14436 Nil!22992))))

(declare-fun b!1069873 () Bool)

(declare-fun lt!472668 () Unit!35054)

(declare-fun lt!472672 () Unit!35054)

(assert (=> b!1069873 (= lt!472668 lt!472672)))

(declare-fun lt!472671 () V!39425)

(declare-fun lt!472673 () (_ BitVec 64))

(declare-fun lt!472669 () ListLongMap!14435)

(declare-fun lt!472670 () (_ BitVec 64))

(assert (=> b!1069873 (not (contains!6285 (+!3187 lt!472669 (tuple2!16467 lt!472670 lt!472671)) lt!472673))))

(assert (=> b!1069873 (= lt!472672 (addStillNotContains!257 lt!472669 lt!472670 lt!472671 lt!472673))))

(assert (=> b!1069873 (= lt!472673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1069873 (= lt!472671 (get!17121 (select (arr!32873 _values!955) #b00000000000000000000000000000000) (dynLambda!2020 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1069873 (= lt!472670 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45147 () ListLongMap!14435)

(assert (=> b!1069873 (= lt!472669 call!45147)))

(declare-fun e!610643 () ListLongMap!14435)

(assert (=> b!1069873 (= e!610643 (+!3187 call!45147 (tuple2!16467 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000) (get!17121 (select (arr!32873 _values!955) #b00000000000000000000000000000000) (dynLambda!2020 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1069874 () Bool)

(declare-fun e!610644 () Bool)

(declare-fun e!610648 () Bool)

(assert (=> b!1069874 (= e!610644 e!610648)))

(declare-fun c!107570 () Bool)

(assert (=> b!1069874 (= c!107570 (bvslt #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(declare-fun b!1069875 () Bool)

(assert (=> b!1069875 (= e!610643 call!45147)))

(declare-fun b!1069876 () Bool)

(declare-fun res!713805 () Bool)

(declare-fun e!610647 () Bool)

(assert (=> b!1069876 (=> (not res!713805) (not e!610647))))

(declare-fun lt!472667 () ListLongMap!14435)

(assert (=> b!1069876 (= res!713805 (not (contains!6285 lt!472667 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!129083 () Bool)

(assert (=> d!129083 e!610647))

(declare-fun res!713808 () Bool)

(assert (=> d!129083 (=> (not res!713808) (not e!610647))))

(assert (=> d!129083 (= res!713808 (not (contains!6285 lt!472667 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129083 (= lt!472667 e!610645)))

(declare-fun c!107568 () Bool)

(assert (=> d!129083 (= c!107568 (bvsge #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(assert (=> d!129083 (validMask!0 mask!1515)))

(assert (=> d!129083 (= (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!472667)))

(declare-fun b!1069877 () Bool)

(declare-fun e!610646 () Bool)

(assert (=> b!1069877 (= e!610644 e!610646)))

(assert (=> b!1069877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(declare-fun res!713807 () Bool)

(assert (=> b!1069877 (= res!713807 (contains!6285 lt!472667 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069877 (=> (not res!713807) (not e!610646))))

(declare-fun b!1069878 () Bool)

(assert (=> b!1069878 (= e!610648 (isEmpty!951 lt!472667))))

(declare-fun bm!45144 () Bool)

(assert (=> bm!45144 (= call!45147 (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1069879 () Bool)

(assert (=> b!1069879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(assert (=> b!1069879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33411 _values!955)))))

(assert (=> b!1069879 (= e!610646 (= (apply!921 lt!472667 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)) (get!17121 (select (arr!32873 _values!955) #b00000000000000000000000000000000) (dynLambda!2020 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1069880 () Bool)

(assert (=> b!1069880 (= e!610647 e!610644)))

(declare-fun c!107569 () Bool)

(declare-fun e!610642 () Bool)

(assert (=> b!1069880 (= c!107569 e!610642)))

(declare-fun res!713806 () Bool)

(assert (=> b!1069880 (=> (not res!713806) (not e!610642))))

(assert (=> b!1069880 (= res!713806 (bvslt #b00000000000000000000000000000000 (size!33412 _keys!1163)))))

(declare-fun b!1069881 () Bool)

(assert (=> b!1069881 (= e!610642 (validKeyInArray!0 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1069881 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1069882 () Bool)

(assert (=> b!1069882 (= e!610648 (= lt!472667 (getCurrentListMapNoExtraKeys!3822 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1069883 () Bool)

(assert (=> b!1069883 (= e!610645 e!610643)))

(declare-fun c!107567 () Bool)

(assert (=> b!1069883 (= c!107567 (validKeyInArray!0 (select (arr!32874 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129083 c!107568) b!1069872))

(assert (= (and d!129083 (not c!107568)) b!1069883))

(assert (= (and b!1069883 c!107567) b!1069873))

(assert (= (and b!1069883 (not c!107567)) b!1069875))

(assert (= (or b!1069873 b!1069875) bm!45144))

(assert (= (and d!129083 res!713808) b!1069876))

(assert (= (and b!1069876 res!713805) b!1069880))

(assert (= (and b!1069880 res!713806) b!1069881))

(assert (= (and b!1069880 c!107569) b!1069877))

(assert (= (and b!1069880 (not c!107569)) b!1069874))

(assert (= (and b!1069877 res!713807) b!1069879))

(assert (= (and b!1069874 c!107570) b!1069882))

(assert (= (and b!1069874 (not c!107570)) b!1069878))

(declare-fun b_lambda!16623 () Bool)

(assert (=> (not b_lambda!16623) (not b!1069873)))

(assert (=> b!1069873 t!32319))

(declare-fun b_and!34703 () Bool)

(assert (= b_and!34701 (and (=> t!32319 result!14753) b_and!34703)))

(declare-fun b_lambda!16625 () Bool)

(assert (=> (not b_lambda!16625) (not b!1069879)))

(assert (=> b!1069879 t!32319))

(declare-fun b_and!34705 () Bool)

(assert (= b_and!34703 (and (=> t!32319 result!14753) b_and!34705)))

(assert (=> b!1069881 m!987781))

(assert (=> b!1069881 m!987781))

(assert (=> b!1069881 m!987785))

(declare-fun m!987825 () Bool)

(assert (=> b!1069878 m!987825))

(assert (=> b!1069877 m!987781))

(assert (=> b!1069877 m!987781))

(declare-fun m!987827 () Bool)

(assert (=> b!1069877 m!987827))

(declare-fun m!987829 () Bool)

(assert (=> b!1069876 m!987829))

(declare-fun m!987831 () Bool)

(assert (=> bm!45144 m!987831))

(declare-fun m!987833 () Bool)

(assert (=> b!1069873 m!987833))

(assert (=> b!1069873 m!987781))

(assert (=> b!1069873 m!987809))

(assert (=> b!1069873 m!987811))

(declare-fun m!987835 () Bool)

(assert (=> b!1069873 m!987835))

(assert (=> b!1069873 m!987811))

(assert (=> b!1069873 m!987809))

(assert (=> b!1069873 m!987815))

(assert (=> b!1069873 m!987835))

(declare-fun m!987837 () Bool)

(assert (=> b!1069873 m!987837))

(declare-fun m!987839 () Bool)

(assert (=> b!1069873 m!987839))

(declare-fun m!987841 () Bool)

(assert (=> d!129083 m!987841))

(assert (=> d!129083 m!987727))

(assert (=> b!1069883 m!987781))

(assert (=> b!1069883 m!987781))

(assert (=> b!1069883 m!987785))

(assert (=> b!1069882 m!987831))

(assert (=> b!1069879 m!987781))

(assert (=> b!1069879 m!987809))

(assert (=> b!1069879 m!987811))

(assert (=> b!1069879 m!987781))

(declare-fun m!987843 () Bool)

(assert (=> b!1069879 m!987843))

(assert (=> b!1069879 m!987811))

(assert (=> b!1069879 m!987809))

(assert (=> b!1069879 m!987815))

(assert (=> b!1069761 d!129083))

(declare-fun d!129085 () Bool)

(assert (=> d!129085 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94618 d!129085))

(declare-fun d!129087 () Bool)

(assert (=> d!129087 (= (array_inv!25436 _values!955) (bvsge (size!33411 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94618 d!129087))

(declare-fun d!129089 () Bool)

(assert (=> d!129089 (= (array_inv!25437 _keys!1163) (bvsge (size!33412 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94618 d!129089))

(declare-fun b!1069890 () Bool)

(declare-fun e!610654 () Bool)

(assert (=> b!1069890 (= e!610654 tp_is_empty!25717)))

(declare-fun condMapEmpty!40285 () Bool)

(declare-fun mapDefault!40285 () ValueCell!12155)

(assert (=> mapNonEmpty!40276 (= condMapEmpty!40285 (= mapRest!40276 ((as const (Array (_ BitVec 32) ValueCell!12155)) mapDefault!40285)))))

(declare-fun e!610653 () Bool)

(declare-fun mapRes!40285 () Bool)

(assert (=> mapNonEmpty!40276 (= tp!77173 (and e!610653 mapRes!40285))))

(declare-fun b!1069891 () Bool)

(assert (=> b!1069891 (= e!610653 tp_is_empty!25717)))

(declare-fun mapIsEmpty!40285 () Bool)

(assert (=> mapIsEmpty!40285 mapRes!40285))

(declare-fun mapNonEmpty!40285 () Bool)

(declare-fun tp!77189 () Bool)

(assert (=> mapNonEmpty!40285 (= mapRes!40285 (and tp!77189 e!610654))))

(declare-fun mapKey!40285 () (_ BitVec 32))

(declare-fun mapValue!40285 () ValueCell!12155)

(declare-fun mapRest!40285 () (Array (_ BitVec 32) ValueCell!12155))

(assert (=> mapNonEmpty!40285 (= mapRest!40276 (store mapRest!40285 mapKey!40285 mapValue!40285))))

(assert (= (and mapNonEmpty!40276 condMapEmpty!40285) mapIsEmpty!40285))

(assert (= (and mapNonEmpty!40276 (not condMapEmpty!40285)) mapNonEmpty!40285))

(assert (= (and mapNonEmpty!40285 ((_ is ValueCellFull!12155) mapValue!40285)) b!1069890))

(assert (= (and mapNonEmpty!40276 ((_ is ValueCellFull!12155) mapDefault!40285)) b!1069891))

(declare-fun m!987845 () Bool)

(assert (=> mapNonEmpty!40285 m!987845))

(declare-fun b_lambda!16627 () Bool)

(assert (= b_lambda!16625 (or (and start!94618 b_free!21907) b_lambda!16627)))

(declare-fun b_lambda!16629 () Bool)

(assert (= b_lambda!16623 (or (and start!94618 b_free!21907) b_lambda!16629)))

(declare-fun b_lambda!16631 () Bool)

(assert (= b_lambda!16621 (or (and start!94618 b_free!21907) b_lambda!16631)))

(declare-fun b_lambda!16633 () Bool)

(assert (= b_lambda!16619 (or (and start!94618 b_free!21907) b_lambda!16633)))

(check-sat (not b!1069865) (not b_lambda!16631) (not mapNonEmpty!40285) (not b_lambda!16629) tp_is_empty!25717 (not b!1069868) (not b!1069869) (not bm!45137) (not bm!45143) (not b!1069819) (not b!1069820) (not d!129079) (not b!1069833) (not b!1069859) (not d!129081) (not bm!45140) (not b!1069818) (not b_lambda!16627) (not b_lambda!16633) (not b!1069882) (not b_next!21907) (not d!129083) (not b!1069873) (not b!1069867) (not b!1069879) (not bm!45144) (not b!1069832) b_and!34705 (not b!1069877) (not b!1069862) (not b!1069878) (not b!1069883) (not b!1069863) (not b!1069876) (not b!1069881) (not b!1069864))
(check-sat b_and!34705 (not b_next!21907))
