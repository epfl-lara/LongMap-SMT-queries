; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95440 () Bool)

(assert start!95440)

(declare-fun b_free!22225 () Bool)

(declare-fun b_next!22225 () Bool)

(assert (=> start!95440 (= b_free!22225 (not b_next!22225))))

(declare-fun tp!78170 () Bool)

(declare-fun b_and!35201 () Bool)

(assert (=> start!95440 (= tp!78170 b_and!35201)))

(declare-fun mapIsEmpty!40795 () Bool)

(declare-fun mapRes!40795 () Bool)

(assert (=> mapIsEmpty!40795 mapRes!40795))

(declare-fun mapNonEmpty!40795 () Bool)

(declare-fun tp!78169 () Bool)

(declare-fun e!615943 () Bool)

(assert (=> mapNonEmpty!40795 (= mapRes!40795 (and tp!78169 e!615943))))

(declare-datatypes ((V!39849 0))(
  ( (V!39850 (val!13068 Int)) )
))
(declare-datatypes ((ValueCell!12314 0))(
  ( (ValueCellFull!12314 (v!15691 V!39849)) (EmptyCell!12314) )
))
(declare-fun mapValue!40795 () ValueCell!12314)

(declare-fun mapRest!40795 () (Array (_ BitVec 32) ValueCell!12314))

