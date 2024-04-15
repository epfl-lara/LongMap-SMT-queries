; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93870 () Bool)

(assert start!93870)

(declare-fun b_free!21349 () Bool)

(declare-fun b_next!21349 () Bool)

(assert (=> start!93870 (= b_free!21349 (not b_next!21349))))

(declare-fun tp!75469 () Bool)

(declare-fun b_and!34037 () Bool)

(assert (=> start!93870 (= tp!75469 b_and!34037)))

(declare-fun b!1061573 () Bool)

(declare-fun res!708919 () Bool)

(declare-fun e!604556 () Bool)

(assert (=> b!1061573 (=> (not res!708919) (not e!604556))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38681 0))(
  ( (V!38682 (val!12630 Int)) )
))
(declare-datatypes ((ValueCell!11876 0))(
  ( (ValueCellFull!11876 (v!15239 V!38681)) (EmptyCell!11876) )
))
(declare-datatypes ((array!67268 0))(
  ( (array!67269 (arr!32342 (Array (_ BitVec 32) ValueCell!11876)) (size!32880 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67268)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67270 0))(
  ( (array!67271 (arr!32343 (Array (_ BitVec 32) (_ BitVec 64))) (size!32881 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67270)

(assert (=> b!1061573 (= res!708919 (and (= (size!32880 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32881 _keys!1163) (size!32880 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061574 () Bool)

(declare-fun e!604560 () Bool)

(declare-fun e!604559 () Bool)

(declare-fun mapRes!39409 () Bool)

(assert (=> b!1061574 (= e!604560 (and e!604559 mapRes!39409))))

(declare-fun condMapEmpty!39409 () Bool)

(declare-fun mapDefault!39409 () ValueCell!11876)

(assert (=> b!1061574 (= condMapEmpty!39409 (= (arr!32342 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11876)) mapDefault!39409)))))

(declare-fun b!1061575 () Bool)

(declare-fun res!708918 () Bool)

(assert (=> b!1061575 (=> (not res!708918) (not e!604556))))

(declare-datatypes ((List!22590 0))(
  ( (Nil!22587) (Cons!22586 (h!23795 (_ BitVec 64)) (t!31890 List!22590)) )
))
(declare-fun arrayNoDuplicates!0 (array!67270 (_ BitVec 32) List!22590) Bool)

(assert (=> b!1061575 (= res!708918 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22587))))

(declare-fun b!1061576 () Bool)

(declare-fun tp_is_empty!25159 () Bool)

(assert (=> b!1061576 (= e!604559 tp_is_empty!25159)))

(declare-fun b!1061577 () Bool)

(declare-fun res!708917 () Bool)

(assert (=> b!1061577 (=> (not res!708917) (not e!604556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67270 (_ BitVec 32)) Bool)

(assert (=> b!1061577 (= res!708917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39409 () Bool)

(assert (=> mapIsEmpty!39409 mapRes!39409))

(declare-fun b!1061578 () Bool)

(assert (=> b!1061578 (= e!604556 (not (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!32881 _keys!1163)))))))

(declare-datatypes ((tuple2!16034 0))(
  ( (tuple2!16035 (_1!8028 (_ BitVec 64)) (_2!8028 V!38681)) )
))
(declare-datatypes ((List!22591 0))(
  ( (Nil!22588) (Cons!22587 (h!23796 tuple2!16034) (t!31891 List!22591)) )
))
(declare-datatypes ((ListLongMap!14003 0))(
  ( (ListLongMap!14004 (toList!7017 List!22591)) )
))
(declare-fun lt!467520 () ListLongMap!14003)

(declare-fun lt!467522 () ListLongMap!14003)

(assert (=> b!1061578 (= lt!467520 lt!467522)))

(declare-fun zeroValueBefore!47 () V!38681)

(declare-fun minValue!907 () V!38681)

(declare-datatypes ((Unit!34633 0))(
  ( (Unit!34634) )
))
(declare-fun lt!467521 () Unit!34633)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38681)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!628 (array!67270 array!67268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38681 V!38681 V!38681 V!38681 (_ BitVec 32) Int) Unit!34633)

(assert (=> b!1061578 (= lt!467521 (lemmaNoChangeToArrayThenSameMapNoExtras!628 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3634 (array!67270 array!67268 (_ BitVec 32) (_ BitVec 32) V!38681 V!38681 (_ BitVec 32) Int) ListLongMap!14003)

(assert (=> b!1061578 (= lt!467522 (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061578 (= lt!467520 (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061579 () Bool)

(declare-fun e!604557 () Bool)

(assert (=> b!1061579 (= e!604557 tp_is_empty!25159)))

(declare-fun res!708916 () Bool)

(assert (=> start!93870 (=> (not res!708916) (not e!604556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93870 (= res!708916 (validMask!0 mask!1515))))

(assert (=> start!93870 e!604556))

(assert (=> start!93870 true))

(assert (=> start!93870 tp_is_empty!25159))

(declare-fun array_inv!25058 (array!67268) Bool)

(assert (=> start!93870 (and (array_inv!25058 _values!955) e!604560)))

(assert (=> start!93870 tp!75469))

(declare-fun array_inv!25059 (array!67270) Bool)

(assert (=> start!93870 (array_inv!25059 _keys!1163)))

(declare-fun mapNonEmpty!39409 () Bool)

(declare-fun tp!75470 () Bool)

(assert (=> mapNonEmpty!39409 (= mapRes!39409 (and tp!75470 e!604557))))

(declare-fun mapRest!39409 () (Array (_ BitVec 32) ValueCell!11876))

(declare-fun mapKey!39409 () (_ BitVec 32))

(declare-fun mapValue!39409 () ValueCell!11876)

(assert (=> mapNonEmpty!39409 (= (arr!32342 _values!955) (store mapRest!39409 mapKey!39409 mapValue!39409))))

(assert (= (and start!93870 res!708916) b!1061573))

(assert (= (and b!1061573 res!708919) b!1061577))

(assert (= (and b!1061577 res!708917) b!1061575))

(assert (= (and b!1061575 res!708918) b!1061578))

(assert (= (and b!1061574 condMapEmpty!39409) mapIsEmpty!39409))

(assert (= (and b!1061574 (not condMapEmpty!39409)) mapNonEmpty!39409))

(get-info :version)

(assert (= (and mapNonEmpty!39409 ((_ is ValueCellFull!11876) mapValue!39409)) b!1061579))

(assert (= (and b!1061574 ((_ is ValueCellFull!11876) mapDefault!39409)) b!1061576))

(assert (= start!93870 b!1061574))

(declare-fun m!979909 () Bool)

(assert (=> b!1061578 m!979909))

(declare-fun m!979911 () Bool)

(assert (=> b!1061578 m!979911))

(declare-fun m!979913 () Bool)

(assert (=> b!1061578 m!979913))

(declare-fun m!979915 () Bool)

(assert (=> mapNonEmpty!39409 m!979915))

(declare-fun m!979917 () Bool)

(assert (=> start!93870 m!979917))

(declare-fun m!979919 () Bool)

(assert (=> start!93870 m!979919))

(declare-fun m!979921 () Bool)

(assert (=> start!93870 m!979921))

(declare-fun m!979923 () Bool)

(assert (=> b!1061577 m!979923))

(declare-fun m!979925 () Bool)

(assert (=> b!1061575 m!979925))

(check-sat (not b_next!21349) (not b!1061578) (not start!93870) (not mapNonEmpty!39409) (not b!1061575) tp_is_empty!25159 (not b!1061577) b_and!34037)
(check-sat b_and!34037 (not b_next!21349))
(get-model)

(declare-fun d!128671 () Bool)

(assert (=> d!128671 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93870 d!128671))

(declare-fun d!128673 () Bool)

(assert (=> d!128673 (= (array_inv!25058 _values!955) (bvsge (size!32880 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93870 d!128673))

(declare-fun d!128675 () Bool)

(assert (=> d!128675 (= (array_inv!25059 _keys!1163) (bvsge (size!32881 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93870 d!128675))

(declare-fun bm!44876 () Bool)

(declare-fun call!44879 () Bool)

(assert (=> bm!44876 (= call!44879 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1061630 () Bool)

(declare-fun e!604597 () Bool)

(declare-fun e!604599 () Bool)

(assert (=> b!1061630 (= e!604597 e!604599)))

(declare-fun c!107181 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1061630 (= c!107181 (validKeyInArray!0 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128677 () Bool)

(declare-fun res!708949 () Bool)

(assert (=> d!128677 (=> res!708949 e!604597)))

(assert (=> d!128677 (= res!708949 (bvsge #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(assert (=> d!128677 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!604597)))

(declare-fun b!1061631 () Bool)

(assert (=> b!1061631 (= e!604599 call!44879)))

(declare-fun b!1061632 () Bool)

(declare-fun e!604598 () Bool)

(assert (=> b!1061632 (= e!604599 e!604598)))

(declare-fun lt!467547 () (_ BitVec 64))

(assert (=> b!1061632 (= lt!467547 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!467548 () Unit!34633)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67270 (_ BitVec 64) (_ BitVec 32)) Unit!34633)

(assert (=> b!1061632 (= lt!467548 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467547 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1061632 (arrayContainsKey!0 _keys!1163 lt!467547 #b00000000000000000000000000000000)))

(declare-fun lt!467549 () Unit!34633)

(assert (=> b!1061632 (= lt!467549 lt!467548)))

(declare-fun res!708948 () Bool)

(declare-datatypes ((SeekEntryResult!9870 0))(
  ( (MissingZero!9870 (index!41851 (_ BitVec 32))) (Found!9870 (index!41852 (_ BitVec 32))) (Intermediate!9870 (undefined!10682 Bool) (index!41853 (_ BitVec 32)) (x!94982 (_ BitVec 32))) (Undefined!9870) (MissingVacant!9870 (index!41854 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67270 (_ BitVec 32)) SeekEntryResult!9870)

(assert (=> b!1061632 (= res!708948 (= (seekEntryOrOpen!0 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9870 #b00000000000000000000000000000000)))))

(assert (=> b!1061632 (=> (not res!708948) (not e!604598))))

(declare-fun b!1061633 () Bool)

(assert (=> b!1061633 (= e!604598 call!44879)))

(assert (= (and d!128677 (not res!708949)) b!1061630))

(assert (= (and b!1061630 c!107181) b!1061632))

(assert (= (and b!1061630 (not c!107181)) b!1061631))

(assert (= (and b!1061632 res!708948) b!1061633))

(assert (= (or b!1061633 b!1061631) bm!44876))

(declare-fun m!979963 () Bool)

(assert (=> bm!44876 m!979963))

(declare-fun m!979965 () Bool)

(assert (=> b!1061630 m!979965))

(assert (=> b!1061630 m!979965))

(declare-fun m!979967 () Bool)

(assert (=> b!1061630 m!979967))

(assert (=> b!1061632 m!979965))

(declare-fun m!979969 () Bool)

(assert (=> b!1061632 m!979969))

(declare-fun m!979971 () Bool)

(assert (=> b!1061632 m!979971))

(assert (=> b!1061632 m!979965))

(declare-fun m!979973 () Bool)

(assert (=> b!1061632 m!979973))

(assert (=> b!1061577 d!128677))

(declare-fun b!1061644 () Bool)

(declare-fun e!604608 () Bool)

(declare-fun call!44882 () Bool)

(assert (=> b!1061644 (= e!604608 call!44882)))

(declare-fun d!128679 () Bool)

(declare-fun res!708958 () Bool)

(declare-fun e!604611 () Bool)

(assert (=> d!128679 (=> res!708958 e!604611)))

(assert (=> d!128679 (= res!708958 (bvsge #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(assert (=> d!128679 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22587) e!604611)))

(declare-fun b!1061645 () Bool)

(declare-fun e!604609 () Bool)

(declare-fun contains!6188 (List!22590 (_ BitVec 64)) Bool)

(assert (=> b!1061645 (= e!604609 (contains!6188 Nil!22587 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061646 () Bool)

(declare-fun e!604610 () Bool)

(assert (=> b!1061646 (= e!604611 e!604610)))

(declare-fun res!708957 () Bool)

(assert (=> b!1061646 (=> (not res!708957) (not e!604610))))

(assert (=> b!1061646 (= res!708957 (not e!604609))))

(declare-fun res!708956 () Bool)

(assert (=> b!1061646 (=> (not res!708956) (not e!604609))))

(assert (=> b!1061646 (= res!708956 (validKeyInArray!0 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44879 () Bool)

(declare-fun c!107184 () Bool)

(assert (=> bm!44879 (= call!44882 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107184 (Cons!22586 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000) Nil!22587) Nil!22587)))))

(declare-fun b!1061647 () Bool)

(assert (=> b!1061647 (= e!604610 e!604608)))

(assert (=> b!1061647 (= c!107184 (validKeyInArray!0 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061648 () Bool)

(assert (=> b!1061648 (= e!604608 call!44882)))

(assert (= (and d!128679 (not res!708958)) b!1061646))

(assert (= (and b!1061646 res!708956) b!1061645))

(assert (= (and b!1061646 res!708957) b!1061647))

(assert (= (and b!1061647 c!107184) b!1061648))

(assert (= (and b!1061647 (not c!107184)) b!1061644))

(assert (= (or b!1061648 b!1061644) bm!44879))

(assert (=> b!1061645 m!979965))

(assert (=> b!1061645 m!979965))

(declare-fun m!979975 () Bool)

(assert (=> b!1061645 m!979975))

(assert (=> b!1061646 m!979965))

(assert (=> b!1061646 m!979965))

(assert (=> b!1061646 m!979967))

(assert (=> bm!44879 m!979965))

(declare-fun m!979977 () Bool)

(assert (=> bm!44879 m!979977))

(assert (=> b!1061647 m!979965))

(assert (=> b!1061647 m!979965))

(assert (=> b!1061647 m!979967))

(assert (=> b!1061575 d!128679))

(declare-fun d!128681 () Bool)

(assert (=> d!128681 (= (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!467552 () Unit!34633)

(declare-fun choose!1730 (array!67270 array!67268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38681 V!38681 V!38681 V!38681 (_ BitVec 32) Int) Unit!34633)

(assert (=> d!128681 (= lt!467552 (choose!1730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!128681 (validMask!0 mask!1515)))

(assert (=> d!128681 (= (lemmaNoChangeToArrayThenSameMapNoExtras!628 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!467552)))

(declare-fun bs!31181 () Bool)

(assert (= bs!31181 d!128681))

(assert (=> bs!31181 m!979913))

(assert (=> bs!31181 m!979911))

(declare-fun m!979979 () Bool)

(assert (=> bs!31181 m!979979))

(assert (=> bs!31181 m!979917))

(assert (=> b!1061578 d!128681))

(declare-fun b!1061673 () Bool)

(declare-fun e!604632 () Bool)

(declare-fun e!604626 () Bool)

(assert (=> b!1061673 (= e!604632 e!604626)))

(declare-fun c!107193 () Bool)

(assert (=> b!1061673 (= c!107193 (bvslt #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(declare-fun b!1061674 () Bool)

(declare-fun lt!467567 () Unit!34633)

(declare-fun lt!467570 () Unit!34633)

(assert (=> b!1061674 (= lt!467567 lt!467570)))

(declare-fun lt!467571 () V!38681)

(declare-fun lt!467573 () (_ BitVec 64))

(declare-fun lt!467568 () (_ BitVec 64))

(declare-fun lt!467572 () ListLongMap!14003)

(declare-fun contains!6189 (ListLongMap!14003 (_ BitVec 64)) Bool)

(declare-fun +!3142 (ListLongMap!14003 tuple2!16034) ListLongMap!14003)

(assert (=> b!1061674 (not (contains!6189 (+!3142 lt!467572 (tuple2!16035 lt!467573 lt!467571)) lt!467568))))

(declare-fun addStillNotContains!247 (ListLongMap!14003 (_ BitVec 64) V!38681 (_ BitVec 64)) Unit!34633)

(assert (=> b!1061674 (= lt!467570 (addStillNotContains!247 lt!467572 lt!467573 lt!467571 lt!467568))))

(assert (=> b!1061674 (= lt!467568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!16925 (ValueCell!11876 V!38681) V!38681)

(declare-fun dynLambda!2010 (Int (_ BitVec 64)) V!38681)

(assert (=> b!1061674 (= lt!467571 (get!16925 (select (arr!32342 _values!955) #b00000000000000000000000000000000) (dynLambda!2010 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1061674 (= lt!467573 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44885 () ListLongMap!14003)

(assert (=> b!1061674 (= lt!467572 call!44885)))

(declare-fun e!604628 () ListLongMap!14003)

(assert (=> b!1061674 (= e!604628 (+!3142 call!44885 (tuple2!16035 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000) (get!16925 (select (arr!32342 _values!955) #b00000000000000000000000000000000) (dynLambda!2010 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1061675 () Bool)

(declare-fun res!708968 () Bool)

(declare-fun e!604631 () Bool)

(assert (=> b!1061675 (=> (not res!708968) (not e!604631))))

(declare-fun lt!467569 () ListLongMap!14003)

(assert (=> b!1061675 (= res!708968 (not (contains!6189 lt!467569 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1061676 () Bool)

(declare-fun e!604627 () Bool)

(assert (=> b!1061676 (= e!604632 e!604627)))

(assert (=> b!1061676 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(declare-fun res!708970 () Bool)

(assert (=> b!1061676 (= res!708970 (contains!6189 lt!467569 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1061676 (=> (not res!708970) (not e!604627))))

(declare-fun d!128683 () Bool)

(assert (=> d!128683 e!604631))

(declare-fun res!708967 () Bool)

(assert (=> d!128683 (=> (not res!708967) (not e!604631))))

(assert (=> d!128683 (= res!708967 (not (contains!6189 lt!467569 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!604630 () ListLongMap!14003)

(assert (=> d!128683 (= lt!467569 e!604630)))

(declare-fun c!107194 () Bool)

(assert (=> d!128683 (= c!107194 (bvsge #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(assert (=> d!128683 (validMask!0 mask!1515)))

(assert (=> d!128683 (= (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!467569)))

(declare-fun b!1061677 () Bool)

(assert (=> b!1061677 (= e!604630 (ListLongMap!14004 Nil!22588))))

(declare-fun b!1061678 () Bool)

(declare-fun isEmpty!941 (ListLongMap!14003) Bool)

(assert (=> b!1061678 (= e!604626 (isEmpty!941 lt!467569))))

(declare-fun b!1061679 () Bool)

(assert (=> b!1061679 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(assert (=> b!1061679 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32880 _values!955)))))

(declare-fun apply!911 (ListLongMap!14003 (_ BitVec 64)) V!38681)

(assert (=> b!1061679 (= e!604627 (= (apply!911 lt!467569 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)) (get!16925 (select (arr!32342 _values!955) #b00000000000000000000000000000000) (dynLambda!2010 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1061680 () Bool)

(assert (=> b!1061680 (= e!604628 call!44885)))

(declare-fun b!1061681 () Bool)

(assert (=> b!1061681 (= e!604630 e!604628)))

(declare-fun c!107196 () Bool)

(assert (=> b!1061681 (= c!107196 (validKeyInArray!0 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061682 () Bool)

(assert (=> b!1061682 (= e!604626 (= lt!467569 (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1061683 () Bool)

(assert (=> b!1061683 (= e!604631 e!604632)))

(declare-fun c!107195 () Bool)

(declare-fun e!604629 () Bool)

(assert (=> b!1061683 (= c!107195 e!604629)))

(declare-fun res!708969 () Bool)

(assert (=> b!1061683 (=> (not res!708969) (not e!604629))))

(assert (=> b!1061683 (= res!708969 (bvslt #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(declare-fun bm!44882 () Bool)

(assert (=> bm!44882 (= call!44885 (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1061684 () Bool)

(assert (=> b!1061684 (= e!604629 (validKeyInArray!0 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1061684 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!128683 c!107194) b!1061677))

(assert (= (and d!128683 (not c!107194)) b!1061681))

(assert (= (and b!1061681 c!107196) b!1061674))

(assert (= (and b!1061681 (not c!107196)) b!1061680))

(assert (= (or b!1061674 b!1061680) bm!44882))

(assert (= (and d!128683 res!708967) b!1061675))

(assert (= (and b!1061675 res!708968) b!1061683))

(assert (= (and b!1061683 res!708969) b!1061684))

(assert (= (and b!1061683 c!107195) b!1061676))

(assert (= (and b!1061683 (not c!107195)) b!1061673))

(assert (= (and b!1061676 res!708970) b!1061679))

(assert (= (and b!1061673 c!107193) b!1061682))

(assert (= (and b!1061673 (not c!107193)) b!1061678))

(declare-fun b_lambda!16423 () Bool)

(assert (=> (not b_lambda!16423) (not b!1061674)))

(declare-fun t!31896 () Bool)

(declare-fun tb!7123 () Bool)

(assert (=> (and start!93870 (= defaultEntry!963 defaultEntry!963) t!31896) tb!7123))

(declare-fun result!14693 () Bool)

(assert (=> tb!7123 (= result!14693 tp_is_empty!25159)))

(assert (=> b!1061674 t!31896))

(declare-fun b_and!34043 () Bool)

(assert (= b_and!34037 (and (=> t!31896 result!14693) b_and!34043)))

(declare-fun b_lambda!16425 () Bool)

(assert (=> (not b_lambda!16425) (not b!1061679)))

(assert (=> b!1061679 t!31896))

(declare-fun b_and!34045 () Bool)

(assert (= b_and!34043 (and (=> t!31896 result!14693) b_and!34045)))

(assert (=> b!1061676 m!979965))

(assert (=> b!1061676 m!979965))

(declare-fun m!979981 () Bool)

(assert (=> b!1061676 m!979981))

(declare-fun m!979983 () Bool)

(assert (=> b!1061678 m!979983))

(declare-fun m!979985 () Bool)

(assert (=> b!1061682 m!979985))

(assert (=> b!1061679 m!979965))

(declare-fun m!979987 () Bool)

(assert (=> b!1061679 m!979987))

(declare-fun m!979989 () Bool)

(assert (=> b!1061679 m!979989))

(assert (=> b!1061679 m!979989))

(declare-fun m!979991 () Bool)

(assert (=> b!1061679 m!979991))

(declare-fun m!979993 () Bool)

(assert (=> b!1061679 m!979993))

(assert (=> b!1061679 m!979991))

(assert (=> b!1061679 m!979965))

(declare-fun m!979995 () Bool)

(assert (=> d!128683 m!979995))

(assert (=> d!128683 m!979917))

(assert (=> bm!44882 m!979985))

(declare-fun m!979997 () Bool)

(assert (=> b!1061674 m!979997))

(assert (=> b!1061674 m!979989))

(declare-fun m!979999 () Bool)

(assert (=> b!1061674 m!979999))

(assert (=> b!1061674 m!979991))

(assert (=> b!1061674 m!979965))

(declare-fun m!980001 () Bool)

(assert (=> b!1061674 m!980001))

(assert (=> b!1061674 m!979999))

(declare-fun m!980003 () Bool)

(assert (=> b!1061674 m!980003))

(assert (=> b!1061674 m!979989))

(assert (=> b!1061674 m!979991))

(assert (=> b!1061674 m!979993))

(declare-fun m!980005 () Bool)

(assert (=> b!1061675 m!980005))

(assert (=> b!1061681 m!979965))

(assert (=> b!1061681 m!979965))

(assert (=> b!1061681 m!979967))

(assert (=> b!1061684 m!979965))

(assert (=> b!1061684 m!979965))

(assert (=> b!1061684 m!979967))

(assert (=> b!1061578 d!128683))

(declare-fun b!1061687 () Bool)

(declare-fun e!604639 () Bool)

(declare-fun e!604633 () Bool)

(assert (=> b!1061687 (= e!604639 e!604633)))

(declare-fun c!107197 () Bool)

(assert (=> b!1061687 (= c!107197 (bvslt #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(declare-fun b!1061688 () Bool)

(declare-fun lt!467574 () Unit!34633)

(declare-fun lt!467577 () Unit!34633)

(assert (=> b!1061688 (= lt!467574 lt!467577)))

(declare-fun lt!467579 () ListLongMap!14003)

(declare-fun lt!467575 () (_ BitVec 64))

(declare-fun lt!467578 () V!38681)

(declare-fun lt!467580 () (_ BitVec 64))

(assert (=> b!1061688 (not (contains!6189 (+!3142 lt!467579 (tuple2!16035 lt!467580 lt!467578)) lt!467575))))

(assert (=> b!1061688 (= lt!467577 (addStillNotContains!247 lt!467579 lt!467580 lt!467578 lt!467575))))

(assert (=> b!1061688 (= lt!467575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1061688 (= lt!467578 (get!16925 (select (arr!32342 _values!955) #b00000000000000000000000000000000) (dynLambda!2010 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1061688 (= lt!467580 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!44886 () ListLongMap!14003)

(assert (=> b!1061688 (= lt!467579 call!44886)))

(declare-fun e!604635 () ListLongMap!14003)

(assert (=> b!1061688 (= e!604635 (+!3142 call!44886 (tuple2!16035 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000) (get!16925 (select (arr!32342 _values!955) #b00000000000000000000000000000000) (dynLambda!2010 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1061689 () Bool)

(declare-fun res!708972 () Bool)

(declare-fun e!604638 () Bool)

(assert (=> b!1061689 (=> (not res!708972) (not e!604638))))

(declare-fun lt!467576 () ListLongMap!14003)

(assert (=> b!1061689 (= res!708972 (not (contains!6189 lt!467576 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1061690 () Bool)

(declare-fun e!604634 () Bool)

(assert (=> b!1061690 (= e!604639 e!604634)))

(assert (=> b!1061690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(declare-fun res!708974 () Bool)

(assert (=> b!1061690 (= res!708974 (contains!6189 lt!467576 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1061690 (=> (not res!708974) (not e!604634))))

(declare-fun d!128685 () Bool)

(assert (=> d!128685 e!604638))

(declare-fun res!708971 () Bool)

(assert (=> d!128685 (=> (not res!708971) (not e!604638))))

(assert (=> d!128685 (= res!708971 (not (contains!6189 lt!467576 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!604637 () ListLongMap!14003)

(assert (=> d!128685 (= lt!467576 e!604637)))

(declare-fun c!107198 () Bool)

(assert (=> d!128685 (= c!107198 (bvsge #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(assert (=> d!128685 (validMask!0 mask!1515)))

(assert (=> d!128685 (= (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!467576)))

(declare-fun b!1061691 () Bool)

(assert (=> b!1061691 (= e!604637 (ListLongMap!14004 Nil!22588))))

(declare-fun b!1061692 () Bool)

(assert (=> b!1061692 (= e!604633 (isEmpty!941 lt!467576))))

(declare-fun b!1061693 () Bool)

(assert (=> b!1061693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(assert (=> b!1061693 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32880 _values!955)))))

(assert (=> b!1061693 (= e!604634 (= (apply!911 lt!467576 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)) (get!16925 (select (arr!32342 _values!955) #b00000000000000000000000000000000) (dynLambda!2010 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1061694 () Bool)

(assert (=> b!1061694 (= e!604635 call!44886)))

(declare-fun b!1061695 () Bool)

(assert (=> b!1061695 (= e!604637 e!604635)))

(declare-fun c!107200 () Bool)

(assert (=> b!1061695 (= c!107200 (validKeyInArray!0 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061696 () Bool)

(assert (=> b!1061696 (= e!604633 (= lt!467576 (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1061697 () Bool)

(assert (=> b!1061697 (= e!604638 e!604639)))

(declare-fun c!107199 () Bool)

(declare-fun e!604636 () Bool)

(assert (=> b!1061697 (= c!107199 e!604636)))

(declare-fun res!708973 () Bool)

(assert (=> b!1061697 (=> (not res!708973) (not e!604636))))

(assert (=> b!1061697 (= res!708973 (bvslt #b00000000000000000000000000000000 (size!32881 _keys!1163)))))

(declare-fun bm!44883 () Bool)

(assert (=> bm!44883 (= call!44886 (getCurrentListMapNoExtraKeys!3634 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1061698 () Bool)

(assert (=> b!1061698 (= e!604636 (validKeyInArray!0 (select (arr!32343 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1061698 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!128685 c!107198) b!1061691))

(assert (= (and d!128685 (not c!107198)) b!1061695))

(assert (= (and b!1061695 c!107200) b!1061688))

(assert (= (and b!1061695 (not c!107200)) b!1061694))

(assert (= (or b!1061688 b!1061694) bm!44883))

(assert (= (and d!128685 res!708971) b!1061689))

(assert (= (and b!1061689 res!708972) b!1061697))

(assert (= (and b!1061697 res!708973) b!1061698))

(assert (= (and b!1061697 c!107199) b!1061690))

(assert (= (and b!1061697 (not c!107199)) b!1061687))

(assert (= (and b!1061690 res!708974) b!1061693))

(assert (= (and b!1061687 c!107197) b!1061696))

(assert (= (and b!1061687 (not c!107197)) b!1061692))

(declare-fun b_lambda!16427 () Bool)

(assert (=> (not b_lambda!16427) (not b!1061688)))

(assert (=> b!1061688 t!31896))

(declare-fun b_and!34047 () Bool)

(assert (= b_and!34045 (and (=> t!31896 result!14693) b_and!34047)))

(declare-fun b_lambda!16429 () Bool)

(assert (=> (not b_lambda!16429) (not b!1061693)))

(assert (=> b!1061693 t!31896))

(declare-fun b_and!34049 () Bool)

(assert (= b_and!34047 (and (=> t!31896 result!14693) b_and!34049)))

(assert (=> b!1061690 m!979965))

(assert (=> b!1061690 m!979965))

(declare-fun m!980007 () Bool)

(assert (=> b!1061690 m!980007))

(declare-fun m!980009 () Bool)

(assert (=> b!1061692 m!980009))

(declare-fun m!980011 () Bool)

(assert (=> b!1061696 m!980011))

(assert (=> b!1061693 m!979965))

(declare-fun m!980013 () Bool)

(assert (=> b!1061693 m!980013))

(assert (=> b!1061693 m!979989))

(assert (=> b!1061693 m!979989))

(assert (=> b!1061693 m!979991))

(assert (=> b!1061693 m!979993))

(assert (=> b!1061693 m!979991))

(assert (=> b!1061693 m!979965))

(declare-fun m!980015 () Bool)

(assert (=> d!128685 m!980015))

(assert (=> d!128685 m!979917))

(assert (=> bm!44883 m!980011))

(declare-fun m!980017 () Bool)

(assert (=> b!1061688 m!980017))

(assert (=> b!1061688 m!979989))

(declare-fun m!980019 () Bool)

(assert (=> b!1061688 m!980019))

(assert (=> b!1061688 m!979991))

(assert (=> b!1061688 m!979965))

(declare-fun m!980021 () Bool)

(assert (=> b!1061688 m!980021))

(assert (=> b!1061688 m!980019))

(declare-fun m!980023 () Bool)

(assert (=> b!1061688 m!980023))

(assert (=> b!1061688 m!979989))

(assert (=> b!1061688 m!979991))

(assert (=> b!1061688 m!979993))

(declare-fun m!980025 () Bool)

(assert (=> b!1061689 m!980025))

(assert (=> b!1061695 m!979965))

(assert (=> b!1061695 m!979965))

(assert (=> b!1061695 m!979967))

(assert (=> b!1061698 m!979965))

(assert (=> b!1061698 m!979965))

(assert (=> b!1061698 m!979967))

(assert (=> b!1061578 d!128685))

(declare-fun mapIsEmpty!39418 () Bool)

(declare-fun mapRes!39418 () Bool)

(assert (=> mapIsEmpty!39418 mapRes!39418))

(declare-fun b!1061705 () Bool)

(declare-fun e!604645 () Bool)

(assert (=> b!1061705 (= e!604645 tp_is_empty!25159)))

(declare-fun condMapEmpty!39418 () Bool)

(declare-fun mapDefault!39418 () ValueCell!11876)

(assert (=> mapNonEmpty!39409 (= condMapEmpty!39418 (= mapRest!39409 ((as const (Array (_ BitVec 32) ValueCell!11876)) mapDefault!39418)))))

(declare-fun e!604644 () Bool)

(assert (=> mapNonEmpty!39409 (= tp!75470 (and e!604644 mapRes!39418))))

(declare-fun mapNonEmpty!39418 () Bool)

(declare-fun tp!75485 () Bool)

(assert (=> mapNonEmpty!39418 (= mapRes!39418 (and tp!75485 e!604645))))

(declare-fun mapValue!39418 () ValueCell!11876)

(declare-fun mapRest!39418 () (Array (_ BitVec 32) ValueCell!11876))

(declare-fun mapKey!39418 () (_ BitVec 32))

(assert (=> mapNonEmpty!39418 (= mapRest!39409 (store mapRest!39418 mapKey!39418 mapValue!39418))))

(declare-fun b!1061706 () Bool)

(assert (=> b!1061706 (= e!604644 tp_is_empty!25159)))

(assert (= (and mapNonEmpty!39409 condMapEmpty!39418) mapIsEmpty!39418))

(assert (= (and mapNonEmpty!39409 (not condMapEmpty!39418)) mapNonEmpty!39418))

(assert (= (and mapNonEmpty!39418 ((_ is ValueCellFull!11876) mapValue!39418)) b!1061705))

(assert (= (and mapNonEmpty!39409 ((_ is ValueCellFull!11876) mapDefault!39418)) b!1061706))

(declare-fun m!980027 () Bool)

(assert (=> mapNonEmpty!39418 m!980027))

(declare-fun b_lambda!16431 () Bool)

(assert (= b_lambda!16427 (or (and start!93870 b_free!21349) b_lambda!16431)))

(declare-fun b_lambda!16433 () Bool)

(assert (= b_lambda!16423 (or (and start!93870 b_free!21349) b_lambda!16433)))

(declare-fun b_lambda!16435 () Bool)

(assert (= b_lambda!16425 (or (and start!93870 b_free!21349) b_lambda!16435)))

(declare-fun b_lambda!16437 () Bool)

(assert (= b_lambda!16429 (or (and start!93870 b_free!21349) b_lambda!16437)))

(check-sat (not b_next!21349) (not b!1061695) (not b_lambda!16431) (not bm!44879) (not b!1061681) (not bm!44876) (not b_lambda!16433) (not b!1061696) (not mapNonEmpty!39418) (not b!1061676) (not b!1061693) (not b!1061688) (not d!128683) (not b!1061632) (not b!1061682) b_and!34049 (not d!128685) (not bm!44883) (not b_lambda!16435) (not b!1061630) (not b!1061690) (not b!1061692) (not b!1061678) (not b_lambda!16437) (not b!1061646) tp_is_empty!25159 (not b!1061675) (not b!1061684) (not b!1061689) (not b!1061674) (not bm!44882) (not b!1061698) (not b!1061647) (not b!1061645) (not d!128681) (not b!1061679))
(check-sat b_and!34049 (not b_next!21349))
