; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94984 () Bool)

(assert start!94984)

(declare-fun b_free!22165 () Bool)

(declare-fun b_next!22165 () Bool)

(assert (=> start!94984 (= b_free!22165 (not b_next!22165))))

(declare-fun tp!77966 () Bool)

(declare-fun b_and!35011 () Bool)

(assert (=> start!94984 (= tp!77966 b_and!35011)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun b!1073780 () Bool)

(declare-datatypes ((V!39769 0))(
  ( (V!39770 (val!13038 Int)) )
))
(declare-fun minValue!907 () V!39769)

(declare-datatypes ((array!68846 0))(
  ( (array!68847 (arr!33115 (Array (_ BitVec 32) (_ BitVec 64))) (size!33653 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68846)

(declare-datatypes ((tuple2!16666 0))(
  ( (tuple2!16667 (_1!8344 (_ BitVec 64)) (_2!8344 V!39769)) )
))
(declare-datatypes ((List!23191 0))(
  ( (Nil!23188) (Cons!23187 (h!24396 tuple2!16666) (t!32523 List!23191)) )
))
(declare-datatypes ((ListLongMap!14635 0))(
  ( (ListLongMap!14636 (toList!7333 List!23191)) )
))
(declare-fun lt!476091 () ListLongMap!14635)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12284 0))(
  ( (ValueCellFull!12284 (v!15656 V!39769)) (EmptyCell!12284) )
))
(declare-datatypes ((array!68848 0))(
  ( (array!68849 (arr!33116 (Array (_ BitVec 32) ValueCell!12284)) (size!33654 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68848)

(declare-fun e!613505 () Bool)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39769)

(declare-fun getCurrentListMap!4106 (array!68846 array!68848 (_ BitVec 32) (_ BitVec 32) V!39769 V!39769 (_ BitVec 32) Int) ListLongMap!14635)

(assert (=> b!1073780 (= e!613505 (= lt!476091 (getCurrentListMap!4106 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)))))

(declare-fun lt!476089 () ListLongMap!14635)

(assert (=> b!1073780 (= lt!476091 lt!476089)))

(declare-fun -!691 (ListLongMap!14635 (_ BitVec 64)) ListLongMap!14635)

(assert (=> b!1073780 (= lt!476091 (-!691 lt!476089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!35203 0))(
  ( (Unit!35204) )
))
(declare-fun lt!476087 () Unit!35203)

(declare-fun removeNotPresentStillSame!72 (ListLongMap!14635 (_ BitVec 64)) Unit!35203)

(assert (=> b!1073780 (= lt!476087 (removeNotPresentStillSame!72 lt!476089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073781 () Bool)

(declare-fun e!613506 () Bool)

(declare-fun tp_is_empty!25975 () Bool)

(assert (=> b!1073781 (= e!613506 tp_is_empty!25975)))

(declare-fun b!1073782 () Bool)

(declare-fun res!716117 () Bool)

(declare-fun e!613510 () Bool)

(assert (=> b!1073782 (=> (not res!716117) (not e!613510))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073782 (= res!716117 (and (= (size!33654 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33653 _keys!1163) (size!33654 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40681 () Bool)

(declare-fun mapRes!40681 () Bool)

(declare-fun tp!77965 () Bool)

(assert (=> mapNonEmpty!40681 (= mapRes!40681 (and tp!77965 e!613506))))

(declare-fun mapKey!40681 () (_ BitVec 32))

(declare-fun mapRest!40681 () (Array (_ BitVec 32) ValueCell!12284))

(declare-fun mapValue!40681 () ValueCell!12284)

(assert (=> mapNonEmpty!40681 (= (arr!33116 _values!955) (store mapRest!40681 mapKey!40681 mapValue!40681))))

(declare-fun res!716116 () Bool)

(assert (=> start!94984 (=> (not res!716116) (not e!613510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94984 (= res!716116 (validMask!0 mask!1515))))

(assert (=> start!94984 e!613510))

(assert (=> start!94984 true))

(assert (=> start!94984 tp_is_empty!25975))

(declare-fun e!613507 () Bool)

(declare-fun array_inv!25620 (array!68848) Bool)

(assert (=> start!94984 (and (array_inv!25620 _values!955) e!613507)))

(assert (=> start!94984 tp!77966))

(declare-fun array_inv!25621 (array!68846) Bool)

(assert (=> start!94984 (array_inv!25621 _keys!1163)))

(declare-fun b!1073783 () Bool)

(declare-fun res!716113 () Bool)

(assert (=> b!1073783 (=> (not res!716113) (not e!613510))))

(declare-datatypes ((List!23192 0))(
  ( (Nil!23189) (Cons!23188 (h!24397 (_ BitVec 64)) (t!32524 List!23192)) )
))
(declare-fun arrayNoDuplicates!0 (array!68846 (_ BitVec 32) List!23192) Bool)

(assert (=> b!1073783 (= res!716113 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23189))))

(declare-fun b!1073784 () Bool)

(declare-fun e!613509 () Bool)

(assert (=> b!1073784 (= e!613509 tp_is_empty!25975)))

(declare-fun b!1073785 () Bool)

(declare-fun e!613504 () Bool)

(assert (=> b!1073785 (= e!613510 (not e!613504))))

(declare-fun res!716115 () Bool)

(assert (=> b!1073785 (=> res!716115 e!613504)))

(assert (=> b!1073785 (= res!716115 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!476088 () ListLongMap!14635)

(declare-fun lt!476092 () ListLongMap!14635)

(assert (=> b!1073785 (= lt!476088 lt!476092)))

(declare-fun zeroValueBefore!47 () V!39769)

(declare-fun lt!476090 () Unit!35203)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!885 (array!68846 array!68848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39769 V!39769 V!39769 V!39769 (_ BitVec 32) Int) Unit!35203)

(assert (=> b!1073785 (= lt!476090 (lemmaNoChangeToArrayThenSameMapNoExtras!885 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3913 (array!68846 array!68848 (_ BitVec 32) (_ BitVec 32) V!39769 V!39769 (_ BitVec 32) Int) ListLongMap!14635)

(assert (=> b!1073785 (= lt!476092 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073785 (= lt!476088 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073786 () Bool)

(assert (=> b!1073786 (= e!613507 (and e!613509 mapRes!40681))))

(declare-fun condMapEmpty!40681 () Bool)

(declare-fun mapDefault!40681 () ValueCell!12284)

(assert (=> b!1073786 (= condMapEmpty!40681 (= (arr!33116 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12284)) mapDefault!40681)))))

(declare-fun b!1073787 () Bool)

(assert (=> b!1073787 (= e!613504 e!613505)))

(declare-fun res!716118 () Bool)

(assert (=> b!1073787 (=> res!716118 e!613505)))

(declare-fun contains!6301 (ListLongMap!14635 (_ BitVec 64)) Bool)

(assert (=> b!1073787 (= res!716118 (contains!6301 lt!476089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1073787 (= lt!476089 (getCurrentListMap!4106 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40681 () Bool)

(assert (=> mapIsEmpty!40681 mapRes!40681))

(declare-fun b!1073788 () Bool)

(declare-fun res!716114 () Bool)

(assert (=> b!1073788 (=> (not res!716114) (not e!613510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68846 (_ BitVec 32)) Bool)

(assert (=> b!1073788 (= res!716114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94984 res!716116) b!1073782))

(assert (= (and b!1073782 res!716117) b!1073788))

(assert (= (and b!1073788 res!716114) b!1073783))

(assert (= (and b!1073783 res!716113) b!1073785))

(assert (= (and b!1073785 (not res!716115)) b!1073787))

(assert (= (and b!1073787 (not res!716118)) b!1073780))

(assert (= (and b!1073786 condMapEmpty!40681) mapIsEmpty!40681))

(assert (= (and b!1073786 (not condMapEmpty!40681)) mapNonEmpty!40681))

(get-info :version)

(assert (= (and mapNonEmpty!40681 ((_ is ValueCellFull!12284) mapValue!40681)) b!1073781))

(assert (= (and b!1073786 ((_ is ValueCellFull!12284) mapDefault!40681)) b!1073784))

(assert (= start!94984 b!1073786))

(declare-fun m!992183 () Bool)

(assert (=> mapNonEmpty!40681 m!992183))

(declare-fun m!992185 () Bool)

(assert (=> start!94984 m!992185))

(declare-fun m!992187 () Bool)

(assert (=> start!94984 m!992187))

(declare-fun m!992189 () Bool)

(assert (=> start!94984 m!992189))

(declare-fun m!992191 () Bool)

(assert (=> b!1073780 m!992191))

(declare-fun m!992193 () Bool)

(assert (=> b!1073780 m!992193))

(declare-fun m!992195 () Bool)

(assert (=> b!1073780 m!992195))

(declare-fun m!992197 () Bool)

(assert (=> b!1073787 m!992197))

(declare-fun m!992199 () Bool)

(assert (=> b!1073787 m!992199))

(declare-fun m!992201 () Bool)

(assert (=> b!1073783 m!992201))

(declare-fun m!992203 () Bool)

(assert (=> b!1073788 m!992203))

(declare-fun m!992205 () Bool)

(assert (=> b!1073785 m!992205))

(declare-fun m!992207 () Bool)

(assert (=> b!1073785 m!992207))

(declare-fun m!992209 () Bool)

(assert (=> b!1073785 m!992209))

(check-sat (not start!94984) b_and!35011 (not b!1073787) (not b!1073788) (not b!1073783) (not mapNonEmpty!40681) tp_is_empty!25975 (not b_next!22165) (not b!1073780) (not b!1073785))
(check-sat b_and!35011 (not b_next!22165))
(get-model)

(declare-fun b!1073885 () Bool)

(declare-fun e!613579 () Bool)

(declare-fun e!613586 () Bool)

(assert (=> b!1073885 (= e!613579 e!613586)))

(declare-fun c!107783 () Bool)

(assert (=> b!1073885 (= c!107783 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1073886 () Bool)

(declare-fun e!613585 () ListLongMap!14635)

(declare-fun e!613583 () ListLongMap!14635)

(assert (=> b!1073886 (= e!613585 e!613583)))

(declare-fun c!107780 () Bool)

(assert (=> b!1073886 (= c!107780 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1073887 () Bool)

(declare-fun c!107782 () Bool)

(assert (=> b!1073887 (= c!107782 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!613587 () ListLongMap!14635)

(assert (=> b!1073887 (= e!613583 e!613587)))

(declare-fun b!1073888 () Bool)

(declare-fun e!613581 () Unit!35203)

(declare-fun Unit!35205 () Unit!35203)

(assert (=> b!1073888 (= e!613581 Unit!35205)))

(declare-fun call!45315 () ListLongMap!14635)

(declare-fun bm!45307 () Bool)

(declare-fun call!45316 () ListLongMap!14635)

(declare-fun call!45314 () ListLongMap!14635)

(declare-fun c!107781 () Bool)

(declare-fun call!45311 () ListLongMap!14635)

(declare-fun +!3239 (ListLongMap!14635 tuple2!16666) ListLongMap!14635)

(assert (=> bm!45307 (= call!45311 (+!3239 (ite c!107781 call!45314 (ite c!107780 call!45315 call!45316)) (ite (or c!107781 c!107780) (tuple2!16667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1073889 () Bool)

(declare-fun e!613591 () Bool)

(assert (=> b!1073889 (= e!613586 e!613591)))

(declare-fun res!716181 () Bool)

(declare-fun call!45310 () Bool)

(assert (=> b!1073889 (= res!716181 call!45310)))

(assert (=> b!1073889 (=> (not res!716181) (not e!613591))))

(declare-fun b!1073890 () Bool)

(declare-fun call!45313 () ListLongMap!14635)

(assert (=> b!1073890 (= e!613583 call!45313)))

(declare-fun bm!45308 () Bool)

(assert (=> bm!45308 (= call!45314 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45309 () Bool)

(assert (=> bm!45309 (= call!45313 call!45311)))

(declare-fun b!1073891 () Bool)

(declare-fun lt!476178 () ListLongMap!14635)

(declare-fun apply!927 (ListLongMap!14635 (_ BitVec 64)) V!39769)

(assert (=> b!1073891 (= e!613591 (= (apply!927 lt!476178 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1073892 () Bool)

(declare-fun e!613580 () Bool)

(declare-fun e!613584 () Bool)

(assert (=> b!1073892 (= e!613580 e!613584)))

(declare-fun res!716180 () Bool)

(assert (=> b!1073892 (=> (not res!716180) (not e!613584))))

(assert (=> b!1073892 (= res!716180 (contains!6301 lt!476178 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073892 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun b!1073893 () Bool)

(declare-fun e!613582 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1073893 (= e!613582 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129305 () Bool)

(assert (=> d!129305 e!613579))

(declare-fun res!716174 () Bool)

(assert (=> d!129305 (=> (not res!716174) (not e!613579))))

(assert (=> d!129305 (= res!716174 (or (bvsge #b00000000000000000000000000000000 (size!33653 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))))

(declare-fun lt!476190 () ListLongMap!14635)

(assert (=> d!129305 (= lt!476178 lt!476190)))

(declare-fun lt!476174 () Unit!35203)

(assert (=> d!129305 (= lt!476174 e!613581)))

(declare-fun c!107785 () Bool)

(declare-fun e!613589 () Bool)

(assert (=> d!129305 (= c!107785 e!613589)))

(declare-fun res!716177 () Bool)

(assert (=> d!129305 (=> (not res!716177) (not e!613589))))

(assert (=> d!129305 (= res!716177 (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(assert (=> d!129305 (= lt!476190 e!613585)))

(assert (=> d!129305 (= c!107781 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129305 (validMask!0 mask!1515)))

(assert (=> d!129305 (= (getCurrentListMap!4106 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476178)))

(declare-fun b!1073894 () Bool)

(declare-fun e!613590 () Bool)

(declare-fun call!45312 () Bool)

(assert (=> b!1073894 (= e!613590 (not call!45312))))

(declare-fun b!1073895 () Bool)

(assert (=> b!1073895 (= e!613587 call!45313)))

(declare-fun b!1073896 () Bool)

(declare-fun res!716179 () Bool)

(assert (=> b!1073896 (=> (not res!716179) (not e!613579))))

(assert (=> b!1073896 (= res!716179 e!613580)))

(declare-fun res!716173 () Bool)

(assert (=> b!1073896 (=> res!716173 e!613580)))

(assert (=> b!1073896 (= res!716173 (not e!613582))))

(declare-fun res!716176 () Bool)

(assert (=> b!1073896 (=> (not res!716176) (not e!613582))))

(assert (=> b!1073896 (= res!716176 (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun b!1073897 () Bool)

(assert (=> b!1073897 (= e!613589 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073898 () Bool)

(declare-fun res!716175 () Bool)

(assert (=> b!1073898 (=> (not res!716175) (not e!613579))))

(assert (=> b!1073898 (= res!716175 e!613590)))

(declare-fun c!107784 () Bool)

(assert (=> b!1073898 (= c!107784 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45310 () Bool)

(assert (=> bm!45310 (= call!45315 call!45314)))

(declare-fun bm!45311 () Bool)

(assert (=> bm!45311 (= call!45312 (contains!6301 lt!476178 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073899 () Bool)

(assert (=> b!1073899 (= e!613585 (+!3239 call!45311 (tuple2!16667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1073900 () Bool)

(declare-fun e!613588 () Bool)

(assert (=> b!1073900 (= e!613588 (= (apply!927 lt!476178 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun bm!45312 () Bool)

(assert (=> bm!45312 (= call!45316 call!45315)))

(declare-fun b!1073901 () Bool)

(assert (=> b!1073901 (= e!613587 call!45316)))

(declare-fun b!1073902 () Bool)

(declare-fun get!17213 (ValueCell!12284 V!39769) V!39769)

(declare-fun dynLambda!2026 (Int (_ BitVec 64)) V!39769)

(assert (=> b!1073902 (= e!613584 (= (apply!927 lt!476178 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)) (get!17213 (select (arr!33116 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1073902 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33654 _values!955)))))

(assert (=> b!1073902 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun bm!45313 () Bool)

(assert (=> bm!45313 (= call!45310 (contains!6301 lt!476178 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073903 () Bool)

(assert (=> b!1073903 (= e!613586 (not call!45310))))

(declare-fun b!1073904 () Bool)

(declare-fun lt!476192 () Unit!35203)

(assert (=> b!1073904 (= e!613581 lt!476192)))

(declare-fun lt!476181 () ListLongMap!14635)

(assert (=> b!1073904 (= lt!476181 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476182 () (_ BitVec 64))

(assert (=> b!1073904 (= lt!476182 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476193 () (_ BitVec 64))

(assert (=> b!1073904 (= lt!476193 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476187 () Unit!35203)

(declare-fun addStillContains!640 (ListLongMap!14635 (_ BitVec 64) V!39769 (_ BitVec 64)) Unit!35203)

(assert (=> b!1073904 (= lt!476187 (addStillContains!640 lt!476181 lt!476182 zeroValueAfter!47 lt!476193))))

(assert (=> b!1073904 (contains!6301 (+!3239 lt!476181 (tuple2!16667 lt!476182 zeroValueAfter!47)) lt!476193)))

(declare-fun lt!476177 () Unit!35203)

(assert (=> b!1073904 (= lt!476177 lt!476187)))

(declare-fun lt!476183 () ListLongMap!14635)

(assert (=> b!1073904 (= lt!476183 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476194 () (_ BitVec 64))

(assert (=> b!1073904 (= lt!476194 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476175 () (_ BitVec 64))

(assert (=> b!1073904 (= lt!476175 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476179 () Unit!35203)

(declare-fun addApplyDifferent!496 (ListLongMap!14635 (_ BitVec 64) V!39769 (_ BitVec 64)) Unit!35203)

(assert (=> b!1073904 (= lt!476179 (addApplyDifferent!496 lt!476183 lt!476194 minValue!907 lt!476175))))

(assert (=> b!1073904 (= (apply!927 (+!3239 lt!476183 (tuple2!16667 lt!476194 minValue!907)) lt!476175) (apply!927 lt!476183 lt!476175))))

(declare-fun lt!476189 () Unit!35203)

(assert (=> b!1073904 (= lt!476189 lt!476179)))

(declare-fun lt!476191 () ListLongMap!14635)

(assert (=> b!1073904 (= lt!476191 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476176 () (_ BitVec 64))

(assert (=> b!1073904 (= lt!476176 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476180 () (_ BitVec 64))

(assert (=> b!1073904 (= lt!476180 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476186 () Unit!35203)

(assert (=> b!1073904 (= lt!476186 (addApplyDifferent!496 lt!476191 lt!476176 zeroValueAfter!47 lt!476180))))

(assert (=> b!1073904 (= (apply!927 (+!3239 lt!476191 (tuple2!16667 lt!476176 zeroValueAfter!47)) lt!476180) (apply!927 lt!476191 lt!476180))))

(declare-fun lt!476188 () Unit!35203)

(assert (=> b!1073904 (= lt!476188 lt!476186)))

(declare-fun lt!476173 () ListLongMap!14635)

(assert (=> b!1073904 (= lt!476173 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476184 () (_ BitVec 64))

(assert (=> b!1073904 (= lt!476184 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476185 () (_ BitVec 64))

(assert (=> b!1073904 (= lt!476185 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073904 (= lt!476192 (addApplyDifferent!496 lt!476173 lt!476184 minValue!907 lt!476185))))

(assert (=> b!1073904 (= (apply!927 (+!3239 lt!476173 (tuple2!16667 lt!476184 minValue!907)) lt!476185) (apply!927 lt!476173 lt!476185))))

(declare-fun b!1073905 () Bool)

(assert (=> b!1073905 (= e!613590 e!613588)))

(declare-fun res!716178 () Bool)

(assert (=> b!1073905 (= res!716178 call!45312)))

(assert (=> b!1073905 (=> (not res!716178) (not e!613588))))

(assert (= (and d!129305 c!107781) b!1073899))

(assert (= (and d!129305 (not c!107781)) b!1073886))

(assert (= (and b!1073886 c!107780) b!1073890))

(assert (= (and b!1073886 (not c!107780)) b!1073887))

(assert (= (and b!1073887 c!107782) b!1073895))

(assert (= (and b!1073887 (not c!107782)) b!1073901))

(assert (= (or b!1073895 b!1073901) bm!45312))

(assert (= (or b!1073890 bm!45312) bm!45310))

(assert (= (or b!1073890 b!1073895) bm!45309))

(assert (= (or b!1073899 bm!45310) bm!45308))

(assert (= (or b!1073899 bm!45309) bm!45307))

(assert (= (and d!129305 res!716177) b!1073897))

(assert (= (and d!129305 c!107785) b!1073904))

(assert (= (and d!129305 (not c!107785)) b!1073888))

(assert (= (and d!129305 res!716174) b!1073896))

(assert (= (and b!1073896 res!716176) b!1073893))

(assert (= (and b!1073896 (not res!716173)) b!1073892))

(assert (= (and b!1073892 res!716180) b!1073902))

(assert (= (and b!1073896 res!716179) b!1073898))

(assert (= (and b!1073898 c!107784) b!1073905))

(assert (= (and b!1073898 (not c!107784)) b!1073894))

(assert (= (and b!1073905 res!716178) b!1073900))

(assert (= (or b!1073905 b!1073894) bm!45311))

(assert (= (and b!1073898 res!716175) b!1073885))

(assert (= (and b!1073885 c!107783) b!1073889))

(assert (= (and b!1073885 (not c!107783)) b!1073903))

(assert (= (and b!1073889 res!716181) b!1073891))

(assert (= (or b!1073889 b!1073903) bm!45313))

(declare-fun b_lambda!16739 () Bool)

(assert (=> (not b_lambda!16739) (not b!1073902)))

(declare-fun t!32526 () Bool)

(declare-fun tb!7155 () Bool)

(assert (=> (and start!94984 (= defaultEntry!963 defaultEntry!963) t!32526) tb!7155))

(declare-fun result!14789 () Bool)

(assert (=> tb!7155 (= result!14789 tp_is_empty!25975)))

(assert (=> b!1073902 t!32526))

(declare-fun b_and!35017 () Bool)

(assert (= b_and!35011 (and (=> t!32526 result!14789) b_and!35017)))

(declare-fun m!992267 () Bool)

(assert (=> b!1073904 m!992267))

(declare-fun m!992269 () Bool)

(assert (=> b!1073904 m!992269))

(declare-fun m!992271 () Bool)

(assert (=> b!1073904 m!992271))

(declare-fun m!992273 () Bool)

(assert (=> b!1073904 m!992273))

(assert (=> b!1073904 m!992207))

(declare-fun m!992275 () Bool)

(assert (=> b!1073904 m!992275))

(declare-fun m!992277 () Bool)

(assert (=> b!1073904 m!992277))

(declare-fun m!992279 () Bool)

(assert (=> b!1073904 m!992279))

(declare-fun m!992281 () Bool)

(assert (=> b!1073904 m!992281))

(declare-fun m!992283 () Bool)

(assert (=> b!1073904 m!992283))

(declare-fun m!992285 () Bool)

(assert (=> b!1073904 m!992285))

(declare-fun m!992287 () Bool)

(assert (=> b!1073904 m!992287))

(declare-fun m!992289 () Bool)

(assert (=> b!1073904 m!992289))

(assert (=> b!1073904 m!992271))

(declare-fun m!992291 () Bool)

(assert (=> b!1073904 m!992291))

(declare-fun m!992293 () Bool)

(assert (=> b!1073904 m!992293))

(declare-fun m!992295 () Bool)

(assert (=> b!1073904 m!992295))

(assert (=> b!1073904 m!992293))

(assert (=> b!1073904 m!992287))

(assert (=> b!1073904 m!992283))

(declare-fun m!992297 () Bool)

(assert (=> b!1073904 m!992297))

(assert (=> d!129305 m!992185))

(declare-fun m!992299 () Bool)

(assert (=> b!1073891 m!992299))

(declare-fun m!992301 () Bool)

(assert (=> b!1073899 m!992301))

(declare-fun m!992303 () Bool)

(assert (=> bm!45307 m!992303))

(assert (=> b!1073892 m!992267))

(assert (=> b!1073892 m!992267))

(declare-fun m!992305 () Bool)

(assert (=> b!1073892 m!992305))

(declare-fun m!992307 () Bool)

(assert (=> bm!45313 m!992307))

(assert (=> bm!45308 m!992207))

(assert (=> b!1073897 m!992267))

(assert (=> b!1073897 m!992267))

(declare-fun m!992309 () Bool)

(assert (=> b!1073897 m!992309))

(declare-fun m!992311 () Bool)

(assert (=> b!1073900 m!992311))

(assert (=> b!1073902 m!992267))

(declare-fun m!992313 () Bool)

(assert (=> b!1073902 m!992313))

(assert (=> b!1073902 m!992313))

(declare-fun m!992315 () Bool)

(assert (=> b!1073902 m!992315))

(declare-fun m!992317 () Bool)

(assert (=> b!1073902 m!992317))

(assert (=> b!1073902 m!992267))

(declare-fun m!992319 () Bool)

(assert (=> b!1073902 m!992319))

(assert (=> b!1073902 m!992315))

(assert (=> b!1073893 m!992267))

(assert (=> b!1073893 m!992267))

(assert (=> b!1073893 m!992309))

(declare-fun m!992321 () Bool)

(assert (=> bm!45311 m!992321))

(assert (=> b!1073780 d!129305))

(declare-fun d!129307 () Bool)

(declare-fun lt!476197 () ListLongMap!14635)

(assert (=> d!129307 (not (contains!6301 lt!476197 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!75 (List!23191 (_ BitVec 64)) List!23191)

(assert (=> d!129307 (= lt!476197 (ListLongMap!14636 (removeStrictlySorted!75 (toList!7333 lt!476089) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129307 (= (-!691 lt!476089 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476197)))

(declare-fun bs!31626 () Bool)

(assert (= bs!31626 d!129307))

(declare-fun m!992323 () Bool)

(assert (=> bs!31626 m!992323))

(declare-fun m!992325 () Bool)

(assert (=> bs!31626 m!992325))

(assert (=> b!1073780 d!129307))

(declare-fun d!129309 () Bool)

(assert (=> d!129309 (= (-!691 lt!476089 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476089)))

(declare-fun lt!476200 () Unit!35203)

(declare-fun choose!1755 (ListLongMap!14635 (_ BitVec 64)) Unit!35203)

(assert (=> d!129309 (= lt!476200 (choose!1755 lt!476089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129309 (not (contains!6301 lt!476089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129309 (= (removeNotPresentStillSame!72 lt!476089 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476200)))

(declare-fun bs!31627 () Bool)

(assert (= bs!31627 d!129309))

(assert (=> bs!31627 m!992193))

(declare-fun m!992327 () Bool)

(assert (=> bs!31627 m!992327))

(assert (=> bs!31627 m!992197))

(assert (=> b!1073780 d!129309))

(declare-fun b!1073916 () Bool)

(declare-fun e!613599 () Bool)

(declare-fun e!613600 () Bool)

(assert (=> b!1073916 (= e!613599 e!613600)))

(declare-fun c!107788 () Bool)

(assert (=> b!1073916 (= c!107788 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129311 () Bool)

(declare-fun res!716186 () Bool)

(assert (=> d!129311 (=> res!716186 e!613599)))

(assert (=> d!129311 (= res!716186 (bvsge #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(assert (=> d!129311 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!613599)))

(declare-fun bm!45316 () Bool)

(declare-fun call!45319 () Bool)

(assert (=> bm!45316 (= call!45319 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1073917 () Bool)

(assert (=> b!1073917 (= e!613600 call!45319)))

(declare-fun b!1073918 () Bool)

(declare-fun e!613598 () Bool)

(assert (=> b!1073918 (= e!613598 call!45319)))

(declare-fun b!1073919 () Bool)

(assert (=> b!1073919 (= e!613600 e!613598)))

(declare-fun lt!476208 () (_ BitVec 64))

(assert (=> b!1073919 (= lt!476208 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476207 () Unit!35203)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68846 (_ BitVec 64) (_ BitVec 32)) Unit!35203)

(assert (=> b!1073919 (= lt!476207 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!476208 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1073919 (arrayContainsKey!0 _keys!1163 lt!476208 #b00000000000000000000000000000000)))

(declare-fun lt!476209 () Unit!35203)

(assert (=> b!1073919 (= lt!476209 lt!476207)))

(declare-fun res!716187 () Bool)

(declare-datatypes ((SeekEntryResult!9886 0))(
  ( (MissingZero!9886 (index!41915 (_ BitVec 32))) (Found!9886 (index!41916 (_ BitVec 32))) (Intermediate!9886 (undefined!10698 Bool) (index!41917 (_ BitVec 32)) (x!96262 (_ BitVec 32))) (Undefined!9886) (MissingVacant!9886 (index!41918 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68846 (_ BitVec 32)) SeekEntryResult!9886)

(assert (=> b!1073919 (= res!716187 (= (seekEntryOrOpen!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9886 #b00000000000000000000000000000000)))))

(assert (=> b!1073919 (=> (not res!716187) (not e!613598))))

(assert (= (and d!129311 (not res!716186)) b!1073916))

(assert (= (and b!1073916 c!107788) b!1073919))

(assert (= (and b!1073916 (not c!107788)) b!1073917))

(assert (= (and b!1073919 res!716187) b!1073918))

(assert (= (or b!1073918 b!1073917) bm!45316))

(assert (=> b!1073916 m!992267))

(assert (=> b!1073916 m!992267))

(assert (=> b!1073916 m!992309))

(declare-fun m!992329 () Bool)

(assert (=> bm!45316 m!992329))

(assert (=> b!1073919 m!992267))

(declare-fun m!992331 () Bool)

(assert (=> b!1073919 m!992331))

(declare-fun m!992333 () Bool)

(assert (=> b!1073919 m!992333))

(assert (=> b!1073919 m!992267))

(declare-fun m!992335 () Bool)

(assert (=> b!1073919 m!992335))

(assert (=> b!1073788 d!129311))

(declare-fun d!129313 () Bool)

(declare-fun res!716194 () Bool)

(declare-fun e!613610 () Bool)

(assert (=> d!129313 (=> res!716194 e!613610)))

(assert (=> d!129313 (= res!716194 (bvsge #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(assert (=> d!129313 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23189) e!613610)))

(declare-fun b!1073930 () Bool)

(declare-fun e!613609 () Bool)

(declare-fun contains!6302 (List!23192 (_ BitVec 64)) Bool)

(assert (=> b!1073930 (= e!613609 (contains!6302 Nil!23189 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073931 () Bool)

(declare-fun e!613612 () Bool)

(declare-fun e!613611 () Bool)

(assert (=> b!1073931 (= e!613612 e!613611)))

(declare-fun c!107791 () Bool)

(assert (=> b!1073931 (= c!107791 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073932 () Bool)

(declare-fun call!45322 () Bool)

(assert (=> b!1073932 (= e!613611 call!45322)))

(declare-fun b!1073933 () Bool)

(assert (=> b!1073933 (= e!613610 e!613612)))

(declare-fun res!716195 () Bool)

(assert (=> b!1073933 (=> (not res!716195) (not e!613612))))

(assert (=> b!1073933 (= res!716195 (not e!613609))))

(declare-fun res!716196 () Bool)

(assert (=> b!1073933 (=> (not res!716196) (not e!613609))))

(assert (=> b!1073933 (= res!716196 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073934 () Bool)

(assert (=> b!1073934 (= e!613611 call!45322)))

(declare-fun bm!45319 () Bool)

(assert (=> bm!45319 (= call!45322 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107791 (Cons!23188 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000) Nil!23189) Nil!23189)))))

(assert (= (and d!129313 (not res!716194)) b!1073933))

(assert (= (and b!1073933 res!716196) b!1073930))

(assert (= (and b!1073933 res!716195) b!1073931))

(assert (= (and b!1073931 c!107791) b!1073934))

(assert (= (and b!1073931 (not c!107791)) b!1073932))

(assert (= (or b!1073934 b!1073932) bm!45319))

(assert (=> b!1073930 m!992267))

(assert (=> b!1073930 m!992267))

(declare-fun m!992337 () Bool)

(assert (=> b!1073930 m!992337))

(assert (=> b!1073931 m!992267))

(assert (=> b!1073931 m!992267))

(assert (=> b!1073931 m!992309))

(assert (=> b!1073933 m!992267))

(assert (=> b!1073933 m!992267))

(assert (=> b!1073933 m!992309))

(assert (=> bm!45319 m!992267))

(declare-fun m!992339 () Bool)

(assert (=> bm!45319 m!992339))

(assert (=> b!1073783 d!129313))

(declare-fun d!129315 () Bool)

(declare-fun e!613618 () Bool)

(assert (=> d!129315 e!613618))

(declare-fun res!716199 () Bool)

(assert (=> d!129315 (=> res!716199 e!613618)))

(declare-fun lt!476219 () Bool)

(assert (=> d!129315 (= res!716199 (not lt!476219))))

(declare-fun lt!476221 () Bool)

(assert (=> d!129315 (= lt!476219 lt!476221)))

(declare-fun lt!476218 () Unit!35203)

(declare-fun e!613617 () Unit!35203)

(assert (=> d!129315 (= lt!476218 e!613617)))

(declare-fun c!107794 () Bool)

(assert (=> d!129315 (= c!107794 lt!476221)))

(declare-fun containsKey!577 (List!23191 (_ BitVec 64)) Bool)

(assert (=> d!129315 (= lt!476221 (containsKey!577 (toList!7333 lt!476089) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129315 (= (contains!6301 lt!476089 #b0000000000000000000000000000000000000000000000000000000000000000) lt!476219)))

(declare-fun b!1073941 () Bool)

(declare-fun lt!476220 () Unit!35203)

(assert (=> b!1073941 (= e!613617 lt!476220)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!409 (List!23191 (_ BitVec 64)) Unit!35203)

(assert (=> b!1073941 (= lt!476220 (lemmaContainsKeyImpliesGetValueByKeyDefined!409 (toList!7333 lt!476089) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!659 0))(
  ( (Some!658 (v!15659 V!39769)) (None!657) )
))
(declare-fun isDefined!452 (Option!659) Bool)

(declare-fun getValueByKey!608 (List!23191 (_ BitVec 64)) Option!659)

(assert (=> b!1073941 (isDefined!452 (getValueByKey!608 (toList!7333 lt!476089) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073942 () Bool)

(declare-fun Unit!35206 () Unit!35203)

(assert (=> b!1073942 (= e!613617 Unit!35206)))

(declare-fun b!1073943 () Bool)

(assert (=> b!1073943 (= e!613618 (isDefined!452 (getValueByKey!608 (toList!7333 lt!476089) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!129315 c!107794) b!1073941))

(assert (= (and d!129315 (not c!107794)) b!1073942))

(assert (= (and d!129315 (not res!716199)) b!1073943))

(declare-fun m!992341 () Bool)

(assert (=> d!129315 m!992341))

(declare-fun m!992343 () Bool)

(assert (=> b!1073941 m!992343))

(declare-fun m!992345 () Bool)

(assert (=> b!1073941 m!992345))

(assert (=> b!1073941 m!992345))

(declare-fun m!992347 () Bool)

(assert (=> b!1073941 m!992347))

(assert (=> b!1073943 m!992345))

(assert (=> b!1073943 m!992345))

(assert (=> b!1073943 m!992347))

(assert (=> b!1073787 d!129315))

(declare-fun b!1073944 () Bool)

(declare-fun e!613619 () Bool)

(declare-fun e!613626 () Bool)

(assert (=> b!1073944 (= e!613619 e!613626)))

(declare-fun c!107798 () Bool)

(assert (=> b!1073944 (= c!107798 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1073945 () Bool)

(declare-fun e!613625 () ListLongMap!14635)

(declare-fun e!613623 () ListLongMap!14635)

(assert (=> b!1073945 (= e!613625 e!613623)))

(declare-fun c!107795 () Bool)

(assert (=> b!1073945 (= c!107795 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1073946 () Bool)

(declare-fun c!107797 () Bool)

(assert (=> b!1073946 (= c!107797 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!613627 () ListLongMap!14635)

(assert (=> b!1073946 (= e!613623 e!613627)))

(declare-fun b!1073947 () Bool)

(declare-fun e!613621 () Unit!35203)

(declare-fun Unit!35207 () Unit!35203)

(assert (=> b!1073947 (= e!613621 Unit!35207)))

(declare-fun c!107796 () Bool)

(declare-fun bm!45320 () Bool)

(declare-fun call!45324 () ListLongMap!14635)

(declare-fun call!45327 () ListLongMap!14635)

(declare-fun call!45329 () ListLongMap!14635)

(declare-fun call!45328 () ListLongMap!14635)

(assert (=> bm!45320 (= call!45324 (+!3239 (ite c!107796 call!45327 (ite c!107795 call!45328 call!45329)) (ite (or c!107796 c!107795) (tuple2!16667 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1073948 () Bool)

(declare-fun e!613631 () Bool)

(assert (=> b!1073948 (= e!613626 e!613631)))

(declare-fun res!716208 () Bool)

(declare-fun call!45323 () Bool)

(assert (=> b!1073948 (= res!716208 call!45323)))

(assert (=> b!1073948 (=> (not res!716208) (not e!613631))))

(declare-fun b!1073949 () Bool)

(declare-fun call!45326 () ListLongMap!14635)

(assert (=> b!1073949 (= e!613623 call!45326)))

(declare-fun bm!45321 () Bool)

(assert (=> bm!45321 (= call!45327 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45322 () Bool)

(assert (=> bm!45322 (= call!45326 call!45324)))

(declare-fun b!1073950 () Bool)

(declare-fun lt!476227 () ListLongMap!14635)

(assert (=> b!1073950 (= e!613631 (= (apply!927 lt!476227 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1073951 () Bool)

(declare-fun e!613620 () Bool)

(declare-fun e!613624 () Bool)

(assert (=> b!1073951 (= e!613620 e!613624)))

(declare-fun res!716207 () Bool)

(assert (=> b!1073951 (=> (not res!716207) (not e!613624))))

(assert (=> b!1073951 (= res!716207 (contains!6301 lt!476227 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073951 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun b!1073952 () Bool)

(declare-fun e!613622 () Bool)

(assert (=> b!1073952 (= e!613622 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129317 () Bool)

(assert (=> d!129317 e!613619))

(declare-fun res!716201 () Bool)

(assert (=> d!129317 (=> (not res!716201) (not e!613619))))

(assert (=> d!129317 (= res!716201 (or (bvsge #b00000000000000000000000000000000 (size!33653 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))))

(declare-fun lt!476239 () ListLongMap!14635)

(assert (=> d!129317 (= lt!476227 lt!476239)))

(declare-fun lt!476223 () Unit!35203)

(assert (=> d!129317 (= lt!476223 e!613621)))

(declare-fun c!107800 () Bool)

(declare-fun e!613629 () Bool)

(assert (=> d!129317 (= c!107800 e!613629)))

(declare-fun res!716204 () Bool)

(assert (=> d!129317 (=> (not res!716204) (not e!613629))))

(assert (=> d!129317 (= res!716204 (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(assert (=> d!129317 (= lt!476239 e!613625)))

(assert (=> d!129317 (= c!107796 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129317 (validMask!0 mask!1515)))

(assert (=> d!129317 (= (getCurrentListMap!4106 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476227)))

(declare-fun b!1073953 () Bool)

(declare-fun e!613630 () Bool)

(declare-fun call!45325 () Bool)

(assert (=> b!1073953 (= e!613630 (not call!45325))))

(declare-fun b!1073954 () Bool)

(assert (=> b!1073954 (= e!613627 call!45326)))

(declare-fun b!1073955 () Bool)

(declare-fun res!716206 () Bool)

(assert (=> b!1073955 (=> (not res!716206) (not e!613619))))

(assert (=> b!1073955 (= res!716206 e!613620)))

(declare-fun res!716200 () Bool)

(assert (=> b!1073955 (=> res!716200 e!613620)))

(assert (=> b!1073955 (= res!716200 (not e!613622))))

(declare-fun res!716203 () Bool)

(assert (=> b!1073955 (=> (not res!716203) (not e!613622))))

(assert (=> b!1073955 (= res!716203 (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun b!1073956 () Bool)

(assert (=> b!1073956 (= e!613629 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073957 () Bool)

(declare-fun res!716202 () Bool)

(assert (=> b!1073957 (=> (not res!716202) (not e!613619))))

(assert (=> b!1073957 (= res!716202 e!613630)))

(declare-fun c!107799 () Bool)

(assert (=> b!1073957 (= c!107799 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45323 () Bool)

(assert (=> bm!45323 (= call!45328 call!45327)))

(declare-fun bm!45324 () Bool)

(assert (=> bm!45324 (= call!45325 (contains!6301 lt!476227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073958 () Bool)

(assert (=> b!1073958 (= e!613625 (+!3239 call!45324 (tuple2!16667 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1073959 () Bool)

(declare-fun e!613628 () Bool)

(assert (=> b!1073959 (= e!613628 (= (apply!927 lt!476227 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun bm!45325 () Bool)

(assert (=> bm!45325 (= call!45329 call!45328)))

(declare-fun b!1073960 () Bool)

(assert (=> b!1073960 (= e!613627 call!45329)))

(declare-fun b!1073961 () Bool)

(assert (=> b!1073961 (= e!613624 (= (apply!927 lt!476227 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)) (get!17213 (select (arr!33116 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1073961 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33654 _values!955)))))

(assert (=> b!1073961 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun bm!45326 () Bool)

(assert (=> bm!45326 (= call!45323 (contains!6301 lt!476227 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1073962 () Bool)

(assert (=> b!1073962 (= e!613626 (not call!45323))))

(declare-fun b!1073963 () Bool)

(declare-fun lt!476241 () Unit!35203)

(assert (=> b!1073963 (= e!613621 lt!476241)))

(declare-fun lt!476230 () ListLongMap!14635)

(assert (=> b!1073963 (= lt!476230 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476231 () (_ BitVec 64))

(assert (=> b!1073963 (= lt!476231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476242 () (_ BitVec 64))

(assert (=> b!1073963 (= lt!476242 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476236 () Unit!35203)

(assert (=> b!1073963 (= lt!476236 (addStillContains!640 lt!476230 lt!476231 zeroValueBefore!47 lt!476242))))

(assert (=> b!1073963 (contains!6301 (+!3239 lt!476230 (tuple2!16667 lt!476231 zeroValueBefore!47)) lt!476242)))

(declare-fun lt!476226 () Unit!35203)

(assert (=> b!1073963 (= lt!476226 lt!476236)))

(declare-fun lt!476232 () ListLongMap!14635)

(assert (=> b!1073963 (= lt!476232 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476243 () (_ BitVec 64))

(assert (=> b!1073963 (= lt!476243 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476224 () (_ BitVec 64))

(assert (=> b!1073963 (= lt!476224 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476228 () Unit!35203)

(assert (=> b!1073963 (= lt!476228 (addApplyDifferent!496 lt!476232 lt!476243 minValue!907 lt!476224))))

(assert (=> b!1073963 (= (apply!927 (+!3239 lt!476232 (tuple2!16667 lt!476243 minValue!907)) lt!476224) (apply!927 lt!476232 lt!476224))))

(declare-fun lt!476238 () Unit!35203)

(assert (=> b!1073963 (= lt!476238 lt!476228)))

(declare-fun lt!476240 () ListLongMap!14635)

(assert (=> b!1073963 (= lt!476240 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476225 () (_ BitVec 64))

(assert (=> b!1073963 (= lt!476225 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476229 () (_ BitVec 64))

(assert (=> b!1073963 (= lt!476229 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!476235 () Unit!35203)

(assert (=> b!1073963 (= lt!476235 (addApplyDifferent!496 lt!476240 lt!476225 zeroValueBefore!47 lt!476229))))

(assert (=> b!1073963 (= (apply!927 (+!3239 lt!476240 (tuple2!16667 lt!476225 zeroValueBefore!47)) lt!476229) (apply!927 lt!476240 lt!476229))))

(declare-fun lt!476237 () Unit!35203)

(assert (=> b!1073963 (= lt!476237 lt!476235)))

(declare-fun lt!476222 () ListLongMap!14635)

(assert (=> b!1073963 (= lt!476222 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476233 () (_ BitVec 64))

(assert (=> b!1073963 (= lt!476233 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!476234 () (_ BitVec 64))

(assert (=> b!1073963 (= lt!476234 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073963 (= lt!476241 (addApplyDifferent!496 lt!476222 lt!476233 minValue!907 lt!476234))))

(assert (=> b!1073963 (= (apply!927 (+!3239 lt!476222 (tuple2!16667 lt!476233 minValue!907)) lt!476234) (apply!927 lt!476222 lt!476234))))

(declare-fun b!1073964 () Bool)

(assert (=> b!1073964 (= e!613630 e!613628)))

(declare-fun res!716205 () Bool)

(assert (=> b!1073964 (= res!716205 call!45325)))

(assert (=> b!1073964 (=> (not res!716205) (not e!613628))))

(assert (= (and d!129317 c!107796) b!1073958))

(assert (= (and d!129317 (not c!107796)) b!1073945))

(assert (= (and b!1073945 c!107795) b!1073949))

(assert (= (and b!1073945 (not c!107795)) b!1073946))

(assert (= (and b!1073946 c!107797) b!1073954))

(assert (= (and b!1073946 (not c!107797)) b!1073960))

(assert (= (or b!1073954 b!1073960) bm!45325))

(assert (= (or b!1073949 bm!45325) bm!45323))

(assert (= (or b!1073949 b!1073954) bm!45322))

(assert (= (or b!1073958 bm!45323) bm!45321))

(assert (= (or b!1073958 bm!45322) bm!45320))

(assert (= (and d!129317 res!716204) b!1073956))

(assert (= (and d!129317 c!107800) b!1073963))

(assert (= (and d!129317 (not c!107800)) b!1073947))

(assert (= (and d!129317 res!716201) b!1073955))

(assert (= (and b!1073955 res!716203) b!1073952))

(assert (= (and b!1073955 (not res!716200)) b!1073951))

(assert (= (and b!1073951 res!716207) b!1073961))

(assert (= (and b!1073955 res!716206) b!1073957))

(assert (= (and b!1073957 c!107799) b!1073964))

(assert (= (and b!1073957 (not c!107799)) b!1073953))

(assert (= (and b!1073964 res!716205) b!1073959))

(assert (= (or b!1073964 b!1073953) bm!45324))

(assert (= (and b!1073957 res!716202) b!1073944))

(assert (= (and b!1073944 c!107798) b!1073948))

(assert (= (and b!1073944 (not c!107798)) b!1073962))

(assert (= (and b!1073948 res!716208) b!1073950))

(assert (= (or b!1073948 b!1073962) bm!45326))

(declare-fun b_lambda!16741 () Bool)

(assert (=> (not b_lambda!16741) (not b!1073961)))

(assert (=> b!1073961 t!32526))

(declare-fun b_and!35019 () Bool)

(assert (= b_and!35017 (and (=> t!32526 result!14789) b_and!35019)))

(assert (=> b!1073963 m!992267))

(declare-fun m!992349 () Bool)

(assert (=> b!1073963 m!992349))

(declare-fun m!992351 () Bool)

(assert (=> b!1073963 m!992351))

(declare-fun m!992353 () Bool)

(assert (=> b!1073963 m!992353))

(assert (=> b!1073963 m!992209))

(declare-fun m!992355 () Bool)

(assert (=> b!1073963 m!992355))

(declare-fun m!992357 () Bool)

(assert (=> b!1073963 m!992357))

(declare-fun m!992359 () Bool)

(assert (=> b!1073963 m!992359))

(declare-fun m!992361 () Bool)

(assert (=> b!1073963 m!992361))

(declare-fun m!992363 () Bool)

(assert (=> b!1073963 m!992363))

(declare-fun m!992365 () Bool)

(assert (=> b!1073963 m!992365))

(declare-fun m!992367 () Bool)

(assert (=> b!1073963 m!992367))

(declare-fun m!992369 () Bool)

(assert (=> b!1073963 m!992369))

(assert (=> b!1073963 m!992351))

(declare-fun m!992371 () Bool)

(assert (=> b!1073963 m!992371))

(declare-fun m!992373 () Bool)

(assert (=> b!1073963 m!992373))

(declare-fun m!992375 () Bool)

(assert (=> b!1073963 m!992375))

(assert (=> b!1073963 m!992373))

(assert (=> b!1073963 m!992367))

(assert (=> b!1073963 m!992363))

(declare-fun m!992377 () Bool)

(assert (=> b!1073963 m!992377))

(assert (=> d!129317 m!992185))

(declare-fun m!992379 () Bool)

(assert (=> b!1073950 m!992379))

(declare-fun m!992381 () Bool)

(assert (=> b!1073958 m!992381))

(declare-fun m!992383 () Bool)

(assert (=> bm!45320 m!992383))

(assert (=> b!1073951 m!992267))

(assert (=> b!1073951 m!992267))

(declare-fun m!992385 () Bool)

(assert (=> b!1073951 m!992385))

(declare-fun m!992387 () Bool)

(assert (=> bm!45326 m!992387))

(assert (=> bm!45321 m!992209))

(assert (=> b!1073956 m!992267))

(assert (=> b!1073956 m!992267))

(assert (=> b!1073956 m!992309))

(declare-fun m!992389 () Bool)

(assert (=> b!1073959 m!992389))

(assert (=> b!1073961 m!992267))

(assert (=> b!1073961 m!992313))

(assert (=> b!1073961 m!992313))

(assert (=> b!1073961 m!992315))

(assert (=> b!1073961 m!992317))

(assert (=> b!1073961 m!992267))

(declare-fun m!992391 () Bool)

(assert (=> b!1073961 m!992391))

(assert (=> b!1073961 m!992315))

(assert (=> b!1073952 m!992267))

(assert (=> b!1073952 m!992267))

(assert (=> b!1073952 m!992309))

(declare-fun m!992393 () Bool)

(assert (=> bm!45324 m!992393))

(assert (=> b!1073787 d!129317))

(declare-fun d!129319 () Bool)

(assert (=> d!129319 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94984 d!129319))

(declare-fun d!129321 () Bool)

(assert (=> d!129321 (= (array_inv!25620 _values!955) (bvsge (size!33654 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94984 d!129321))

(declare-fun d!129323 () Bool)

(assert (=> d!129323 (= (array_inv!25621 _keys!1163) (bvsge (size!33653 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94984 d!129323))

(declare-fun d!129325 () Bool)

(assert (=> d!129325 (= (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!476246 () Unit!35203)

(declare-fun choose!1756 (array!68846 array!68848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39769 V!39769 V!39769 V!39769 (_ BitVec 32) Int) Unit!35203)

(assert (=> d!129325 (= lt!476246 (choose!1756 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129325 (validMask!0 mask!1515)))

(assert (=> d!129325 (= (lemmaNoChangeToArrayThenSameMapNoExtras!885 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476246)))

(declare-fun bs!31628 () Bool)

(assert (= bs!31628 d!129325))

(assert (=> bs!31628 m!992209))

(assert (=> bs!31628 m!992207))

(declare-fun m!992395 () Bool)

(assert (=> bs!31628 m!992395))

(assert (=> bs!31628 m!992185))

(assert (=> b!1073785 d!129325))

(declare-fun b!1073989 () Bool)

(declare-fun e!613651 () ListLongMap!14635)

(declare-fun call!45332 () ListLongMap!14635)

(assert (=> b!1073989 (= e!613651 call!45332)))

(declare-fun b!1073990 () Bool)

(declare-fun lt!476267 () Unit!35203)

(declare-fun lt!476261 () Unit!35203)

(assert (=> b!1073990 (= lt!476267 lt!476261)))

(declare-fun lt!476266 () (_ BitVec 64))

(declare-fun lt!476263 () (_ BitVec 64))

(declare-fun lt!476262 () V!39769)

(declare-fun lt!476264 () ListLongMap!14635)

(assert (=> b!1073990 (not (contains!6301 (+!3239 lt!476264 (tuple2!16667 lt!476266 lt!476262)) lt!476263))))

(declare-fun addStillNotContains!263 (ListLongMap!14635 (_ BitVec 64) V!39769 (_ BitVec 64)) Unit!35203)

(assert (=> b!1073990 (= lt!476261 (addStillNotContains!263 lt!476264 lt!476266 lt!476262 lt!476263))))

(assert (=> b!1073990 (= lt!476263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1073990 (= lt!476262 (get!17213 (select (arr!33116 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1073990 (= lt!476266 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1073990 (= lt!476264 call!45332)))

(assert (=> b!1073990 (= e!613651 (+!3239 call!45332 (tuple2!16667 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000) (get!17213 (select (arr!33116 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1073991 () Bool)

(declare-fun e!613647 () Bool)

(assert (=> b!1073991 (= e!613647 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073991 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1073992 () Bool)

(declare-fun e!613646 () Bool)

(declare-fun e!613649 () Bool)

(assert (=> b!1073992 (= e!613646 e!613649)))

(declare-fun c!107809 () Bool)

(assert (=> b!1073992 (= c!107809 (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun d!129327 () Bool)

(declare-fun e!613652 () Bool)

(assert (=> d!129327 e!613652))

(declare-fun res!716218 () Bool)

(assert (=> d!129327 (=> (not res!716218) (not e!613652))))

(declare-fun lt!476265 () ListLongMap!14635)

(assert (=> d!129327 (= res!716218 (not (contains!6301 lt!476265 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!613650 () ListLongMap!14635)

(assert (=> d!129327 (= lt!476265 e!613650)))

(declare-fun c!107811 () Bool)

(assert (=> d!129327 (= c!107811 (bvsge #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(assert (=> d!129327 (validMask!0 mask!1515)))

(assert (=> d!129327 (= (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476265)))

(declare-fun b!1073993 () Bool)

(assert (=> b!1073993 (= e!613650 (ListLongMap!14636 Nil!23188))))

(declare-fun b!1073994 () Bool)

(assert (=> b!1073994 (= e!613652 e!613646)))

(declare-fun c!107812 () Bool)

(assert (=> b!1073994 (= c!107812 e!613647)))

(declare-fun res!716217 () Bool)

(assert (=> b!1073994 (=> (not res!716217) (not e!613647))))

(assert (=> b!1073994 (= res!716217 (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun b!1073995 () Bool)

(declare-fun isEmpty!957 (ListLongMap!14635) Bool)

(assert (=> b!1073995 (= e!613649 (isEmpty!957 lt!476265))))

(declare-fun b!1073996 () Bool)

(assert (=> b!1073996 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(assert (=> b!1073996 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33654 _values!955)))))

(declare-fun e!613648 () Bool)

(assert (=> b!1073996 (= e!613648 (= (apply!927 lt!476265 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)) (get!17213 (select (arr!33116 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1073997 () Bool)

(declare-fun res!716220 () Bool)

(assert (=> b!1073997 (=> (not res!716220) (not e!613652))))

(assert (=> b!1073997 (= res!716220 (not (contains!6301 lt!476265 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1073998 () Bool)

(assert (=> b!1073998 (= e!613650 e!613651)))

(declare-fun c!107810 () Bool)

(assert (=> b!1073998 (= c!107810 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1073999 () Bool)

(assert (=> b!1073999 (= e!613646 e!613648)))

(assert (=> b!1073999 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun res!716219 () Bool)

(assert (=> b!1073999 (= res!716219 (contains!6301 lt!476265 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1073999 (=> (not res!716219) (not e!613648))))

(declare-fun bm!45329 () Bool)

(assert (=> bm!45329 (= call!45332 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074000 () Bool)

(assert (=> b!1074000 (= e!613649 (= lt!476265 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(assert (= (and d!129327 c!107811) b!1073993))

(assert (= (and d!129327 (not c!107811)) b!1073998))

(assert (= (and b!1073998 c!107810) b!1073990))

(assert (= (and b!1073998 (not c!107810)) b!1073989))

(assert (= (or b!1073990 b!1073989) bm!45329))

(assert (= (and d!129327 res!716218) b!1073997))

(assert (= (and b!1073997 res!716220) b!1073994))

(assert (= (and b!1073994 res!716217) b!1073991))

(assert (= (and b!1073994 c!107812) b!1073999))

(assert (= (and b!1073994 (not c!107812)) b!1073992))

(assert (= (and b!1073999 res!716219) b!1073996))

(assert (= (and b!1073992 c!107809) b!1074000))

(assert (= (and b!1073992 (not c!107809)) b!1073995))

(declare-fun b_lambda!16743 () Bool)

(assert (=> (not b_lambda!16743) (not b!1073990)))

(assert (=> b!1073990 t!32526))

(declare-fun b_and!35021 () Bool)

(assert (= b_and!35019 (and (=> t!32526 result!14789) b_and!35021)))

(declare-fun b_lambda!16745 () Bool)

(assert (=> (not b_lambda!16745) (not b!1073996)))

(assert (=> b!1073996 t!32526))

(declare-fun b_and!35023 () Bool)

(assert (= b_and!35021 (and (=> t!32526 result!14789) b_and!35023)))

(declare-fun m!992397 () Bool)

(assert (=> b!1073995 m!992397))

(declare-fun m!992399 () Bool)

(assert (=> b!1074000 m!992399))

(declare-fun m!992401 () Bool)

(assert (=> d!129327 m!992401))

(assert (=> d!129327 m!992185))

(assert (=> b!1073991 m!992267))

(assert (=> b!1073991 m!992267))

(assert (=> b!1073991 m!992309))

(assert (=> b!1073998 m!992267))

(assert (=> b!1073998 m!992267))

(assert (=> b!1073998 m!992309))

(assert (=> b!1073996 m!992267))

(assert (=> b!1073996 m!992313))

(assert (=> b!1073996 m!992267))

(declare-fun m!992403 () Bool)

(assert (=> b!1073996 m!992403))

(assert (=> b!1073996 m!992315))

(assert (=> b!1073996 m!992313))

(assert (=> b!1073996 m!992315))

(assert (=> b!1073996 m!992317))

(declare-fun m!992405 () Bool)

(assert (=> b!1073990 m!992405))

(declare-fun m!992407 () Bool)

(assert (=> b!1073990 m!992407))

(assert (=> b!1073990 m!992405))

(assert (=> b!1073990 m!992267))

(assert (=> b!1073990 m!992313))

(declare-fun m!992409 () Bool)

(assert (=> b!1073990 m!992409))

(declare-fun m!992411 () Bool)

(assert (=> b!1073990 m!992411))

(assert (=> b!1073990 m!992315))

(assert (=> b!1073990 m!992313))

(assert (=> b!1073990 m!992315))

(assert (=> b!1073990 m!992317))

(declare-fun m!992413 () Bool)

(assert (=> b!1073997 m!992413))

(assert (=> bm!45329 m!992399))

(assert (=> b!1073999 m!992267))

(assert (=> b!1073999 m!992267))

(declare-fun m!992415 () Bool)

(assert (=> b!1073999 m!992415))

(assert (=> b!1073785 d!129327))

(declare-fun b!1074001 () Bool)

(declare-fun e!613658 () ListLongMap!14635)

(declare-fun call!45333 () ListLongMap!14635)

(assert (=> b!1074001 (= e!613658 call!45333)))

(declare-fun b!1074002 () Bool)

(declare-fun lt!476274 () Unit!35203)

(declare-fun lt!476268 () Unit!35203)

(assert (=> b!1074002 (= lt!476274 lt!476268)))

(declare-fun lt!476271 () ListLongMap!14635)

(declare-fun lt!476269 () V!39769)

(declare-fun lt!476270 () (_ BitVec 64))

(declare-fun lt!476273 () (_ BitVec 64))

(assert (=> b!1074002 (not (contains!6301 (+!3239 lt!476271 (tuple2!16667 lt!476273 lt!476269)) lt!476270))))

(assert (=> b!1074002 (= lt!476268 (addStillNotContains!263 lt!476271 lt!476273 lt!476269 lt!476270))))

(assert (=> b!1074002 (= lt!476270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1074002 (= lt!476269 (get!17213 (select (arr!33116 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1074002 (= lt!476273 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1074002 (= lt!476271 call!45333)))

(assert (=> b!1074002 (= e!613658 (+!3239 call!45333 (tuple2!16667 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000) (get!17213 (select (arr!33116 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1074003 () Bool)

(declare-fun e!613654 () Bool)

(assert (=> b!1074003 (= e!613654 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074003 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1074004 () Bool)

(declare-fun e!613653 () Bool)

(declare-fun e!613656 () Bool)

(assert (=> b!1074004 (= e!613653 e!613656)))

(declare-fun c!107813 () Bool)

(assert (=> b!1074004 (= c!107813 (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun d!129329 () Bool)

(declare-fun e!613659 () Bool)

(assert (=> d!129329 e!613659))

(declare-fun res!716222 () Bool)

(assert (=> d!129329 (=> (not res!716222) (not e!613659))))

(declare-fun lt!476272 () ListLongMap!14635)

(assert (=> d!129329 (= res!716222 (not (contains!6301 lt!476272 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!613657 () ListLongMap!14635)

(assert (=> d!129329 (= lt!476272 e!613657)))

(declare-fun c!107815 () Bool)

(assert (=> d!129329 (= c!107815 (bvsge #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(assert (=> d!129329 (validMask!0 mask!1515)))

(assert (=> d!129329 (= (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476272)))

(declare-fun b!1074005 () Bool)

(assert (=> b!1074005 (= e!613657 (ListLongMap!14636 Nil!23188))))

(declare-fun b!1074006 () Bool)

(assert (=> b!1074006 (= e!613659 e!613653)))

(declare-fun c!107816 () Bool)

(assert (=> b!1074006 (= c!107816 e!613654)))

(declare-fun res!716221 () Bool)

(assert (=> b!1074006 (=> (not res!716221) (not e!613654))))

(assert (=> b!1074006 (= res!716221 (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun b!1074007 () Bool)

(assert (=> b!1074007 (= e!613656 (isEmpty!957 lt!476272))))

(declare-fun b!1074008 () Bool)

(assert (=> b!1074008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(assert (=> b!1074008 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33654 _values!955)))))

(declare-fun e!613655 () Bool)

(assert (=> b!1074008 (= e!613655 (= (apply!927 lt!476272 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)) (get!17213 (select (arr!33116 _values!955) #b00000000000000000000000000000000) (dynLambda!2026 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1074009 () Bool)

(declare-fun res!716224 () Bool)

(assert (=> b!1074009 (=> (not res!716224) (not e!613659))))

(assert (=> b!1074009 (= res!716224 (not (contains!6301 lt!476272 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1074010 () Bool)

(assert (=> b!1074010 (= e!613657 e!613658)))

(declare-fun c!107814 () Bool)

(assert (=> b!1074010 (= c!107814 (validKeyInArray!0 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1074011 () Bool)

(assert (=> b!1074011 (= e!613653 e!613655)))

(assert (=> b!1074011 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33653 _keys!1163)))))

(declare-fun res!716223 () Bool)

(assert (=> b!1074011 (= res!716223 (contains!6301 lt!476272 (select (arr!33115 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1074011 (=> (not res!716223) (not e!613655))))

(declare-fun bm!45330 () Bool)

(assert (=> bm!45330 (= call!45333 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1074012 () Bool)

(assert (=> b!1074012 (= e!613656 (= lt!476272 (getCurrentListMapNoExtraKeys!3913 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(assert (= (and d!129329 c!107815) b!1074005))

(assert (= (and d!129329 (not c!107815)) b!1074010))

(assert (= (and b!1074010 c!107814) b!1074002))

(assert (= (and b!1074010 (not c!107814)) b!1074001))

(assert (= (or b!1074002 b!1074001) bm!45330))

(assert (= (and d!129329 res!716222) b!1074009))

(assert (= (and b!1074009 res!716224) b!1074006))

(assert (= (and b!1074006 res!716221) b!1074003))

(assert (= (and b!1074006 c!107816) b!1074011))

(assert (= (and b!1074006 (not c!107816)) b!1074004))

(assert (= (and b!1074011 res!716223) b!1074008))

(assert (= (and b!1074004 c!107813) b!1074012))

(assert (= (and b!1074004 (not c!107813)) b!1074007))

(declare-fun b_lambda!16747 () Bool)

(assert (=> (not b_lambda!16747) (not b!1074002)))

(assert (=> b!1074002 t!32526))

(declare-fun b_and!35025 () Bool)

(assert (= b_and!35023 (and (=> t!32526 result!14789) b_and!35025)))

(declare-fun b_lambda!16749 () Bool)

(assert (=> (not b_lambda!16749) (not b!1074008)))

(assert (=> b!1074008 t!32526))

(declare-fun b_and!35027 () Bool)

(assert (= b_and!35025 (and (=> t!32526 result!14789) b_and!35027)))

(declare-fun m!992417 () Bool)

(assert (=> b!1074007 m!992417))

(declare-fun m!992419 () Bool)

(assert (=> b!1074012 m!992419))

(declare-fun m!992421 () Bool)

(assert (=> d!129329 m!992421))

(assert (=> d!129329 m!992185))

(assert (=> b!1074003 m!992267))

(assert (=> b!1074003 m!992267))

(assert (=> b!1074003 m!992309))

(assert (=> b!1074010 m!992267))

(assert (=> b!1074010 m!992267))

(assert (=> b!1074010 m!992309))

(assert (=> b!1074008 m!992267))

(assert (=> b!1074008 m!992313))

(assert (=> b!1074008 m!992267))

(declare-fun m!992423 () Bool)

(assert (=> b!1074008 m!992423))

(assert (=> b!1074008 m!992315))

(assert (=> b!1074008 m!992313))

(assert (=> b!1074008 m!992315))

(assert (=> b!1074008 m!992317))

(declare-fun m!992425 () Bool)

(assert (=> b!1074002 m!992425))

(declare-fun m!992427 () Bool)

(assert (=> b!1074002 m!992427))

(assert (=> b!1074002 m!992425))

(assert (=> b!1074002 m!992267))

(assert (=> b!1074002 m!992313))

(declare-fun m!992429 () Bool)

(assert (=> b!1074002 m!992429))

(declare-fun m!992431 () Bool)

(assert (=> b!1074002 m!992431))

(assert (=> b!1074002 m!992315))

(assert (=> b!1074002 m!992313))

(assert (=> b!1074002 m!992315))

(assert (=> b!1074002 m!992317))

(declare-fun m!992433 () Bool)

(assert (=> b!1074009 m!992433))

(assert (=> bm!45330 m!992419))

(assert (=> b!1074011 m!992267))

(assert (=> b!1074011 m!992267))

(declare-fun m!992435 () Bool)

(assert (=> b!1074011 m!992435))

(assert (=> b!1073785 d!129329))

(declare-fun b!1074019 () Bool)

(declare-fun e!613665 () Bool)

(assert (=> b!1074019 (= e!613665 tp_is_empty!25975)))

(declare-fun mapIsEmpty!40690 () Bool)

(declare-fun mapRes!40690 () Bool)

(assert (=> mapIsEmpty!40690 mapRes!40690))

(declare-fun mapNonEmpty!40690 () Bool)

(declare-fun tp!77981 () Bool)

(assert (=> mapNonEmpty!40690 (= mapRes!40690 (and tp!77981 e!613665))))

(declare-fun mapRest!40690 () (Array (_ BitVec 32) ValueCell!12284))

(declare-fun mapValue!40690 () ValueCell!12284)

(declare-fun mapKey!40690 () (_ BitVec 32))

(assert (=> mapNonEmpty!40690 (= mapRest!40681 (store mapRest!40690 mapKey!40690 mapValue!40690))))

(declare-fun condMapEmpty!40690 () Bool)

(declare-fun mapDefault!40690 () ValueCell!12284)

(assert (=> mapNonEmpty!40681 (= condMapEmpty!40690 (= mapRest!40681 ((as const (Array (_ BitVec 32) ValueCell!12284)) mapDefault!40690)))))

(declare-fun e!613664 () Bool)

(assert (=> mapNonEmpty!40681 (= tp!77965 (and e!613664 mapRes!40690))))

(declare-fun b!1074020 () Bool)

(assert (=> b!1074020 (= e!613664 tp_is_empty!25975)))

(assert (= (and mapNonEmpty!40681 condMapEmpty!40690) mapIsEmpty!40690))

(assert (= (and mapNonEmpty!40681 (not condMapEmpty!40690)) mapNonEmpty!40690))

(assert (= (and mapNonEmpty!40690 ((_ is ValueCellFull!12284) mapValue!40690)) b!1074019))

(assert (= (and mapNonEmpty!40681 ((_ is ValueCellFull!12284) mapDefault!40690)) b!1074020))

(declare-fun m!992437 () Bool)

(assert (=> mapNonEmpty!40690 m!992437))

(declare-fun b_lambda!16751 () Bool)

(assert (= b_lambda!16741 (or (and start!94984 b_free!22165) b_lambda!16751)))

(declare-fun b_lambda!16753 () Bool)

(assert (= b_lambda!16747 (or (and start!94984 b_free!22165) b_lambda!16753)))

(declare-fun b_lambda!16755 () Bool)

(assert (= b_lambda!16745 (or (and start!94984 b_free!22165) b_lambda!16755)))

(declare-fun b_lambda!16757 () Bool)

(assert (= b_lambda!16739 (or (and start!94984 b_free!22165) b_lambda!16757)))

(declare-fun b_lambda!16759 () Bool)

(assert (= b_lambda!16743 (or (and start!94984 b_free!22165) b_lambda!16759)))

(declare-fun b_lambda!16761 () Bool)

(assert (= b_lambda!16749 (or (and start!94984 b_free!22165) b_lambda!16761)))

(check-sat (not b!1073952) (not b!1073950) (not b!1073902) (not b!1073996) (not d!129305) (not b!1073943) (not b!1073963) (not bm!45330) (not bm!45308) (not b!1073892) (not b!1073931) (not b!1073930) (not b!1074007) (not bm!45307) (not bm!45319) (not bm!45320) (not bm!45321) (not b!1074010) (not b!1073995) (not b!1074000) (not b!1073997) (not b!1073904) (not b!1073897) (not d!129309) (not d!129307) (not b!1073999) (not b!1074009) (not b!1074008) (not b!1073891) (not b!1073951) (not bm!45311) (not d!129329) (not b!1073933) (not b!1073916) (not b!1074002) (not b!1074003) (not b!1073919) (not b!1074012) (not bm!45313) (not b!1073899) (not b!1073941) (not d!129327) (not b_lambda!16757) (not d!129325) b_and!35027 (not b!1073958) (not b!1073998) (not b!1073956) (not d!129317) (not bm!45329) (not b_lambda!16761) tp_is_empty!25975 (not b_lambda!16759) (not mapNonEmpty!40690) (not b!1073961) (not b!1073900) (not b_lambda!16751) (not bm!45316) (not d!129315) (not bm!45324) (not b_lambda!16753) (not b!1073991) (not b!1073893) (not b_next!22165) (not b!1073990) (not b!1074011) (not b!1073959) (not b_lambda!16755) (not bm!45326))
(check-sat b_and!35027 (not b_next!22165))
