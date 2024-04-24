; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94338 () Bool)

(assert start!94338)

(declare-fun b_free!21517 () Bool)

(declare-fun b_next!21517 () Bool)

(assert (=> start!94338 (= b_free!21517 (not b_next!21517))))

(declare-fun tp!75982 () Bool)

(declare-fun b_and!34269 () Bool)

(assert (=> start!94338 (= tp!75982 b_and!34269)))

(declare-fun b!1065549 () Bool)

(declare-fun e!607352 () Bool)

(declare-fun e!607353 () Bool)

(declare-fun mapRes!39670 () Bool)

(assert (=> b!1065549 (= e!607352 (and e!607353 mapRes!39670))))

(declare-fun condMapEmpty!39670 () Bool)

(declare-datatypes ((V!38905 0))(
  ( (V!38906 (val!12714 Int)) )
))
(declare-datatypes ((ValueCell!11960 0))(
  ( (ValueCellFull!11960 (v!15322 V!38905)) (EmptyCell!11960) )
))
(declare-datatypes ((array!67699 0))(
  ( (array!67700 (arr!32548 (Array (_ BitVec 32) ValueCell!11960)) (size!33085 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67699)

(declare-fun mapDefault!39670 () ValueCell!11960)

(assert (=> b!1065549 (= condMapEmpty!39670 (= (arr!32548 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11960)) mapDefault!39670)))))

(declare-fun b!1065550 () Bool)

(declare-fun tp_is_empty!25327 () Bool)

(assert (=> b!1065550 (= e!607353 tp_is_empty!25327)))

(declare-fun b!1065551 () Bool)

(declare-fun res!711003 () Bool)

(declare-fun e!607354 () Bool)

(assert (=> b!1065551 (=> (not res!711003) (not e!607354))))

(declare-datatypes ((array!67701 0))(
  ( (array!67702 (arr!32549 (Array (_ BitVec 32) (_ BitVec 64))) (size!33086 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67701)

(declare-datatypes ((List!22664 0))(
  ( (Nil!22661) (Cons!22660 (h!23878 (_ BitVec 64)) (t!31971 List!22664)) )
))
(declare-fun arrayNoDuplicates!0 (array!67701 (_ BitVec 32) List!22664) Bool)

(assert (=> b!1065551 (= res!711003 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22661))))

(declare-fun mapNonEmpty!39670 () Bool)

(declare-fun tp!75983 () Bool)

(declare-fun e!607355 () Bool)

(assert (=> mapNonEmpty!39670 (= mapRes!39670 (and tp!75983 e!607355))))

(declare-fun mapValue!39670 () ValueCell!11960)

(declare-fun mapKey!39670 () (_ BitVec 32))

(declare-fun mapRest!39670 () (Array (_ BitVec 32) ValueCell!11960))

(assert (=> mapNonEmpty!39670 (= (arr!32548 _values!955) (store mapRest!39670 mapKey!39670 mapValue!39670))))

(declare-fun mapIsEmpty!39670 () Bool)

(assert (=> mapIsEmpty!39670 mapRes!39670))

(declare-fun res!711001 () Bool)

(assert (=> start!94338 (=> (not res!711001) (not e!607354))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94338 (= res!711001 (validMask!0 mask!1515))))

(assert (=> start!94338 e!607354))

(assert (=> start!94338 true))

(assert (=> start!94338 tp_is_empty!25327))

(declare-fun array_inv!25226 (array!67699) Bool)

(assert (=> start!94338 (and (array_inv!25226 _values!955) e!607352)))

(assert (=> start!94338 tp!75982))

(declare-fun array_inv!25227 (array!67701) Bool)

(assert (=> start!94338 (array_inv!25227 _keys!1163)))

(declare-fun b!1065552 () Bool)

(declare-fun res!711004 () Bool)

(assert (=> b!1065552 (=> (not res!711004) (not e!607354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67701 (_ BitVec 32)) Bool)

(assert (=> b!1065552 (= res!711004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065553 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065553 (= e!607354 (not (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!33086 _keys!1163)))))))

(declare-datatypes ((tuple2!16090 0))(
  ( (tuple2!16091 (_1!8056 (_ BitVec 64)) (_2!8056 V!38905)) )
))
(declare-datatypes ((List!22665 0))(
  ( (Nil!22662) (Cons!22661 (h!23879 tuple2!16090) (t!31972 List!22665)) )
))
(declare-datatypes ((ListLongMap!14067 0))(
  ( (ListLongMap!14068 (toList!7049 List!22665)) )
))
(declare-fun lt!469612 () ListLongMap!14067)

(declare-fun lt!469614 () ListLongMap!14067)

(assert (=> b!1065553 (= lt!469612 lt!469614)))

(declare-fun zeroValueBefore!47 () V!38905)

(declare-fun minValue!907 () V!38905)

(declare-datatypes ((Unit!34901 0))(
  ( (Unit!34902) )
))
(declare-fun lt!469613 () Unit!34901)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38905)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!686 (array!67701 array!67699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38905 V!38905 V!38905 V!38905 (_ BitVec 32) Int) Unit!34901)

(assert (=> b!1065553 (= lt!469613 (lemmaNoChangeToArrayThenSameMapNoExtras!686 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3683 (array!67701 array!67699 (_ BitVec 32) (_ BitVec 32) V!38905 V!38905 (_ BitVec 32) Int) ListLongMap!14067)

(assert (=> b!1065553 (= lt!469614 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065553 (= lt!469612 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065554 () Bool)

(assert (=> b!1065554 (= e!607355 tp_is_empty!25327)))

(declare-fun b!1065555 () Bool)

(declare-fun res!711002 () Bool)

(assert (=> b!1065555 (=> (not res!711002) (not e!607354))))

(assert (=> b!1065555 (= res!711002 (and (= (size!33085 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33086 _keys!1163) (size!33085 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94338 res!711001) b!1065555))

(assert (= (and b!1065555 res!711002) b!1065552))

(assert (= (and b!1065552 res!711004) b!1065551))

(assert (= (and b!1065551 res!711003) b!1065553))

(assert (= (and b!1065549 condMapEmpty!39670) mapIsEmpty!39670))

(assert (= (and b!1065549 (not condMapEmpty!39670)) mapNonEmpty!39670))

(get-info :version)

(assert (= (and mapNonEmpty!39670 ((_ is ValueCellFull!11960) mapValue!39670)) b!1065554))

(assert (= (and b!1065549 ((_ is ValueCellFull!11960) mapDefault!39670)) b!1065550))

(assert (= start!94338 b!1065549))

(declare-fun m!984481 () Bool)

(assert (=> b!1065553 m!984481))

(declare-fun m!984483 () Bool)

(assert (=> b!1065553 m!984483))

(declare-fun m!984485 () Bool)

(assert (=> b!1065553 m!984485))

(declare-fun m!984487 () Bool)

(assert (=> mapNonEmpty!39670 m!984487))

(declare-fun m!984489 () Bool)

(assert (=> start!94338 m!984489))

(declare-fun m!984491 () Bool)

(assert (=> start!94338 m!984491))

(declare-fun m!984493 () Bool)

(assert (=> start!94338 m!984493))

(declare-fun m!984495 () Bool)

(assert (=> b!1065551 m!984495))

(declare-fun m!984497 () Bool)

(assert (=> b!1065552 m!984497))

(check-sat b_and!34269 (not start!94338) (not b!1065552) tp_is_empty!25327 (not b!1065551) (not mapNonEmpty!39670) (not b!1065553) (not b_next!21517))
(check-sat b_and!34269 (not b_next!21517))
(get-model)

(declare-fun b!1065606 () Bool)

(declare-fun e!607395 () Bool)

(declare-fun call!45041 () Bool)

(assert (=> b!1065606 (= e!607395 call!45041)))

(declare-fun b!1065607 () Bool)

(declare-fun e!607394 () Bool)

(assert (=> b!1065607 (= e!607394 call!45041)))

(declare-fun b!1065608 () Bool)

(declare-fun e!607393 () Bool)

(assert (=> b!1065608 (= e!607393 e!607394)))

(declare-fun c!107738 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1065608 (= c!107738 (validKeyInArray!0 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129411 () Bool)

(declare-fun res!711033 () Bool)

(assert (=> d!129411 (=> res!711033 e!607393)))

(assert (=> d!129411 (= res!711033 (bvsge #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(assert (=> d!129411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!607393)))

(declare-fun bm!45038 () Bool)

(assert (=> bm!45038 (= call!45041 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1065609 () Bool)

(assert (=> b!1065609 (= e!607394 e!607395)))

(declare-fun lt!469640 () (_ BitVec 64))

(assert (=> b!1065609 (= lt!469640 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!469641 () Unit!34901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67701 (_ BitVec 64) (_ BitVec 32)) Unit!34901)

(assert (=> b!1065609 (= lt!469641 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!469640 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1065609 (arrayContainsKey!0 _keys!1163 lt!469640 #b00000000000000000000000000000000)))

(declare-fun lt!469639 () Unit!34901)

(assert (=> b!1065609 (= lt!469639 lt!469641)))

(declare-fun res!711034 () Bool)

(declare-datatypes ((SeekEntryResult!9830 0))(
  ( (MissingZero!9830 (index!41691 (_ BitVec 32))) (Found!9830 (index!41692 (_ BitVec 32))) (Intermediate!9830 (undefined!10642 Bool) (index!41693 (_ BitVec 32)) (x!95224 (_ BitVec 32))) (Undefined!9830) (MissingVacant!9830 (index!41694 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67701 (_ BitVec 32)) SeekEntryResult!9830)

(assert (=> b!1065609 (= res!711034 (= (seekEntryOrOpen!0 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9830 #b00000000000000000000000000000000)))))

(assert (=> b!1065609 (=> (not res!711034) (not e!607395))))

(assert (= (and d!129411 (not res!711033)) b!1065608))

(assert (= (and b!1065608 c!107738) b!1065609))

(assert (= (and b!1065608 (not c!107738)) b!1065607))

(assert (= (and b!1065609 res!711034) b!1065606))

(assert (= (or b!1065606 b!1065607) bm!45038))

(declare-fun m!984535 () Bool)

(assert (=> b!1065608 m!984535))

(assert (=> b!1065608 m!984535))

(declare-fun m!984537 () Bool)

(assert (=> b!1065608 m!984537))

(declare-fun m!984539 () Bool)

(assert (=> bm!45038 m!984539))

(assert (=> b!1065609 m!984535))

(declare-fun m!984541 () Bool)

(assert (=> b!1065609 m!984541))

(declare-fun m!984543 () Bool)

(assert (=> b!1065609 m!984543))

(assert (=> b!1065609 m!984535))

(declare-fun m!984545 () Bool)

(assert (=> b!1065609 m!984545))

(assert (=> b!1065552 d!129411))

(declare-fun d!129413 () Bool)

(assert (=> d!129413 (= (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!469644 () Unit!34901)

(declare-fun choose!1732 (array!67701 array!67699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38905 V!38905 V!38905 V!38905 (_ BitVec 32) Int) Unit!34901)

(assert (=> d!129413 (= lt!469644 (choose!1732 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129413 (validMask!0 mask!1515)))

(assert (=> d!129413 (= (lemmaNoChangeToArrayThenSameMapNoExtras!686 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469644)))

(declare-fun bs!31321 () Bool)

(assert (= bs!31321 d!129413))

(assert (=> bs!31321 m!984485))

(assert (=> bs!31321 m!984483))

(declare-fun m!984547 () Bool)

(assert (=> bs!31321 m!984547))

(assert (=> bs!31321 m!984489))

(assert (=> b!1065553 d!129413))

(declare-fun b!1065635 () Bool)

(declare-fun e!607415 () Bool)

(declare-fun e!607412 () Bool)

(assert (=> b!1065635 (= e!607415 e!607412)))

(declare-fun c!107750 () Bool)

(declare-fun e!607416 () Bool)

(assert (=> b!1065635 (= c!107750 e!607416)))

(declare-fun res!711045 () Bool)

(assert (=> b!1065635 (=> (not res!711045) (not e!607416))))

(assert (=> b!1065635 (= res!711045 (bvslt #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(declare-fun b!1065636 () Bool)

(declare-fun e!607414 () ListLongMap!14067)

(declare-fun call!45044 () ListLongMap!14067)

(assert (=> b!1065636 (= e!607414 call!45044)))

(declare-fun bm!45041 () Bool)

(assert (=> bm!45041 (= call!45044 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1065637 () Bool)

(declare-fun e!607413 () Bool)

(assert (=> b!1065637 (= e!607412 e!607413)))

(declare-fun c!107748 () Bool)

(assert (=> b!1065637 (= c!107748 (bvslt #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(declare-fun b!1065638 () Bool)

(declare-fun e!607411 () ListLongMap!14067)

(assert (=> b!1065638 (= e!607411 e!607414)))

(declare-fun c!107747 () Bool)

(assert (=> b!1065638 (= c!107747 (validKeyInArray!0 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065639 () Bool)

(assert (=> b!1065639 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(assert (=> b!1065639 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33085 _values!955)))))

(declare-fun e!607410 () Bool)

(declare-fun lt!469661 () ListLongMap!14067)

(declare-fun apply!930 (ListLongMap!14067 (_ BitVec 64)) V!38905)

(declare-fun get!17018 (ValueCell!11960 V!38905) V!38905)

(declare-fun dynLambda!2045 (Int (_ BitVec 64)) V!38905)

(assert (=> b!1065639 (= e!607410 (= (apply!930 lt!469661 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)) (get!17018 (select (arr!32548 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1065640 () Bool)

(declare-fun isEmpty!943 (ListLongMap!14067) Bool)

(assert (=> b!1065640 (= e!607413 (isEmpty!943 lt!469661))))

(declare-fun b!1065641 () Bool)

(declare-fun lt!469659 () Unit!34901)

(declare-fun lt!469660 () Unit!34901)

(assert (=> b!1065641 (= lt!469659 lt!469660)))

(declare-fun lt!469664 () V!38905)

(declare-fun lt!469665 () (_ BitVec 64))

(declare-fun lt!469662 () ListLongMap!14067)

(declare-fun lt!469663 () (_ BitVec 64))

(declare-fun contains!6283 (ListLongMap!14067 (_ BitVec 64)) Bool)

(declare-fun +!3141 (ListLongMap!14067 tuple2!16090) ListLongMap!14067)

(assert (=> b!1065641 (not (contains!6283 (+!3141 lt!469662 (tuple2!16091 lt!469663 lt!469664)) lt!469665))))

(declare-fun addStillNotContains!251 (ListLongMap!14067 (_ BitVec 64) V!38905 (_ BitVec 64)) Unit!34901)

(assert (=> b!1065641 (= lt!469660 (addStillNotContains!251 lt!469662 lt!469663 lt!469664 lt!469665))))

(assert (=> b!1065641 (= lt!469665 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1065641 (= lt!469664 (get!17018 (select (arr!32548 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1065641 (= lt!469663 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1065641 (= lt!469662 call!45044)))

(assert (=> b!1065641 (= e!607414 (+!3141 call!45044 (tuple2!16091 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000) (get!17018 (select (arr!32548 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!129415 () Bool)

(assert (=> d!129415 e!607415))

(declare-fun res!711043 () Bool)

(assert (=> d!129415 (=> (not res!711043) (not e!607415))))

(assert (=> d!129415 (= res!711043 (not (contains!6283 lt!469661 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129415 (= lt!469661 e!607411)))

(declare-fun c!107749 () Bool)

(assert (=> d!129415 (= c!107749 (bvsge #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(assert (=> d!129415 (validMask!0 mask!1515)))

(assert (=> d!129415 (= (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469661)))

(declare-fun b!1065634 () Bool)

(assert (=> b!1065634 (= e!607413 (= lt!469661 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1065642 () Bool)

(assert (=> b!1065642 (= e!607412 e!607410)))

(assert (=> b!1065642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(declare-fun res!711046 () Bool)

(assert (=> b!1065642 (= res!711046 (contains!6283 lt!469661 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065642 (=> (not res!711046) (not e!607410))))

(declare-fun b!1065643 () Bool)

(assert (=> b!1065643 (= e!607416 (validKeyInArray!0 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065643 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1065644 () Bool)

(declare-fun res!711044 () Bool)

(assert (=> b!1065644 (=> (not res!711044) (not e!607415))))

(assert (=> b!1065644 (= res!711044 (not (contains!6283 lt!469661 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1065645 () Bool)

(assert (=> b!1065645 (= e!607411 (ListLongMap!14068 Nil!22662))))

(assert (= (and d!129415 c!107749) b!1065645))

(assert (= (and d!129415 (not c!107749)) b!1065638))

(assert (= (and b!1065638 c!107747) b!1065641))

(assert (= (and b!1065638 (not c!107747)) b!1065636))

(assert (= (or b!1065641 b!1065636) bm!45041))

(assert (= (and d!129415 res!711043) b!1065644))

(assert (= (and b!1065644 res!711044) b!1065635))

(assert (= (and b!1065635 res!711045) b!1065643))

(assert (= (and b!1065635 c!107750) b!1065642))

(assert (= (and b!1065635 (not c!107750)) b!1065637))

(assert (= (and b!1065642 res!711046) b!1065639))

(assert (= (and b!1065637 c!107748) b!1065634))

(assert (= (and b!1065637 (not c!107748)) b!1065640))

(declare-fun b_lambda!16511 () Bool)

(assert (=> (not b_lambda!16511) (not b!1065639)))

(declare-fun t!31976 () Bool)

(declare-fun tb!7129 () Bool)

(assert (=> (and start!94338 (= defaultEntry!963 defaultEntry!963) t!31976) tb!7129))

(declare-fun result!14711 () Bool)

(assert (=> tb!7129 (= result!14711 tp_is_empty!25327)))

(assert (=> b!1065639 t!31976))

(declare-fun b_and!34275 () Bool)

(assert (= b_and!34269 (and (=> t!31976 result!14711) b_and!34275)))

(declare-fun b_lambda!16513 () Bool)

(assert (=> (not b_lambda!16513) (not b!1065641)))

(assert (=> b!1065641 t!31976))

(declare-fun b_and!34277 () Bool)

(assert (= b_and!34275 (and (=> t!31976 result!14711) b_and!34277)))

(declare-fun m!984549 () Bool)

(assert (=> b!1065639 m!984549))

(declare-fun m!984551 () Bool)

(assert (=> b!1065639 m!984551))

(assert (=> b!1065639 m!984535))

(declare-fun m!984553 () Bool)

(assert (=> b!1065639 m!984553))

(assert (=> b!1065639 m!984535))

(assert (=> b!1065639 m!984551))

(assert (=> b!1065639 m!984549))

(declare-fun m!984555 () Bool)

(assert (=> b!1065639 m!984555))

(assert (=> b!1065643 m!984535))

(assert (=> b!1065643 m!984535))

(assert (=> b!1065643 m!984537))

(declare-fun m!984557 () Bool)

(assert (=> b!1065644 m!984557))

(declare-fun m!984559 () Bool)

(assert (=> b!1065640 m!984559))

(declare-fun m!984561 () Bool)

(assert (=> b!1065641 m!984561))

(assert (=> b!1065641 m!984549))

(assert (=> b!1065641 m!984535))

(assert (=> b!1065641 m!984551))

(assert (=> b!1065641 m!984549))

(assert (=> b!1065641 m!984555))

(declare-fun m!984563 () Bool)

(assert (=> b!1065641 m!984563))

(declare-fun m!984565 () Bool)

(assert (=> b!1065641 m!984565))

(assert (=> b!1065641 m!984563))

(declare-fun m!984567 () Bool)

(assert (=> b!1065641 m!984567))

(assert (=> b!1065641 m!984551))

(assert (=> b!1065642 m!984535))

(assert (=> b!1065642 m!984535))

(declare-fun m!984569 () Bool)

(assert (=> b!1065642 m!984569))

(declare-fun m!984571 () Bool)

(assert (=> bm!45041 m!984571))

(assert (=> b!1065634 m!984571))

(declare-fun m!984573 () Bool)

(assert (=> d!129415 m!984573))

(assert (=> d!129415 m!984489))

(assert (=> b!1065638 m!984535))

(assert (=> b!1065638 m!984535))

(assert (=> b!1065638 m!984537))

(assert (=> b!1065553 d!129415))

(declare-fun b!1065649 () Bool)

(declare-fun e!607422 () Bool)

(declare-fun e!607419 () Bool)

(assert (=> b!1065649 (= e!607422 e!607419)))

(declare-fun c!107754 () Bool)

(declare-fun e!607423 () Bool)

(assert (=> b!1065649 (= c!107754 e!607423)))

(declare-fun res!711049 () Bool)

(assert (=> b!1065649 (=> (not res!711049) (not e!607423))))

(assert (=> b!1065649 (= res!711049 (bvslt #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(declare-fun b!1065650 () Bool)

(declare-fun e!607421 () ListLongMap!14067)

(declare-fun call!45045 () ListLongMap!14067)

(assert (=> b!1065650 (= e!607421 call!45045)))

(declare-fun bm!45042 () Bool)

(assert (=> bm!45042 (= call!45045 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1065651 () Bool)

(declare-fun e!607420 () Bool)

(assert (=> b!1065651 (= e!607419 e!607420)))

(declare-fun c!107752 () Bool)

(assert (=> b!1065651 (= c!107752 (bvslt #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(declare-fun b!1065652 () Bool)

(declare-fun e!607418 () ListLongMap!14067)

(assert (=> b!1065652 (= e!607418 e!607421)))

(declare-fun c!107751 () Bool)

(assert (=> b!1065652 (= c!107751 (validKeyInArray!0 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065653 () Bool)

(assert (=> b!1065653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(assert (=> b!1065653 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33085 _values!955)))))

(declare-fun e!607417 () Bool)

(declare-fun lt!469668 () ListLongMap!14067)

(assert (=> b!1065653 (= e!607417 (= (apply!930 lt!469668 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)) (get!17018 (select (arr!32548 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1065654 () Bool)

(assert (=> b!1065654 (= e!607420 (isEmpty!943 lt!469668))))

(declare-fun b!1065655 () Bool)

(declare-fun lt!469666 () Unit!34901)

(declare-fun lt!469667 () Unit!34901)

(assert (=> b!1065655 (= lt!469666 lt!469667)))

(declare-fun lt!469669 () ListLongMap!14067)

(declare-fun lt!469670 () (_ BitVec 64))

(declare-fun lt!469672 () (_ BitVec 64))

(declare-fun lt!469671 () V!38905)

(assert (=> b!1065655 (not (contains!6283 (+!3141 lt!469669 (tuple2!16091 lt!469670 lt!469671)) lt!469672))))

(assert (=> b!1065655 (= lt!469667 (addStillNotContains!251 lt!469669 lt!469670 lt!469671 lt!469672))))

(assert (=> b!1065655 (= lt!469672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1065655 (= lt!469671 (get!17018 (select (arr!32548 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1065655 (= lt!469670 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1065655 (= lt!469669 call!45045)))

(assert (=> b!1065655 (= e!607421 (+!3141 call!45045 (tuple2!16091 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000) (get!17018 (select (arr!32548 _values!955) #b00000000000000000000000000000000) (dynLambda!2045 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!129417 () Bool)

(assert (=> d!129417 e!607422))

(declare-fun res!711047 () Bool)

(assert (=> d!129417 (=> (not res!711047) (not e!607422))))

(assert (=> d!129417 (= res!711047 (not (contains!6283 lt!469668 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129417 (= lt!469668 e!607418)))

(declare-fun c!107753 () Bool)

(assert (=> d!129417 (= c!107753 (bvsge #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(assert (=> d!129417 (validMask!0 mask!1515)))

(assert (=> d!129417 (= (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!469668)))

(declare-fun b!1065648 () Bool)

(assert (=> b!1065648 (= e!607420 (= lt!469668 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(declare-fun b!1065656 () Bool)

(assert (=> b!1065656 (= e!607419 e!607417)))

(assert (=> b!1065656 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(declare-fun res!711050 () Bool)

(assert (=> b!1065656 (= res!711050 (contains!6283 lt!469668 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065656 (=> (not res!711050) (not e!607417))))

(declare-fun b!1065657 () Bool)

(assert (=> b!1065657 (= e!607423 (validKeyInArray!0 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065657 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1065658 () Bool)

(declare-fun res!711048 () Bool)

(assert (=> b!1065658 (=> (not res!711048) (not e!607422))))

(assert (=> b!1065658 (= res!711048 (not (contains!6283 lt!469668 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1065659 () Bool)

(assert (=> b!1065659 (= e!607418 (ListLongMap!14068 Nil!22662))))

(assert (= (and d!129417 c!107753) b!1065659))

(assert (= (and d!129417 (not c!107753)) b!1065652))

(assert (= (and b!1065652 c!107751) b!1065655))

(assert (= (and b!1065652 (not c!107751)) b!1065650))

(assert (= (or b!1065655 b!1065650) bm!45042))

(assert (= (and d!129417 res!711047) b!1065658))

(assert (= (and b!1065658 res!711048) b!1065649))

(assert (= (and b!1065649 res!711049) b!1065657))

(assert (= (and b!1065649 c!107754) b!1065656))

(assert (= (and b!1065649 (not c!107754)) b!1065651))

(assert (= (and b!1065656 res!711050) b!1065653))

(assert (= (and b!1065651 c!107752) b!1065648))

(assert (= (and b!1065651 (not c!107752)) b!1065654))

(declare-fun b_lambda!16515 () Bool)

(assert (=> (not b_lambda!16515) (not b!1065653)))

(assert (=> b!1065653 t!31976))

(declare-fun b_and!34279 () Bool)

(assert (= b_and!34277 (and (=> t!31976 result!14711) b_and!34279)))

(declare-fun b_lambda!16517 () Bool)

(assert (=> (not b_lambda!16517) (not b!1065655)))

(assert (=> b!1065655 t!31976))

(declare-fun b_and!34281 () Bool)

(assert (= b_and!34279 (and (=> t!31976 result!14711) b_and!34281)))

(assert (=> b!1065653 m!984549))

(assert (=> b!1065653 m!984551))

(assert (=> b!1065653 m!984535))

(declare-fun m!984575 () Bool)

(assert (=> b!1065653 m!984575))

(assert (=> b!1065653 m!984535))

(assert (=> b!1065653 m!984551))

(assert (=> b!1065653 m!984549))

(assert (=> b!1065653 m!984555))

(assert (=> b!1065657 m!984535))

(assert (=> b!1065657 m!984535))

(assert (=> b!1065657 m!984537))

(declare-fun m!984577 () Bool)

(assert (=> b!1065658 m!984577))

(declare-fun m!984579 () Bool)

(assert (=> b!1065654 m!984579))

(declare-fun m!984581 () Bool)

(assert (=> b!1065655 m!984581))

(assert (=> b!1065655 m!984549))

(assert (=> b!1065655 m!984535))

(assert (=> b!1065655 m!984551))

(assert (=> b!1065655 m!984549))

(assert (=> b!1065655 m!984555))

(declare-fun m!984583 () Bool)

(assert (=> b!1065655 m!984583))

(declare-fun m!984585 () Bool)

(assert (=> b!1065655 m!984585))

(assert (=> b!1065655 m!984583))

(declare-fun m!984587 () Bool)

(assert (=> b!1065655 m!984587))

(assert (=> b!1065655 m!984551))

(assert (=> b!1065656 m!984535))

(assert (=> b!1065656 m!984535))

(declare-fun m!984589 () Bool)

(assert (=> b!1065656 m!984589))

(declare-fun m!984591 () Bool)

(assert (=> bm!45042 m!984591))

(assert (=> b!1065648 m!984591))

(declare-fun m!984593 () Bool)

(assert (=> d!129417 m!984593))

(assert (=> d!129417 m!984489))

(assert (=> b!1065652 m!984535))

(assert (=> b!1065652 m!984535))

(assert (=> b!1065652 m!984537))

(assert (=> b!1065553 d!129417))

(declare-fun d!129419 () Bool)

(assert (=> d!129419 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94338 d!129419))

(declare-fun d!129421 () Bool)

(assert (=> d!129421 (= (array_inv!25226 _values!955) (bvsge (size!33085 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94338 d!129421))

(declare-fun d!129423 () Bool)

(assert (=> d!129423 (= (array_inv!25227 _keys!1163) (bvsge (size!33086 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94338 d!129423))

(declare-fun b!1065670 () Bool)

(declare-fun e!607435 () Bool)

(declare-fun call!45048 () Bool)

(assert (=> b!1065670 (= e!607435 call!45048)))

(declare-fun b!1065671 () Bool)

(declare-fun e!607432 () Bool)

(assert (=> b!1065671 (= e!607432 e!607435)))

(declare-fun c!107757 () Bool)

(assert (=> b!1065671 (= c!107757 (validKeyInArray!0 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065672 () Bool)

(declare-fun e!607434 () Bool)

(declare-fun contains!6284 (List!22664 (_ BitVec 64)) Bool)

(assert (=> b!1065672 (= e!607434 (contains!6284 Nil!22661 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065673 () Bool)

(assert (=> b!1065673 (= e!607435 call!45048)))

(declare-fun b!1065674 () Bool)

(declare-fun e!607433 () Bool)

(assert (=> b!1065674 (= e!607433 e!607432)))

(declare-fun res!711057 () Bool)

(assert (=> b!1065674 (=> (not res!711057) (not e!607432))))

(assert (=> b!1065674 (= res!711057 (not e!607434))))

(declare-fun res!711059 () Bool)

(assert (=> b!1065674 (=> (not res!711059) (not e!607434))))

(assert (=> b!1065674 (= res!711059 (validKeyInArray!0 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45045 () Bool)

(assert (=> bm!45045 (= call!45048 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107757 (Cons!22660 (select (arr!32549 _keys!1163) #b00000000000000000000000000000000) Nil!22661) Nil!22661)))))

(declare-fun d!129425 () Bool)

(declare-fun res!711058 () Bool)

(assert (=> d!129425 (=> res!711058 e!607433)))

(assert (=> d!129425 (= res!711058 (bvsge #b00000000000000000000000000000000 (size!33086 _keys!1163)))))

(assert (=> d!129425 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22661) e!607433)))

(assert (= (and d!129425 (not res!711058)) b!1065674))

(assert (= (and b!1065674 res!711059) b!1065672))

(assert (= (and b!1065674 res!711057) b!1065671))

(assert (= (and b!1065671 c!107757) b!1065670))

(assert (= (and b!1065671 (not c!107757)) b!1065673))

(assert (= (or b!1065670 b!1065673) bm!45045))

(assert (=> b!1065671 m!984535))

(assert (=> b!1065671 m!984535))

(assert (=> b!1065671 m!984537))

(assert (=> b!1065672 m!984535))

(assert (=> b!1065672 m!984535))

(declare-fun m!984595 () Bool)

(assert (=> b!1065672 m!984595))

(assert (=> b!1065674 m!984535))

(assert (=> b!1065674 m!984535))

(assert (=> b!1065674 m!984537))

(assert (=> bm!45045 m!984535))

(declare-fun m!984597 () Bool)

(assert (=> bm!45045 m!984597))

(assert (=> b!1065551 d!129425))

(declare-fun b!1065681 () Bool)

(declare-fun e!607440 () Bool)

(assert (=> b!1065681 (= e!607440 tp_is_empty!25327)))

(declare-fun mapNonEmpty!39679 () Bool)

(declare-fun mapRes!39679 () Bool)

(declare-fun tp!75998 () Bool)

(assert (=> mapNonEmpty!39679 (= mapRes!39679 (and tp!75998 e!607440))))

(declare-fun mapKey!39679 () (_ BitVec 32))

(declare-fun mapRest!39679 () (Array (_ BitVec 32) ValueCell!11960))

(declare-fun mapValue!39679 () ValueCell!11960)

(assert (=> mapNonEmpty!39679 (= mapRest!39670 (store mapRest!39679 mapKey!39679 mapValue!39679))))

(declare-fun condMapEmpty!39679 () Bool)

(declare-fun mapDefault!39679 () ValueCell!11960)

(assert (=> mapNonEmpty!39670 (= condMapEmpty!39679 (= mapRest!39670 ((as const (Array (_ BitVec 32) ValueCell!11960)) mapDefault!39679)))))

(declare-fun e!607441 () Bool)

(assert (=> mapNonEmpty!39670 (= tp!75983 (and e!607441 mapRes!39679))))

(declare-fun mapIsEmpty!39679 () Bool)

(assert (=> mapIsEmpty!39679 mapRes!39679))

(declare-fun b!1065682 () Bool)

(assert (=> b!1065682 (= e!607441 tp_is_empty!25327)))

(assert (= (and mapNonEmpty!39670 condMapEmpty!39679) mapIsEmpty!39679))

(assert (= (and mapNonEmpty!39670 (not condMapEmpty!39679)) mapNonEmpty!39679))

(assert (= (and mapNonEmpty!39679 ((_ is ValueCellFull!11960) mapValue!39679)) b!1065681))

(assert (= (and mapNonEmpty!39670 ((_ is ValueCellFull!11960) mapDefault!39679)) b!1065682))

(declare-fun m!984599 () Bool)

(assert (=> mapNonEmpty!39679 m!984599))

(declare-fun b_lambda!16519 () Bool)

(assert (= b_lambda!16517 (or (and start!94338 b_free!21517) b_lambda!16519)))

(declare-fun b_lambda!16521 () Bool)

(assert (= b_lambda!16513 (or (and start!94338 b_free!21517) b_lambda!16521)))

(declare-fun b_lambda!16523 () Bool)

(assert (= b_lambda!16515 (or (and start!94338 b_free!21517) b_lambda!16523)))

(declare-fun b_lambda!16525 () Bool)

(assert (= b_lambda!16511 (or (and start!94338 b_free!21517) b_lambda!16525)))

(check-sat (not b!1065634) (not b!1065652) (not b_lambda!16521) (not bm!45042) (not d!129413) (not b!1065608) (not d!129415) (not b_next!21517) (not b!1065657) (not b_lambda!16523) b_and!34281 (not b!1065655) (not b!1065644) (not b!1065640) (not b!1065671) (not bm!45038) (not b!1065643) (not b!1065639) (not b_lambda!16525) (not b!1065648) (not b!1065642) (not b!1065672) (not b!1065653) (not b!1065609) (not b_lambda!16519) (not bm!45041) (not b!1065654) tp_is_empty!25327 (not mapNonEmpty!39679) (not b!1065656) (not b!1065641) (not b!1065674) (not bm!45045) (not d!129417) (not b!1065638) (not b!1065658))
(check-sat b_and!34281 (not b_next!21517))
