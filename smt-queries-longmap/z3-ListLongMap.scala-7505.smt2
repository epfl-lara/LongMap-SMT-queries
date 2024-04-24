; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95364 () Bool)

(assert start!95364)

(declare-fun b_free!22207 () Bool)

(declare-fun b_next!22207 () Bool)

(assert (=> start!95364 (= b_free!22207 (not b_next!22207))))

(declare-fun tp!78106 () Bool)

(declare-fun b_and!35147 () Bool)

(assert (=> start!95364 (= tp!78106 b_and!35147)))

(declare-fun b!1076669 () Bool)

(declare-fun e!615415 () Bool)

(declare-fun tp_is_empty!26017 () Bool)

(assert (=> b!1076669 (= e!615415 tp_is_empty!26017)))

(declare-fun res!717411 () Bool)

(declare-fun e!615416 () Bool)

(assert (=> start!95364 (=> (not res!717411) (not e!615416))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95364 (= res!717411 (validMask!0 mask!1515))))

(assert (=> start!95364 e!615416))

(assert (=> start!95364 true))

(assert (=> start!95364 tp_is_empty!26017))

(declare-datatypes ((V!39825 0))(
  ( (V!39826 (val!13059 Int)) )
))
(declare-datatypes ((ValueCell!12305 0))(
  ( (ValueCellFull!12305 (v!15679 V!39825)) (EmptyCell!12305) )
))
(declare-datatypes ((array!69045 0))(
  ( (array!69046 (arr!33203 (Array (_ BitVec 32) ValueCell!12305)) (size!33740 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69045)

(declare-fun e!615418 () Bool)

(declare-fun array_inv!25696 (array!69045) Bool)

(assert (=> start!95364 (and (array_inv!25696 _values!955) e!615418)))

(assert (=> start!95364 tp!78106))

(declare-datatypes ((array!69047 0))(
  ( (array!69048 (arr!33204 (Array (_ BitVec 32) (_ BitVec 64))) (size!33741 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69047)

(declare-fun array_inv!25697 (array!69047) Bool)

(assert (=> start!95364 (array_inv!25697 _keys!1163)))

(declare-fun minValue!907 () V!39825)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39825)

(declare-fun e!615417 () Bool)

(declare-datatypes ((tuple2!16626 0))(
  ( (tuple2!16627 (_1!8324 (_ BitVec 64)) (_2!8324 V!39825)) )
))
(declare-datatypes ((List!23177 0))(
  ( (Nil!23174) (Cons!23173 (h!24391 tuple2!16626) (t!32520 List!23177)) )
))
(declare-datatypes ((ListLongMap!14603 0))(
  ( (ListLongMap!14604 (toList!7317 List!23177)) )
))
(declare-fun lt!477822 () ListLongMap!14603)

(declare-fun b!1076670 () Bool)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun getCurrentListMap!4174 (array!69047 array!69045 (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 (_ BitVec 32) Int) ListLongMap!14603)

(assert (=> b!1076670 (= e!615417 (= lt!477822 (getCurrentListMap!4174 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963)))))

(declare-fun lt!477826 () ListLongMap!14603)

(assert (=> b!1076670 (= lt!477822 lt!477826)))

(declare-fun -!704 (ListLongMap!14603 (_ BitVec 64)) ListLongMap!14603)

(assert (=> b!1076670 (= lt!477822 (-!704 lt!477826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!35377 0))(
  ( (Unit!35378) )
))
(declare-fun lt!477823 () Unit!35377)

(declare-fun removeNotPresentStillSame!78 (ListLongMap!14603 (_ BitVec 64)) Unit!35377)

(assert (=> b!1076670 (= lt!477823 (removeNotPresentStillSame!78 lt!477826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076671 () Bool)

(declare-fun res!717408 () Bool)

(assert (=> b!1076671 (=> (not res!717408) (not e!615416))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076671 (= res!717408 (and (= (size!33740 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33741 _keys!1163) (size!33740 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!40759 () Bool)

(declare-fun mapRes!40759 () Bool)

(declare-fun tp!78107 () Bool)

(declare-fun e!615419 () Bool)

(assert (=> mapNonEmpty!40759 (= mapRes!40759 (and tp!78107 e!615419))))

(declare-fun mapRest!40759 () (Array (_ BitVec 32) ValueCell!12305))

(declare-fun mapKey!40759 () (_ BitVec 32))

(declare-fun mapValue!40759 () ValueCell!12305)

(assert (=> mapNonEmpty!40759 (= (arr!33203 _values!955) (store mapRest!40759 mapKey!40759 mapValue!40759))))

(declare-fun b!1076672 () Bool)

(assert (=> b!1076672 (= e!615419 tp_is_empty!26017)))

(declare-fun mapIsEmpty!40759 () Bool)

(assert (=> mapIsEmpty!40759 mapRes!40759))

(declare-fun b!1076673 () Bool)

(assert (=> b!1076673 (= e!615418 (and e!615415 mapRes!40759))))

(declare-fun condMapEmpty!40759 () Bool)

(declare-fun mapDefault!40759 () ValueCell!12305)

(assert (=> b!1076673 (= condMapEmpty!40759 (= (arr!33203 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12305)) mapDefault!40759)))))

(declare-fun b!1076674 () Bool)

(declare-fun e!615420 () Bool)

(assert (=> b!1076674 (= e!615416 (not e!615420))))

(declare-fun res!717409 () Bool)

(assert (=> b!1076674 (=> res!717409 e!615420)))

(assert (=> b!1076674 (= res!717409 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!477827 () ListLongMap!14603)

(declare-fun lt!477825 () ListLongMap!14603)

(assert (=> b!1076674 (= lt!477827 lt!477825)))

(declare-fun lt!477824 () Unit!35377)

(declare-fun zeroValueBefore!47 () V!39825)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!890 (array!69047 array!69045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 V!39825 V!39825 (_ BitVec 32) Int) Unit!35377)

(assert (=> b!1076674 (= lt!477824 (lemmaNoChangeToArrayThenSameMapNoExtras!890 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3910 (array!69047 array!69045 (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 (_ BitVec 32) Int) ListLongMap!14603)

(assert (=> b!1076674 (= lt!477825 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076674 (= lt!477827 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076675 () Bool)

(declare-fun res!717410 () Bool)

(assert (=> b!1076675 (=> (not res!717410) (not e!615416))))

(declare-datatypes ((List!23178 0))(
  ( (Nil!23175) (Cons!23174 (h!24392 (_ BitVec 64)) (t!32521 List!23178)) )
))
(declare-fun arrayNoDuplicates!0 (array!69047 (_ BitVec 32) List!23178) Bool)

(assert (=> b!1076675 (= res!717410 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23175))))

(declare-fun b!1076676 () Bool)

(declare-fun res!717412 () Bool)

(assert (=> b!1076676 (=> (not res!717412) (not e!615416))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69047 (_ BitVec 32)) Bool)

(assert (=> b!1076676 (= res!717412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1076677 () Bool)

(assert (=> b!1076677 (= e!615420 e!615417)))

(declare-fun res!717413 () Bool)

(assert (=> b!1076677 (=> res!717413 e!615417)))

(declare-fun contains!6371 (ListLongMap!14603 (_ BitVec 64)) Bool)

(assert (=> b!1076677 (= res!717413 (contains!6371 lt!477826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1076677 (= lt!477826 (getCurrentListMap!4174 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95364 res!717411) b!1076671))

(assert (= (and b!1076671 res!717408) b!1076676))

(assert (= (and b!1076676 res!717412) b!1076675))

(assert (= (and b!1076675 res!717410) b!1076674))

(assert (= (and b!1076674 (not res!717409)) b!1076677))

(assert (= (and b!1076677 (not res!717413)) b!1076670))

(assert (= (and b!1076673 condMapEmpty!40759) mapIsEmpty!40759))

(assert (= (and b!1076673 (not condMapEmpty!40759)) mapNonEmpty!40759))

(get-info :version)

(assert (= (and mapNonEmpty!40759 ((_ is ValueCellFull!12305) mapValue!40759)) b!1076672))

(assert (= (and b!1076673 ((_ is ValueCellFull!12305) mapDefault!40759)) b!1076669))

(assert (= start!95364 b!1076673))

(declare-fun m!995843 () Bool)

(assert (=> b!1076670 m!995843))

(declare-fun m!995845 () Bool)

(assert (=> b!1076670 m!995845))

(declare-fun m!995847 () Bool)

(assert (=> b!1076670 m!995847))

(declare-fun m!995849 () Bool)

(assert (=> b!1076676 m!995849))

(declare-fun m!995851 () Bool)

(assert (=> b!1076677 m!995851))

(declare-fun m!995853 () Bool)

(assert (=> b!1076677 m!995853))

(declare-fun m!995855 () Bool)

(assert (=> b!1076674 m!995855))

(declare-fun m!995857 () Bool)

(assert (=> b!1076674 m!995857))

(declare-fun m!995859 () Bool)

(assert (=> b!1076674 m!995859))

(declare-fun m!995861 () Bool)

(assert (=> mapNonEmpty!40759 m!995861))

(declare-fun m!995863 () Bool)

(assert (=> start!95364 m!995863))

(declare-fun m!995865 () Bool)

(assert (=> start!95364 m!995865))

(declare-fun m!995867 () Bool)

(assert (=> start!95364 m!995867))

(declare-fun m!995869 () Bool)

(assert (=> b!1076675 m!995869))

(check-sat (not mapNonEmpty!40759) (not b!1076675) (not b!1076676) (not start!95364) (not b!1076670) (not b!1076674) b_and!35147 tp_is_empty!26017 (not b!1076677) (not b_next!22207))
(check-sat b_and!35147 (not b_next!22207))
(get-model)

(declare-fun d!130053 () Bool)

(assert (=> d!130053 (= (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477866 () Unit!35377)

(declare-fun choose!1758 (array!69047 array!69045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39825 V!39825 V!39825 V!39825 (_ BitVec 32) Int) Unit!35377)

(assert (=> d!130053 (= lt!477866 (choose!1758 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!130053 (validMask!0 mask!1515)))

(assert (=> d!130053 (= (lemmaNoChangeToArrayThenSameMapNoExtras!890 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477866)))

(declare-fun bs!31703 () Bool)

(assert (= bs!31703 d!130053))

(assert (=> bs!31703 m!995859))

(assert (=> bs!31703 m!995857))

(declare-fun m!995927 () Bool)

(assert (=> bs!31703 m!995927))

(assert (=> bs!31703 m!995863))

(assert (=> b!1076674 d!130053))

(declare-fun b!1076756 () Bool)

(declare-fun e!615480 () Bool)

(declare-fun e!615482 () Bool)

(assert (=> b!1076756 (= e!615480 e!615482)))

(declare-fun c!108461 () Bool)

(assert (=> b!1076756 (= c!108461 (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun b!1076757 () Bool)

(assert (=> b!1076757 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(assert (=> b!1076757 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33740 _values!955)))))

(declare-fun e!615479 () Bool)

(declare-fun lt!477887 () ListLongMap!14603)

(declare-fun apply!948 (ListLongMap!14603 (_ BitVec 64)) V!39825)

(declare-fun get!17266 (ValueCell!12305 V!39825) V!39825)

(declare-fun dynLambda!2063 (Int (_ BitVec 64)) V!39825)

(assert (=> b!1076757 (= e!615479 (= (apply!948 lt!477887 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)) (get!17266 (select (arr!33203 _values!955) #b00000000000000000000000000000000) (dynLambda!2063 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076758 () Bool)

(declare-fun e!615481 () Bool)

(assert (=> b!1076758 (= e!615481 e!615480)))

(declare-fun c!108460 () Bool)

(declare-fun e!615478 () Bool)

(assert (=> b!1076758 (= c!108460 e!615478)))

(declare-fun res!717460 () Bool)

(assert (=> b!1076758 (=> (not res!717460) (not e!615478))))

(assert (=> b!1076758 (= res!717460 (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun b!1076759 () Bool)

(assert (=> b!1076759 (= e!615480 e!615479)))

(assert (=> b!1076759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun res!717459 () Bool)

(assert (=> b!1076759 (= res!717459 (contains!6371 lt!477887 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076759 (=> (not res!717459) (not e!615479))))

(declare-fun b!1076760 () Bool)

(declare-fun e!615484 () ListLongMap!14603)

(declare-fun call!45571 () ListLongMap!14603)

(assert (=> b!1076760 (= e!615484 call!45571)))

(declare-fun d!130055 () Bool)

(assert (=> d!130055 e!615481))

(declare-fun res!717458 () Bool)

(assert (=> d!130055 (=> (not res!717458) (not e!615481))))

(assert (=> d!130055 (= res!717458 (not (contains!6371 lt!477887 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!615483 () ListLongMap!14603)

(assert (=> d!130055 (= lt!477887 e!615483)))

(declare-fun c!108459 () Bool)

(assert (=> d!130055 (= c!108459 (bvsge #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(assert (=> d!130055 (validMask!0 mask!1515)))

(assert (=> d!130055 (= (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477887)))

(declare-fun b!1076761 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1076761 (= e!615478 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076761 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1076762 () Bool)

(assert (=> b!1076762 (= e!615483 (ListLongMap!14604 Nil!23174))))

(declare-fun bm!45568 () Bool)

(assert (=> bm!45568 (= call!45571 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076763 () Bool)

(declare-fun res!717461 () Bool)

(assert (=> b!1076763 (=> (not res!717461) (not e!615481))))

(assert (=> b!1076763 (= res!717461 (not (contains!6371 lt!477887 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076764 () Bool)

(declare-fun isEmpty!961 (ListLongMap!14603) Bool)

(assert (=> b!1076764 (= e!615482 (isEmpty!961 lt!477887))))

(declare-fun b!1076765 () Bool)

(declare-fun lt!477886 () Unit!35377)

(declare-fun lt!477883 () Unit!35377)

(assert (=> b!1076765 (= lt!477886 lt!477883)))

(declare-fun lt!477885 () V!39825)

(declare-fun lt!477884 () (_ BitVec 64))

(declare-fun lt!477881 () ListLongMap!14603)

(declare-fun lt!477882 () (_ BitVec 64))

(declare-fun +!3246 (ListLongMap!14603 tuple2!16626) ListLongMap!14603)

(assert (=> b!1076765 (not (contains!6371 (+!3246 lt!477881 (tuple2!16627 lt!477884 lt!477885)) lt!477882))))

(declare-fun addStillNotContains!269 (ListLongMap!14603 (_ BitVec 64) V!39825 (_ BitVec 64)) Unit!35377)

(assert (=> b!1076765 (= lt!477883 (addStillNotContains!269 lt!477881 lt!477884 lt!477885 lt!477882))))

(assert (=> b!1076765 (= lt!477882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1076765 (= lt!477885 (get!17266 (select (arr!33203 _values!955) #b00000000000000000000000000000000) (dynLambda!2063 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076765 (= lt!477884 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076765 (= lt!477881 call!45571)))

(assert (=> b!1076765 (= e!615484 (+!3246 call!45571 (tuple2!16627 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000) (get!17266 (select (arr!33203 _values!955) #b00000000000000000000000000000000) (dynLambda!2063 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1076766 () Bool)

(assert (=> b!1076766 (= e!615483 e!615484)))

(declare-fun c!108458 () Bool)

(assert (=> b!1076766 (= c!108458 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076767 () Bool)

(assert (=> b!1076767 (= e!615482 (= lt!477887 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(assert (= (and d!130055 c!108459) b!1076762))

(assert (= (and d!130055 (not c!108459)) b!1076766))

(assert (= (and b!1076766 c!108458) b!1076765))

(assert (= (and b!1076766 (not c!108458)) b!1076760))

(assert (= (or b!1076765 b!1076760) bm!45568))

(assert (= (and d!130055 res!717458) b!1076763))

(assert (= (and b!1076763 res!717461) b!1076758))

(assert (= (and b!1076758 res!717460) b!1076761))

(assert (= (and b!1076758 c!108460) b!1076759))

(assert (= (and b!1076758 (not c!108460)) b!1076756))

(assert (= (and b!1076759 res!717459) b!1076757))

(assert (= (and b!1076756 c!108461) b!1076767))

(assert (= (and b!1076756 (not c!108461)) b!1076764))

(declare-fun b_lambda!16887 () Bool)

(assert (=> (not b_lambda!16887) (not b!1076757)))

(declare-fun t!32526 () Bool)

(declare-fun tb!7165 () Bool)

(assert (=> (and start!95364 (= defaultEntry!963 defaultEntry!963) t!32526) tb!7165))

(declare-fun result!14819 () Bool)

(assert (=> tb!7165 (= result!14819 tp_is_empty!26017)))

(assert (=> b!1076757 t!32526))

(declare-fun b_and!35153 () Bool)

(assert (= b_and!35147 (and (=> t!32526 result!14819) b_and!35153)))

(declare-fun b_lambda!16889 () Bool)

(assert (=> (not b_lambda!16889) (not b!1076765)))

(assert (=> b!1076765 t!32526))

(declare-fun b_and!35155 () Bool)

(assert (= b_and!35153 (and (=> t!32526 result!14819) b_and!35155)))

(declare-fun m!995929 () Bool)

(assert (=> b!1076763 m!995929))

(declare-fun m!995931 () Bool)

(assert (=> b!1076765 m!995931))

(declare-fun m!995933 () Bool)

(assert (=> b!1076765 m!995933))

(declare-fun m!995935 () Bool)

(assert (=> b!1076765 m!995935))

(declare-fun m!995937 () Bool)

(assert (=> b!1076765 m!995937))

(declare-fun m!995939 () Bool)

(assert (=> b!1076765 m!995939))

(assert (=> b!1076765 m!995933))

(declare-fun m!995941 () Bool)

(assert (=> b!1076765 m!995941))

(declare-fun m!995943 () Bool)

(assert (=> b!1076765 m!995943))

(assert (=> b!1076765 m!995937))

(assert (=> b!1076765 m!995943))

(declare-fun m!995945 () Bool)

(assert (=> b!1076765 m!995945))

(assert (=> b!1076759 m!995931))

(assert (=> b!1076759 m!995931))

(declare-fun m!995947 () Bool)

(assert (=> b!1076759 m!995947))

(declare-fun m!995949 () Bool)

(assert (=> d!130055 m!995949))

(assert (=> d!130055 m!995863))

(assert (=> b!1076757 m!995931))

(assert (=> b!1076757 m!995937))

(assert (=> b!1076757 m!995931))

(declare-fun m!995951 () Bool)

(assert (=> b!1076757 m!995951))

(assert (=> b!1076757 m!995943))

(assert (=> b!1076757 m!995937))

(assert (=> b!1076757 m!995943))

(assert (=> b!1076757 m!995945))

(assert (=> b!1076761 m!995931))

(assert (=> b!1076761 m!995931))

(declare-fun m!995953 () Bool)

(assert (=> b!1076761 m!995953))

(declare-fun m!995955 () Bool)

(assert (=> b!1076767 m!995955))

(assert (=> bm!45568 m!995955))

(declare-fun m!995957 () Bool)

(assert (=> b!1076764 m!995957))

(assert (=> b!1076766 m!995931))

(assert (=> b!1076766 m!995931))

(assert (=> b!1076766 m!995953))

(assert (=> b!1076674 d!130055))

(declare-fun b!1076770 () Bool)

(declare-fun e!615487 () Bool)

(declare-fun e!615489 () Bool)

(assert (=> b!1076770 (= e!615487 e!615489)))

(declare-fun c!108465 () Bool)

(assert (=> b!1076770 (= c!108465 (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun b!1076771 () Bool)

(assert (=> b!1076771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(assert (=> b!1076771 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33740 _values!955)))))

(declare-fun e!615486 () Bool)

(declare-fun lt!477894 () ListLongMap!14603)

(assert (=> b!1076771 (= e!615486 (= (apply!948 lt!477894 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)) (get!17266 (select (arr!33203 _values!955) #b00000000000000000000000000000000) (dynLambda!2063 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1076772 () Bool)

(declare-fun e!615488 () Bool)

(assert (=> b!1076772 (= e!615488 e!615487)))

(declare-fun c!108464 () Bool)

(declare-fun e!615485 () Bool)

(assert (=> b!1076772 (= c!108464 e!615485)))

(declare-fun res!717464 () Bool)

(assert (=> b!1076772 (=> (not res!717464) (not e!615485))))

(assert (=> b!1076772 (= res!717464 (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun b!1076773 () Bool)

(assert (=> b!1076773 (= e!615487 e!615486)))

(assert (=> b!1076773 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun res!717463 () Bool)

(assert (=> b!1076773 (= res!717463 (contains!6371 lt!477894 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076773 (=> (not res!717463) (not e!615486))))

(declare-fun b!1076774 () Bool)

(declare-fun e!615491 () ListLongMap!14603)

(declare-fun call!45572 () ListLongMap!14603)

(assert (=> b!1076774 (= e!615491 call!45572)))

(declare-fun d!130057 () Bool)

(assert (=> d!130057 e!615488))

(declare-fun res!717462 () Bool)

(assert (=> d!130057 (=> (not res!717462) (not e!615488))))

(assert (=> d!130057 (= res!717462 (not (contains!6371 lt!477894 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!615490 () ListLongMap!14603)

(assert (=> d!130057 (= lt!477894 e!615490)))

(declare-fun c!108463 () Bool)

(assert (=> d!130057 (= c!108463 (bvsge #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(assert (=> d!130057 (validMask!0 mask!1515)))

(assert (=> d!130057 (= (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477894)))

(declare-fun b!1076775 () Bool)

(assert (=> b!1076775 (= e!615485 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076775 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1076776 () Bool)

(assert (=> b!1076776 (= e!615490 (ListLongMap!14604 Nil!23174))))

(declare-fun bm!45569 () Bool)

(assert (=> bm!45569 (= call!45572 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1076777 () Bool)

(declare-fun res!717465 () Bool)

(assert (=> b!1076777 (=> (not res!717465) (not e!615488))))

(assert (=> b!1076777 (= res!717465 (not (contains!6371 lt!477894 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1076778 () Bool)

(assert (=> b!1076778 (= e!615489 (isEmpty!961 lt!477894))))

(declare-fun b!1076779 () Bool)

(declare-fun lt!477893 () Unit!35377)

(declare-fun lt!477890 () Unit!35377)

(assert (=> b!1076779 (= lt!477893 lt!477890)))

(declare-fun lt!477889 () (_ BitVec 64))

(declare-fun lt!477888 () ListLongMap!14603)

(declare-fun lt!477891 () (_ BitVec 64))

(declare-fun lt!477892 () V!39825)

(assert (=> b!1076779 (not (contains!6371 (+!3246 lt!477888 (tuple2!16627 lt!477891 lt!477892)) lt!477889))))

(assert (=> b!1076779 (= lt!477890 (addStillNotContains!269 lt!477888 lt!477891 lt!477892 lt!477889))))

(assert (=> b!1076779 (= lt!477889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1076779 (= lt!477892 (get!17266 (select (arr!33203 _values!955) #b00000000000000000000000000000000) (dynLambda!2063 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1076779 (= lt!477891 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076779 (= lt!477888 call!45572)))

(assert (=> b!1076779 (= e!615491 (+!3246 call!45572 (tuple2!16627 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000) (get!17266 (select (arr!33203 _values!955) #b00000000000000000000000000000000) (dynLambda!2063 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1076780 () Bool)

(assert (=> b!1076780 (= e!615490 e!615491)))

(declare-fun c!108462 () Bool)

(assert (=> b!1076780 (= c!108462 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076781 () Bool)

(assert (=> b!1076781 (= e!615489 (= lt!477894 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(assert (= (and d!130057 c!108463) b!1076776))

(assert (= (and d!130057 (not c!108463)) b!1076780))

(assert (= (and b!1076780 c!108462) b!1076779))

(assert (= (and b!1076780 (not c!108462)) b!1076774))

(assert (= (or b!1076779 b!1076774) bm!45569))

(assert (= (and d!130057 res!717462) b!1076777))

(assert (= (and b!1076777 res!717465) b!1076772))

(assert (= (and b!1076772 res!717464) b!1076775))

(assert (= (and b!1076772 c!108464) b!1076773))

(assert (= (and b!1076772 (not c!108464)) b!1076770))

(assert (= (and b!1076773 res!717463) b!1076771))

(assert (= (and b!1076770 c!108465) b!1076781))

(assert (= (and b!1076770 (not c!108465)) b!1076778))

(declare-fun b_lambda!16891 () Bool)

(assert (=> (not b_lambda!16891) (not b!1076771)))

(assert (=> b!1076771 t!32526))

(declare-fun b_and!35157 () Bool)

(assert (= b_and!35155 (and (=> t!32526 result!14819) b_and!35157)))

(declare-fun b_lambda!16893 () Bool)

(assert (=> (not b_lambda!16893) (not b!1076779)))

(assert (=> b!1076779 t!32526))

(declare-fun b_and!35159 () Bool)

(assert (= b_and!35157 (and (=> t!32526 result!14819) b_and!35159)))

(declare-fun m!995959 () Bool)

(assert (=> b!1076777 m!995959))

(assert (=> b!1076779 m!995931))

(declare-fun m!995961 () Bool)

(assert (=> b!1076779 m!995961))

(declare-fun m!995963 () Bool)

(assert (=> b!1076779 m!995963))

(assert (=> b!1076779 m!995937))

(declare-fun m!995965 () Bool)

(assert (=> b!1076779 m!995965))

(assert (=> b!1076779 m!995961))

(declare-fun m!995967 () Bool)

(assert (=> b!1076779 m!995967))

(assert (=> b!1076779 m!995943))

(assert (=> b!1076779 m!995937))

(assert (=> b!1076779 m!995943))

(assert (=> b!1076779 m!995945))

(assert (=> b!1076773 m!995931))

(assert (=> b!1076773 m!995931))

(declare-fun m!995969 () Bool)

(assert (=> b!1076773 m!995969))

(declare-fun m!995971 () Bool)

(assert (=> d!130057 m!995971))

(assert (=> d!130057 m!995863))

(assert (=> b!1076771 m!995931))

(assert (=> b!1076771 m!995937))

(assert (=> b!1076771 m!995931))

(declare-fun m!995973 () Bool)

(assert (=> b!1076771 m!995973))

(assert (=> b!1076771 m!995943))

(assert (=> b!1076771 m!995937))

(assert (=> b!1076771 m!995943))

(assert (=> b!1076771 m!995945))

(assert (=> b!1076775 m!995931))

(assert (=> b!1076775 m!995931))

(assert (=> b!1076775 m!995953))

(declare-fun m!995975 () Bool)

(assert (=> b!1076781 m!995975))

(assert (=> bm!45569 m!995975))

(declare-fun m!995977 () Bool)

(assert (=> b!1076778 m!995977))

(assert (=> b!1076780 m!995931))

(assert (=> b!1076780 m!995931))

(assert (=> b!1076780 m!995953))

(assert (=> b!1076674 d!130057))

(declare-fun b!1076824 () Bool)

(declare-fun e!615527 () Bool)

(declare-fun lt!477958 () ListLongMap!14603)

(assert (=> b!1076824 (= e!615527 (= (apply!948 lt!477958 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1076825 () Bool)

(declare-fun res!717485 () Bool)

(declare-fun e!615526 () Bool)

(assert (=> b!1076825 (=> (not res!717485) (not e!615526))))

(declare-fun e!615525 () Bool)

(assert (=> b!1076825 (= res!717485 e!615525)))

(declare-fun res!717486 () Bool)

(assert (=> b!1076825 (=> res!717486 e!615525)))

(declare-fun e!615530 () Bool)

(assert (=> b!1076825 (= res!717486 (not e!615530))))

(declare-fun res!717489 () Bool)

(assert (=> b!1076825 (=> (not res!717489) (not e!615530))))

(assert (=> b!1076825 (= res!717489 (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun bm!45584 () Bool)

(declare-fun call!45590 () Bool)

(assert (=> bm!45584 (= call!45590 (contains!6371 lt!477958 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076826 () Bool)

(declare-fun e!615529 () ListLongMap!14603)

(declare-fun call!45589 () ListLongMap!14603)

(assert (=> b!1076826 (= e!615529 (+!3246 call!45589 (tuple2!16627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1076827 () Bool)

(declare-fun e!615523 () Bool)

(assert (=> b!1076827 (= e!615523 (not call!45590))))

(declare-fun bm!45585 () Bool)

(declare-fun call!45588 () ListLongMap!14603)

(declare-fun call!45593 () ListLongMap!14603)

(assert (=> bm!45585 (= call!45588 call!45593)))

(declare-fun b!1076828 () Bool)

(assert (=> b!1076828 (= e!615526 e!615523)))

(declare-fun c!108480 () Bool)

(assert (=> b!1076828 (= c!108480 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076829 () Bool)

(declare-fun e!615522 () Unit!35377)

(declare-fun Unit!35383 () Unit!35377)

(assert (=> b!1076829 (= e!615522 Unit!35383)))

(declare-fun d!130059 () Bool)

(assert (=> d!130059 e!615526))

(declare-fun res!717491 () Bool)

(assert (=> d!130059 (=> (not res!717491) (not e!615526))))

(assert (=> d!130059 (= res!717491 (or (bvsge #b00000000000000000000000000000000 (size!33741 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))))

(declare-fun lt!477953 () ListLongMap!14603)

(assert (=> d!130059 (= lt!477958 lt!477953)))

(declare-fun lt!477947 () Unit!35377)

(assert (=> d!130059 (= lt!477947 e!615522)))

(declare-fun c!108481 () Bool)

(declare-fun e!615524 () Bool)

(assert (=> d!130059 (= c!108481 e!615524)))

(declare-fun res!717484 () Bool)

(assert (=> d!130059 (=> (not res!717484) (not e!615524))))

(assert (=> d!130059 (= res!717484 (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(assert (=> d!130059 (= lt!477953 e!615529)))

(declare-fun c!108482 () Bool)

(assert (=> d!130059 (= c!108482 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130059 (validMask!0 mask!1515)))

(assert (=> d!130059 (= (getCurrentListMap!4174 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477958)))

(declare-fun b!1076830 () Bool)

(declare-fun e!615519 () Bool)

(assert (=> b!1076830 (= e!615519 (= (apply!948 lt!477958 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)) (get!17266 (select (arr!33203 _values!955) #b00000000000000000000000000000000) (dynLambda!2063 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1076830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33740 _values!955)))))

(assert (=> b!1076830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun b!1076831 () Bool)

(declare-fun e!615518 () Bool)

(assert (=> b!1076831 (= e!615518 e!615527)))

(declare-fun res!717488 () Bool)

(declare-fun call!45591 () Bool)

(assert (=> b!1076831 (= res!717488 call!45591)))

(assert (=> b!1076831 (=> (not res!717488) (not e!615527))))

(declare-fun b!1076832 () Bool)

(declare-fun lt!477956 () Unit!35377)

(assert (=> b!1076832 (= e!615522 lt!477956)))

(declare-fun lt!477948 () ListLongMap!14603)

(assert (=> b!1076832 (= lt!477948 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477960 () (_ BitVec 64))

(assert (=> b!1076832 (= lt!477960 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477954 () (_ BitVec 64))

(assert (=> b!1076832 (= lt!477954 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477942 () Unit!35377)

(declare-fun addStillContains!652 (ListLongMap!14603 (_ BitVec 64) V!39825 (_ BitVec 64)) Unit!35377)

(assert (=> b!1076832 (= lt!477942 (addStillContains!652 lt!477948 lt!477960 zeroValueAfter!47 lt!477954))))

(assert (=> b!1076832 (contains!6371 (+!3246 lt!477948 (tuple2!16627 lt!477960 zeroValueAfter!47)) lt!477954)))

(declare-fun lt!477941 () Unit!35377)

(assert (=> b!1076832 (= lt!477941 lt!477942)))

(declare-fun lt!477939 () ListLongMap!14603)

(assert (=> b!1076832 (= lt!477939 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477944 () (_ BitVec 64))

(assert (=> b!1076832 (= lt!477944 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477946 () (_ BitVec 64))

(assert (=> b!1076832 (= lt!477946 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477943 () Unit!35377)

(declare-fun addApplyDifferent!508 (ListLongMap!14603 (_ BitVec 64) V!39825 (_ BitVec 64)) Unit!35377)

(assert (=> b!1076832 (= lt!477943 (addApplyDifferent!508 lt!477939 lt!477944 minValue!907 lt!477946))))

(assert (=> b!1076832 (= (apply!948 (+!3246 lt!477939 (tuple2!16627 lt!477944 minValue!907)) lt!477946) (apply!948 lt!477939 lt!477946))))

(declare-fun lt!477957 () Unit!35377)

(assert (=> b!1076832 (= lt!477957 lt!477943)))

(declare-fun lt!477959 () ListLongMap!14603)

(assert (=> b!1076832 (= lt!477959 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477949 () (_ BitVec 64))

(assert (=> b!1076832 (= lt!477949 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477951 () (_ BitVec 64))

(assert (=> b!1076832 (= lt!477951 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477952 () Unit!35377)

(assert (=> b!1076832 (= lt!477952 (addApplyDifferent!508 lt!477959 lt!477949 zeroValueAfter!47 lt!477951))))

(assert (=> b!1076832 (= (apply!948 (+!3246 lt!477959 (tuple2!16627 lt!477949 zeroValueAfter!47)) lt!477951) (apply!948 lt!477959 lt!477951))))

(declare-fun lt!477955 () Unit!35377)

(assert (=> b!1076832 (= lt!477955 lt!477952)))

(declare-fun lt!477950 () ListLongMap!14603)

(assert (=> b!1076832 (= lt!477950 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477945 () (_ BitVec 64))

(assert (=> b!1076832 (= lt!477945 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477940 () (_ BitVec 64))

(assert (=> b!1076832 (= lt!477940 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076832 (= lt!477956 (addApplyDifferent!508 lt!477950 lt!477945 minValue!907 lt!477940))))

(assert (=> b!1076832 (= (apply!948 (+!3246 lt!477950 (tuple2!16627 lt!477945 minValue!907)) lt!477940) (apply!948 lt!477950 lt!477940))))

(declare-fun b!1076833 () Bool)

(assert (=> b!1076833 (= e!615525 e!615519)))

(declare-fun res!717487 () Bool)

(assert (=> b!1076833 (=> (not res!717487) (not e!615519))))

(assert (=> b!1076833 (= res!717487 (contains!6371 lt!477958 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun b!1076834 () Bool)

(declare-fun e!615521 () Bool)

(assert (=> b!1076834 (= e!615523 e!615521)))

(declare-fun res!717492 () Bool)

(assert (=> b!1076834 (= res!717492 call!45590)))

(assert (=> b!1076834 (=> (not res!717492) (not e!615521))))

(declare-fun b!1076835 () Bool)

(assert (=> b!1076835 (= e!615524 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45586 () Bool)

(declare-fun call!45587 () ListLongMap!14603)

(assert (=> bm!45586 (= call!45587 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45587 () Bool)

(declare-fun c!108483 () Bool)

(assert (=> bm!45587 (= call!45589 (+!3246 (ite c!108482 call!45587 (ite c!108483 call!45593 call!45588)) (ite (or c!108482 c!108483) (tuple2!16627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1076836 () Bool)

(declare-fun e!615520 () ListLongMap!14603)

(declare-fun call!45592 () ListLongMap!14603)

(assert (=> b!1076836 (= e!615520 call!45592)))

(declare-fun bm!45588 () Bool)

(assert (=> bm!45588 (= call!45591 (contains!6371 lt!477958 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076837 () Bool)

(declare-fun c!108478 () Bool)

(assert (=> b!1076837 (= c!108478 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!615528 () ListLongMap!14603)

(assert (=> b!1076837 (= e!615528 e!615520)))

(declare-fun b!1076838 () Bool)

(assert (=> b!1076838 (= e!615528 call!45592)))

(declare-fun b!1076839 () Bool)

(assert (=> b!1076839 (= e!615520 call!45588)))

(declare-fun b!1076840 () Bool)

(assert (=> b!1076840 (= e!615521 (= (apply!948 lt!477958 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45589 () Bool)

(assert (=> bm!45589 (= call!45592 call!45589)))

(declare-fun b!1076841 () Bool)

(assert (=> b!1076841 (= e!615530 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076842 () Bool)

(assert (=> b!1076842 (= e!615529 e!615528)))

(assert (=> b!1076842 (= c!108483 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076843 () Bool)

(assert (=> b!1076843 (= e!615518 (not call!45591))))

(declare-fun b!1076844 () Bool)

(declare-fun res!717490 () Bool)

(assert (=> b!1076844 (=> (not res!717490) (not e!615526))))

(assert (=> b!1076844 (= res!717490 e!615518)))

(declare-fun c!108479 () Bool)

(assert (=> b!1076844 (= c!108479 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45590 () Bool)

(assert (=> bm!45590 (= call!45593 call!45587)))

(assert (= (and d!130059 c!108482) b!1076826))

(assert (= (and d!130059 (not c!108482)) b!1076842))

(assert (= (and b!1076842 c!108483) b!1076838))

(assert (= (and b!1076842 (not c!108483)) b!1076837))

(assert (= (and b!1076837 c!108478) b!1076836))

(assert (= (and b!1076837 (not c!108478)) b!1076839))

(assert (= (or b!1076836 b!1076839) bm!45585))

(assert (= (or b!1076838 bm!45585) bm!45590))

(assert (= (or b!1076838 b!1076836) bm!45589))

(assert (= (or b!1076826 bm!45590) bm!45586))

(assert (= (or b!1076826 bm!45589) bm!45587))

(assert (= (and d!130059 res!717484) b!1076835))

(assert (= (and d!130059 c!108481) b!1076832))

(assert (= (and d!130059 (not c!108481)) b!1076829))

(assert (= (and d!130059 res!717491) b!1076825))

(assert (= (and b!1076825 res!717489) b!1076841))

(assert (= (and b!1076825 (not res!717486)) b!1076833))

(assert (= (and b!1076833 res!717487) b!1076830))

(assert (= (and b!1076825 res!717485) b!1076844))

(assert (= (and b!1076844 c!108479) b!1076831))

(assert (= (and b!1076844 (not c!108479)) b!1076843))

(assert (= (and b!1076831 res!717488) b!1076824))

(assert (= (or b!1076831 b!1076843) bm!45588))

(assert (= (and b!1076844 res!717490) b!1076828))

(assert (= (and b!1076828 c!108480) b!1076834))

(assert (= (and b!1076828 (not c!108480)) b!1076827))

(assert (= (and b!1076834 res!717492) b!1076840))

(assert (= (or b!1076834 b!1076827) bm!45584))

(declare-fun b_lambda!16895 () Bool)

(assert (=> (not b_lambda!16895) (not b!1076830)))

(assert (=> b!1076830 t!32526))

(declare-fun b_and!35161 () Bool)

(assert (= b_and!35159 (and (=> t!32526 result!14819) b_and!35161)))

(declare-fun m!995979 () Bool)

(assert (=> b!1076826 m!995979))

(assert (=> d!130059 m!995863))

(assert (=> b!1076830 m!995943))

(assert (=> b!1076830 m!995931))

(declare-fun m!995981 () Bool)

(assert (=> b!1076830 m!995981))

(assert (=> b!1076830 m!995937))

(assert (=> b!1076830 m!995943))

(assert (=> b!1076830 m!995945))

(assert (=> b!1076830 m!995931))

(assert (=> b!1076830 m!995937))

(declare-fun m!995983 () Bool)

(assert (=> bm!45588 m!995983))

(declare-fun m!995985 () Bool)

(assert (=> bm!45584 m!995985))

(declare-fun m!995987 () Bool)

(assert (=> b!1076840 m!995987))

(assert (=> b!1076833 m!995931))

(assert (=> b!1076833 m!995931))

(declare-fun m!995989 () Bool)

(assert (=> b!1076833 m!995989))

(declare-fun m!995991 () Bool)

(assert (=> b!1076824 m!995991))

(assert (=> b!1076835 m!995931))

(assert (=> b!1076835 m!995931))

(assert (=> b!1076835 m!995953))

(assert (=> bm!45586 m!995857))

(declare-fun m!995993 () Bool)

(assert (=> b!1076832 m!995993))

(declare-fun m!995995 () Bool)

(assert (=> b!1076832 m!995995))

(declare-fun m!995997 () Bool)

(assert (=> b!1076832 m!995997))

(declare-fun m!995999 () Bool)

(assert (=> b!1076832 m!995999))

(declare-fun m!996001 () Bool)

(assert (=> b!1076832 m!996001))

(declare-fun m!996003 () Bool)

(assert (=> b!1076832 m!996003))

(assert (=> b!1076832 m!995857))

(assert (=> b!1076832 m!995993))

(declare-fun m!996005 () Bool)

(assert (=> b!1076832 m!996005))

(declare-fun m!996007 () Bool)

(assert (=> b!1076832 m!996007))

(assert (=> b!1076832 m!995999))

(assert (=> b!1076832 m!995995))

(declare-fun m!996009 () Bool)

(assert (=> b!1076832 m!996009))

(declare-fun m!996011 () Bool)

(assert (=> b!1076832 m!996011))

(declare-fun m!996013 () Bool)

(assert (=> b!1076832 m!996013))

(declare-fun m!996015 () Bool)

(assert (=> b!1076832 m!996015))

(assert (=> b!1076832 m!995931))

(declare-fun m!996017 () Bool)

(assert (=> b!1076832 m!996017))

(assert (=> b!1076832 m!996011))

(declare-fun m!996019 () Bool)

(assert (=> b!1076832 m!996019))

(declare-fun m!996021 () Bool)

(assert (=> b!1076832 m!996021))

(assert (=> b!1076841 m!995931))

(assert (=> b!1076841 m!995931))

(assert (=> b!1076841 m!995953))

(declare-fun m!996023 () Bool)

(assert (=> bm!45587 m!996023))

(assert (=> b!1076670 d!130059))

(declare-fun d!130061 () Bool)

(declare-fun lt!477963 () ListLongMap!14603)

(assert (=> d!130061 (not (contains!6371 lt!477963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!75 (List!23177 (_ BitVec 64)) List!23177)

(assert (=> d!130061 (= lt!477963 (ListLongMap!14604 (removeStrictlySorted!75 (toList!7317 lt!477826) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!130061 (= (-!704 lt!477826 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477963)))

(declare-fun bs!31704 () Bool)

(assert (= bs!31704 d!130061))

(declare-fun m!996025 () Bool)

(assert (=> bs!31704 m!996025))

(declare-fun m!996027 () Bool)

(assert (=> bs!31704 m!996027))

(assert (=> b!1076670 d!130061))

(declare-fun d!130063 () Bool)

(assert (=> d!130063 (= (-!704 lt!477826 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477826)))

(declare-fun lt!477966 () Unit!35377)

(declare-fun choose!1759 (ListLongMap!14603 (_ BitVec 64)) Unit!35377)

(assert (=> d!130063 (= lt!477966 (choose!1759 lt!477826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!130063 (not (contains!6371 lt!477826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!130063 (= (removeNotPresentStillSame!78 lt!477826 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477966)))

(declare-fun bs!31705 () Bool)

(assert (= bs!31705 d!130063))

(assert (=> bs!31705 m!995845))

(declare-fun m!996029 () Bool)

(assert (=> bs!31705 m!996029))

(assert (=> bs!31705 m!995851))

(assert (=> b!1076670 d!130063))

(declare-fun d!130065 () Bool)

(assert (=> d!130065 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95364 d!130065))

(declare-fun d!130067 () Bool)

(assert (=> d!130067 (= (array_inv!25696 _values!955) (bvsge (size!33740 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95364 d!130067))

(declare-fun d!130069 () Bool)

(assert (=> d!130069 (= (array_inv!25697 _keys!1163) (bvsge (size!33741 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95364 d!130069))

(declare-fun d!130071 () Bool)

(declare-fun e!615535 () Bool)

(assert (=> d!130071 e!615535))

(declare-fun res!717495 () Bool)

(assert (=> d!130071 (=> res!717495 e!615535)))

(declare-fun lt!477978 () Bool)

(assert (=> d!130071 (= res!717495 (not lt!477978))))

(declare-fun lt!477977 () Bool)

(assert (=> d!130071 (= lt!477978 lt!477977)))

(declare-fun lt!477976 () Unit!35377)

(declare-fun e!615536 () Unit!35377)

(assert (=> d!130071 (= lt!477976 e!615536)))

(declare-fun c!108486 () Bool)

(assert (=> d!130071 (= c!108486 lt!477977)))

(declare-fun containsKey!582 (List!23177 (_ BitVec 64)) Bool)

(assert (=> d!130071 (= lt!477977 (containsKey!582 (toList!7317 lt!477826) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!130071 (= (contains!6371 lt!477826 #b0000000000000000000000000000000000000000000000000000000000000000) lt!477978)))

(declare-fun b!1076851 () Bool)

(declare-fun lt!477975 () Unit!35377)

(assert (=> b!1076851 (= e!615536 lt!477975)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!413 (List!23177 (_ BitVec 64)) Unit!35377)

(assert (=> b!1076851 (= lt!477975 (lemmaContainsKeyImpliesGetValueByKeyDefined!413 (toList!7317 lt!477826) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!658 0))(
  ( (Some!657 (v!15682 V!39825)) (None!656) )
))
(declare-fun isDefined!451 (Option!658) Bool)

(declare-fun getValueByKey!607 (List!23177 (_ BitVec 64)) Option!658)

(assert (=> b!1076851 (isDefined!451 (getValueByKey!607 (toList!7317 lt!477826) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076852 () Bool)

(declare-fun Unit!35384 () Unit!35377)

(assert (=> b!1076852 (= e!615536 Unit!35384)))

(declare-fun b!1076853 () Bool)

(assert (=> b!1076853 (= e!615535 (isDefined!451 (getValueByKey!607 (toList!7317 lt!477826) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!130071 c!108486) b!1076851))

(assert (= (and d!130071 (not c!108486)) b!1076852))

(assert (= (and d!130071 (not res!717495)) b!1076853))

(declare-fun m!996031 () Bool)

(assert (=> d!130071 m!996031))

(declare-fun m!996033 () Bool)

(assert (=> b!1076851 m!996033))

(declare-fun m!996035 () Bool)

(assert (=> b!1076851 m!996035))

(assert (=> b!1076851 m!996035))

(declare-fun m!996037 () Bool)

(assert (=> b!1076851 m!996037))

(assert (=> b!1076853 m!996035))

(assert (=> b!1076853 m!996035))

(assert (=> b!1076853 m!996037))

(assert (=> b!1076677 d!130071))

(declare-fun b!1076854 () Bool)

(declare-fun e!615546 () Bool)

(declare-fun lt!477998 () ListLongMap!14603)

(assert (=> b!1076854 (= e!615546 (= (apply!948 lt!477998 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1076855 () Bool)

(declare-fun res!717497 () Bool)

(declare-fun e!615545 () Bool)

(assert (=> b!1076855 (=> (not res!717497) (not e!615545))))

(declare-fun e!615544 () Bool)

(assert (=> b!1076855 (= res!717497 e!615544)))

(declare-fun res!717498 () Bool)

(assert (=> b!1076855 (=> res!717498 e!615544)))

(declare-fun e!615549 () Bool)

(assert (=> b!1076855 (= res!717498 (not e!615549))))

(declare-fun res!717501 () Bool)

(assert (=> b!1076855 (=> (not res!717501) (not e!615549))))

(assert (=> b!1076855 (= res!717501 (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun bm!45591 () Bool)

(declare-fun call!45597 () Bool)

(assert (=> bm!45591 (= call!45597 (contains!6371 lt!477998 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076856 () Bool)

(declare-fun e!615548 () ListLongMap!14603)

(declare-fun call!45596 () ListLongMap!14603)

(assert (=> b!1076856 (= e!615548 (+!3246 call!45596 (tuple2!16627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1076857 () Bool)

(declare-fun e!615542 () Bool)

(assert (=> b!1076857 (= e!615542 (not call!45597))))

(declare-fun bm!45592 () Bool)

(declare-fun call!45595 () ListLongMap!14603)

(declare-fun call!45600 () ListLongMap!14603)

(assert (=> bm!45592 (= call!45595 call!45600)))

(declare-fun b!1076858 () Bool)

(assert (=> b!1076858 (= e!615545 e!615542)))

(declare-fun c!108489 () Bool)

(assert (=> b!1076858 (= c!108489 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076859 () Bool)

(declare-fun e!615541 () Unit!35377)

(declare-fun Unit!35385 () Unit!35377)

(assert (=> b!1076859 (= e!615541 Unit!35385)))

(declare-fun d!130073 () Bool)

(assert (=> d!130073 e!615545))

(declare-fun res!717503 () Bool)

(assert (=> d!130073 (=> (not res!717503) (not e!615545))))

(assert (=> d!130073 (= res!717503 (or (bvsge #b00000000000000000000000000000000 (size!33741 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))))

(declare-fun lt!477993 () ListLongMap!14603)

(assert (=> d!130073 (= lt!477998 lt!477993)))

(declare-fun lt!477987 () Unit!35377)

(assert (=> d!130073 (= lt!477987 e!615541)))

(declare-fun c!108490 () Bool)

(declare-fun e!615543 () Bool)

(assert (=> d!130073 (= c!108490 e!615543)))

(declare-fun res!717496 () Bool)

(assert (=> d!130073 (=> (not res!717496) (not e!615543))))

(assert (=> d!130073 (= res!717496 (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(assert (=> d!130073 (= lt!477993 e!615548)))

(declare-fun c!108491 () Bool)

(assert (=> d!130073 (= c!108491 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130073 (validMask!0 mask!1515)))

(assert (=> d!130073 (= (getCurrentListMap!4174 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!477998)))

(declare-fun b!1076860 () Bool)

(declare-fun e!615538 () Bool)

(assert (=> b!1076860 (= e!615538 (= (apply!948 lt!477998 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)) (get!17266 (select (arr!33203 _values!955) #b00000000000000000000000000000000) (dynLambda!2063 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1076860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33740 _values!955)))))

(assert (=> b!1076860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun b!1076861 () Bool)

(declare-fun e!615537 () Bool)

(assert (=> b!1076861 (= e!615537 e!615546)))

(declare-fun res!717500 () Bool)

(declare-fun call!45598 () Bool)

(assert (=> b!1076861 (= res!717500 call!45598)))

(assert (=> b!1076861 (=> (not res!717500) (not e!615546))))

(declare-fun b!1076862 () Bool)

(declare-fun lt!477996 () Unit!35377)

(assert (=> b!1076862 (= e!615541 lt!477996)))

(declare-fun lt!477988 () ListLongMap!14603)

(assert (=> b!1076862 (= lt!477988 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478000 () (_ BitVec 64))

(assert (=> b!1076862 (= lt!478000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477994 () (_ BitVec 64))

(assert (=> b!1076862 (= lt!477994 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477982 () Unit!35377)

(assert (=> b!1076862 (= lt!477982 (addStillContains!652 lt!477988 lt!478000 zeroValueBefore!47 lt!477994))))

(assert (=> b!1076862 (contains!6371 (+!3246 lt!477988 (tuple2!16627 lt!478000 zeroValueBefore!47)) lt!477994)))

(declare-fun lt!477981 () Unit!35377)

(assert (=> b!1076862 (= lt!477981 lt!477982)))

(declare-fun lt!477979 () ListLongMap!14603)

(assert (=> b!1076862 (= lt!477979 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477984 () (_ BitVec 64))

(assert (=> b!1076862 (= lt!477984 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477986 () (_ BitVec 64))

(assert (=> b!1076862 (= lt!477986 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477983 () Unit!35377)

(assert (=> b!1076862 (= lt!477983 (addApplyDifferent!508 lt!477979 lt!477984 minValue!907 lt!477986))))

(assert (=> b!1076862 (= (apply!948 (+!3246 lt!477979 (tuple2!16627 lt!477984 minValue!907)) lt!477986) (apply!948 lt!477979 lt!477986))))

(declare-fun lt!477997 () Unit!35377)

(assert (=> b!1076862 (= lt!477997 lt!477983)))

(declare-fun lt!477999 () ListLongMap!14603)

(assert (=> b!1076862 (= lt!477999 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477989 () (_ BitVec 64))

(assert (=> b!1076862 (= lt!477989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477991 () (_ BitVec 64))

(assert (=> b!1076862 (= lt!477991 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!477992 () Unit!35377)

(assert (=> b!1076862 (= lt!477992 (addApplyDifferent!508 lt!477999 lt!477989 zeroValueBefore!47 lt!477991))))

(assert (=> b!1076862 (= (apply!948 (+!3246 lt!477999 (tuple2!16627 lt!477989 zeroValueBefore!47)) lt!477991) (apply!948 lt!477999 lt!477991))))

(declare-fun lt!477995 () Unit!35377)

(assert (=> b!1076862 (= lt!477995 lt!477992)))

(declare-fun lt!477990 () ListLongMap!14603)

(assert (=> b!1076862 (= lt!477990 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!477985 () (_ BitVec 64))

(assert (=> b!1076862 (= lt!477985 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!477980 () (_ BitVec 64))

(assert (=> b!1076862 (= lt!477980 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1076862 (= lt!477996 (addApplyDifferent!508 lt!477990 lt!477985 minValue!907 lt!477980))))

(assert (=> b!1076862 (= (apply!948 (+!3246 lt!477990 (tuple2!16627 lt!477985 minValue!907)) lt!477980) (apply!948 lt!477990 lt!477980))))

(declare-fun b!1076863 () Bool)

(assert (=> b!1076863 (= e!615544 e!615538)))

(declare-fun res!717499 () Bool)

(assert (=> b!1076863 (=> (not res!717499) (not e!615538))))

(assert (=> b!1076863 (= res!717499 (contains!6371 lt!477998 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1076863 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(declare-fun b!1076864 () Bool)

(declare-fun e!615540 () Bool)

(assert (=> b!1076864 (= e!615542 e!615540)))

(declare-fun res!717504 () Bool)

(assert (=> b!1076864 (= res!717504 call!45597)))

(assert (=> b!1076864 (=> (not res!717504) (not e!615540))))

(declare-fun b!1076865 () Bool)

(assert (=> b!1076865 (= e!615543 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45593 () Bool)

(declare-fun call!45594 () ListLongMap!14603)

(assert (=> bm!45593 (= call!45594 (getCurrentListMapNoExtraKeys!3910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun c!108492 () Bool)

(declare-fun bm!45594 () Bool)

(assert (=> bm!45594 (= call!45596 (+!3246 (ite c!108491 call!45594 (ite c!108492 call!45600 call!45595)) (ite (or c!108491 c!108492) (tuple2!16627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16627 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1076866 () Bool)

(declare-fun e!615539 () ListLongMap!14603)

(declare-fun call!45599 () ListLongMap!14603)

(assert (=> b!1076866 (= e!615539 call!45599)))

(declare-fun bm!45595 () Bool)

(assert (=> bm!45595 (= call!45598 (contains!6371 lt!477998 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1076867 () Bool)

(declare-fun c!108487 () Bool)

(assert (=> b!1076867 (= c!108487 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!615547 () ListLongMap!14603)

(assert (=> b!1076867 (= e!615547 e!615539)))

(declare-fun b!1076868 () Bool)

(assert (=> b!1076868 (= e!615547 call!45599)))

(declare-fun b!1076869 () Bool)

(assert (=> b!1076869 (= e!615539 call!45595)))

(declare-fun b!1076870 () Bool)

(assert (=> b!1076870 (= e!615540 (= (apply!948 lt!477998 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun bm!45596 () Bool)

(assert (=> bm!45596 (= call!45599 call!45596)))

(declare-fun b!1076871 () Bool)

(assert (=> b!1076871 (= e!615549 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076872 () Bool)

(assert (=> b!1076872 (= e!615548 e!615547)))

(assert (=> b!1076872 (= c!108492 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1076873 () Bool)

(assert (=> b!1076873 (= e!615537 (not call!45598))))

(declare-fun b!1076874 () Bool)

(declare-fun res!717502 () Bool)

(assert (=> b!1076874 (=> (not res!717502) (not e!615545))))

(assert (=> b!1076874 (= res!717502 e!615537)))

(declare-fun c!108488 () Bool)

(assert (=> b!1076874 (= c!108488 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45597 () Bool)

(assert (=> bm!45597 (= call!45600 call!45594)))

(assert (= (and d!130073 c!108491) b!1076856))

(assert (= (and d!130073 (not c!108491)) b!1076872))

(assert (= (and b!1076872 c!108492) b!1076868))

(assert (= (and b!1076872 (not c!108492)) b!1076867))

(assert (= (and b!1076867 c!108487) b!1076866))

(assert (= (and b!1076867 (not c!108487)) b!1076869))

(assert (= (or b!1076866 b!1076869) bm!45592))

(assert (= (or b!1076868 bm!45592) bm!45597))

(assert (= (or b!1076868 b!1076866) bm!45596))

(assert (= (or b!1076856 bm!45597) bm!45593))

(assert (= (or b!1076856 bm!45596) bm!45594))

(assert (= (and d!130073 res!717496) b!1076865))

(assert (= (and d!130073 c!108490) b!1076862))

(assert (= (and d!130073 (not c!108490)) b!1076859))

(assert (= (and d!130073 res!717503) b!1076855))

(assert (= (and b!1076855 res!717501) b!1076871))

(assert (= (and b!1076855 (not res!717498)) b!1076863))

(assert (= (and b!1076863 res!717499) b!1076860))

(assert (= (and b!1076855 res!717497) b!1076874))

(assert (= (and b!1076874 c!108488) b!1076861))

(assert (= (and b!1076874 (not c!108488)) b!1076873))

(assert (= (and b!1076861 res!717500) b!1076854))

(assert (= (or b!1076861 b!1076873) bm!45595))

(assert (= (and b!1076874 res!717502) b!1076858))

(assert (= (and b!1076858 c!108489) b!1076864))

(assert (= (and b!1076858 (not c!108489)) b!1076857))

(assert (= (and b!1076864 res!717504) b!1076870))

(assert (= (or b!1076864 b!1076857) bm!45591))

(declare-fun b_lambda!16897 () Bool)

(assert (=> (not b_lambda!16897) (not b!1076860)))

(assert (=> b!1076860 t!32526))

(declare-fun b_and!35163 () Bool)

(assert (= b_and!35161 (and (=> t!32526 result!14819) b_and!35163)))

(declare-fun m!996039 () Bool)

(assert (=> b!1076856 m!996039))

(assert (=> d!130073 m!995863))

(assert (=> b!1076860 m!995943))

(assert (=> b!1076860 m!995931))

(declare-fun m!996041 () Bool)

(assert (=> b!1076860 m!996041))

(assert (=> b!1076860 m!995937))

(assert (=> b!1076860 m!995943))

(assert (=> b!1076860 m!995945))

(assert (=> b!1076860 m!995931))

(assert (=> b!1076860 m!995937))

(declare-fun m!996043 () Bool)

(assert (=> bm!45595 m!996043))

(declare-fun m!996045 () Bool)

(assert (=> bm!45591 m!996045))

(declare-fun m!996047 () Bool)

(assert (=> b!1076870 m!996047))

(assert (=> b!1076863 m!995931))

(assert (=> b!1076863 m!995931))

(declare-fun m!996049 () Bool)

(assert (=> b!1076863 m!996049))

(declare-fun m!996051 () Bool)

(assert (=> b!1076854 m!996051))

(assert (=> b!1076865 m!995931))

(assert (=> b!1076865 m!995931))

(assert (=> b!1076865 m!995953))

(assert (=> bm!45593 m!995859))

(declare-fun m!996053 () Bool)

(assert (=> b!1076862 m!996053))

(declare-fun m!996055 () Bool)

(assert (=> b!1076862 m!996055))

(declare-fun m!996057 () Bool)

(assert (=> b!1076862 m!996057))

(declare-fun m!996059 () Bool)

(assert (=> b!1076862 m!996059))

(declare-fun m!996061 () Bool)

(assert (=> b!1076862 m!996061))

(declare-fun m!996063 () Bool)

(assert (=> b!1076862 m!996063))

(assert (=> b!1076862 m!995859))

(assert (=> b!1076862 m!996053))

(declare-fun m!996065 () Bool)

(assert (=> b!1076862 m!996065))

(declare-fun m!996067 () Bool)

(assert (=> b!1076862 m!996067))

(assert (=> b!1076862 m!996059))

(assert (=> b!1076862 m!996055))

(declare-fun m!996069 () Bool)

(assert (=> b!1076862 m!996069))

(declare-fun m!996071 () Bool)

(assert (=> b!1076862 m!996071))

(declare-fun m!996073 () Bool)

(assert (=> b!1076862 m!996073))

(declare-fun m!996075 () Bool)

(assert (=> b!1076862 m!996075))

(assert (=> b!1076862 m!995931))

(declare-fun m!996077 () Bool)

(assert (=> b!1076862 m!996077))

(assert (=> b!1076862 m!996071))

(declare-fun m!996079 () Bool)

(assert (=> b!1076862 m!996079))

(declare-fun m!996081 () Bool)

(assert (=> b!1076862 m!996081))

(assert (=> b!1076871 m!995931))

(assert (=> b!1076871 m!995931))

(assert (=> b!1076871 m!995953))

(declare-fun m!996083 () Bool)

(assert (=> bm!45594 m!996083))

(assert (=> b!1076677 d!130073))

(declare-fun b!1076883 () Bool)

(declare-fun e!615556 () Bool)

(declare-fun call!45603 () Bool)

(assert (=> b!1076883 (= e!615556 call!45603)))

(declare-fun d!130075 () Bool)

(declare-fun res!717510 () Bool)

(declare-fun e!615558 () Bool)

(assert (=> d!130075 (=> res!717510 e!615558)))

(assert (=> d!130075 (= res!717510 (bvsge #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(assert (=> d!130075 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!615558)))

(declare-fun b!1076884 () Bool)

(assert (=> b!1076884 (= e!615558 e!615556)))

(declare-fun c!108495 () Bool)

(assert (=> b!1076884 (= c!108495 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45600 () Bool)

(assert (=> bm!45600 (= call!45603 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1076885 () Bool)

(declare-fun e!615557 () Bool)

(assert (=> b!1076885 (= e!615557 call!45603)))

(declare-fun b!1076886 () Bool)

(assert (=> b!1076886 (= e!615556 e!615557)))

(declare-fun lt!478009 () (_ BitVec 64))

(assert (=> b!1076886 (= lt!478009 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478007 () Unit!35377)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69047 (_ BitVec 64) (_ BitVec 32)) Unit!35377)

(assert (=> b!1076886 (= lt!478007 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!478009 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1076886 (arrayContainsKey!0 _keys!1163 lt!478009 #b00000000000000000000000000000000)))

(declare-fun lt!478008 () Unit!35377)

(assert (=> b!1076886 (= lt!478008 lt!478007)))

(declare-fun res!717509 () Bool)

(declare-datatypes ((SeekEntryResult!9848 0))(
  ( (MissingZero!9848 (index!41763 (_ BitVec 32))) (Found!9848 (index!41764 (_ BitVec 32))) (Intermediate!9848 (undefined!10660 Bool) (index!41765 (_ BitVec 32)) (x!96360 (_ BitVec 32))) (Undefined!9848) (MissingVacant!9848 (index!41766 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69047 (_ BitVec 32)) SeekEntryResult!9848)

(assert (=> b!1076886 (= res!717509 (= (seekEntryOrOpen!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9848 #b00000000000000000000000000000000)))))

(assert (=> b!1076886 (=> (not res!717509) (not e!615557))))

(assert (= (and d!130075 (not res!717510)) b!1076884))

(assert (= (and b!1076884 c!108495) b!1076886))

(assert (= (and b!1076884 (not c!108495)) b!1076883))

(assert (= (and b!1076886 res!717509) b!1076885))

(assert (= (or b!1076885 b!1076883) bm!45600))

(assert (=> b!1076884 m!995931))

(assert (=> b!1076884 m!995931))

(assert (=> b!1076884 m!995953))

(declare-fun m!996085 () Bool)

(assert (=> bm!45600 m!996085))

(assert (=> b!1076886 m!995931))

(declare-fun m!996087 () Bool)

(assert (=> b!1076886 m!996087))

(declare-fun m!996089 () Bool)

(assert (=> b!1076886 m!996089))

(assert (=> b!1076886 m!995931))

(declare-fun m!996091 () Bool)

(assert (=> b!1076886 m!996091))

(assert (=> b!1076676 d!130075))

(declare-fun d!130077 () Bool)

(declare-fun res!717517 () Bool)

(declare-fun e!615568 () Bool)

(assert (=> d!130077 (=> res!717517 e!615568)))

(assert (=> d!130077 (= res!717517 (bvsge #b00000000000000000000000000000000 (size!33741 _keys!1163)))))

(assert (=> d!130077 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23175) e!615568)))

(declare-fun b!1076897 () Bool)

(declare-fun e!615569 () Bool)

(declare-fun call!45606 () Bool)

(assert (=> b!1076897 (= e!615569 call!45606)))

(declare-fun b!1076898 () Bool)

(declare-fun e!615567 () Bool)

(declare-fun contains!6374 (List!23178 (_ BitVec 64)) Bool)

(assert (=> b!1076898 (= e!615567 (contains!6374 Nil!23175 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076899 () Bool)

(declare-fun e!615570 () Bool)

(assert (=> b!1076899 (= e!615568 e!615570)))

(declare-fun res!717519 () Bool)

(assert (=> b!1076899 (=> (not res!717519) (not e!615570))))

(assert (=> b!1076899 (= res!717519 (not e!615567))))

(declare-fun res!717518 () Bool)

(assert (=> b!1076899 (=> (not res!717518) (not e!615567))))

(assert (=> b!1076899 (= res!717518 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1076900 () Bool)

(assert (=> b!1076900 (= e!615569 call!45606)))

(declare-fun b!1076901 () Bool)

(assert (=> b!1076901 (= e!615570 e!615569)))

(declare-fun c!108498 () Bool)

(assert (=> b!1076901 (= c!108498 (validKeyInArray!0 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45603 () Bool)

(assert (=> bm!45603 (= call!45606 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108498 (Cons!23174 (select (arr!33204 _keys!1163) #b00000000000000000000000000000000) Nil!23175) Nil!23175)))))

(assert (= (and d!130077 (not res!717517)) b!1076899))

(assert (= (and b!1076899 res!717518) b!1076898))

(assert (= (and b!1076899 res!717519) b!1076901))

(assert (= (and b!1076901 c!108498) b!1076900))

(assert (= (and b!1076901 (not c!108498)) b!1076897))

(assert (= (or b!1076900 b!1076897) bm!45603))

(assert (=> b!1076898 m!995931))

(assert (=> b!1076898 m!995931))

(declare-fun m!996093 () Bool)

(assert (=> b!1076898 m!996093))

(assert (=> b!1076899 m!995931))

(assert (=> b!1076899 m!995931))

(assert (=> b!1076899 m!995953))

(assert (=> b!1076901 m!995931))

(assert (=> b!1076901 m!995931))

(assert (=> b!1076901 m!995953))

(assert (=> bm!45603 m!995931))

(declare-fun m!996095 () Bool)

(assert (=> bm!45603 m!996095))

(assert (=> b!1076675 d!130077))

(declare-fun condMapEmpty!40768 () Bool)

(declare-fun mapDefault!40768 () ValueCell!12305)

(assert (=> mapNonEmpty!40759 (= condMapEmpty!40768 (= mapRest!40759 ((as const (Array (_ BitVec 32) ValueCell!12305)) mapDefault!40768)))))

(declare-fun e!615576 () Bool)

(declare-fun mapRes!40768 () Bool)

(assert (=> mapNonEmpty!40759 (= tp!78107 (and e!615576 mapRes!40768))))

(declare-fun b!1076908 () Bool)

(declare-fun e!615575 () Bool)

(assert (=> b!1076908 (= e!615575 tp_is_empty!26017)))

(declare-fun mapIsEmpty!40768 () Bool)

(assert (=> mapIsEmpty!40768 mapRes!40768))

(declare-fun b!1076909 () Bool)

(assert (=> b!1076909 (= e!615576 tp_is_empty!26017)))

(declare-fun mapNonEmpty!40768 () Bool)

(declare-fun tp!78122 () Bool)

(assert (=> mapNonEmpty!40768 (= mapRes!40768 (and tp!78122 e!615575))))

(declare-fun mapRest!40768 () (Array (_ BitVec 32) ValueCell!12305))

(declare-fun mapValue!40768 () ValueCell!12305)

(declare-fun mapKey!40768 () (_ BitVec 32))

(assert (=> mapNonEmpty!40768 (= mapRest!40759 (store mapRest!40768 mapKey!40768 mapValue!40768))))

(assert (= (and mapNonEmpty!40759 condMapEmpty!40768) mapIsEmpty!40768))

(assert (= (and mapNonEmpty!40759 (not condMapEmpty!40768)) mapNonEmpty!40768))

(assert (= (and mapNonEmpty!40768 ((_ is ValueCellFull!12305) mapValue!40768)) b!1076908))

(assert (= (and mapNonEmpty!40759 ((_ is ValueCellFull!12305) mapDefault!40768)) b!1076909))

(declare-fun m!996097 () Bool)

(assert (=> mapNonEmpty!40768 m!996097))

(declare-fun b_lambda!16899 () Bool)

(assert (= b_lambda!16897 (or (and start!95364 b_free!22207) b_lambda!16899)))

(declare-fun b_lambda!16901 () Bool)

(assert (= b_lambda!16887 (or (and start!95364 b_free!22207) b_lambda!16901)))

(declare-fun b_lambda!16903 () Bool)

(assert (= b_lambda!16895 (or (and start!95364 b_free!22207) b_lambda!16903)))

(declare-fun b_lambda!16905 () Bool)

(assert (= b_lambda!16893 (or (and start!95364 b_free!22207) b_lambda!16905)))

(declare-fun b_lambda!16907 () Bool)

(assert (= b_lambda!16889 (or (and start!95364 b_free!22207) b_lambda!16907)))

(declare-fun b_lambda!16909 () Bool)

(assert (= b_lambda!16891 (or (and start!95364 b_free!22207) b_lambda!16909)))

(check-sat (not b!1076862) tp_is_empty!26017 (not bm!45584) (not b!1076884) (not d!130061) (not b!1076841) (not b_next!22207) (not bm!45587) (not b!1076863) (not bm!45600) (not bm!45569) (not b!1076865) (not d!130063) (not b!1076775) (not bm!45603) (not bm!45568) (not b!1076761) (not b!1076830) b_and!35163 (not d!130057) (not b!1076870) (not b_lambda!16905) (not b!1076854) (not b!1076860) (not b!1076832) (not d!130059) (not d!130073) (not b!1076757) (not b!1076853) (not b!1076778) (not b!1076840) (not b!1076765) (not b_lambda!16907) (not b!1076780) (not b!1076899) (not b!1076851) (not b!1076835) (not b!1076777) (not b!1076773) (not b!1076779) (not d!130053) (not b_lambda!16909) (not b!1076766) (not b_lambda!16901) (not b!1076871) (not b!1076886) (not bm!45595) (not b!1076901) (not b!1076856) (not b!1076824) (not bm!45591) (not b!1076764) (not bm!45593) (not b!1076898) (not b!1076763) (not b!1076771) (not b!1076759) (not b_lambda!16899) (not mapNonEmpty!40768) (not d!130055) (not b_lambda!16903) (not b!1076826) (not bm!45586) (not b!1076767) (not b!1076833) (not d!130071) (not bm!45588) (not bm!45594) (not b!1076781))
(check-sat b_and!35163 (not b_next!22207))