(declare-datatypes ((array!69087 0))(
  ( (array!69088 (arr!33221 (Array (_ BitVec 32) ValueCell!12314)) (size!33758 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69087)

(declare-fun mapKey!40795 () (_ BitVec 32))

(assert (=> mapNonEmpty!40795 (= (arr!33221 _values!955) (store mapRest!40795 mapKey!40795 mapValue!40795))))

(declare-fun b!1077446 () Bool)

(declare-fun e!615941 () Bool)

(declare-fun tp_is_empty!26035 () Bool)

(assert (=> b!1077446 (= e!615941 tp_is_empty!26035)))

(declare-fun b!1077447 () Bool)

(declare-fun e!615944 () Bool)

(declare-datatypes ((tuple2!16644 0))(
  ( (tuple2!16645 (_1!8333 (_ BitVec 64)) (_2!8333 V!39849)) )
))
(declare-datatypes ((List!23193 0))(
  ( (Nil!23190) (Cons!23189 (h!24407 tuple2!16644) (t!32542 List!23193)) )
))
(declare-datatypes ((ListLongMap!14621 0))(
  ( (ListLongMap!14622 (toList!7326 List!23193)) )
))
(declare-fun lt!478379 () ListLongMap!14621)

(declare-fun lt!478380 () tuple2!16644)

(declare-fun contains!6381 (ListLongMap!14621 (_ BitVec 64)) Bool)

(declare-fun +!3253 (ListLongMap!14621 tuple2!16644) ListLongMap!14621)

(assert (=> b!1077447 (= e!615944 (not (contains!6381 (+!3253 lt!478379 lt!478380) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!615940 () Bool)

(assert (=> b!1077447 e!615940))

(declare-fun res!717797 () Bool)

(assert (=> b!1077447 (=> (not res!717797) (not e!615940))))

(declare-fun zeroValueBefore!47 () V!39849)

(declare-fun lt!478382 () ListLongMap!14621)

(assert (=> b!1077447 (= res!717797 (= lt!478382 (+!3253 (+!3253 lt!478379 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!478380)))))

(declare-fun minValue!907 () V!39849)

(assert (=> b!1077447 (= lt!478380 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!478381 () ListLongMap!14621)

(declare-datatypes ((array!69089 0))(
  ( (array!69090 (arr!33222 (Array (_ BitVec 32) (_ BitVec 64))) (size!33759 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69089)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39849)

(declare-fun getCurrentListMap!4183 (array!69089 array!69087 (_ BitVec 32) (_ BitVec 32) V!39849 V!39849 (_ BitVec 32) Int) ListLongMap!14621)

(assert (=> b!1077447 (= lt!478381 (getCurrentListMap!4183 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1077447 (= lt!478382 (getCurrentListMap!4183 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077448 () Bool)

(declare-fun e!615946 () Bool)

(assert (=> b!1077448 (= e!615946 (not e!615944))))

(declare-fun res!717795 () Bool)

(assert (=> b!1077448 (=> res!717795 e!615944)))

(assert (=> b!1077448 (= res!717795 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!478378 () ListLongMap!14621)

(assert (=> b!1077448 (= lt!478379 lt!478378)))

(declare-datatypes ((Unit!35402 0))(
  ( (Unit!35403) )
))
(declare-fun lt!478377 () Unit!35402)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!898 (array!69089 array!69087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39849 V!39849 V!39849 V!39849 (_ BitVec 32) Int) Unit!35402)

(assert (=> b!1077448 (= lt!478377 (lemmaNoChangeToArrayThenSameMapNoExtras!898 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3918 (array!69089 array!69087 (_ BitVec 32) (_ BitVec 32) V!39849 V!39849 (_ BitVec 32) Int) ListLongMap!14621)

(assert (=> b!1077448 (= lt!478378 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1077448 (= lt!478379 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077449 () Bool)

(declare-fun res!717792 () Bool)

(assert (=> b!1077449 (=> (not res!717792) (not e!615946))))

(assert (=> b!1077449 (= res!717792 (and (= (size!33758 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33759 _keys!1163) (size!33758 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1077450 () Bool)

(assert (=> b!1077450 (= e!615943 tp_is_empty!26035)))

(declare-fun res!717796 () Bool)

(assert (=> start!95440 (=> (not res!717796) (not e!615946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95440 (= res!717796 (validMask!0 mask!1515))))

(assert (=> start!95440 e!615946))

(assert (=> start!95440 true))

(assert (=> start!95440 tp_is_empty!26035))

(declare-fun e!615942 () Bool)

(declare-fun array_inv!25712 (array!69087) Bool)

(assert (=> start!95440 (and (array_inv!25712 _values!955) e!615942)))

(assert (=> start!95440 tp!78170))

(declare-fun array_inv!25713 (array!69089) Bool)

(assert (=> start!95440 (array_inv!25713 _keys!1163)))

(declare-fun b!1077451 () Bool)

(assert (=> b!1077451 (= e!615940 (= lt!478381 (+!3253 lt!478378 lt!478380)))))

(declare-fun b!1077452 () Bool)

(assert (=> b!1077452 (= e!615942 (and e!615941 mapRes!40795))))

(declare-fun condMapEmpty!40795 () Bool)

(declare-fun mapDefault!40795 () ValueCell!12314)

(assert (=> b!1077452 (= condMapEmpty!40795 (= (arr!33221 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12314)) mapDefault!40795)))))

(declare-fun b!1077453 () Bool)

(declare-fun res!717793 () Bool)

(assert (=> b!1077453 (=> (not res!717793) (not e!615946))))

(declare-datatypes ((List!23194 0))(
  ( (Nil!23191) (Cons!23190 (h!24408 (_ BitVec 64)) (t!32543 List!23194)) )
))
(declare-fun arrayNoDuplicates!0 (array!69089 (_ BitVec 32) List!23194) Bool)

(assert (=> b!1077453 (= res!717793 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23191))))

(declare-fun b!1077454 () Bool)

(declare-fun res!717794 () Bool)

(assert (=> b!1077454 (=> (not res!717794) (not e!615946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69089 (_ BitVec 32)) Bool)

(assert (=> b!1077454 (= res!717794 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!95440 res!717796) b!1077449))

(assert (= (and b!1077449 res!717792) b!1077454))

(assert (= (and b!1077454 res!717794) b!1077453))

(assert (= (and b!1077453 res!717793) b!1077448))

(assert (= (and b!1077448 (not res!717795)) b!1077447))

(assert (= (and b!1077447 res!717797) b!1077451))

(assert (= (and b!1077452 condMapEmpty!40795) mapIsEmpty!40795))

(assert (= (and b!1077452 (not condMapEmpty!40795)) mapNonEmpty!40795))

(get-info :version)

(assert (= (and mapNonEmpty!40795 ((_ is ValueCellFull!12314) mapValue!40795)) b!1077450))

(assert (= (and b!1077452 ((_ is ValueCellFull!12314) mapDefault!40795)) b!1077446))

(assert (= start!95440 b!1077452))

(declare-fun m!996637 () Bool)

(assert (=> start!95440 m!996637))

(declare-fun m!996639 () Bool)

(assert (=> start!95440 m!996639))

(declare-fun m!996641 () Bool)

(assert (=> start!95440 m!996641))

(declare-fun m!996643 () Bool)

(assert (=> b!1077448 m!996643))

(declare-fun m!996645 () Bool)

(assert (=> b!1077448 m!996645))

(declare-fun m!996647 () Bool)

(assert (=> b!1077448 m!996647))

(declare-fun m!996649 () Bool)

(assert (=> b!1077453 m!996649))

(declare-fun m!996651 () Bool)

(assert (=> b!1077447 m!996651))

(declare-fun m!996653 () Bool)

(assert (=> b!1077447 m!996653))

(declare-fun m!996655 () Bool)

(assert (=> b!1077447 m!996655))

(assert (=> b!1077447 m!996653))

(declare-fun m!996657 () Bool)

(assert (=> b!1077447 m!996657))

(declare-fun m!996659 () Bool)

(assert (=> b!1077447 m!996659))

(assert (=> b!1077447 m!996651))

(declare-fun m!996661 () Bool)

(assert (=> b!1077447 m!996661))

(declare-fun m!996663 () Bool)

(assert (=> b!1077454 m!996663))

(declare-fun m!996665 () Bool)

(assert (=> b!1077451 m!996665))

(declare-fun m!996667 () Bool)

(assert (=> mapNonEmpty!40795 m!996667))

(check-sat (not b_next!22225) (not mapNonEmpty!40795) (not start!95440) b_and!35201 (not b!1077447) (not b!1077448) (not b!1077454) (not b!1077451) (not b!1077453) tp_is_empty!26035)
(check-sat b_and!35201 (not b_next!22225))
(get-model)

(declare-fun d!130135 () Bool)

(assert (=> d!130135 (= (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478421 () Unit!35402)

(declare-fun choose!1762 (array!69089 array!69087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39849 V!39849 V!39849 V!39849 (_ BitVec 32) Int) Unit!35402)

(assert (=> d!130135 (= lt!478421 (choose!1762 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!130135 (validMask!0 mask!1515)))

(assert (=> d!130135 (= (lemmaNoChangeToArrayThenSameMapNoExtras!898 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478421)))

(declare-fun bs!31717 () Bool)

(assert (= bs!31717 d!130135))

(assert (=> bs!31717 m!996647))

(assert (=> bs!31717 m!996645))

(declare-fun m!996733 () Bool)

(assert (=> bs!31717 m!996733))

(assert (=> bs!31717 m!996637))

(assert (=> b!1077448 d!130135))

(declare-fun b!1077533 () Bool)

(declare-fun lt!478439 () Unit!35402)

(declare-fun lt!478441 () Unit!35402)

(assert (=> b!1077533 (= lt!478439 lt!478441)))

(declare-fun lt!478436 () (_ BitVec 64))

(declare-fun lt!478437 () V!39849)

(declare-fun lt!478440 () (_ BitVec 64))

(declare-fun lt!478442 () ListLongMap!14621)

(assert (=> b!1077533 (not (contains!6381 (+!3253 lt!478442 (tuple2!16645 lt!478436 lt!478437)) lt!478440))))

(declare-fun addStillNotContains!272 (ListLongMap!14621 (_ BitVec 64) V!39849 (_ BitVec 64)) Unit!35402)

(assert (=> b!1077533 (= lt!478441 (addStillNotContains!272 lt!478442 lt!478436 lt!478437 lt!478440))))

(assert (=> b!1077533 (= lt!478440 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17275 (ValueCell!12314 V!39849) V!39849)

(declare-fun dynLambda!2066 (Int (_ BitVec 64)) V!39849)

(assert (=> b!1077533 (= lt!478437 (get!17275 (select (arr!33221 _values!955) #b00000000000000000000000000000000) (dynLambda!2066 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1077533 (= lt!478436 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45685 () ListLongMap!14621)

(assert (=> b!1077533 (= lt!478442 call!45685)))

(declare-fun e!616005 () ListLongMap!14621)

(assert (=> b!1077533 (= e!616005 (+!3253 call!45685 (tuple2!16645 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000) (get!17275 (select (arr!33221 _values!955) #b00000000000000000000000000000000) (dynLambda!2066 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!130137 () Bool)

(declare-fun e!616006 () Bool)

(assert (=> d!130137 e!616006))

(declare-fun res!717842 () Bool)

(assert (=> d!130137 (=> (not res!717842) (not e!616006))))

(declare-fun lt!478438 () ListLongMap!14621)

(assert (=> d!130137 (= res!717842 (not (contains!6381 lt!478438 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!616004 () ListLongMap!14621)

(assert (=> d!130137 (= lt!478438 e!616004)))

(declare-fun c!108601 () Bool)

(assert (=> d!130137 (= c!108601 (bvsge #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(assert (=> d!130137 (validMask!0 mask!1515)))

(assert (=> d!130137 (= (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478438)))

(declare-fun b!1077534 () Bool)

(assert (=> b!1077534 (= e!616005 call!45685)))

(declare-fun b!1077535 () Bool)

(declare-fun res!717843 () Bool)

(assert (=> b!1077535 (=> (not res!717843) (not e!616006))))

(assert (=> b!1077535 (= res!717843 (not (contains!6381 lt!478438 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1077536 () Bool)

(declare-fun e!616009 () Bool)

(assert (=> b!1077536 (= e!616006 e!616009)))

(declare-fun c!108599 () Bool)

(declare-fun e!616008 () Bool)

(assert (=> b!1077536 (= c!108599 e!616008)))

(declare-fun res!717844 () Bool)

(assert (=> b!1077536 (=> (not res!717844) (not e!616008))))

(assert (=> b!1077536 (= res!717844 (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun b!1077537 () Bool)

(declare-fun e!616007 () Bool)

(assert (=> b!1077537 (= e!616009 e!616007)))

(declare-fun c!108600 () Bool)

(assert (=> b!1077537 (= c!108600 (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun b!1077538 () Bool)

(assert (=> b!1077538 (= e!616007 (= lt!478438 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1077539 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1077539 (= e!616008 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077539 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45682 () Bool)

(assert (=> bm!45682 (= call!45685 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1077540 () Bool)

(assert (=> b!1077540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(assert (=> b!1077540 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33758 _values!955)))))

(declare-fun e!616003 () Bool)

(declare-fun apply!951 (ListLongMap!14621 (_ BitVec 64)) V!39849)

(assert (=> b!1077540 (= e!616003 (= (apply!951 lt!478438 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)) (get!17275 (select (arr!33221 _values!955) #b00000000000000000000000000000000) (dynLambda!2066 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1077541 () Bool)

(assert (=> b!1077541 (= e!616004 (ListLongMap!14622 Nil!23190))))

(declare-fun b!1077542 () Bool)

(assert (=> b!1077542 (= e!616009 e!616003)))

(assert (=> b!1077542 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun res!717845 () Bool)

(assert (=> b!1077542 (= res!717845 (contains!6381 lt!478438 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077542 (=> (not res!717845) (not e!616003))))

(declare-fun b!1077543 () Bool)

(declare-fun isEmpty!964 (ListLongMap!14621) Bool)

(assert (=> b!1077543 (= e!616007 (isEmpty!964 lt!478438))))

(declare-fun b!1077544 () Bool)

(assert (=> b!1077544 (= e!616004 e!616005)))

(declare-fun c!108602 () Bool)

(assert (=> b!1077544 (= c!108602 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!130137 c!108601) b!1077541))

(assert (= (and d!130137 (not c!108601)) b!1077544))

(assert (= (and b!1077544 c!108602) b!1077533))

(assert (= (and b!1077544 (not c!108602)) b!1077534))

(assert (= (or b!1077533 b!1077534) bm!45682))

(assert (= (and d!130137 res!717842) b!1077535))

(assert (= (and b!1077535 res!717843) b!1077536))

(assert (= (and b!1077536 res!717844) b!1077539))

(assert (= (and b!1077536 c!108599) b!1077542))

(assert (= (and b!1077536 (not c!108599)) b!1077537))

(assert (= (and b!1077542 res!717845) b!1077540))

(assert (= (and b!1077537 c!108600) b!1077538))

(assert (= (and b!1077537 (not c!108600)) b!1077543))

(declare-fun b_lambda!16959 () Bool)

(assert (=> (not b_lambda!16959) (not b!1077533)))

(declare-fun t!32546 () Bool)

(declare-fun tb!7171 () Bool)

(assert (=> (and start!95440 (= defaultEntry!963 defaultEntry!963) t!32546) tb!7171))

(declare-fun result!14837 () Bool)

(assert (=> tb!7171 (= result!14837 tp_is_empty!26035)))

(assert (=> b!1077533 t!32546))

(declare-fun b_and!35207 () Bool)

(assert (= b_and!35201 (and (=> t!32546 result!14837) b_and!35207)))

(declare-fun b_lambda!16961 () Bool)

(assert (=> (not b_lambda!16961) (not b!1077540)))

(assert (=> b!1077540 t!32546))

(declare-fun b_and!35209 () Bool)

(assert (= b_and!35207 (and (=> t!32546 result!14837) b_and!35209)))

(declare-fun m!996735 () Bool)

(assert (=> b!1077544 m!996735))

(assert (=> b!1077544 m!996735))

(declare-fun m!996737 () Bool)

(assert (=> b!1077544 m!996737))

(declare-fun m!996739 () Bool)

(assert (=> b!1077538 m!996739))

(assert (=> bm!45682 m!996739))

(assert (=> b!1077542 m!996735))

(assert (=> b!1077542 m!996735))

(declare-fun m!996741 () Bool)

(assert (=> b!1077542 m!996741))

(declare-fun m!996743 () Bool)

(assert (=> b!1077535 m!996743))

(declare-fun m!996745 () Bool)

(assert (=> b!1077543 m!996745))

(declare-fun m!996747 () Bool)

(assert (=> b!1077533 m!996747))

(declare-fun m!996749 () Bool)

(assert (=> b!1077533 m!996749))

(declare-fun m!996751 () Bool)

(assert (=> b!1077533 m!996751))

(declare-fun m!996753 () Bool)

(assert (=> b!1077533 m!996753))

(declare-fun m!996755 () Bool)

(assert (=> b!1077533 m!996755))

(declare-fun m!996757 () Bool)

(assert (=> b!1077533 m!996757))

(assert (=> b!1077533 m!996749))

(assert (=> b!1077533 m!996747))

(declare-fun m!996759 () Bool)

(assert (=> b!1077533 m!996759))

(assert (=> b!1077533 m!996751))

(assert (=> b!1077533 m!996735))

(assert (=> b!1077539 m!996735))

(assert (=> b!1077539 m!996735))

(assert (=> b!1077539 m!996737))

(declare-fun m!996761 () Bool)

(assert (=> d!130137 m!996761))

(assert (=> d!130137 m!996637))

(assert (=> b!1077540 m!996749))

(assert (=> b!1077540 m!996751))

(assert (=> b!1077540 m!996753))

(assert (=> b!1077540 m!996749))

(assert (=> b!1077540 m!996751))

(assert (=> b!1077540 m!996735))

(declare-fun m!996763 () Bool)

(assert (=> b!1077540 m!996763))

(assert (=> b!1077540 m!996735))

(assert (=> b!1077448 d!130137))

(declare-fun b!1077547 () Bool)

(declare-fun lt!478446 () Unit!35402)

(declare-fun lt!478448 () Unit!35402)

(assert (=> b!1077547 (= lt!478446 lt!478448)))

(declare-fun lt!478447 () (_ BitVec 64))

(declare-fun lt!478443 () (_ BitVec 64))

(declare-fun lt!478449 () ListLongMap!14621)

(declare-fun lt!478444 () V!39849)

(assert (=> b!1077547 (not (contains!6381 (+!3253 lt!478449 (tuple2!16645 lt!478443 lt!478444)) lt!478447))))

(assert (=> b!1077547 (= lt!478448 (addStillNotContains!272 lt!478449 lt!478443 lt!478444 lt!478447))))

(assert (=> b!1077547 (= lt!478447 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1077547 (= lt!478444 (get!17275 (select (arr!33221 _values!955) #b00000000000000000000000000000000) (dynLambda!2066 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1077547 (= lt!478443 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45686 () ListLongMap!14621)

(assert (=> b!1077547 (= lt!478449 call!45686)))

(declare-fun e!616012 () ListLongMap!14621)

(assert (=> b!1077547 (= e!616012 (+!3253 call!45686 (tuple2!16645 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000) (get!17275 (select (arr!33221 _values!955) #b00000000000000000000000000000000) (dynLambda!2066 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!130139 () Bool)

(declare-fun e!616013 () Bool)

(assert (=> d!130139 e!616013))

(declare-fun res!717846 () Bool)

(assert (=> d!130139 (=> (not res!717846) (not e!616013))))

(declare-fun lt!478445 () ListLongMap!14621)

(assert (=> d!130139 (= res!717846 (not (contains!6381 lt!478445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!616011 () ListLongMap!14621)

(assert (=> d!130139 (= lt!478445 e!616011)))

(declare-fun c!108605 () Bool)

(assert (=> d!130139 (= c!108605 (bvsge #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(assert (=> d!130139 (validMask!0 mask!1515)))

(assert (=> d!130139 (= (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478445)))

(declare-fun b!1077548 () Bool)

(assert (=> b!1077548 (= e!616012 call!45686)))

(declare-fun b!1077549 () Bool)

(declare-fun res!717847 () Bool)

(assert (=> b!1077549 (=> (not res!717847) (not e!616013))))

(assert (=> b!1077549 (= res!717847 (not (contains!6381 lt!478445 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1077550 () Bool)

(declare-fun e!616016 () Bool)

(assert (=> b!1077550 (= e!616013 e!616016)))

(declare-fun c!108603 () Bool)

(declare-fun e!616015 () Bool)

(assert (=> b!1077550 (= c!108603 e!616015)))

(declare-fun res!717848 () Bool)

(assert (=> b!1077550 (=> (not res!717848) (not e!616015))))

(assert (=> b!1077550 (= res!717848 (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun b!1077551 () Bool)

(declare-fun e!616014 () Bool)

(assert (=> b!1077551 (= e!616016 e!616014)))

(declare-fun c!108604 () Bool)

(assert (=> b!1077551 (= c!108604 (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun b!1077552 () Bool)

(assert (=> b!1077552 (= e!616014 (= lt!478445 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1077553 () Bool)

(assert (=> b!1077553 (= e!616015 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077553 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!45683 () Bool)

(assert (=> bm!45683 (= call!45686 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1077554 () Bool)

(assert (=> b!1077554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(assert (=> b!1077554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33758 _values!955)))))

(declare-fun e!616010 () Bool)

(assert (=> b!1077554 (= e!616010 (= (apply!951 lt!478445 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)) (get!17275 (select (arr!33221 _values!955) #b00000000000000000000000000000000) (dynLambda!2066 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1077555 () Bool)

(assert (=> b!1077555 (= e!616011 (ListLongMap!14622 Nil!23190))))

(declare-fun b!1077556 () Bool)

(assert (=> b!1077556 (= e!616016 e!616010)))

(assert (=> b!1077556 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun res!717849 () Bool)

(assert (=> b!1077556 (= res!717849 (contains!6381 lt!478445 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077556 (=> (not res!717849) (not e!616010))))

(declare-fun b!1077557 () Bool)

(assert (=> b!1077557 (= e!616014 (isEmpty!964 lt!478445))))

(declare-fun b!1077558 () Bool)

(assert (=> b!1077558 (= e!616011 e!616012)))

(declare-fun c!108606 () Bool)

(assert (=> b!1077558 (= c!108606 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!130139 c!108605) b!1077555))

(assert (= (and d!130139 (not c!108605)) b!1077558))

(assert (= (and b!1077558 c!108606) b!1077547))

(assert (= (and b!1077558 (not c!108606)) b!1077548))

(assert (= (or b!1077547 b!1077548) bm!45683))

(assert (= (and d!130139 res!717846) b!1077549))

(assert (= (and b!1077549 res!717847) b!1077550))

(assert (= (and b!1077550 res!717848) b!1077553))

(assert (= (and b!1077550 c!108603) b!1077556))

(assert (= (and b!1077550 (not c!108603)) b!1077551))

(assert (= (and b!1077556 res!717849) b!1077554))

(assert (= (and b!1077551 c!108604) b!1077552))

(assert (= (and b!1077551 (not c!108604)) b!1077557))

(declare-fun b_lambda!16963 () Bool)

(assert (=> (not b_lambda!16963) (not b!1077547)))

(assert (=> b!1077547 t!32546))

(declare-fun b_and!35211 () Bool)

(assert (= b_and!35209 (and (=> t!32546 result!14837) b_and!35211)))

(declare-fun b_lambda!16965 () Bool)

(assert (=> (not b_lambda!16965) (not b!1077554)))

(assert (=> b!1077554 t!32546))

(declare-fun b_and!35213 () Bool)

(assert (= b_and!35211 (and (=> t!32546 result!14837) b_and!35213)))

(assert (=> b!1077558 m!996735))

(assert (=> b!1077558 m!996735))

(assert (=> b!1077558 m!996737))

(declare-fun m!996765 () Bool)

(assert (=> b!1077552 m!996765))

(assert (=> bm!45683 m!996765))

(assert (=> b!1077556 m!996735))

(assert (=> b!1077556 m!996735))

(declare-fun m!996767 () Bool)

(assert (=> b!1077556 m!996767))

(declare-fun m!996769 () Bool)

(assert (=> b!1077549 m!996769))

(declare-fun m!996771 () Bool)

(assert (=> b!1077557 m!996771))

(declare-fun m!996773 () Bool)

(assert (=> b!1077547 m!996773))

(assert (=> b!1077547 m!996749))

(assert (=> b!1077547 m!996751))

(assert (=> b!1077547 m!996753))

(declare-fun m!996775 () Bool)

(assert (=> b!1077547 m!996775))

(declare-fun m!996777 () Bool)

(assert (=> b!1077547 m!996777))

(assert (=> b!1077547 m!996749))

(assert (=> b!1077547 m!996773))

(declare-fun m!996779 () Bool)

(assert (=> b!1077547 m!996779))

(assert (=> b!1077547 m!996751))

(assert (=> b!1077547 m!996735))

(assert (=> b!1077553 m!996735))

(assert (=> b!1077553 m!996735))

(assert (=> b!1077553 m!996737))

(declare-fun m!996781 () Bool)

(assert (=> d!130139 m!996781))

(assert (=> d!130139 m!996637))

(assert (=> b!1077554 m!996749))

(assert (=> b!1077554 m!996751))

(assert (=> b!1077554 m!996753))

(assert (=> b!1077554 m!996749))

(assert (=> b!1077554 m!996751))

(assert (=> b!1077554 m!996735))

(declare-fun m!996783 () Bool)

(assert (=> b!1077554 m!996783))

(assert (=> b!1077554 m!996735))

(assert (=> b!1077448 d!130139))

(declare-fun bm!45686 () Bool)

(declare-fun call!45689 () Bool)

(declare-fun c!108609 () Bool)

(assert (=> bm!45686 (= call!45689 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108609 (Cons!23190 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000) Nil!23191) Nil!23191)))))

(declare-fun b!1077569 () Bool)

(declare-fun e!616025 () Bool)

(declare-fun e!616028 () Bool)

(assert (=> b!1077569 (= e!616025 e!616028)))

(declare-fun res!717858 () Bool)

(assert (=> b!1077569 (=> (not res!717858) (not e!616028))))

(declare-fun e!616026 () Bool)

(assert (=> b!1077569 (= res!717858 (not e!616026))))

(declare-fun res!717856 () Bool)

(assert (=> b!1077569 (=> (not res!717856) (not e!616026))))

(assert (=> b!1077569 (= res!717856 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077570 () Bool)

(declare-fun contains!6383 (List!23194 (_ BitVec 64)) Bool)

(assert (=> b!1077570 (= e!616026 (contains!6383 Nil!23191 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077571 () Bool)

(declare-fun e!616027 () Bool)

(assert (=> b!1077571 (= e!616027 call!45689)))

(declare-fun d!130141 () Bool)

(declare-fun res!717857 () Bool)

(assert (=> d!130141 (=> res!717857 e!616025)))

(assert (=> d!130141 (= res!717857 (bvsge #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(assert (=> d!130141 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23191) e!616025)))

(declare-fun b!1077572 () Bool)

(assert (=> b!1077572 (= e!616027 call!45689)))

(declare-fun b!1077573 () Bool)

(assert (=> b!1077573 (= e!616028 e!616027)))

(assert (=> b!1077573 (= c!108609 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!130141 (not res!717857)) b!1077569))

(assert (= (and b!1077569 res!717856) b!1077570))

(assert (= (and b!1077569 res!717858) b!1077573))

(assert (= (and b!1077573 c!108609) b!1077572))

(assert (= (and b!1077573 (not c!108609)) b!1077571))

(assert (= (or b!1077572 b!1077571) bm!45686))

(assert (=> bm!45686 m!996735))

(declare-fun m!996785 () Bool)

(assert (=> bm!45686 m!996785))

(assert (=> b!1077569 m!996735))

(assert (=> b!1077569 m!996735))

(assert (=> b!1077569 m!996737))

(assert (=> b!1077570 m!996735))

(assert (=> b!1077570 m!996735))

(declare-fun m!996787 () Bool)

(assert (=> b!1077570 m!996787))

(assert (=> b!1077573 m!996735))

(assert (=> b!1077573 m!996735))

(assert (=> b!1077573 m!996737))

(assert (=> b!1077453 d!130141))

(declare-fun b!1077582 () Bool)

(declare-fun e!616037 () Bool)

(declare-fun call!45692 () Bool)

(assert (=> b!1077582 (= e!616037 call!45692)))

(declare-fun bm!45689 () Bool)

(assert (=> bm!45689 (= call!45692 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1077583 () Bool)

(declare-fun e!616035 () Bool)

(assert (=> b!1077583 (= e!616035 e!616037)))

(declare-fun c!108612 () Bool)

(assert (=> b!1077583 (= c!108612 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077584 () Bool)

(declare-fun e!616036 () Bool)

(assert (=> b!1077584 (= e!616037 e!616036)))

(declare-fun lt!478456 () (_ BitVec 64))

(assert (=> b!1077584 (= lt!478456 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478458 () Unit!35402)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69089 (_ BitVec 64) (_ BitVec 32)) Unit!35402)

(assert (=> b!1077584 (= lt!478458 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!478456 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!69089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1077584 (arrayContainsKey!0 _keys!1163 lt!478456 #b00000000000000000000000000000000)))

(declare-fun lt!478457 () Unit!35402)

(assert (=> b!1077584 (= lt!478457 lt!478458)))

(declare-fun res!717864 () Bool)

(declare-datatypes ((SeekEntryResult!9851 0))(
  ( (MissingZero!9851 (index!41775 (_ BitVec 32))) (Found!9851 (index!41776 (_ BitVec 32))) (Intermediate!9851 (undefined!10663 Bool) (index!41777 (_ BitVec 32)) (x!96420 (_ BitVec 32))) (Undefined!9851) (MissingVacant!9851 (index!41778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69089 (_ BitVec 32)) SeekEntryResult!9851)

(assert (=> b!1077584 (= res!717864 (= (seekEntryOrOpen!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9851 #b00000000000000000000000000000000)))))

(assert (=> b!1077584 (=> (not res!717864) (not e!616036))))

(declare-fun b!1077585 () Bool)

(assert (=> b!1077585 (= e!616036 call!45692)))

(declare-fun d!130143 () Bool)

(declare-fun res!717863 () Bool)

(assert (=> d!130143 (=> res!717863 e!616035)))

(assert (=> d!130143 (= res!717863 (bvsge #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(assert (=> d!130143 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!616035)))

(assert (= (and d!130143 (not res!717863)) b!1077583))

(assert (= (and b!1077583 c!108612) b!1077584))

(assert (= (and b!1077583 (not c!108612)) b!1077582))

(assert (= (and b!1077584 res!717864) b!1077585))

(assert (= (or b!1077585 b!1077582) bm!45689))

(declare-fun m!996789 () Bool)

(assert (=> bm!45689 m!996789))

(assert (=> b!1077583 m!996735))

(assert (=> b!1077583 m!996735))

(assert (=> b!1077583 m!996737))

(assert (=> b!1077584 m!996735))

(declare-fun m!996791 () Bool)

(assert (=> b!1077584 m!996791))

(declare-fun m!996793 () Bool)

(assert (=> b!1077584 m!996793))

(assert (=> b!1077584 m!996735))

(declare-fun m!996795 () Bool)

(assert (=> b!1077584 m!996795))

(assert (=> b!1077454 d!130143))

(declare-fun d!130145 () Bool)

(declare-fun e!616040 () Bool)

(assert (=> d!130145 e!616040))

(declare-fun res!717869 () Bool)

(assert (=> d!130145 (=> (not res!717869) (not e!616040))))

(declare-fun lt!478467 () ListLongMap!14621)

(assert (=> d!130145 (= res!717869 (contains!6381 lt!478467 (_1!8333 lt!478380)))))

(declare-fun lt!478468 () List!23193)

(assert (=> d!130145 (= lt!478467 (ListLongMap!14622 lt!478468))))

(declare-fun lt!478469 () Unit!35402)

(declare-fun lt!478470 () Unit!35402)

(assert (=> d!130145 (= lt!478469 lt!478470)))

(declare-datatypes ((Option!661 0))(
  ( (Some!660 (v!15694 V!39849)) (None!659) )
))
(declare-fun getValueByKey!610 (List!23193 (_ BitVec 64)) Option!661)

(assert (=> d!130145 (= (getValueByKey!610 lt!478468 (_1!8333 lt!478380)) (Some!660 (_2!8333 lt!478380)))))

(declare-fun lemmaContainsTupThenGetReturnValue!292 (List!23193 (_ BitVec 64) V!39849) Unit!35402)

(assert (=> d!130145 (= lt!478470 (lemmaContainsTupThenGetReturnValue!292 lt!478468 (_1!8333 lt!478380) (_2!8333 lt!478380)))))

(declare-fun insertStrictlySorted!385 (List!23193 (_ BitVec 64) V!39849) List!23193)

(assert (=> d!130145 (= lt!478468 (insertStrictlySorted!385 (toList!7326 lt!478378) (_1!8333 lt!478380) (_2!8333 lt!478380)))))

(assert (=> d!130145 (= (+!3253 lt!478378 lt!478380) lt!478467)))

(declare-fun b!1077590 () Bool)

(declare-fun res!717870 () Bool)

(assert (=> b!1077590 (=> (not res!717870) (not e!616040))))

(assert (=> b!1077590 (= res!717870 (= (getValueByKey!610 (toList!7326 lt!478467) (_1!8333 lt!478380)) (Some!660 (_2!8333 lt!478380))))))

(declare-fun b!1077591 () Bool)

(declare-fun contains!6384 (List!23193 tuple2!16644) Bool)

(assert (=> b!1077591 (= e!616040 (contains!6384 (toList!7326 lt!478467) lt!478380))))

(assert (= (and d!130145 res!717869) b!1077590))

(assert (= (and b!1077590 res!717870) b!1077591))

(declare-fun m!996797 () Bool)

(assert (=> d!130145 m!996797))

(declare-fun m!996799 () Bool)

(assert (=> d!130145 m!996799))

(declare-fun m!996801 () Bool)

(assert (=> d!130145 m!996801))

(declare-fun m!996803 () Bool)

(assert (=> d!130145 m!996803))

(declare-fun m!996805 () Bool)

(assert (=> b!1077590 m!996805))

(declare-fun m!996807 () Bool)

(assert (=> b!1077591 m!996807))

(assert (=> b!1077451 d!130145))

(declare-fun d!130147 () Bool)

(assert (=> d!130147 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!95440 d!130147))

(declare-fun d!130149 () Bool)

(assert (=> d!130149 (= (array_inv!25712 _values!955) (bvsge (size!33758 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!95440 d!130149))

(declare-fun d!130151 () Bool)

(assert (=> d!130151 (= (array_inv!25713 _keys!1163) (bvsge (size!33759 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!95440 d!130151))

(declare-fun d!130153 () Bool)

(declare-fun e!616041 () Bool)

(assert (=> d!130153 e!616041))

(declare-fun res!717871 () Bool)

(assert (=> d!130153 (=> (not res!717871) (not e!616041))))

(declare-fun lt!478471 () ListLongMap!14621)

(assert (=> d!130153 (= res!717871 (contains!6381 lt!478471 (_1!8333 lt!478380)))))

(declare-fun lt!478472 () List!23193)

(assert (=> d!130153 (= lt!478471 (ListLongMap!14622 lt!478472))))

(declare-fun lt!478473 () Unit!35402)

(declare-fun lt!478474 () Unit!35402)

(assert (=> d!130153 (= lt!478473 lt!478474)))

(assert (=> d!130153 (= (getValueByKey!610 lt!478472 (_1!8333 lt!478380)) (Some!660 (_2!8333 lt!478380)))))

(assert (=> d!130153 (= lt!478474 (lemmaContainsTupThenGetReturnValue!292 lt!478472 (_1!8333 lt!478380) (_2!8333 lt!478380)))))

(assert (=> d!130153 (= lt!478472 (insertStrictlySorted!385 (toList!7326 lt!478379) (_1!8333 lt!478380) (_2!8333 lt!478380)))))

(assert (=> d!130153 (= (+!3253 lt!478379 lt!478380) lt!478471)))

(declare-fun b!1077592 () Bool)

(declare-fun res!717872 () Bool)

(assert (=> b!1077592 (=> (not res!717872) (not e!616041))))

(assert (=> b!1077592 (= res!717872 (= (getValueByKey!610 (toList!7326 lt!478471) (_1!8333 lt!478380)) (Some!660 (_2!8333 lt!478380))))))

(declare-fun b!1077593 () Bool)

(assert (=> b!1077593 (= e!616041 (contains!6384 (toList!7326 lt!478471) lt!478380))))

(assert (= (and d!130153 res!717871) b!1077592))

(assert (= (and b!1077592 res!717872) b!1077593))

(declare-fun m!996809 () Bool)

(assert (=> d!130153 m!996809))

(declare-fun m!996811 () Bool)

(assert (=> d!130153 m!996811))

(declare-fun m!996813 () Bool)

(assert (=> d!130153 m!996813))

(declare-fun m!996815 () Bool)

(assert (=> d!130153 m!996815))

(declare-fun m!996817 () Bool)

(assert (=> b!1077592 m!996817))

(declare-fun m!996819 () Bool)

(assert (=> b!1077593 m!996819))

(assert (=> b!1077447 d!130153))

(declare-fun b!1077636 () Bool)

(declare-fun e!616076 () Bool)

(declare-fun lt!478534 () ListLongMap!14621)

(assert (=> b!1077636 (= e!616076 (= (apply!951 lt!478534 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1077637 () Bool)

(declare-fun e!616074 () Bool)

(assert (=> b!1077637 (= e!616074 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun c!108626 () Bool)

(declare-fun bm!45704 () Bool)

(declare-fun call!45710 () ListLongMap!14621)

(declare-fun call!45707 () ListLongMap!14621)

(declare-fun call!45711 () ListLongMap!14621)

(declare-fun c!108630 () Bool)

(declare-fun call!45712 () ListLongMap!14621)

(assert (=> bm!45704 (= call!45707 (+!3253 (ite c!108626 call!45711 (ite c!108630 call!45712 call!45710)) (ite (or c!108626 c!108630) (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1077638 () Bool)

(declare-fun e!616073 () Bool)

(declare-fun e!616077 () Bool)

(assert (=> b!1077638 (= e!616073 e!616077)))

(declare-fun c!108629 () Bool)

(assert (=> b!1077638 (= c!108629 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1077639 () Bool)

(declare-fun e!616072 () ListLongMap!14621)

(assert (=> b!1077639 (= e!616072 (+!3253 call!45707 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1077641 () Bool)

(declare-fun e!616070 () ListLongMap!14621)

(declare-fun call!45713 () ListLongMap!14621)

(assert (=> b!1077641 (= e!616070 call!45713)))

(declare-fun bm!45705 () Bool)

(assert (=> bm!45705 (= call!45712 call!45711)))

(declare-fun b!1077642 () Bool)

(declare-fun e!616071 () Bool)

(declare-fun call!45709 () Bool)

(assert (=> b!1077642 (= e!616071 (not call!45709))))

(declare-fun b!1077643 () Bool)

(declare-fun e!616069 () Unit!35402)

(declare-fun lt!478531 () Unit!35402)

(assert (=> b!1077643 (= e!616069 lt!478531)))

(declare-fun lt!478524 () ListLongMap!14621)

(assert (=> b!1077643 (= lt!478524 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478532 () (_ BitVec 64))

(assert (=> b!1077643 (= lt!478532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478520 () (_ BitVec 64))

(assert (=> b!1077643 (= lt!478520 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478540 () Unit!35402)

(declare-fun addStillContains!655 (ListLongMap!14621 (_ BitVec 64) V!39849 (_ BitVec 64)) Unit!35402)

(assert (=> b!1077643 (= lt!478540 (addStillContains!655 lt!478524 lt!478532 zeroValueBefore!47 lt!478520))))

(assert (=> b!1077643 (contains!6381 (+!3253 lt!478524 (tuple2!16645 lt!478532 zeroValueBefore!47)) lt!478520)))

(declare-fun lt!478528 () Unit!35402)

(assert (=> b!1077643 (= lt!478528 lt!478540)))

(declare-fun lt!478521 () ListLongMap!14621)

(assert (=> b!1077643 (= lt!478521 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478538 () (_ BitVec 64))

(assert (=> b!1077643 (= lt!478538 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478533 () (_ BitVec 64))

(assert (=> b!1077643 (= lt!478533 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478527 () Unit!35402)

(declare-fun addApplyDifferent!511 (ListLongMap!14621 (_ BitVec 64) V!39849 (_ BitVec 64)) Unit!35402)

(assert (=> b!1077643 (= lt!478527 (addApplyDifferent!511 lt!478521 lt!478538 minValue!907 lt!478533))))

(assert (=> b!1077643 (= (apply!951 (+!3253 lt!478521 (tuple2!16645 lt!478538 minValue!907)) lt!478533) (apply!951 lt!478521 lt!478533))))

(declare-fun lt!478535 () Unit!35402)

(assert (=> b!1077643 (= lt!478535 lt!478527)))

(declare-fun lt!478537 () ListLongMap!14621)

(assert (=> b!1077643 (= lt!478537 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478523 () (_ BitVec 64))

(assert (=> b!1077643 (= lt!478523 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478539 () (_ BitVec 64))

(assert (=> b!1077643 (= lt!478539 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478529 () Unit!35402)

(assert (=> b!1077643 (= lt!478529 (addApplyDifferent!511 lt!478537 lt!478523 zeroValueBefore!47 lt!478539))))

(assert (=> b!1077643 (= (apply!951 (+!3253 lt!478537 (tuple2!16645 lt!478523 zeroValueBefore!47)) lt!478539) (apply!951 lt!478537 lt!478539))))

(declare-fun lt!478526 () Unit!35402)

(assert (=> b!1077643 (= lt!478526 lt!478529)))

(declare-fun lt!478522 () ListLongMap!14621)

(assert (=> b!1077643 (= lt!478522 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478530 () (_ BitVec 64))

(assert (=> b!1077643 (= lt!478530 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478525 () (_ BitVec 64))

(assert (=> b!1077643 (= lt!478525 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1077643 (= lt!478531 (addApplyDifferent!511 lt!478522 lt!478530 minValue!907 lt!478525))))

(assert (=> b!1077643 (= (apply!951 (+!3253 lt!478522 (tuple2!16645 lt!478530 minValue!907)) lt!478525) (apply!951 lt!478522 lt!478525))))

(declare-fun b!1077644 () Bool)

(declare-fun res!717891 () Bool)

(assert (=> b!1077644 (=> (not res!717891) (not e!616073))))

(declare-fun e!616078 () Bool)

(assert (=> b!1077644 (= res!717891 e!616078)))

(declare-fun res!717895 () Bool)

(assert (=> b!1077644 (=> res!717895 e!616078)))

(assert (=> b!1077644 (= res!717895 (not e!616074))))

(declare-fun res!717896 () Bool)

(assert (=> b!1077644 (=> (not res!717896) (not e!616074))))

(assert (=> b!1077644 (= res!717896 (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun bm!45706 () Bool)

(assert (=> bm!45706 (= call!45710 call!45712)))

(declare-fun bm!45707 () Bool)

(declare-fun call!45708 () Bool)

(assert (=> bm!45707 (= call!45708 (contains!6381 lt!478534 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077645 () Bool)

(declare-fun e!616075 () ListLongMap!14621)

(assert (=> b!1077645 (= e!616072 e!616075)))

(assert (=> b!1077645 (= c!108630 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45708 () Bool)

(assert (=> bm!45708 (= call!45713 call!45707)))

(declare-fun b!1077646 () Bool)

(declare-fun e!616079 () Bool)

(assert (=> b!1077646 (= e!616079 (= (apply!951 lt!478534 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun b!1077647 () Bool)

(assert (=> b!1077647 (= e!616077 (not call!45708))))

(declare-fun e!616068 () Bool)

(declare-fun b!1077648 () Bool)

(assert (=> b!1077648 (= e!616068 (= (apply!951 lt!478534 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)) (get!17275 (select (arr!33221 _values!955) #b00000000000000000000000000000000) (dynLambda!2066 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077648 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33758 _values!955)))))

(assert (=> b!1077648 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun b!1077640 () Bool)

(assert (=> b!1077640 (= e!616070 call!45710)))

(declare-fun d!130155 () Bool)

(assert (=> d!130155 e!616073))

(declare-fun res!717898 () Bool)

(assert (=> d!130155 (=> (not res!717898) (not e!616073))))

(assert (=> d!130155 (= res!717898 (or (bvsge #b00000000000000000000000000000000 (size!33759 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))))

(declare-fun lt!478519 () ListLongMap!14621)

(assert (=> d!130155 (= lt!478534 lt!478519)))

(declare-fun lt!478536 () Unit!35402)

(assert (=> d!130155 (= lt!478536 e!616069)))

(declare-fun c!108628 () Bool)

(declare-fun e!616080 () Bool)

(assert (=> d!130155 (= c!108628 e!616080)))

(declare-fun res!717893 () Bool)

(assert (=> d!130155 (=> (not res!717893) (not e!616080))))

(assert (=> d!130155 (= res!717893 (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(assert (=> d!130155 (= lt!478519 e!616072)))

(assert (=> d!130155 (= c!108626 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130155 (validMask!0 mask!1515)))

(assert (=> d!130155 (= (getCurrentListMap!4183 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478534)))

(declare-fun bm!45709 () Bool)

(assert (=> bm!45709 (= call!45709 (contains!6381 lt!478534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077649 () Bool)

(assert (=> b!1077649 (= e!616075 call!45713)))

(declare-fun b!1077650 () Bool)

(declare-fun c!108627 () Bool)

(assert (=> b!1077650 (= c!108627 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1077650 (= e!616075 e!616070)))

(declare-fun b!1077651 () Bool)

(declare-fun res!717899 () Bool)

(assert (=> b!1077651 (=> (not res!717899) (not e!616073))))

(assert (=> b!1077651 (= res!717899 e!616071)))

(declare-fun c!108625 () Bool)

(assert (=> b!1077651 (= c!108625 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1077652 () Bool)

(declare-fun Unit!35404 () Unit!35402)

(assert (=> b!1077652 (= e!616069 Unit!35404)))

(declare-fun bm!45710 () Bool)

(assert (=> bm!45710 (= call!45711 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077653 () Bool)

(assert (=> b!1077653 (= e!616071 e!616079)))

(declare-fun res!717892 () Bool)

(assert (=> b!1077653 (= res!717892 call!45709)))

(assert (=> b!1077653 (=> (not res!717892) (not e!616079))))

(declare-fun b!1077654 () Bool)

(assert (=> b!1077654 (= e!616078 e!616068)))

(declare-fun res!717897 () Bool)

(assert (=> b!1077654 (=> (not res!717897) (not e!616068))))

(assert (=> b!1077654 (= res!717897 (contains!6381 lt!478534 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077654 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun b!1077655 () Bool)

(assert (=> b!1077655 (= e!616080 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077656 () Bool)

(assert (=> b!1077656 (= e!616077 e!616076)))

(declare-fun res!717894 () Bool)

(assert (=> b!1077656 (= res!717894 call!45708)))

(assert (=> b!1077656 (=> (not res!717894) (not e!616076))))

(assert (= (and d!130155 c!108626) b!1077639))

(assert (= (and d!130155 (not c!108626)) b!1077645))

(assert (= (and b!1077645 c!108630) b!1077649))

(assert (= (and b!1077645 (not c!108630)) b!1077650))

(assert (= (and b!1077650 c!108627) b!1077641))

(assert (= (and b!1077650 (not c!108627)) b!1077640))

(assert (= (or b!1077641 b!1077640) bm!45706))

(assert (= (or b!1077649 bm!45706) bm!45705))

(assert (= (or b!1077649 b!1077641) bm!45708))

(assert (= (or b!1077639 bm!45705) bm!45710))

(assert (= (or b!1077639 bm!45708) bm!45704))

(assert (= (and d!130155 res!717893) b!1077655))

(assert (= (and d!130155 c!108628) b!1077643))

(assert (= (and d!130155 (not c!108628)) b!1077652))

(assert (= (and d!130155 res!717898) b!1077644))

(assert (= (and b!1077644 res!717896) b!1077637))

(assert (= (and b!1077644 (not res!717895)) b!1077654))

(assert (= (and b!1077654 res!717897) b!1077648))

(assert (= (and b!1077644 res!717891) b!1077651))

(assert (= (and b!1077651 c!108625) b!1077653))

(assert (= (and b!1077651 (not c!108625)) b!1077642))

(assert (= (and b!1077653 res!717892) b!1077646))

(assert (= (or b!1077653 b!1077642) bm!45709))

(assert (= (and b!1077651 res!717899) b!1077638))

(assert (= (and b!1077638 c!108629) b!1077656))

(assert (= (and b!1077638 (not c!108629)) b!1077647))

(assert (= (and b!1077656 res!717894) b!1077636))

(assert (= (or b!1077656 b!1077647) bm!45707))

(declare-fun b_lambda!16967 () Bool)

(assert (=> (not b_lambda!16967) (not b!1077648)))

(assert (=> b!1077648 t!32546))

(declare-fun b_and!35215 () Bool)

(assert (= b_and!35213 (and (=> t!32546 result!14837) b_and!35215)))

(declare-fun m!996821 () Bool)

(assert (=> bm!45704 m!996821))

(assert (=> b!1077654 m!996735))

(assert (=> b!1077654 m!996735))

(declare-fun m!996823 () Bool)

(assert (=> b!1077654 m!996823))

(declare-fun m!996825 () Bool)

(assert (=> b!1077639 m!996825))

(declare-fun m!996827 () Bool)

(assert (=> b!1077646 m!996827))

(assert (=> d!130155 m!996637))

(assert (=> b!1077648 m!996735))

(declare-fun m!996829 () Bool)

(assert (=> b!1077648 m!996829))

(assert (=> b!1077648 m!996751))

(assert (=> b!1077648 m!996735))

(assert (=> b!1077648 m!996749))

(assert (=> b!1077648 m!996749))

(assert (=> b!1077648 m!996751))

(assert (=> b!1077648 m!996753))

(declare-fun m!996831 () Bool)

(assert (=> b!1077643 m!996831))

(declare-fun m!996833 () Bool)

(assert (=> b!1077643 m!996833))

(declare-fun m!996835 () Bool)

(assert (=> b!1077643 m!996835))

(declare-fun m!996837 () Bool)

(assert (=> b!1077643 m!996837))

(declare-fun m!996839 () Bool)

(assert (=> b!1077643 m!996839))

(declare-fun m!996841 () Bool)

(assert (=> b!1077643 m!996841))

(assert (=> b!1077643 m!996735))

(assert (=> b!1077643 m!996841))

(declare-fun m!996843 () Bool)

(assert (=> b!1077643 m!996843))

(declare-fun m!996845 () Bool)

(assert (=> b!1077643 m!996845))

(assert (=> b!1077643 m!996647))

(declare-fun m!996847 () Bool)

(assert (=> b!1077643 m!996847))

(declare-fun m!996849 () Bool)

(assert (=> b!1077643 m!996849))

(declare-fun m!996851 () Bool)

(assert (=> b!1077643 m!996851))

(assert (=> b!1077643 m!996835))

(assert (=> b!1077643 m!996833))

(declare-fun m!996853 () Bool)

(assert (=> b!1077643 m!996853))

(declare-fun m!996855 () Bool)

(assert (=> b!1077643 m!996855))

(assert (=> b!1077643 m!996839))

(declare-fun m!996857 () Bool)

(assert (=> b!1077643 m!996857))

(declare-fun m!996859 () Bool)

(assert (=> b!1077643 m!996859))

(assert (=> b!1077655 m!996735))

(assert (=> b!1077655 m!996735))

(assert (=> b!1077655 m!996737))

(declare-fun m!996861 () Bool)

(assert (=> bm!45707 m!996861))

(declare-fun m!996863 () Bool)

(assert (=> bm!45709 m!996863))

(declare-fun m!996865 () Bool)

(assert (=> b!1077636 m!996865))

(assert (=> bm!45710 m!996647))

(assert (=> b!1077637 m!996735))

(assert (=> b!1077637 m!996735))

(assert (=> b!1077637 m!996737))

(assert (=> b!1077447 d!130155))

(declare-fun d!130157 () Bool)

(declare-fun e!616085 () Bool)

(assert (=> d!130157 e!616085))

(declare-fun res!717902 () Bool)

(assert (=> d!130157 (=> res!717902 e!616085)))

(declare-fun lt!478550 () Bool)

(assert (=> d!130157 (= res!717902 (not lt!478550))))

(declare-fun lt!478552 () Bool)

(assert (=> d!130157 (= lt!478550 lt!478552)))

(declare-fun lt!478551 () Unit!35402)

(declare-fun e!616086 () Unit!35402)

(assert (=> d!130157 (= lt!478551 e!616086)))

(declare-fun c!108633 () Bool)

(assert (=> d!130157 (= c!108633 lt!478552)))

(declare-fun containsKey!583 (List!23193 (_ BitVec 64)) Bool)

(assert (=> d!130157 (= lt!478552 (containsKey!583 (toList!7326 (+!3253 lt!478379 lt!478380)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!130157 (= (contains!6381 (+!3253 lt!478379 lt!478380) #b0000000000000000000000000000000000000000000000000000000000000000) lt!478550)))

(declare-fun b!1077663 () Bool)

(declare-fun lt!478549 () Unit!35402)

(assert (=> b!1077663 (= e!616086 lt!478549)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!414 (List!23193 (_ BitVec 64)) Unit!35402)

(assert (=> b!1077663 (= lt!478549 (lemmaContainsKeyImpliesGetValueByKeyDefined!414 (toList!7326 (+!3253 lt!478379 lt!478380)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!452 (Option!661) Bool)

(assert (=> b!1077663 (isDefined!452 (getValueByKey!610 (toList!7326 (+!3253 lt!478379 lt!478380)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077664 () Bool)

(declare-fun Unit!35405 () Unit!35402)

(assert (=> b!1077664 (= e!616086 Unit!35405)))

(declare-fun b!1077665 () Bool)

(assert (=> b!1077665 (= e!616085 (isDefined!452 (getValueByKey!610 (toList!7326 (+!3253 lt!478379 lt!478380)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!130157 c!108633) b!1077663))

(assert (= (and d!130157 (not c!108633)) b!1077664))

(assert (= (and d!130157 (not res!717902)) b!1077665))

(declare-fun m!996867 () Bool)

(assert (=> d!130157 m!996867))

(declare-fun m!996869 () Bool)

(assert (=> b!1077663 m!996869))

(declare-fun m!996871 () Bool)

(assert (=> b!1077663 m!996871))

(assert (=> b!1077663 m!996871))

(declare-fun m!996873 () Bool)

(assert (=> b!1077663 m!996873))

(assert (=> b!1077665 m!996871))

(assert (=> b!1077665 m!996871))

(assert (=> b!1077665 m!996873))

(assert (=> b!1077447 d!130157))

(declare-fun d!130159 () Bool)

(declare-fun e!616087 () Bool)

(assert (=> d!130159 e!616087))

(declare-fun res!717903 () Bool)

(assert (=> d!130159 (=> (not res!717903) (not e!616087))))

(declare-fun lt!478553 () ListLongMap!14621)

(assert (=> d!130159 (= res!717903 (contains!6381 lt!478553 (_1!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!478554 () List!23193)

(assert (=> d!130159 (= lt!478553 (ListLongMap!14622 lt!478554))))

(declare-fun lt!478555 () Unit!35402)

(declare-fun lt!478556 () Unit!35402)

(assert (=> d!130159 (= lt!478555 lt!478556)))

(assert (=> d!130159 (= (getValueByKey!610 lt!478554 (_1!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!660 (_2!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!130159 (= lt!478556 (lemmaContainsTupThenGetReturnValue!292 lt!478554 (_1!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!130159 (= lt!478554 (insertStrictlySorted!385 (toList!7326 lt!478379) (_1!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!130159 (= (+!3253 lt!478379 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!478553)))

(declare-fun b!1077666 () Bool)

(declare-fun res!717904 () Bool)

(assert (=> b!1077666 (=> (not res!717904) (not e!616087))))

(assert (=> b!1077666 (= res!717904 (= (getValueByKey!610 (toList!7326 lt!478553) (_1!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!660 (_2!8333 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1077667 () Bool)

(assert (=> b!1077667 (= e!616087 (contains!6384 (toList!7326 lt!478553) (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!130159 res!717903) b!1077666))

(assert (= (and b!1077666 res!717904) b!1077667))

(declare-fun m!996875 () Bool)

(assert (=> d!130159 m!996875))

(declare-fun m!996877 () Bool)

(assert (=> d!130159 m!996877))

(declare-fun m!996879 () Bool)

(assert (=> d!130159 m!996879))

(declare-fun m!996881 () Bool)

(assert (=> d!130159 m!996881))

(declare-fun m!996883 () Bool)

(assert (=> b!1077666 m!996883))

(declare-fun m!996885 () Bool)

(assert (=> b!1077667 m!996885))

(assert (=> b!1077447 d!130159))

(declare-fun d!130161 () Bool)

(declare-fun e!616088 () Bool)

(assert (=> d!130161 e!616088))

(declare-fun res!717905 () Bool)

(assert (=> d!130161 (=> (not res!717905) (not e!616088))))

(declare-fun lt!478557 () ListLongMap!14621)

(assert (=> d!130161 (= res!717905 (contains!6381 lt!478557 (_1!8333 lt!478380)))))

(declare-fun lt!478558 () List!23193)

(assert (=> d!130161 (= lt!478557 (ListLongMap!14622 lt!478558))))

(declare-fun lt!478559 () Unit!35402)

(declare-fun lt!478560 () Unit!35402)

(assert (=> d!130161 (= lt!478559 lt!478560)))

(assert (=> d!130161 (= (getValueByKey!610 lt!478558 (_1!8333 lt!478380)) (Some!660 (_2!8333 lt!478380)))))

(assert (=> d!130161 (= lt!478560 (lemmaContainsTupThenGetReturnValue!292 lt!478558 (_1!8333 lt!478380) (_2!8333 lt!478380)))))

(assert (=> d!130161 (= lt!478558 (insertStrictlySorted!385 (toList!7326 (+!3253 lt!478379 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (_1!8333 lt!478380) (_2!8333 lt!478380)))))

(assert (=> d!130161 (= (+!3253 (+!3253 lt!478379 (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!478380) lt!478557)))

(declare-fun b!1077668 () Bool)

(declare-fun res!717906 () Bool)

(assert (=> b!1077668 (=> (not res!717906) (not e!616088))))

(assert (=> b!1077668 (= res!717906 (= (getValueByKey!610 (toList!7326 lt!478557) (_1!8333 lt!478380)) (Some!660 (_2!8333 lt!478380))))))

(declare-fun b!1077669 () Bool)

(assert (=> b!1077669 (= e!616088 (contains!6384 (toList!7326 lt!478557) lt!478380))))

(assert (= (and d!130161 res!717905) b!1077668))

(assert (= (and b!1077668 res!717906) b!1077669))

(declare-fun m!996887 () Bool)

(assert (=> d!130161 m!996887))

(declare-fun m!996889 () Bool)

(assert (=> d!130161 m!996889))

(declare-fun m!996891 () Bool)

(assert (=> d!130161 m!996891))

(declare-fun m!996893 () Bool)

(assert (=> d!130161 m!996893))

(declare-fun m!996895 () Bool)

(assert (=> b!1077668 m!996895))

(declare-fun m!996897 () Bool)

(assert (=> b!1077669 m!996897))

(assert (=> b!1077447 d!130161))

(declare-fun b!1077670 () Bool)

(declare-fun e!616097 () Bool)

(declare-fun lt!478576 () ListLongMap!14621)

(assert (=> b!1077670 (= e!616097 (= (apply!951 lt!478576 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1077671 () Bool)

(declare-fun e!616095 () Bool)

(assert (=> b!1077671 (= e!616095 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun call!45717 () ListLongMap!14621)

(declare-fun c!108635 () Bool)

(declare-fun c!108639 () Bool)

(declare-fun bm!45711 () Bool)

(declare-fun call!45719 () ListLongMap!14621)

(declare-fun call!45718 () ListLongMap!14621)

(declare-fun call!45714 () ListLongMap!14621)

(assert (=> bm!45711 (= call!45714 (+!3253 (ite c!108635 call!45718 (ite c!108639 call!45719 call!45717)) (ite (or c!108635 c!108639) (tuple2!16645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1077672 () Bool)

(declare-fun e!616094 () Bool)

(declare-fun e!616098 () Bool)

(assert (=> b!1077672 (= e!616094 e!616098)))

(declare-fun c!108638 () Bool)

(assert (=> b!1077672 (= c!108638 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1077673 () Bool)

(declare-fun e!616093 () ListLongMap!14621)

(assert (=> b!1077673 (= e!616093 (+!3253 call!45714 (tuple2!16645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1077675 () Bool)

(declare-fun e!616091 () ListLongMap!14621)

(declare-fun call!45720 () ListLongMap!14621)

(assert (=> b!1077675 (= e!616091 call!45720)))

(declare-fun bm!45712 () Bool)

(assert (=> bm!45712 (= call!45719 call!45718)))

(declare-fun b!1077676 () Bool)

(declare-fun e!616092 () Bool)

(declare-fun call!45716 () Bool)

(assert (=> b!1077676 (= e!616092 (not call!45716))))

(declare-fun b!1077677 () Bool)

(declare-fun e!616090 () Unit!35402)

(declare-fun lt!478573 () Unit!35402)

(assert (=> b!1077677 (= e!616090 lt!478573)))

(declare-fun lt!478566 () ListLongMap!14621)

(assert (=> b!1077677 (= lt!478566 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478574 () (_ BitVec 64))

(assert (=> b!1077677 (= lt!478574 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478562 () (_ BitVec 64))

(assert (=> b!1077677 (= lt!478562 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478582 () Unit!35402)

(assert (=> b!1077677 (= lt!478582 (addStillContains!655 lt!478566 lt!478574 zeroValueAfter!47 lt!478562))))

(assert (=> b!1077677 (contains!6381 (+!3253 lt!478566 (tuple2!16645 lt!478574 zeroValueAfter!47)) lt!478562)))

(declare-fun lt!478570 () Unit!35402)

(assert (=> b!1077677 (= lt!478570 lt!478582)))

(declare-fun lt!478563 () ListLongMap!14621)

(assert (=> b!1077677 (= lt!478563 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478580 () (_ BitVec 64))

(assert (=> b!1077677 (= lt!478580 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478575 () (_ BitVec 64))

(assert (=> b!1077677 (= lt!478575 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478569 () Unit!35402)

(assert (=> b!1077677 (= lt!478569 (addApplyDifferent!511 lt!478563 lt!478580 minValue!907 lt!478575))))

(assert (=> b!1077677 (= (apply!951 (+!3253 lt!478563 (tuple2!16645 lt!478580 minValue!907)) lt!478575) (apply!951 lt!478563 lt!478575))))

(declare-fun lt!478577 () Unit!35402)

(assert (=> b!1077677 (= lt!478577 lt!478569)))

(declare-fun lt!478579 () ListLongMap!14621)

(assert (=> b!1077677 (= lt!478579 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478565 () (_ BitVec 64))

(assert (=> b!1077677 (= lt!478565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478581 () (_ BitVec 64))

(assert (=> b!1077677 (= lt!478581 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!478571 () Unit!35402)

(assert (=> b!1077677 (= lt!478571 (addApplyDifferent!511 lt!478579 lt!478565 zeroValueAfter!47 lt!478581))))

(assert (=> b!1077677 (= (apply!951 (+!3253 lt!478579 (tuple2!16645 lt!478565 zeroValueAfter!47)) lt!478581) (apply!951 lt!478579 lt!478581))))

(declare-fun lt!478568 () Unit!35402)

(assert (=> b!1077677 (= lt!478568 lt!478571)))

(declare-fun lt!478564 () ListLongMap!14621)

(assert (=> b!1077677 (= lt!478564 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!478572 () (_ BitVec 64))

(assert (=> b!1077677 (= lt!478572 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!478567 () (_ BitVec 64))

(assert (=> b!1077677 (= lt!478567 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1077677 (= lt!478573 (addApplyDifferent!511 lt!478564 lt!478572 minValue!907 lt!478567))))

(assert (=> b!1077677 (= (apply!951 (+!3253 lt!478564 (tuple2!16645 lt!478572 minValue!907)) lt!478567) (apply!951 lt!478564 lt!478567))))

(declare-fun b!1077678 () Bool)

(declare-fun res!717907 () Bool)

(assert (=> b!1077678 (=> (not res!717907) (not e!616094))))

(declare-fun e!616099 () Bool)

(assert (=> b!1077678 (= res!717907 e!616099)))

(declare-fun res!717911 () Bool)

(assert (=> b!1077678 (=> res!717911 e!616099)))

(assert (=> b!1077678 (= res!717911 (not e!616095))))

(declare-fun res!717912 () Bool)

(assert (=> b!1077678 (=> (not res!717912) (not e!616095))))

(assert (=> b!1077678 (= res!717912 (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun bm!45713 () Bool)

(assert (=> bm!45713 (= call!45717 call!45719)))

(declare-fun bm!45714 () Bool)

(declare-fun call!45715 () Bool)

(assert (=> bm!45714 (= call!45715 (contains!6381 lt!478576 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077679 () Bool)

(declare-fun e!616096 () ListLongMap!14621)

(assert (=> b!1077679 (= e!616093 e!616096)))

(assert (=> b!1077679 (= c!108639 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45715 () Bool)

(assert (=> bm!45715 (= call!45720 call!45714)))

(declare-fun b!1077680 () Bool)

(declare-fun e!616100 () Bool)

(assert (=> b!1077680 (= e!616100 (= (apply!951 lt!478576 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun b!1077681 () Bool)

(assert (=> b!1077681 (= e!616098 (not call!45715))))

(declare-fun b!1077682 () Bool)

(declare-fun e!616089 () Bool)

(assert (=> b!1077682 (= e!616089 (= (apply!951 lt!478576 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)) (get!17275 (select (arr!33221 _values!955) #b00000000000000000000000000000000) (dynLambda!2066 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1077682 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33758 _values!955)))))

(assert (=> b!1077682 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun b!1077674 () Bool)

(assert (=> b!1077674 (= e!616091 call!45717)))

(declare-fun d!130163 () Bool)

(assert (=> d!130163 e!616094))

(declare-fun res!717914 () Bool)

(assert (=> d!130163 (=> (not res!717914) (not e!616094))))

(assert (=> d!130163 (= res!717914 (or (bvsge #b00000000000000000000000000000000 (size!33759 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))))

(declare-fun lt!478561 () ListLongMap!14621)

(assert (=> d!130163 (= lt!478576 lt!478561)))

(declare-fun lt!478578 () Unit!35402)

(assert (=> d!130163 (= lt!478578 e!616090)))

(declare-fun c!108637 () Bool)

(declare-fun e!616101 () Bool)

(assert (=> d!130163 (= c!108637 e!616101)))

(declare-fun res!717909 () Bool)

(assert (=> d!130163 (=> (not res!717909) (not e!616101))))

(assert (=> d!130163 (= res!717909 (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(assert (=> d!130163 (= lt!478561 e!616093)))

(assert (=> d!130163 (= c!108635 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!130163 (validMask!0 mask!1515)))

(assert (=> d!130163 (= (getCurrentListMap!4183 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!478576)))

(declare-fun bm!45716 () Bool)

(assert (=> bm!45716 (= call!45716 (contains!6381 lt!478576 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077683 () Bool)

(assert (=> b!1077683 (= e!616096 call!45720)))

(declare-fun b!1077684 () Bool)

(declare-fun c!108636 () Bool)

(assert (=> b!1077684 (= c!108636 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1077684 (= e!616096 e!616091)))

(declare-fun b!1077685 () Bool)

(declare-fun res!717915 () Bool)

(assert (=> b!1077685 (=> (not res!717915) (not e!616094))))

(assert (=> b!1077685 (= res!717915 e!616092)))

(declare-fun c!108634 () Bool)

(assert (=> b!1077685 (= c!108634 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1077686 () Bool)

(declare-fun Unit!35406 () Unit!35402)

(assert (=> b!1077686 (= e!616090 Unit!35406)))

(declare-fun bm!45717 () Bool)

(assert (=> bm!45717 (= call!45718 (getCurrentListMapNoExtraKeys!3918 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1077687 () Bool)

(assert (=> b!1077687 (= e!616092 e!616100)))

(declare-fun res!717908 () Bool)

(assert (=> b!1077687 (= res!717908 call!45716)))

(assert (=> b!1077687 (=> (not res!717908) (not e!616100))))

(declare-fun b!1077688 () Bool)

(assert (=> b!1077688 (= e!616099 e!616089)))

(declare-fun res!717913 () Bool)

(assert (=> b!1077688 (=> (not res!717913) (not e!616089))))

(assert (=> b!1077688 (= res!717913 (contains!6381 lt!478576 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1077688 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33759 _keys!1163)))))

(declare-fun b!1077689 () Bool)

(assert (=> b!1077689 (= e!616101 (validKeyInArray!0 (select (arr!33222 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1077690 () Bool)

(assert (=> b!1077690 (= e!616098 e!616097)))

(declare-fun res!717910 () Bool)

(assert (=> b!1077690 (= res!717910 call!45715)))

(assert (=> b!1077690 (=> (not res!717910) (not e!616097))))

(assert (= (and d!130163 c!108635) b!1077673))

(assert (= (and d!130163 (not c!108635)) b!1077679))

(assert (= (and b!1077679 c!108639) b!1077683))

(assert (= (and b!1077679 (not c!108639)) b!1077684))

(assert (= (and b!1077684 c!108636) b!1077675))

(assert (= (and b!1077684 (not c!108636)) b!1077674))

(assert (= (or b!1077675 b!1077674) bm!45713))

(assert (= (or b!1077683 bm!45713) bm!45712))

(assert (= (or b!1077683 b!1077675) bm!45715))

(assert (= (or b!1077673 bm!45712) bm!45717))

(assert (= (or b!1077673 bm!45715) bm!45711))

(assert (= (and d!130163 res!717909) b!1077689))

(assert (= (and d!130163 c!108637) b!1077677))

(assert (= (and d!130163 (not c!108637)) b!1077686))

(assert (= (and d!130163 res!717914) b!1077678))

(assert (= (and b!1077678 res!717912) b!1077671))

(assert (= (and b!1077678 (not res!717911)) b!1077688))

(assert (= (and b!1077688 res!717913) b!1077682))

(assert (= (and b!1077678 res!717907) b!1077685))

(assert (= (and b!1077685 c!108634) b!1077687))

(assert (= (and b!1077685 (not c!108634)) b!1077676))

(assert (= (and b!1077687 res!717908) b!1077680))

(assert (= (or b!1077687 b!1077676) bm!45716))

(assert (= (and b!1077685 res!717915) b!1077672))

(assert (= (and b!1077672 c!108638) b!1077690))

(assert (= (and b!1077672 (not c!108638)) b!1077681))

(assert (= (and b!1077690 res!717910) b!1077670))

(assert (= (or b!1077690 b!1077681) bm!45714))

(declare-fun b_lambda!16969 () Bool)

(assert (=> (not b_lambda!16969) (not b!1077682)))

(assert (=> b!1077682 t!32546))

(declare-fun b_and!35217 () Bool)

(assert (= b_and!35215 (and (=> t!32546 result!14837) b_and!35217)))

(declare-fun m!996899 () Bool)

(assert (=> bm!45711 m!996899))

(assert (=> b!1077688 m!996735))

(assert (=> b!1077688 m!996735))

(declare-fun m!996901 () Bool)

(assert (=> b!1077688 m!996901))

(declare-fun m!996903 () Bool)

(assert (=> b!1077673 m!996903))

(declare-fun m!996905 () Bool)

(assert (=> b!1077680 m!996905))

(assert (=> d!130163 m!996637))

(assert (=> b!1077682 m!996735))

(declare-fun m!996907 () Bool)

(assert (=> b!1077682 m!996907))

(assert (=> b!1077682 m!996751))

(assert (=> b!1077682 m!996735))

(assert (=> b!1077682 m!996749))

(assert (=> b!1077682 m!996749))

(assert (=> b!1077682 m!996751))

(assert (=> b!1077682 m!996753))

(declare-fun m!996909 () Bool)

(assert (=> b!1077677 m!996909))

(declare-fun m!996911 () Bool)

(assert (=> b!1077677 m!996911))

(declare-fun m!996913 () Bool)

(assert (=> b!1077677 m!996913))

(declare-fun m!996915 () Bool)

(assert (=> b!1077677 m!996915))

(declare-fun m!996917 () Bool)

(assert (=> b!1077677 m!996917))

(declare-fun m!996919 () Bool)

(assert (=> b!1077677 m!996919))

(assert (=> b!1077677 m!996735))

(assert (=> b!1077677 m!996919))

(declare-fun m!996921 () Bool)

(assert (=> b!1077677 m!996921))

(declare-fun m!996923 () Bool)

(assert (=> b!1077677 m!996923))

(assert (=> b!1077677 m!996645))

(declare-fun m!996925 () Bool)

(assert (=> b!1077677 m!996925))

(declare-fun m!996927 () Bool)

(assert (=> b!1077677 m!996927))

(declare-fun m!996929 () Bool)

(assert (=> b!1077677 m!996929))

(assert (=> b!1077677 m!996913))

(assert (=> b!1077677 m!996911))

(declare-fun m!996931 () Bool)

(assert (=> b!1077677 m!996931))

(declare-fun m!996933 () Bool)

(assert (=> b!1077677 m!996933))

(assert (=> b!1077677 m!996917))

(declare-fun m!996935 () Bool)

(assert (=> b!1077677 m!996935))

(declare-fun m!996937 () Bool)

(assert (=> b!1077677 m!996937))

(assert (=> b!1077689 m!996735))

(assert (=> b!1077689 m!996735))

(assert (=> b!1077689 m!996737))

(declare-fun m!996939 () Bool)

(assert (=> bm!45714 m!996939))

(declare-fun m!996941 () Bool)

(assert (=> bm!45716 m!996941))

(declare-fun m!996943 () Bool)

(assert (=> b!1077670 m!996943))

(assert (=> bm!45717 m!996645))

(assert (=> b!1077671 m!996735))

(assert (=> b!1077671 m!996735))

(assert (=> b!1077671 m!996737))

(assert (=> b!1077447 d!130163))

(declare-fun condMapEmpty!40804 () Bool)

(declare-fun mapDefault!40804 () ValueCell!12314)

(assert (=> mapNonEmpty!40795 (= condMapEmpty!40804 (= mapRest!40795 ((as const (Array (_ BitVec 32) ValueCell!12314)) mapDefault!40804)))))

(declare-fun e!616107 () Bool)

(declare-fun mapRes!40804 () Bool)

(assert (=> mapNonEmpty!40795 (= tp!78169 (and e!616107 mapRes!40804))))

(declare-fun mapIsEmpty!40804 () Bool)

(assert (=> mapIsEmpty!40804 mapRes!40804))

(declare-fun mapNonEmpty!40804 () Bool)

(declare-fun tp!78185 () Bool)

(declare-fun e!616106 () Bool)

(assert (=> mapNonEmpty!40804 (= mapRes!40804 (and tp!78185 e!616106))))

(declare-fun mapRest!40804 () (Array (_ BitVec 32) ValueCell!12314))

(declare-fun mapValue!40804 () ValueCell!12314)

(declare-fun mapKey!40804 () (_ BitVec 32))

(assert (=> mapNonEmpty!40804 (= mapRest!40795 (store mapRest!40804 mapKey!40804 mapValue!40804))))

(declare-fun b!1077698 () Bool)

(assert (=> b!1077698 (= e!616107 tp_is_empty!26035)))

(declare-fun b!1077697 () Bool)

(assert (=> b!1077697 (= e!616106 tp_is_empty!26035)))

(assert (= (and mapNonEmpty!40795 condMapEmpty!40804) mapIsEmpty!40804))

(assert (= (and mapNonEmpty!40795 (not condMapEmpty!40804)) mapNonEmpty!40804))

(assert (= (and mapNonEmpty!40804 ((_ is ValueCellFull!12314) mapValue!40804)) b!1077697))

(assert (= (and mapNonEmpty!40795 ((_ is ValueCellFull!12314) mapDefault!40804)) b!1077698))

(declare-fun m!996945 () Bool)

(assert (=> mapNonEmpty!40804 m!996945))

(declare-fun b_lambda!16971 () Bool)

(assert (= b_lambda!16963 (or (and start!95440 b_free!22225) b_lambda!16971)))

(declare-fun b_lambda!16973 () Bool)

(assert (= b_lambda!16969 (or (and start!95440 b_free!22225) b_lambda!16973)))

(declare-fun b_lambda!16975 () Bool)

(assert (= b_lambda!16965 (or (and start!95440 b_free!22225) b_lambda!16975)))

(declare-fun b_lambda!16977 () Bool)

(assert (= b_lambda!16959 (or (and start!95440 b_free!22225) b_lambda!16977)))

(declare-fun b_lambda!16979 () Bool)

(assert (= b_lambda!16967 (or (and start!95440 b_free!22225) b_lambda!16979)))

(declare-fun b_lambda!16981 () Bool)

(assert (= b_lambda!16961 (or (and start!95440 b_free!22225) b_lambda!16981)))

(check-sat (not d!130135) (not bm!45711) (not bm!45683) (not b!1077637) (not b!1077540) b_and!35217 (not bm!45686) (not b!1077553) (not b!1077569) (not b!1077558) (not b!1077655) (not b!1077665) (not b!1077543) (not b!1077688) (not b!1077535) (not b!1077554) (not b_next!22225) (not b!1077552) (not bm!45689) (not b!1077583) (not b!1077680) (not b!1077673) (not b_lambda!16979) (not b!1077592) (not d!130161) tp_is_empty!26035 (not b!1077646) (not bm!45707) (not b!1077538) (not d!130157) (not bm!45716) (not b!1077539) (not b!1077547) (not b_lambda!16971) (not bm!45709) (not d!130159) (not b_lambda!16973) (not d!130153) (not b!1077654) (not b!1077591) (not b!1077677) (not b!1077648) (not b_lambda!16981) (not b!1077669) (not bm!45682) (not b!1077542) (not b!1077639) (not bm!45710) (not b!1077668) (not b!1077533) (not b!1077671) (not b!1077689) (not d!130137) (not b!1077682) (not b!1077556) (not d!130145) (not d!130155) (not b!1077584) (not b_lambda!16975) (not b_lambda!16977) (not b!1077570) (not b!1077666) (not b!1077643) (not b!1077663) (not b!1077573) (not b!1077544) (not b!1077593) (not b!1077670) (not bm!45717) (not bm!45714) (not b!1077557) (not b!1077636) (not d!130163) (not b!1077667) (not mapNonEmpty!40804) (not b!1077590) (not b!1077549) (not bm!45704) (not d!130139))
(check-sat b_and!35217 (not b_next!22225))
