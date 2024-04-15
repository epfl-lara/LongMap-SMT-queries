; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95174 () Bool)

(assert start!95174)

(declare-fun b_free!22219 () Bool)

(declare-fun b_next!22219 () Bool)

(assert (=> start!95174 (= b_free!22219 (not b_next!22219))))

(declare-fun tp!78149 () Bool)

(declare-fun b_and!35147 () Bool)

(assert (=> start!95174 (= tp!78149 b_and!35147)))

(declare-fun b!1075699 () Bool)

(declare-fun e!614817 () Bool)

(declare-fun e!614815 () Bool)

(declare-fun mapRes!40783 () Bool)

(assert (=> b!1075699 (= e!614817 (and e!614815 mapRes!40783))))

(declare-fun condMapEmpty!40783 () Bool)

(declare-datatypes ((V!39841 0))(
  ( (V!39842 (val!13065 Int)) )
))
(declare-datatypes ((ValueCell!12311 0))(
  ( (ValueCellFull!12311 (v!15690 V!39841)) (EmptyCell!12311) )
))
(declare-datatypes ((array!68962 0))(
  ( (array!68963 (arr!33166 (Array (_ BitVec 32) ValueCell!12311)) (size!33704 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68962)

(declare-fun mapDefault!40783 () ValueCell!12311)

(assert (=> b!1075699 (= condMapEmpty!40783 (= (arr!33166 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12311)) mapDefault!40783)))))

(declare-fun b!1075700 () Bool)

(declare-fun res!717064 () Bool)

(declare-fun e!614813 () Bool)

(assert (=> b!1075700 (=> (not res!717064) (not e!614813))))

(declare-datatypes ((array!68964 0))(
  ( (array!68965 (arr!33167 (Array (_ BitVec 32) (_ BitVec 64))) (size!33705 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68964)

(declare-datatypes ((List!23230 0))(
  ( (Nil!23227) (Cons!23226 (h!24435 (_ BitVec 64)) (t!32576 List!23230)) )
))
(declare-fun arrayNoDuplicates!0 (array!68964 (_ BitVec 32) List!23230) Bool)

(assert (=> b!1075700 (= res!717064 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23227))))

(declare-fun res!717063 () Bool)

(assert (=> start!95174 (=> (not res!717063) (not e!614813))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95174 (= res!717063 (validMask!0 mask!1515))))

(assert (=> start!95174 e!614813))

(assert (=> start!95174 true))

(declare-fun tp_is_empty!26029 () Bool)

(assert (=> start!95174 tp_is_empty!26029))

(declare-fun array_inv!25654 (array!68962) Bool)

(assert (=> start!95174 (and (array_inv!25654 _values!955) e!614817)))

(assert (=> start!95174 tp!78149))

(declare-fun array_inv!25655 (array!68964) Bool)

(assert (=> start!95174 (array_inv!25655 _keys!1163)))

(declare-fun b!1075701 () Bool)

(declare-fun e!614816 () Bool)

(declare-fun e!614811 () Bool)

(assert (=> b!1075701 (= e!614816 e!614811)))

(declare-fun res!717066 () Bool)

(assert (=> b!1075701 (=> res!717066 e!614811)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1075701 (= res!717066 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40783 () Bool)

(declare-fun tp!78148 () Bool)

(declare-fun e!614812 () Bool)

(assert (=> mapNonEmpty!40783 (= mapRes!40783 (and tp!78148 e!614812))))

(declare-fun mapKey!40783 () (_ BitVec 32))

(declare-fun mapRest!40783 () (Array (_ BitVec 32) ValueCell!12311))

(declare-fun mapValue!40783 () ValueCell!12311)

(assert (=> mapNonEmpty!40783 (= (arr!33166 _values!955) (store mapRest!40783 mapKey!40783 mapValue!40783))))

(declare-fun e!614810 () Bool)

(declare-fun minValue!907 () V!39841)

(declare-fun b!1075702 () Bool)

(declare-datatypes ((tuple2!16710 0))(
  ( (tuple2!16711 (_1!8366 (_ BitVec 64)) (_2!8366 V!39841)) )
))
(declare-datatypes ((List!23231 0))(
  ( (Nil!23228) (Cons!23227 (h!24436 tuple2!16710) (t!32577 List!23231)) )
))
(declare-datatypes ((ListLongMap!14679 0))(
  ( (ListLongMap!14680 (toList!7355 List!23231)) )
))
(declare-fun lt!477483 () ListLongMap!14679)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39841)

(declare-fun getCurrentListMap!4123 (array!68964 array!68962 (_ BitVec 32) (_ BitVec 32) V!39841 V!39841 (_ BitVec 32) Int) ListLongMap!14679)

(declare-fun +!3254 (ListLongMap!14679 tuple2!16710) ListLongMap!14679)

(assert (=> b!1075702 (= e!614810 (= (getCurrentListMap!4123 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3254 lt!477483 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun mapIsEmpty!40783 () Bool)

(assert (=> mapIsEmpty!40783 mapRes!40783))

(declare-fun b!1075703 () Bool)

(assert (=> b!1075703 (= e!614812 tp_is_empty!26029)))

(declare-fun lt!477481 () ListLongMap!14679)

(declare-fun zeroValueBefore!47 () V!39841)

(declare-fun b!1075704 () Bool)

(assert (=> b!1075704 (= e!614811 (= (getCurrentListMap!4123 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3254 (+!3254 lt!477481 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075705 () Bool)

(declare-fun res!717065 () Bool)

(assert (=> b!1075705 (=> (not res!717065) (not e!614813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68964 (_ BitVec 32)) Bool)

(assert (=> b!1075705 (= res!717065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075706 () Bool)

(declare-fun res!717067 () Bool)

(assert (=> b!1075706 (=> (not res!717067) (not e!614813))))

(assert (=> b!1075706 (= res!717067 (and (= (size!33704 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33705 _keys!1163) (size!33704 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075707 () Bool)

(assert (=> b!1075707 (= e!614813 (not e!614810))))

(declare-fun res!717068 () Bool)

(assert (=> b!1075707 (=> res!717068 e!614810)))

(assert (=> b!1075707 (= res!717068 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075707 e!614816))

(declare-fun res!717069 () Bool)

(assert (=> b!1075707 (=> (not res!717069) (not e!614816))))

(assert (=> b!1075707 (= res!717069 (= lt!477481 lt!477483))))

(declare-datatypes ((Unit!35260 0))(
  ( (Unit!35261) )
))
(declare-fun lt!477482 () Unit!35260)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!904 (array!68964 array!68962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39841 V!39841 V!39841 V!39841 (_ BitVec 32) Int) Unit!35260)

(assert (=> b!1075707 (= lt!477482 (lemmaNoChangeToArrayThenSameMapNoExtras!904 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3932 (array!68964 array!68962 (_ BitVec 32) (_ BitVec 32) V!39841 V!39841 (_ BitVec 32) Int) ListLongMap!14679)

(assert (=> b!1075707 (= lt!477483 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1075707 (= lt!477481 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075708 () Bool)

(assert (=> b!1075708 (= e!614815 tp_is_empty!26029)))

(assert (= (and start!95174 res!717063) b!1075706))

(assert (= (and b!1075706 res!717067) b!1075705))

(assert (= (and b!1075705 res!717065) b!1075700))

(assert (= (and b!1075700 res!717064) b!1075707))

(assert (= (and b!1075707 res!717069) b!1075701))

(assert (= (and b!1075701 (not res!717066)) b!1075704))

(assert (= (and b!1075707 (not res!717068)) b!1075702))

(assert (= (and b!1075699 condMapEmpty!40783) mapIsEmpty!40783))

(assert (= (and b!1075699 (not condMapEmpty!40783)) mapNonEmpty!40783))

(get-info :version)

(assert (= (and mapNonEmpty!40783 ((_ is ValueCellFull!12311) mapValue!40783)) b!1075703))

(assert (= (and b!1075699 ((_ is ValueCellFull!12311) mapDefault!40783)) b!1075708))

(assert (= start!95174 b!1075699))

(declare-fun m!994061 () Bool)

(assert (=> b!1075700 m!994061))

(declare-fun m!994063 () Bool)

(assert (=> mapNonEmpty!40783 m!994063))

(declare-fun m!994065 () Bool)

(assert (=> b!1075704 m!994065))

(declare-fun m!994067 () Bool)

(assert (=> b!1075704 m!994067))

(assert (=> b!1075704 m!994067))

(declare-fun m!994069 () Bool)

(assert (=> b!1075704 m!994069))

(declare-fun m!994071 () Bool)

(assert (=> start!95174 m!994071))

(declare-fun m!994073 () Bool)

(assert (=> start!95174 m!994073))

(declare-fun m!994075 () Bool)

(assert (=> start!95174 m!994075))

(declare-fun m!994077 () Bool)

(assert (=> b!1075707 m!994077))

(declare-fun m!994079 () Bool)

(assert (=> b!1075707 m!994079))

(declare-fun m!994081 () Bool)

(assert (=> b!1075707 m!994081))

(declare-fun m!994083 () Bool)

(assert (=> b!1075702 m!994083))

(declare-fun m!994085 () Bool)

(assert (=> b!1075702 m!994085))

(declare-fun m!994087 () Bool)

(assert (=> b!1075705 m!994087))

(check-sat (not mapNonEmpty!40783) (not b!1075705) tp_is_empty!26029 (not b_next!22219) (not b!1075700) (not start!95174) (not b!1075707) (not b!1075702) b_and!35147 (not b!1075704))
(check-sat b_and!35147 (not b_next!22219))
(get-model)

(declare-fun b!1075811 () Bool)

(declare-fun e!614893 () Bool)

(declare-fun lt!477558 () ListLongMap!14679)

(declare-fun apply!934 (ListLongMap!14679 (_ BitVec 64)) V!39841)

(declare-fun get!17238 (ValueCell!12311 V!39841) V!39841)

(declare-fun dynLambda!2033 (Int (_ BitVec 64)) V!39841)

(assert (=> b!1075811 (= e!614893 (= (apply!934 lt!477558 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)) (get!17238 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075811 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _values!955)))))

(assert (=> b!1075811 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun bm!45566 () Bool)

(declare-fun call!45572 () ListLongMap!14679)

(declare-fun call!45573 () ListLongMap!14679)

(assert (=> bm!45566 (= call!45572 call!45573)))

(declare-fun b!1075812 () Bool)

(declare-fun e!614904 () Bool)

(declare-fun e!614898 () Bool)

(assert (=> b!1075812 (= e!614904 e!614898)))

(declare-fun res!717138 () Bool)

(declare-fun call!45574 () Bool)

(assert (=> b!1075812 (= res!717138 call!45574)))

(assert (=> b!1075812 (=> (not res!717138) (not e!614898))))

(declare-fun b!1075813 () Bool)

(declare-fun e!614902 () ListLongMap!14679)

(assert (=> b!1075813 (= e!614902 call!45572)))

(declare-fun b!1075814 () Bool)

(declare-fun e!614896 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1075814 (= e!614896 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129487 () Bool)

(declare-fun e!614901 () Bool)

(assert (=> d!129487 e!614901))

(declare-fun res!717133 () Bool)

(assert (=> d!129487 (=> (not res!717133) (not e!614901))))

(assert (=> d!129487 (= res!717133 (or (bvsge #b00000000000000000000000000000000 (size!33705 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))))

(declare-fun lt!477553 () ListLongMap!14679)

(assert (=> d!129487 (= lt!477558 lt!477553)))

(declare-fun lt!477560 () Unit!35260)

(declare-fun e!614897 () Unit!35260)

(assert (=> d!129487 (= lt!477560 e!614897)))

(declare-fun c!108112 () Bool)

(assert (=> d!129487 (= c!108112 e!614896)))

(declare-fun res!717134 () Bool)

(assert (=> d!129487 (=> (not res!717134) (not e!614896))))

(assert (=> d!129487 (= res!717134 (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun e!614892 () ListLongMap!14679)

(assert (=> d!129487 (= lt!477553 e!614892)))

(declare-fun c!108109 () Bool)

(assert (=> d!129487 (= c!108109 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129487 (validMask!0 mask!1515)))

(assert (=> d!129487 (= (getCurrentListMap!4123 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477558)))

(declare-fun bm!45567 () Bool)

(declare-fun call!45571 () ListLongMap!14679)

(assert (=> bm!45567 (= call!45573 call!45571)))

(declare-fun b!1075815 () Bool)

(declare-fun e!614900 () Bool)

(assert (=> b!1075815 (= e!614901 e!614900)))

(declare-fun c!108108 () Bool)

(assert (=> b!1075815 (= c!108108 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075816 () Bool)

(declare-fun e!614899 () ListLongMap!14679)

(declare-fun call!45570 () ListLongMap!14679)

(assert (=> b!1075816 (= e!614899 call!45570)))

(declare-fun bm!45568 () Bool)

(declare-fun call!45569 () ListLongMap!14679)

(declare-fun c!108110 () Bool)

(assert (=> bm!45568 (= call!45569 (+!3254 (ite c!108109 call!45571 (ite c!108110 call!45573 call!45572)) (ite (or c!108109 c!108110) (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075817 () Bool)

(declare-fun res!717136 () Bool)

(assert (=> b!1075817 (=> (not res!717136) (not e!614901))))

(assert (=> b!1075817 (= res!717136 e!614904)))

(declare-fun c!108113 () Bool)

(assert (=> b!1075817 (= c!108113 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45569 () Bool)

(declare-fun call!45575 () Bool)

(declare-fun contains!6321 (ListLongMap!14679 (_ BitVec 64)) Bool)

(assert (=> bm!45569 (= call!45575 (contains!6321 lt!477558 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075818 () Bool)

(assert (=> b!1075818 (= e!614892 (+!3254 call!45569 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45570 () Bool)

(assert (=> bm!45570 (= call!45571 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075819 () Bool)

(assert (=> b!1075819 (= e!614900 (not call!45575))))

(declare-fun b!1075820 () Bool)

(declare-fun Unit!35264 () Unit!35260)

(assert (=> b!1075820 (= e!614897 Unit!35264)))

(declare-fun b!1075821 () Bool)

(assert (=> b!1075821 (= e!614898 (= (apply!934 lt!477558 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1075822 () Bool)

(declare-fun e!614895 () Bool)

(assert (=> b!1075822 (= e!614895 (= (apply!934 lt!477558 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45571 () Bool)

(assert (=> bm!45571 (= call!45570 call!45569)))

(declare-fun b!1075823 () Bool)

(assert (=> b!1075823 (= e!614902 call!45570)))

(declare-fun b!1075824 () Bool)

(declare-fun e!614894 () Bool)

(assert (=> b!1075824 (= e!614894 e!614893)))

(declare-fun res!717135 () Bool)

(assert (=> b!1075824 (=> (not res!717135) (not e!614893))))

(assert (=> b!1075824 (= res!717135 (contains!6321 lt!477558 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075824 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun b!1075825 () Bool)

(declare-fun e!614903 () Bool)

(assert (=> b!1075825 (= e!614903 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075826 () Bool)

(declare-fun lt!477556 () Unit!35260)

(assert (=> b!1075826 (= e!614897 lt!477556)))

(declare-fun lt!477563 () ListLongMap!14679)

(assert (=> b!1075826 (= lt!477563 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477555 () (_ BitVec 64))

(assert (=> b!1075826 (= lt!477555 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477549 () (_ BitVec 64))

(assert (=> b!1075826 (= lt!477549 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477565 () Unit!35260)

(declare-fun addStillContains!647 (ListLongMap!14679 (_ BitVec 64) V!39841 (_ BitVec 64)) Unit!35260)

(assert (=> b!1075826 (= lt!477565 (addStillContains!647 lt!477563 lt!477555 zeroValueBefore!47 lt!477549))))

(assert (=> b!1075826 (contains!6321 (+!3254 lt!477563 (tuple2!16711 lt!477555 zeroValueBefore!47)) lt!477549)))

(declare-fun lt!477561 () Unit!35260)

(assert (=> b!1075826 (= lt!477561 lt!477565)))

(declare-fun lt!477557 () ListLongMap!14679)

(assert (=> b!1075826 (= lt!477557 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477567 () (_ BitVec 64))

(assert (=> b!1075826 (= lt!477567 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477550 () (_ BitVec 64))

(assert (=> b!1075826 (= lt!477550 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477551 () Unit!35260)

(declare-fun addApplyDifferent!503 (ListLongMap!14679 (_ BitVec 64) V!39841 (_ BitVec 64)) Unit!35260)

(assert (=> b!1075826 (= lt!477551 (addApplyDifferent!503 lt!477557 lt!477567 minValue!907 lt!477550))))

(assert (=> b!1075826 (= (apply!934 (+!3254 lt!477557 (tuple2!16711 lt!477567 minValue!907)) lt!477550) (apply!934 lt!477557 lt!477550))))

(declare-fun lt!477548 () Unit!35260)

(assert (=> b!1075826 (= lt!477548 lt!477551)))

(declare-fun lt!477546 () ListLongMap!14679)

(assert (=> b!1075826 (= lt!477546 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477554 () (_ BitVec 64))

(assert (=> b!1075826 (= lt!477554 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477562 () (_ BitVec 64))

(assert (=> b!1075826 (= lt!477562 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477547 () Unit!35260)

(assert (=> b!1075826 (= lt!477547 (addApplyDifferent!503 lt!477546 lt!477554 zeroValueBefore!47 lt!477562))))

(assert (=> b!1075826 (= (apply!934 (+!3254 lt!477546 (tuple2!16711 lt!477554 zeroValueBefore!47)) lt!477562) (apply!934 lt!477546 lt!477562))))

(declare-fun lt!477559 () Unit!35260)

(assert (=> b!1075826 (= lt!477559 lt!477547)))

(declare-fun lt!477566 () ListLongMap!14679)

(assert (=> b!1075826 (= lt!477566 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477552 () (_ BitVec 64))

(assert (=> b!1075826 (= lt!477552 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477564 () (_ BitVec 64))

(assert (=> b!1075826 (= lt!477564 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075826 (= lt!477556 (addApplyDifferent!503 lt!477566 lt!477552 minValue!907 lt!477564))))

(assert (=> b!1075826 (= (apply!934 (+!3254 lt!477566 (tuple2!16711 lt!477552 minValue!907)) lt!477564) (apply!934 lt!477566 lt!477564))))

(declare-fun b!1075827 () Bool)

(declare-fun res!717137 () Bool)

(assert (=> b!1075827 (=> (not res!717137) (not e!614901))))

(assert (=> b!1075827 (= res!717137 e!614894)))

(declare-fun res!717130 () Bool)

(assert (=> b!1075827 (=> res!717130 e!614894)))

(assert (=> b!1075827 (= res!717130 (not e!614903))))

(declare-fun res!717132 () Bool)

(assert (=> b!1075827 (=> (not res!717132) (not e!614903))))

(assert (=> b!1075827 (= res!717132 (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun bm!45572 () Bool)

(assert (=> bm!45572 (= call!45574 (contains!6321 lt!477558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075828 () Bool)

(assert (=> b!1075828 (= e!614892 e!614899)))

(assert (=> b!1075828 (= c!108110 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075829 () Bool)

(declare-fun c!108111 () Bool)

(assert (=> b!1075829 (= c!108111 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075829 (= e!614899 e!614902)))

(declare-fun b!1075830 () Bool)

(assert (=> b!1075830 (= e!614904 (not call!45574))))

(declare-fun b!1075831 () Bool)

(assert (=> b!1075831 (= e!614900 e!614895)))

(declare-fun res!717131 () Bool)

(assert (=> b!1075831 (= res!717131 call!45575)))

(assert (=> b!1075831 (=> (not res!717131) (not e!614895))))

(assert (= (and d!129487 c!108109) b!1075818))

(assert (= (and d!129487 (not c!108109)) b!1075828))

(assert (= (and b!1075828 c!108110) b!1075816))

(assert (= (and b!1075828 (not c!108110)) b!1075829))

(assert (= (and b!1075829 c!108111) b!1075823))

(assert (= (and b!1075829 (not c!108111)) b!1075813))

(assert (= (or b!1075823 b!1075813) bm!45566))

(assert (= (or b!1075816 bm!45566) bm!45567))

(assert (= (or b!1075816 b!1075823) bm!45571))

(assert (= (or b!1075818 bm!45567) bm!45570))

(assert (= (or b!1075818 bm!45571) bm!45568))

(assert (= (and d!129487 res!717134) b!1075814))

(assert (= (and d!129487 c!108112) b!1075826))

(assert (= (and d!129487 (not c!108112)) b!1075820))

(assert (= (and d!129487 res!717133) b!1075827))

(assert (= (and b!1075827 res!717132) b!1075825))

(assert (= (and b!1075827 (not res!717130)) b!1075824))

(assert (= (and b!1075824 res!717135) b!1075811))

(assert (= (and b!1075827 res!717137) b!1075817))

(assert (= (and b!1075817 c!108113) b!1075812))

(assert (= (and b!1075817 (not c!108113)) b!1075830))

(assert (= (and b!1075812 res!717138) b!1075821))

(assert (= (or b!1075812 b!1075830) bm!45572))

(assert (= (and b!1075817 res!717136) b!1075815))

(assert (= (and b!1075815 c!108108) b!1075831))

(assert (= (and b!1075815 (not c!108108)) b!1075819))

(assert (= (and b!1075831 res!717131) b!1075822))

(assert (= (or b!1075831 b!1075819) bm!45569))

(declare-fun b_lambda!16903 () Bool)

(assert (=> (not b_lambda!16903) (not b!1075811)))

(declare-fun t!32581 () Bool)

(declare-fun tb!7169 () Bool)

(assert (=> (and start!95174 (= defaultEntry!963 defaultEntry!963) t!32581) tb!7169))

(declare-fun result!14831 () Bool)

(assert (=> tb!7169 (= result!14831 tp_is_empty!26029)))

(assert (=> b!1075811 t!32581))

(declare-fun b_and!35153 () Bool)

(assert (= b_and!35147 (and (=> t!32581 result!14831) b_and!35153)))

(declare-fun m!994145 () Bool)

(assert (=> b!1075825 m!994145))

(assert (=> b!1075825 m!994145))

(declare-fun m!994147 () Bool)

(assert (=> b!1075825 m!994147))

(assert (=> b!1075824 m!994145))

(assert (=> b!1075824 m!994145))

(declare-fun m!994149 () Bool)

(assert (=> b!1075824 m!994149))

(declare-fun m!994151 () Bool)

(assert (=> bm!45572 m!994151))

(declare-fun m!994153 () Bool)

(assert (=> b!1075821 m!994153))

(assert (=> bm!45570 m!994081))

(assert (=> d!129487 m!994071))

(declare-fun m!994155 () Bool)

(assert (=> b!1075818 m!994155))

(declare-fun m!994157 () Bool)

(assert (=> bm!45568 m!994157))

(declare-fun m!994159 () Bool)

(assert (=> b!1075826 m!994159))

(declare-fun m!994161 () Bool)

(assert (=> b!1075826 m!994161))

(declare-fun m!994163 () Bool)

(assert (=> b!1075826 m!994163))

(declare-fun m!994165 () Bool)

(assert (=> b!1075826 m!994165))

(declare-fun m!994167 () Bool)

(assert (=> b!1075826 m!994167))

(assert (=> b!1075826 m!994159))

(declare-fun m!994169 () Bool)

(assert (=> b!1075826 m!994169))

(declare-fun m!994171 () Bool)

(assert (=> b!1075826 m!994171))

(declare-fun m!994173 () Bool)

(assert (=> b!1075826 m!994173))

(assert (=> b!1075826 m!994163))

(assert (=> b!1075826 m!994081))

(declare-fun m!994175 () Bool)

(assert (=> b!1075826 m!994175))

(declare-fun m!994177 () Bool)

(assert (=> b!1075826 m!994177))

(declare-fun m!994179 () Bool)

(assert (=> b!1075826 m!994179))

(declare-fun m!994181 () Bool)

(assert (=> b!1075826 m!994181))

(declare-fun m!994183 () Bool)

(assert (=> b!1075826 m!994183))

(declare-fun m!994185 () Bool)

(assert (=> b!1075826 m!994185))

(assert (=> b!1075826 m!994181))

(assert (=> b!1075826 m!994145))

(assert (=> b!1075826 m!994179))

(declare-fun m!994187 () Bool)

(assert (=> b!1075826 m!994187))

(assert (=> b!1075814 m!994145))

(assert (=> b!1075814 m!994145))

(assert (=> b!1075814 m!994147))

(declare-fun m!994189 () Bool)

(assert (=> bm!45569 m!994189))

(declare-fun m!994191 () Bool)

(assert (=> b!1075811 m!994191))

(assert (=> b!1075811 m!994191))

(declare-fun m!994193 () Bool)

(assert (=> b!1075811 m!994193))

(declare-fun m!994195 () Bool)

(assert (=> b!1075811 m!994195))

(assert (=> b!1075811 m!994193))

(assert (=> b!1075811 m!994145))

(declare-fun m!994197 () Bool)

(assert (=> b!1075811 m!994197))

(assert (=> b!1075811 m!994145))

(declare-fun m!994199 () Bool)

(assert (=> b!1075822 m!994199))

(assert (=> b!1075704 d!129487))

(declare-fun d!129489 () Bool)

(declare-fun e!614907 () Bool)

(assert (=> d!129489 e!614907))

(declare-fun res!717143 () Bool)

(assert (=> d!129489 (=> (not res!717143) (not e!614907))))

(declare-fun lt!477579 () ListLongMap!14679)

(assert (=> d!129489 (= res!717143 (contains!6321 lt!477579 (_1!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lt!477578 () List!23231)

(assert (=> d!129489 (= lt!477579 (ListLongMap!14680 lt!477578))))

(declare-fun lt!477577 () Unit!35260)

(declare-fun lt!477576 () Unit!35260)

(assert (=> d!129489 (= lt!477577 lt!477576)))

(declare-datatypes ((Option!666 0))(
  ( (Some!665 (v!15693 V!39841)) (None!664) )
))
(declare-fun getValueByKey!615 (List!23231 (_ BitVec 64)) Option!666)

(assert (=> d!129489 (= (getValueByKey!615 lt!477578 (_1!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!665 (_2!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lemmaContainsTupThenGetReturnValue!291 (List!23231 (_ BitVec 64) V!39841) Unit!35260)

(assert (=> d!129489 (= lt!477576 (lemmaContainsTupThenGetReturnValue!291 lt!477578 (_1!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun insertStrictlySorted!384 (List!23231 (_ BitVec 64) V!39841) List!23231)

(assert (=> d!129489 (= lt!477578 (insertStrictlySorted!384 (toList!7355 (+!3254 lt!477481 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (_1!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!129489 (= (+!3254 (+!3254 lt!477481 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) lt!477579)))

(declare-fun b!1075838 () Bool)

(declare-fun res!717144 () Bool)

(assert (=> b!1075838 (=> (not res!717144) (not e!614907))))

(assert (=> b!1075838 (= res!717144 (= (getValueByKey!615 (toList!7355 lt!477579) (_1!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!665 (_2!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))))

(declare-fun b!1075839 () Bool)

(declare-fun contains!6322 (List!23231 tuple2!16710) Bool)

(assert (=> b!1075839 (= e!614907 (contains!6322 (toList!7355 lt!477579) (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!129489 res!717143) b!1075838))

(assert (= (and b!1075838 res!717144) b!1075839))

(declare-fun m!994201 () Bool)

(assert (=> d!129489 m!994201))

(declare-fun m!994203 () Bool)

(assert (=> d!129489 m!994203))

(declare-fun m!994205 () Bool)

(assert (=> d!129489 m!994205))

(declare-fun m!994207 () Bool)

(assert (=> d!129489 m!994207))

(declare-fun m!994209 () Bool)

(assert (=> b!1075838 m!994209))

(declare-fun m!994211 () Bool)

(assert (=> b!1075839 m!994211))

(assert (=> b!1075704 d!129489))

(declare-fun d!129491 () Bool)

(declare-fun e!614908 () Bool)

(assert (=> d!129491 e!614908))

(declare-fun res!717145 () Bool)

(assert (=> d!129491 (=> (not res!717145) (not e!614908))))

(declare-fun lt!477583 () ListLongMap!14679)

(assert (=> d!129491 (= res!717145 (contains!6321 lt!477583 (_1!8366 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!477582 () List!23231)

(assert (=> d!129491 (= lt!477583 (ListLongMap!14680 lt!477582))))

(declare-fun lt!477581 () Unit!35260)

(declare-fun lt!477580 () Unit!35260)

(assert (=> d!129491 (= lt!477581 lt!477580)))

(assert (=> d!129491 (= (getValueByKey!615 lt!477582 (_1!8366 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!665 (_2!8366 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129491 (= lt!477580 (lemmaContainsTupThenGetReturnValue!291 lt!477582 (_1!8366 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8366 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129491 (= lt!477582 (insertStrictlySorted!384 (toList!7355 lt!477481) (_1!8366 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8366 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129491 (= (+!3254 lt!477481 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!477583)))

(declare-fun b!1075840 () Bool)

(declare-fun res!717146 () Bool)

(assert (=> b!1075840 (=> (not res!717146) (not e!614908))))

(assert (=> b!1075840 (= res!717146 (= (getValueByKey!615 (toList!7355 lt!477583) (_1!8366 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!665 (_2!8366 (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1075841 () Bool)

(assert (=> b!1075841 (= e!614908 (contains!6322 (toList!7355 lt!477583) (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129491 res!717145) b!1075840))

(assert (= (and b!1075840 res!717146) b!1075841))

(declare-fun m!994213 () Bool)

(assert (=> d!129491 m!994213))

(declare-fun m!994215 () Bool)

(assert (=> d!129491 m!994215))

(declare-fun m!994217 () Bool)

(assert (=> d!129491 m!994217))

(declare-fun m!994219 () Bool)

(assert (=> d!129491 m!994219))

(declare-fun m!994221 () Bool)

(assert (=> b!1075840 m!994221))

(declare-fun m!994223 () Bool)

(assert (=> b!1075841 m!994223))

(assert (=> b!1075704 d!129491))

(declare-fun b!1075852 () Bool)

(declare-fun e!614920 () Bool)

(declare-fun e!614918 () Bool)

(assert (=> b!1075852 (= e!614920 e!614918)))

(declare-fun res!717153 () Bool)

(assert (=> b!1075852 (=> (not res!717153) (not e!614918))))

(declare-fun e!614917 () Bool)

(assert (=> b!1075852 (= res!717153 (not e!614917))))

(declare-fun res!717155 () Bool)

(assert (=> b!1075852 (=> (not res!717155) (not e!614917))))

(assert (=> b!1075852 (= res!717155 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45575 () Bool)

(declare-fun call!45578 () Bool)

(declare-fun c!108116 () Bool)

(assert (=> bm!45575 (= call!45578 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108116 (Cons!23226 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000) Nil!23227) Nil!23227)))))

(declare-fun b!1075853 () Bool)

(declare-fun contains!6323 (List!23230 (_ BitVec 64)) Bool)

(assert (=> b!1075853 (= e!614917 (contains!6323 Nil!23227 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075854 () Bool)

(declare-fun e!614919 () Bool)

(assert (=> b!1075854 (= e!614919 call!45578)))

(declare-fun b!1075855 () Bool)

(assert (=> b!1075855 (= e!614919 call!45578)))

(declare-fun b!1075856 () Bool)

(assert (=> b!1075856 (= e!614918 e!614919)))

(assert (=> b!1075856 (= c!108116 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129493 () Bool)

(declare-fun res!717154 () Bool)

(assert (=> d!129493 (=> res!717154 e!614920)))

(assert (=> d!129493 (= res!717154 (bvsge #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(assert (=> d!129493 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23227) e!614920)))

(assert (= (and d!129493 (not res!717154)) b!1075852))

(assert (= (and b!1075852 res!717155) b!1075853))

(assert (= (and b!1075852 res!717153) b!1075856))

(assert (= (and b!1075856 c!108116) b!1075855))

(assert (= (and b!1075856 (not c!108116)) b!1075854))

(assert (= (or b!1075855 b!1075854) bm!45575))

(assert (=> b!1075852 m!994145))

(assert (=> b!1075852 m!994145))

(assert (=> b!1075852 m!994147))

(assert (=> bm!45575 m!994145))

(declare-fun m!994225 () Bool)

(assert (=> bm!45575 m!994225))

(assert (=> b!1075853 m!994145))

(assert (=> b!1075853 m!994145))

(declare-fun m!994227 () Bool)

(assert (=> b!1075853 m!994227))

(assert (=> b!1075856 m!994145))

(assert (=> b!1075856 m!994145))

(assert (=> b!1075856 m!994147))

(assert (=> b!1075700 d!129493))

(declare-fun d!129495 () Bool)

(assert (=> d!129495 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95174 d!129495))

(declare-fun d!129497 () Bool)

(assert (=> d!129497 (= (array_inv!25654 _values!955) (bvsge (size!33704 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95174 d!129497))

(declare-fun d!129499 () Bool)

(assert (=> d!129499 (= (array_inv!25655 _keys!1163) (bvsge (size!33705 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95174 d!129499))

(declare-fun b!1075865 () Bool)

(declare-fun e!614928 () Bool)

(declare-fun e!614927 () Bool)

(assert (=> b!1075865 (= e!614928 e!614927)))

(declare-fun lt!477591 () (_ BitVec 64))

(assert (=> b!1075865 (= lt!477591 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477590 () Unit!35260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!68964 (_ BitVec 64) (_ BitVec 32)) Unit!35260)

(assert (=> b!1075865 (= lt!477590 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!477591 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!68964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1075865 (arrayContainsKey!0 _keys!1163 lt!477591 #b00000000000000000000000000000000)))

(declare-fun lt!477592 () Unit!35260)

(assert (=> b!1075865 (= lt!477592 lt!477590)))

(declare-fun res!717161 () Bool)

(declare-datatypes ((SeekEntryResult!9893 0))(
  ( (MissingZero!9893 (index!41943 (_ BitVec 32))) (Found!9893 (index!41944 (_ BitVec 32))) (Intermediate!9893 (undefined!10705 Bool) (index!41945 (_ BitVec 32)) (x!96418 (_ BitVec 32))) (Undefined!9893) (MissingVacant!9893 (index!41946 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!68964 (_ BitVec 32)) SeekEntryResult!9893)

(assert (=> b!1075865 (= res!717161 (= (seekEntryOrOpen!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9893 #b00000000000000000000000000000000)))))

(assert (=> b!1075865 (=> (not res!717161) (not e!614927))))

(declare-fun b!1075866 () Bool)

(declare-fun call!45581 () Bool)

(assert (=> b!1075866 (= e!614928 call!45581)))

(declare-fun d!129501 () Bool)

(declare-fun res!717160 () Bool)

(declare-fun e!614929 () Bool)

(assert (=> d!129501 (=> res!717160 e!614929)))

(assert (=> d!129501 (= res!717160 (bvsge #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(assert (=> d!129501 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!614929)))

(declare-fun bm!45578 () Bool)

(assert (=> bm!45578 (= call!45581 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1075867 () Bool)

(assert (=> b!1075867 (= e!614929 e!614928)))

(declare-fun c!108119 () Bool)

(assert (=> b!1075867 (= c!108119 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075868 () Bool)

(assert (=> b!1075868 (= e!614927 call!45581)))

(assert (= (and d!129501 (not res!717160)) b!1075867))

(assert (= (and b!1075867 c!108119) b!1075865))

(assert (= (and b!1075867 (not c!108119)) b!1075866))

(assert (= (and b!1075865 res!717161) b!1075868))

(assert (= (or b!1075868 b!1075866) bm!45578))

(assert (=> b!1075865 m!994145))

(declare-fun m!994229 () Bool)

(assert (=> b!1075865 m!994229))

(declare-fun m!994231 () Bool)

(assert (=> b!1075865 m!994231))

(assert (=> b!1075865 m!994145))

(declare-fun m!994233 () Bool)

(assert (=> b!1075865 m!994233))

(declare-fun m!994235 () Bool)

(assert (=> bm!45578 m!994235))

(assert (=> b!1075867 m!994145))

(assert (=> b!1075867 m!994145))

(assert (=> b!1075867 m!994147))

(assert (=> b!1075705 d!129501))

(declare-fun lt!477605 () ListLongMap!14679)

(declare-fun e!614931 () Bool)

(declare-fun b!1075869 () Bool)

(assert (=> b!1075869 (= e!614931 (= (apply!934 lt!477605 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)) (get!17238 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1075869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _values!955)))))

(assert (=> b!1075869 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun bm!45579 () Bool)

(declare-fun call!45585 () ListLongMap!14679)

(declare-fun call!45586 () ListLongMap!14679)

(assert (=> bm!45579 (= call!45585 call!45586)))

(declare-fun b!1075870 () Bool)

(declare-fun e!614942 () Bool)

(declare-fun e!614936 () Bool)

(assert (=> b!1075870 (= e!614942 e!614936)))

(declare-fun res!717170 () Bool)

(declare-fun call!45587 () Bool)

(assert (=> b!1075870 (= res!717170 call!45587)))

(assert (=> b!1075870 (=> (not res!717170) (not e!614936))))

(declare-fun b!1075871 () Bool)

(declare-fun e!614940 () ListLongMap!14679)

(assert (=> b!1075871 (= e!614940 call!45585)))

(declare-fun b!1075872 () Bool)

(declare-fun e!614934 () Bool)

(assert (=> b!1075872 (= e!614934 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129503 () Bool)

(declare-fun e!614939 () Bool)

(assert (=> d!129503 e!614939))

(declare-fun res!717165 () Bool)

(assert (=> d!129503 (=> (not res!717165) (not e!614939))))

(assert (=> d!129503 (= res!717165 (or (bvsge #b00000000000000000000000000000000 (size!33705 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))))

(declare-fun lt!477600 () ListLongMap!14679)

(assert (=> d!129503 (= lt!477605 lt!477600)))

(declare-fun lt!477607 () Unit!35260)

(declare-fun e!614935 () Unit!35260)

(assert (=> d!129503 (= lt!477607 e!614935)))

(declare-fun c!108124 () Bool)

(assert (=> d!129503 (= c!108124 e!614934)))

(declare-fun res!717166 () Bool)

(assert (=> d!129503 (=> (not res!717166) (not e!614934))))

(assert (=> d!129503 (= res!717166 (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun e!614930 () ListLongMap!14679)

(assert (=> d!129503 (= lt!477600 e!614930)))

(declare-fun c!108121 () Bool)

(assert (=> d!129503 (= c!108121 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129503 (validMask!0 mask!1515)))

(assert (=> d!129503 (= (getCurrentListMap!4123 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477605)))

(declare-fun bm!45580 () Bool)

(declare-fun call!45584 () ListLongMap!14679)

(assert (=> bm!45580 (= call!45586 call!45584)))

(declare-fun b!1075873 () Bool)

(declare-fun e!614938 () Bool)

(assert (=> b!1075873 (= e!614939 e!614938)))

(declare-fun c!108120 () Bool)

(assert (=> b!1075873 (= c!108120 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075874 () Bool)

(declare-fun e!614937 () ListLongMap!14679)

(declare-fun call!45583 () ListLongMap!14679)

(assert (=> b!1075874 (= e!614937 call!45583)))

(declare-fun c!108122 () Bool)

(declare-fun call!45582 () ListLongMap!14679)

(declare-fun bm!45581 () Bool)

(assert (=> bm!45581 (= call!45582 (+!3254 (ite c!108121 call!45584 (ite c!108122 call!45586 call!45585)) (ite (or c!108121 c!108122) (tuple2!16711 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1075875 () Bool)

(declare-fun res!717168 () Bool)

(assert (=> b!1075875 (=> (not res!717168) (not e!614939))))

(assert (=> b!1075875 (= res!717168 e!614942)))

(declare-fun c!108125 () Bool)

(assert (=> b!1075875 (= c!108125 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45582 () Bool)

(declare-fun call!45588 () Bool)

(assert (=> bm!45582 (= call!45588 (contains!6321 lt!477605 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075876 () Bool)

(assert (=> b!1075876 (= e!614930 (+!3254 call!45582 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun bm!45583 () Bool)

(assert (=> bm!45583 (= call!45584 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1075877 () Bool)

(assert (=> b!1075877 (= e!614938 (not call!45588))))

(declare-fun b!1075878 () Bool)

(declare-fun Unit!35265 () Unit!35260)

(assert (=> b!1075878 (= e!614935 Unit!35265)))

(declare-fun b!1075879 () Bool)

(assert (=> b!1075879 (= e!614936 (= (apply!934 lt!477605 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1075880 () Bool)

(declare-fun e!614933 () Bool)

(assert (=> b!1075880 (= e!614933 (= (apply!934 lt!477605 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45584 () Bool)

(assert (=> bm!45584 (= call!45583 call!45582)))

(declare-fun b!1075881 () Bool)

(assert (=> b!1075881 (= e!614940 call!45583)))

(declare-fun b!1075882 () Bool)

(declare-fun e!614932 () Bool)

(assert (=> b!1075882 (= e!614932 e!614931)))

(declare-fun res!717167 () Bool)

(assert (=> b!1075882 (=> (not res!717167) (not e!614931))))

(assert (=> b!1075882 (= res!717167 (contains!6321 lt!477605 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075882 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun b!1075883 () Bool)

(declare-fun e!614941 () Bool)

(assert (=> b!1075883 (= e!614941 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1075884 () Bool)

(declare-fun lt!477603 () Unit!35260)

(assert (=> b!1075884 (= e!614935 lt!477603)))

(declare-fun lt!477610 () ListLongMap!14679)

(assert (=> b!1075884 (= lt!477610 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477602 () (_ BitVec 64))

(assert (=> b!1075884 (= lt!477602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477596 () (_ BitVec 64))

(assert (=> b!1075884 (= lt!477596 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477612 () Unit!35260)

(assert (=> b!1075884 (= lt!477612 (addStillContains!647 lt!477610 lt!477602 zeroValueAfter!47 lt!477596))))

(assert (=> b!1075884 (contains!6321 (+!3254 lt!477610 (tuple2!16711 lt!477602 zeroValueAfter!47)) lt!477596)))

(declare-fun lt!477608 () Unit!35260)

(assert (=> b!1075884 (= lt!477608 lt!477612)))

(declare-fun lt!477604 () ListLongMap!14679)

(assert (=> b!1075884 (= lt!477604 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477614 () (_ BitVec 64))

(assert (=> b!1075884 (= lt!477614 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477597 () (_ BitVec 64))

(assert (=> b!1075884 (= lt!477597 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477598 () Unit!35260)

(assert (=> b!1075884 (= lt!477598 (addApplyDifferent!503 lt!477604 lt!477614 minValue!907 lt!477597))))

(assert (=> b!1075884 (= (apply!934 (+!3254 lt!477604 (tuple2!16711 lt!477614 minValue!907)) lt!477597) (apply!934 lt!477604 lt!477597))))

(declare-fun lt!477595 () Unit!35260)

(assert (=> b!1075884 (= lt!477595 lt!477598)))

(declare-fun lt!477593 () ListLongMap!14679)

(assert (=> b!1075884 (= lt!477593 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477601 () (_ BitVec 64))

(assert (=> b!1075884 (= lt!477601 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477609 () (_ BitVec 64))

(assert (=> b!1075884 (= lt!477609 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477594 () Unit!35260)

(assert (=> b!1075884 (= lt!477594 (addApplyDifferent!503 lt!477593 lt!477601 zeroValueAfter!47 lt!477609))))

(assert (=> b!1075884 (= (apply!934 (+!3254 lt!477593 (tuple2!16711 lt!477601 zeroValueAfter!47)) lt!477609) (apply!934 lt!477593 lt!477609))))

(declare-fun lt!477606 () Unit!35260)

(assert (=> b!1075884 (= lt!477606 lt!477594)))

(declare-fun lt!477613 () ListLongMap!14679)

(assert (=> b!1075884 (= lt!477613 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477599 () (_ BitVec 64))

(assert (=> b!1075884 (= lt!477599 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477611 () (_ BitVec 64))

(assert (=> b!1075884 (= lt!477611 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075884 (= lt!477603 (addApplyDifferent!503 lt!477613 lt!477599 minValue!907 lt!477611))))

(assert (=> b!1075884 (= (apply!934 (+!3254 lt!477613 (tuple2!16711 lt!477599 minValue!907)) lt!477611) (apply!934 lt!477613 lt!477611))))

(declare-fun b!1075885 () Bool)

(declare-fun res!717169 () Bool)

(assert (=> b!1075885 (=> (not res!717169) (not e!614939))))

(assert (=> b!1075885 (= res!717169 e!614932)))

(declare-fun res!717162 () Bool)

(assert (=> b!1075885 (=> res!717162 e!614932)))

(assert (=> b!1075885 (= res!717162 (not e!614941))))

(declare-fun res!717164 () Bool)

(assert (=> b!1075885 (=> (not res!717164) (not e!614941))))

(assert (=> b!1075885 (= res!717164 (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun bm!45585 () Bool)

(assert (=> bm!45585 (= call!45587 (contains!6321 lt!477605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1075886 () Bool)

(assert (=> b!1075886 (= e!614930 e!614937)))

(assert (=> b!1075886 (= c!108122 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1075887 () Bool)

(declare-fun c!108123 () Bool)

(assert (=> b!1075887 (= c!108123 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1075887 (= e!614937 e!614940)))

(declare-fun b!1075888 () Bool)

(assert (=> b!1075888 (= e!614942 (not call!45587))))

(declare-fun b!1075889 () Bool)

(assert (=> b!1075889 (= e!614938 e!614933)))

(declare-fun res!717163 () Bool)

(assert (=> b!1075889 (= res!717163 call!45588)))

(assert (=> b!1075889 (=> (not res!717163) (not e!614933))))

(assert (= (and d!129503 c!108121) b!1075876))

(assert (= (and d!129503 (not c!108121)) b!1075886))

(assert (= (and b!1075886 c!108122) b!1075874))

(assert (= (and b!1075886 (not c!108122)) b!1075887))

(assert (= (and b!1075887 c!108123) b!1075881))

(assert (= (and b!1075887 (not c!108123)) b!1075871))

(assert (= (or b!1075881 b!1075871) bm!45579))

(assert (= (or b!1075874 bm!45579) bm!45580))

(assert (= (or b!1075874 b!1075881) bm!45584))

(assert (= (or b!1075876 bm!45580) bm!45583))

(assert (= (or b!1075876 bm!45584) bm!45581))

(assert (= (and d!129503 res!717166) b!1075872))

(assert (= (and d!129503 c!108124) b!1075884))

(assert (= (and d!129503 (not c!108124)) b!1075878))

(assert (= (and d!129503 res!717165) b!1075885))

(assert (= (and b!1075885 res!717164) b!1075883))

(assert (= (and b!1075885 (not res!717162)) b!1075882))

(assert (= (and b!1075882 res!717167) b!1075869))

(assert (= (and b!1075885 res!717169) b!1075875))

(assert (= (and b!1075875 c!108125) b!1075870))

(assert (= (and b!1075875 (not c!108125)) b!1075888))

(assert (= (and b!1075870 res!717170) b!1075879))

(assert (= (or b!1075870 b!1075888) bm!45585))

(assert (= (and b!1075875 res!717168) b!1075873))

(assert (= (and b!1075873 c!108120) b!1075889))

(assert (= (and b!1075873 (not c!108120)) b!1075877))

(assert (= (and b!1075889 res!717163) b!1075880))

(assert (= (or b!1075889 b!1075877) bm!45582))

(declare-fun b_lambda!16905 () Bool)

(assert (=> (not b_lambda!16905) (not b!1075869)))

(assert (=> b!1075869 t!32581))

(declare-fun b_and!35155 () Bool)

(assert (= b_and!35153 (and (=> t!32581 result!14831) b_and!35155)))

(assert (=> b!1075883 m!994145))

(assert (=> b!1075883 m!994145))

(assert (=> b!1075883 m!994147))

(assert (=> b!1075882 m!994145))

(assert (=> b!1075882 m!994145))

(declare-fun m!994237 () Bool)

(assert (=> b!1075882 m!994237))

(declare-fun m!994239 () Bool)

(assert (=> bm!45585 m!994239))

(declare-fun m!994241 () Bool)

(assert (=> b!1075879 m!994241))

(assert (=> bm!45583 m!994079))

(assert (=> d!129503 m!994071))

(declare-fun m!994243 () Bool)

(assert (=> b!1075876 m!994243))

(declare-fun m!994245 () Bool)

(assert (=> bm!45581 m!994245))

(declare-fun m!994247 () Bool)

(assert (=> b!1075884 m!994247))

(declare-fun m!994249 () Bool)

(assert (=> b!1075884 m!994249))

(declare-fun m!994251 () Bool)

(assert (=> b!1075884 m!994251))

(declare-fun m!994253 () Bool)

(assert (=> b!1075884 m!994253))

(declare-fun m!994255 () Bool)

(assert (=> b!1075884 m!994255))

(assert (=> b!1075884 m!994247))

(declare-fun m!994257 () Bool)

(assert (=> b!1075884 m!994257))

(declare-fun m!994259 () Bool)

(assert (=> b!1075884 m!994259))

(declare-fun m!994261 () Bool)

(assert (=> b!1075884 m!994261))

(assert (=> b!1075884 m!994251))

(assert (=> b!1075884 m!994079))

(declare-fun m!994263 () Bool)

(assert (=> b!1075884 m!994263))

(declare-fun m!994265 () Bool)

(assert (=> b!1075884 m!994265))

(declare-fun m!994267 () Bool)

(assert (=> b!1075884 m!994267))

(declare-fun m!994269 () Bool)

(assert (=> b!1075884 m!994269))

(declare-fun m!994271 () Bool)

(assert (=> b!1075884 m!994271))

(declare-fun m!994273 () Bool)

(assert (=> b!1075884 m!994273))

(assert (=> b!1075884 m!994269))

(assert (=> b!1075884 m!994145))

(assert (=> b!1075884 m!994267))

(declare-fun m!994275 () Bool)

(assert (=> b!1075884 m!994275))

(assert (=> b!1075872 m!994145))

(assert (=> b!1075872 m!994145))

(assert (=> b!1075872 m!994147))

(declare-fun m!994277 () Bool)

(assert (=> bm!45582 m!994277))

(assert (=> b!1075869 m!994191))

(assert (=> b!1075869 m!994191))

(assert (=> b!1075869 m!994193))

(assert (=> b!1075869 m!994195))

(assert (=> b!1075869 m!994193))

(assert (=> b!1075869 m!994145))

(declare-fun m!994279 () Bool)

(assert (=> b!1075869 m!994279))

(assert (=> b!1075869 m!994145))

(declare-fun m!994281 () Bool)

(assert (=> b!1075880 m!994281))

(assert (=> b!1075702 d!129503))

(declare-fun d!129505 () Bool)

(declare-fun e!614943 () Bool)

(assert (=> d!129505 e!614943))

(declare-fun res!717171 () Bool)

(assert (=> d!129505 (=> (not res!717171) (not e!614943))))

(declare-fun lt!477618 () ListLongMap!14679)

(assert (=> d!129505 (= res!717171 (contains!6321 lt!477618 (_1!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun lt!477617 () List!23231)

(assert (=> d!129505 (= lt!477618 (ListLongMap!14680 lt!477617))))

(declare-fun lt!477616 () Unit!35260)

(declare-fun lt!477615 () Unit!35260)

(assert (=> d!129505 (= lt!477616 lt!477615)))

(assert (=> d!129505 (= (getValueByKey!615 lt!477617 (_1!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!665 (_2!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!129505 (= lt!477615 (lemmaContainsTupThenGetReturnValue!291 lt!477617 (_1!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!129505 (= lt!477617 (insertStrictlySorted!384 (toList!7355 lt!477483) (_1!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) (_2!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(assert (=> d!129505 (= (+!3254 lt!477483 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)) lt!477618)))

(declare-fun b!1075890 () Bool)

(declare-fun res!717172 () Bool)

(assert (=> b!1075890 (=> (not res!717172) (not e!614943))))

(assert (=> b!1075890 (= res!717172 (= (getValueByKey!615 (toList!7355 lt!477618) (_1!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))) (Some!665 (_2!8366 (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))))

(declare-fun b!1075891 () Bool)

(assert (=> b!1075891 (= e!614943 (contains!6322 (toList!7355 lt!477618) (tuple2!16711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(assert (= (and d!129505 res!717171) b!1075890))

(assert (= (and b!1075890 res!717172) b!1075891))

(declare-fun m!994283 () Bool)

(assert (=> d!129505 m!994283))

(declare-fun m!994285 () Bool)

(assert (=> d!129505 m!994285))

(declare-fun m!994287 () Bool)

(assert (=> d!129505 m!994287))

(declare-fun m!994289 () Bool)

(assert (=> d!129505 m!994289))

(declare-fun m!994291 () Bool)

(assert (=> b!1075890 m!994291))

(declare-fun m!994293 () Bool)

(assert (=> b!1075891 m!994293))

(assert (=> b!1075702 d!129505))

(declare-fun d!129507 () Bool)

(assert (=> d!129507 (= (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477621 () Unit!35260)

(declare-fun choose!1764 (array!68964 array!68962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39841 V!39841 V!39841 V!39841 (_ BitVec 32) Int) Unit!35260)

(assert (=> d!129507 (= lt!477621 (choose!1764 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129507 (validMask!0 mask!1515)))

(assert (=> d!129507 (= (lemmaNoChangeToArrayThenSameMapNoExtras!904 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477621)))

(declare-fun bs!31664 () Bool)

(assert (= bs!31664 d!129507))

(assert (=> bs!31664 m!994081))

(assert (=> bs!31664 m!994079))

(declare-fun m!994295 () Bool)

(assert (=> bs!31664 m!994295))

(assert (=> bs!31664 m!994071))

(assert (=> b!1075707 d!129507))

(declare-fun b!1075916 () Bool)

(assert (=> b!1075916 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(assert (=> b!1075916 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _values!955)))))

(declare-fun e!614961 () Bool)

(declare-fun lt!477639 () ListLongMap!14679)

(assert (=> b!1075916 (= e!614961 (= (apply!934 lt!477639 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)) (get!17238 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075917 () Bool)

(declare-fun e!614964 () ListLongMap!14679)

(assert (=> b!1075917 (= e!614964 (ListLongMap!14680 Nil!23228))))

(declare-fun b!1075918 () Bool)

(declare-fun e!614958 () Bool)

(declare-fun isEmpty!964 (ListLongMap!14679) Bool)

(assert (=> b!1075918 (= e!614958 (isEmpty!964 lt!477639))))

(declare-fun b!1075919 () Bool)

(declare-fun e!614960 () Bool)

(assert (=> b!1075919 (= e!614960 e!614961)))

(assert (=> b!1075919 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun res!717182 () Bool)

(assert (=> b!1075919 (= res!717182 (contains!6321 lt!477639 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075919 (=> (not res!717182) (not e!614961))))

(declare-fun b!1075921 () Bool)

(assert (=> b!1075921 (= e!614960 e!614958)))

(declare-fun c!108135 () Bool)

(assert (=> b!1075921 (= c!108135 (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun b!1075922 () Bool)

(declare-fun res!717183 () Bool)

(declare-fun e!614962 () Bool)

(assert (=> b!1075922 (=> (not res!717183) (not e!614962))))

(assert (=> b!1075922 (= res!717183 (not (contains!6321 lt!477639 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075923 () Bool)

(declare-fun e!614963 () ListLongMap!14679)

(assert (=> b!1075923 (= e!614964 e!614963)))

(declare-fun c!108137 () Bool)

(assert (=> b!1075923 (= c!108137 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45588 () Bool)

(declare-fun call!45591 () ListLongMap!14679)

(assert (=> bm!45588 (= call!45591 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075924 () Bool)

(assert (=> b!1075924 (= e!614962 e!614960)))

(declare-fun c!108134 () Bool)

(declare-fun e!614959 () Bool)

(assert (=> b!1075924 (= c!108134 e!614959)))

(declare-fun res!717181 () Bool)

(assert (=> b!1075924 (=> (not res!717181) (not e!614959))))

(assert (=> b!1075924 (= res!717181 (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun b!1075925 () Bool)

(declare-fun lt!477638 () Unit!35260)

(declare-fun lt!477637 () Unit!35260)

(assert (=> b!1075925 (= lt!477638 lt!477637)))

(declare-fun lt!477636 () ListLongMap!14679)

(declare-fun lt!477642 () (_ BitVec 64))

(declare-fun lt!477641 () V!39841)

(declare-fun lt!477640 () (_ BitVec 64))

(assert (=> b!1075925 (not (contains!6321 (+!3254 lt!477636 (tuple2!16711 lt!477640 lt!477641)) lt!477642))))

(declare-fun addStillNotContains!270 (ListLongMap!14679 (_ BitVec 64) V!39841 (_ BitVec 64)) Unit!35260)

(assert (=> b!1075925 (= lt!477637 (addStillNotContains!270 lt!477636 lt!477640 lt!477641 lt!477642))))

(assert (=> b!1075925 (= lt!477642 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075925 (= lt!477641 (get!17238 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075925 (= lt!477640 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075925 (= lt!477636 call!45591)))

(assert (=> b!1075925 (= e!614963 (+!3254 call!45591 (tuple2!16711 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000) (get!17238 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!129509 () Bool)

(assert (=> d!129509 e!614962))

(declare-fun res!717184 () Bool)

(assert (=> d!129509 (=> (not res!717184) (not e!614962))))

(assert (=> d!129509 (= res!717184 (not (contains!6321 lt!477639 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129509 (= lt!477639 e!614964)))

(declare-fun c!108136 () Bool)

(assert (=> d!129509 (= c!108136 (bvsge #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(assert (=> d!129509 (validMask!0 mask!1515)))

(assert (=> d!129509 (= (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477639)))

(declare-fun b!1075920 () Bool)

(assert (=> b!1075920 (= e!614958 (= lt!477639 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075926 () Bool)

(assert (=> b!1075926 (= e!614959 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075926 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075927 () Bool)

(assert (=> b!1075927 (= e!614963 call!45591)))

(assert (= (and d!129509 c!108136) b!1075917))

(assert (= (and d!129509 (not c!108136)) b!1075923))

(assert (= (and b!1075923 c!108137) b!1075925))

(assert (= (and b!1075923 (not c!108137)) b!1075927))

(assert (= (or b!1075925 b!1075927) bm!45588))

(assert (= (and d!129509 res!717184) b!1075922))

(assert (= (and b!1075922 res!717183) b!1075924))

(assert (= (and b!1075924 res!717181) b!1075926))

(assert (= (and b!1075924 c!108134) b!1075919))

(assert (= (and b!1075924 (not c!108134)) b!1075921))

(assert (= (and b!1075919 res!717182) b!1075916))

(assert (= (and b!1075921 c!108135) b!1075920))

(assert (= (and b!1075921 (not c!108135)) b!1075918))

(declare-fun b_lambda!16907 () Bool)

(assert (=> (not b_lambda!16907) (not b!1075916)))

(assert (=> b!1075916 t!32581))

(declare-fun b_and!35157 () Bool)

(assert (= b_and!35155 (and (=> t!32581 result!14831) b_and!35157)))

(declare-fun b_lambda!16909 () Bool)

(assert (=> (not b_lambda!16909) (not b!1075925)))

(assert (=> b!1075925 t!32581))

(declare-fun b_and!35159 () Bool)

(assert (= b_and!35157 (and (=> t!32581 result!14831) b_and!35159)))

(assert (=> b!1075923 m!994145))

(assert (=> b!1075923 m!994145))

(assert (=> b!1075923 m!994147))

(declare-fun m!994297 () Bool)

(assert (=> b!1075920 m!994297))

(assert (=> b!1075926 m!994145))

(assert (=> b!1075926 m!994145))

(assert (=> b!1075926 m!994147))

(declare-fun m!994299 () Bool)

(assert (=> b!1075925 m!994299))

(declare-fun m!994301 () Bool)

(assert (=> b!1075925 m!994301))

(declare-fun m!994303 () Bool)

(assert (=> b!1075925 m!994303))

(declare-fun m!994305 () Bool)

(assert (=> b!1075925 m!994305))

(assert (=> b!1075925 m!994191))

(assert (=> b!1075925 m!994145))

(assert (=> b!1075925 m!994191))

(assert (=> b!1075925 m!994193))

(assert (=> b!1075925 m!994195))

(assert (=> b!1075925 m!994193))

(assert (=> b!1075925 m!994301))

(assert (=> bm!45588 m!994297))

(declare-fun m!994307 () Bool)

(assert (=> b!1075918 m!994307))

(assert (=> b!1075919 m!994145))

(assert (=> b!1075919 m!994145))

(declare-fun m!994309 () Bool)

(assert (=> b!1075919 m!994309))

(declare-fun m!994311 () Bool)

(assert (=> b!1075922 m!994311))

(declare-fun m!994313 () Bool)

(assert (=> d!129509 m!994313))

(assert (=> d!129509 m!994071))

(assert (=> b!1075916 m!994191))

(assert (=> b!1075916 m!994191))

(assert (=> b!1075916 m!994193))

(assert (=> b!1075916 m!994195))

(assert (=> b!1075916 m!994193))

(assert (=> b!1075916 m!994145))

(declare-fun m!994315 () Bool)

(assert (=> b!1075916 m!994315))

(assert (=> b!1075916 m!994145))

(assert (=> b!1075707 d!129509))

(declare-fun b!1075928 () Bool)

(assert (=> b!1075928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(assert (=> b!1075928 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33704 _values!955)))))

(declare-fun lt!477646 () ListLongMap!14679)

(declare-fun e!614968 () Bool)

(assert (=> b!1075928 (= e!614968 (= (apply!934 lt!477646 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)) (get!17238 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1075929 () Bool)

(declare-fun e!614971 () ListLongMap!14679)

(assert (=> b!1075929 (= e!614971 (ListLongMap!14680 Nil!23228))))

(declare-fun b!1075930 () Bool)

(declare-fun e!614965 () Bool)

(assert (=> b!1075930 (= e!614965 (isEmpty!964 lt!477646))))

(declare-fun b!1075931 () Bool)

(declare-fun e!614967 () Bool)

(assert (=> b!1075931 (= e!614967 e!614968)))

(assert (=> b!1075931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun res!717186 () Bool)

(assert (=> b!1075931 (= res!717186 (contains!6321 lt!477646 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075931 (=> (not res!717186) (not e!614968))))

(declare-fun b!1075933 () Bool)

(assert (=> b!1075933 (= e!614967 e!614965)))

(declare-fun c!108139 () Bool)

(assert (=> b!1075933 (= c!108139 (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun b!1075934 () Bool)

(declare-fun res!717187 () Bool)

(declare-fun e!614969 () Bool)

(assert (=> b!1075934 (=> (not res!717187) (not e!614969))))

(assert (=> b!1075934 (= res!717187 (not (contains!6321 lt!477646 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1075935 () Bool)

(declare-fun e!614970 () ListLongMap!14679)

(assert (=> b!1075935 (= e!614971 e!614970)))

(declare-fun c!108141 () Bool)

(assert (=> b!1075935 (= c!108141 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45589 () Bool)

(declare-fun call!45592 () ListLongMap!14679)

(assert (=> bm!45589 (= call!45592 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1075936 () Bool)

(assert (=> b!1075936 (= e!614969 e!614967)))

(declare-fun c!108138 () Bool)

(declare-fun e!614966 () Bool)

(assert (=> b!1075936 (= c!108138 e!614966)))

(declare-fun res!717185 () Bool)

(assert (=> b!1075936 (=> (not res!717185) (not e!614966))))

(assert (=> b!1075936 (= res!717185 (bvslt #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(declare-fun b!1075937 () Bool)

(declare-fun lt!477645 () Unit!35260)

(declare-fun lt!477644 () Unit!35260)

(assert (=> b!1075937 (= lt!477645 lt!477644)))

(declare-fun lt!477647 () (_ BitVec 64))

(declare-fun lt!477643 () ListLongMap!14679)

(declare-fun lt!477648 () V!39841)

(declare-fun lt!477649 () (_ BitVec 64))

(assert (=> b!1075937 (not (contains!6321 (+!3254 lt!477643 (tuple2!16711 lt!477647 lt!477648)) lt!477649))))

(assert (=> b!1075937 (= lt!477644 (addStillNotContains!270 lt!477643 lt!477647 lt!477648 lt!477649))))

(assert (=> b!1075937 (= lt!477649 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1075937 (= lt!477648 (get!17238 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1075937 (= lt!477647 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1075937 (= lt!477643 call!45592)))

(assert (=> b!1075937 (= e!614970 (+!3254 call!45592 (tuple2!16711 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000) (get!17238 (select (arr!33166 _values!955) #b00000000000000000000000000000000) (dynLambda!2033 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!129511 () Bool)

(assert (=> d!129511 e!614969))

(declare-fun res!717188 () Bool)

(assert (=> d!129511 (=> (not res!717188) (not e!614969))))

(assert (=> d!129511 (= res!717188 (not (contains!6321 lt!477646 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129511 (= lt!477646 e!614971)))

(declare-fun c!108140 () Bool)

(assert (=> d!129511 (= c!108140 (bvsge #b00000000000000000000000000000000 (size!33705 _keys!1163)))))

(assert (=> d!129511 (validMask!0 mask!1515)))

(assert (=> d!129511 (= (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477646)))

(declare-fun b!1075932 () Bool)

(assert (=> b!1075932 (= e!614965 (= lt!477646 (getCurrentListMapNoExtraKeys!3932 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1075938 () Bool)

(assert (=> b!1075938 (= e!614966 (validKeyInArray!0 (select (arr!33167 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1075938 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1075939 () Bool)

(assert (=> b!1075939 (= e!614970 call!45592)))

(assert (= (and d!129511 c!108140) b!1075929))

(assert (= (and d!129511 (not c!108140)) b!1075935))

(assert (= (and b!1075935 c!108141) b!1075937))

(assert (= (and b!1075935 (not c!108141)) b!1075939))

(assert (= (or b!1075937 b!1075939) bm!45589))

(assert (= (and d!129511 res!717188) b!1075934))

(assert (= (and b!1075934 res!717187) b!1075936))

(assert (= (and b!1075936 res!717185) b!1075938))

(assert (= (and b!1075936 c!108138) b!1075931))

(assert (= (and b!1075936 (not c!108138)) b!1075933))

(assert (= (and b!1075931 res!717186) b!1075928))

(assert (= (and b!1075933 c!108139) b!1075932))

(assert (= (and b!1075933 (not c!108139)) b!1075930))

(declare-fun b_lambda!16911 () Bool)

(assert (=> (not b_lambda!16911) (not b!1075928)))

(assert (=> b!1075928 t!32581))

(declare-fun b_and!35161 () Bool)

(assert (= b_and!35159 (and (=> t!32581 result!14831) b_and!35161)))

(declare-fun b_lambda!16913 () Bool)

(assert (=> (not b_lambda!16913) (not b!1075937)))

(assert (=> b!1075937 t!32581))

(declare-fun b_and!35163 () Bool)

(assert (= b_and!35161 (and (=> t!32581 result!14831) b_and!35163)))

(assert (=> b!1075935 m!994145))

(assert (=> b!1075935 m!994145))

(assert (=> b!1075935 m!994147))

(declare-fun m!994317 () Bool)

(assert (=> b!1075932 m!994317))

(assert (=> b!1075938 m!994145))

(assert (=> b!1075938 m!994145))

(assert (=> b!1075938 m!994147))

(declare-fun m!994319 () Bool)

(assert (=> b!1075937 m!994319))

(declare-fun m!994321 () Bool)

(assert (=> b!1075937 m!994321))

(declare-fun m!994323 () Bool)

(assert (=> b!1075937 m!994323))

(declare-fun m!994325 () Bool)

(assert (=> b!1075937 m!994325))

(assert (=> b!1075937 m!994191))

(assert (=> b!1075937 m!994145))

(assert (=> b!1075937 m!994191))

(assert (=> b!1075937 m!994193))

(assert (=> b!1075937 m!994195))

(assert (=> b!1075937 m!994193))

(assert (=> b!1075937 m!994321))

(assert (=> bm!45589 m!994317))

(declare-fun m!994327 () Bool)

(assert (=> b!1075930 m!994327))

(assert (=> b!1075931 m!994145))

(assert (=> b!1075931 m!994145))

(declare-fun m!994329 () Bool)

(assert (=> b!1075931 m!994329))

(declare-fun m!994331 () Bool)

(assert (=> b!1075934 m!994331))

(declare-fun m!994333 () Bool)

(assert (=> d!129511 m!994333))

(assert (=> d!129511 m!994071))

(assert (=> b!1075928 m!994191))

(assert (=> b!1075928 m!994191))

(assert (=> b!1075928 m!994193))

(assert (=> b!1075928 m!994195))

(assert (=> b!1075928 m!994193))

(assert (=> b!1075928 m!994145))

(declare-fun m!994335 () Bool)

(assert (=> b!1075928 m!994335))

(assert (=> b!1075928 m!994145))

(assert (=> b!1075707 d!129511))

(declare-fun b!1075946 () Bool)

(declare-fun e!614976 () Bool)

(assert (=> b!1075946 (= e!614976 tp_is_empty!26029)))

(declare-fun mapNonEmpty!40792 () Bool)

(declare-fun mapRes!40792 () Bool)

(declare-fun tp!78164 () Bool)

(assert (=> mapNonEmpty!40792 (= mapRes!40792 (and tp!78164 e!614976))))

(declare-fun mapKey!40792 () (_ BitVec 32))

(declare-fun mapRest!40792 () (Array (_ BitVec 32) ValueCell!12311))

(declare-fun mapValue!40792 () ValueCell!12311)

(assert (=> mapNonEmpty!40792 (= mapRest!40783 (store mapRest!40792 mapKey!40792 mapValue!40792))))

(declare-fun b!1075947 () Bool)

(declare-fun e!614977 () Bool)

(assert (=> b!1075947 (= e!614977 tp_is_empty!26029)))

(declare-fun mapIsEmpty!40792 () Bool)

(assert (=> mapIsEmpty!40792 mapRes!40792))

(declare-fun condMapEmpty!40792 () Bool)

(declare-fun mapDefault!40792 () ValueCell!12311)

(assert (=> mapNonEmpty!40783 (= condMapEmpty!40792 (= mapRest!40783 ((as const (Array (_ BitVec 32) ValueCell!12311)) mapDefault!40792)))))

(assert (=> mapNonEmpty!40783 (= tp!78148 (and e!614977 mapRes!40792))))

(assert (= (and mapNonEmpty!40783 condMapEmpty!40792) mapIsEmpty!40792))

(assert (= (and mapNonEmpty!40783 (not condMapEmpty!40792)) mapNonEmpty!40792))

(assert (= (and mapNonEmpty!40792 ((_ is ValueCellFull!12311) mapValue!40792)) b!1075946))

(assert (= (and mapNonEmpty!40783 ((_ is ValueCellFull!12311) mapDefault!40792)) b!1075947))

(declare-fun m!994337 () Bool)

(assert (=> mapNonEmpty!40792 m!994337))

(declare-fun b_lambda!16915 () Bool)

(assert (= b_lambda!16913 (or (and start!95174 b_free!22219) b_lambda!16915)))

(declare-fun b_lambda!16917 () Bool)

(assert (= b_lambda!16911 (or (and start!95174 b_free!22219) b_lambda!16917)))

(declare-fun b_lambda!16919 () Bool)

(assert (= b_lambda!16903 (or (and start!95174 b_free!22219) b_lambda!16919)))

(declare-fun b_lambda!16921 () Bool)

(assert (= b_lambda!16907 (or (and start!95174 b_free!22219) b_lambda!16921)))

(declare-fun b_lambda!16923 () Bool)

(assert (= b_lambda!16905 (or (and start!95174 b_free!22219) b_lambda!16923)))

(declare-fun b_lambda!16925 () Bool)

(assert (= b_lambda!16909 (or (and start!95174 b_free!22219) b_lambda!16925)))

(check-sat (not b!1075923) (not b!1075932) (not b!1075818) (not b!1075934) (not b!1075841) (not b_lambda!16917) (not b!1075879) (not b!1075876) (not b!1075916) (not b!1075935) (not b!1075872) (not b!1075825) (not d!129489) (not bm!45588) (not b!1075882) (not bm!45570) (not d!129505) (not b!1075824) (not bm!45581) (not b!1075920) (not b_lambda!16915) (not b_lambda!16921) (not b!1075890) b_and!35163 (not mapNonEmpty!40792) (not b_lambda!16925) (not b!1075891) tp_is_empty!26029 (not bm!45569) (not b_lambda!16919) (not bm!45575) (not bm!45572) (not b!1075918) (not b!1075928) (not bm!45578) (not b!1075865) (not b!1075883) (not bm!45568) (not b!1075884) (not b!1075822) (not b!1075930) (not b!1075867) (not b!1075856) (not bm!45583) (not d!129503) (not b!1075811) (not d!129509) (not bm!45582) (not b!1075938) (not b_next!22219) (not d!129507) (not b!1075925) (not b!1075839) (not b!1075821) (not b!1075922) (not bm!45585) (not b!1075919) (not b!1075826) (not b!1075814) (not b!1075853) (not b!1075869) (not b!1075937) (not d!129511) (not b!1075880) (not b!1075926) (not b!1075838) (not b!1075840) (not d!129491) (not d!129487) (not b!1075852) (not bm!45589) (not b_lambda!16923) (not b!1075931))
(check-sat b_and!35163 (not b_next!22219))
