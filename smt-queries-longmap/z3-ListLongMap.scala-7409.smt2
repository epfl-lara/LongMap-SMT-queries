; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94248 () Bool)

(assert start!94248)

(declare-fun b_free!21633 () Bool)

(declare-fun b_next!21633 () Bool)

(assert (=> start!94248 (= b_free!21633 (not b_next!21633))))

(declare-fun tp!76337 () Bool)

(declare-fun b_and!34393 () Bool)

(assert (=> start!94248 (= tp!76337 b_and!34393)))

(declare-fun b!1065854 () Bool)

(declare-fun e!607703 () Bool)

(declare-fun tp_is_empty!25443 () Bool)

(assert (=> b!1065854 (= e!607703 tp_is_empty!25443)))

(declare-fun b!1065855 () Bool)

(declare-fun res!711447 () Bool)

(declare-fun e!607697 () Bool)

(assert (=> b!1065855 (=> (not res!711447) (not e!607697))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39059 0))(
  ( (V!39060 (val!12772 Int)) )
))
(declare-datatypes ((ValueCell!12018 0))(
  ( (ValueCellFull!12018 (v!15384 V!39059)) (EmptyCell!12018) )
))
(declare-datatypes ((array!67869 0))(
  ( (array!67870 (arr!32637 (Array (_ BitVec 32) ValueCell!12018)) (size!33173 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67869)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67871 0))(
  ( (array!67872 (arr!32638 (Array (_ BitVec 32) (_ BitVec 64))) (size!33174 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67871)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1065855 (= res!711447 (and (= (size!33173 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33174 _keys!1163) (size!33173 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39850 () Bool)

(declare-fun mapRes!39850 () Bool)

(assert (=> mapIsEmpty!39850 mapRes!39850))

(declare-fun b!1065856 () Bool)

(declare-fun res!711449 () Bool)

(assert (=> b!1065856 (=> (not res!711449) (not e!607697))))

(declare-datatypes ((List!22758 0))(
  ( (Nil!22755) (Cons!22754 (h!23963 (_ BitVec 64)) (t!32077 List!22758)) )
))
(declare-fun arrayNoDuplicates!0 (array!67871 (_ BitVec 32) List!22758) Bool)

(assert (=> b!1065856 (= res!711449 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22755))))

(declare-fun b!1065857 () Bool)

(declare-fun e!607702 () Bool)

(assert (=> b!1065857 (= e!607702 (bvsle #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun b!1065858 () Bool)

(declare-fun res!711446 () Bool)

(assert (=> b!1065858 (=> (not res!711446) (not e!607697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67871 (_ BitVec 32)) Bool)

(assert (=> b!1065858 (= res!711446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065859 () Bool)

(declare-fun e!607700 () Bool)

(assert (=> b!1065859 (= e!607700 (and e!607703 mapRes!39850))))

(declare-fun condMapEmpty!39850 () Bool)

(declare-fun mapDefault!39850 () ValueCell!12018)

(assert (=> b!1065859 (= condMapEmpty!39850 (= (arr!32637 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12018)) mapDefault!39850)))))

(declare-fun b!1065860 () Bool)

(declare-fun e!607698 () Bool)

(assert (=> b!1065860 (= e!607697 (not e!607698))))

(declare-fun res!711445 () Bool)

(assert (=> b!1065860 (=> res!711445 e!607698)))

(assert (=> b!1065860 (= res!711445 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16194 0))(
  ( (tuple2!16195 (_1!8108 (_ BitVec 64)) (_2!8108 V!39059)) )
))
(declare-datatypes ((List!22759 0))(
  ( (Nil!22756) (Cons!22755 (h!23964 tuple2!16194) (t!32078 List!22759)) )
))
(declare-datatypes ((ListLongMap!14163 0))(
  ( (ListLongMap!14164 (toList!7097 List!22759)) )
))
(declare-fun lt!470259 () ListLongMap!14163)

(declare-fun lt!470258 () ListLongMap!14163)

(assert (=> b!1065860 (= lt!470259 lt!470258)))

(declare-fun zeroValueBefore!47 () V!39059)

(declare-fun minValue!907 () V!39059)

(declare-datatypes ((Unit!34987 0))(
  ( (Unit!34988) )
))
(declare-fun lt!470254 () Unit!34987)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39059)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!720 (array!67871 array!67869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39059 V!39059 V!39059 V!39059 (_ BitVec 32) Int) Unit!34987)

(assert (=> b!1065860 (= lt!470254 (lemmaNoChangeToArrayThenSameMapNoExtras!720 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3683 (array!67871 array!67869 (_ BitVec 32) (_ BitVec 32) V!39059 V!39059 (_ BitVec 32) Int) ListLongMap!14163)

(assert (=> b!1065860 (= lt!470258 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065860 (= lt!470259 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065861 () Bool)

(assert (=> b!1065861 (= e!607698 e!607702)))

(declare-fun res!711448 () Bool)

(assert (=> b!1065861 (=> res!711448 e!607702)))

(declare-fun lt!470253 () ListLongMap!14163)

(declare-fun lt!470255 () ListLongMap!14163)

(declare-fun -!611 (ListLongMap!14163 (_ BitVec 64)) ListLongMap!14163)

(assert (=> b!1065861 (= res!711448 (not (= (-!611 lt!470253 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470255)))))

(declare-fun lt!470256 () ListLongMap!14163)

(assert (=> b!1065861 (= (-!611 lt!470256 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470259)))

(declare-fun lt!470257 () Unit!34987)

(declare-fun addThenRemoveForNewKeyIsSame!20 (ListLongMap!14163 (_ BitVec 64) V!39059) Unit!34987)

(assert (=> b!1065861 (= lt!470257 (addThenRemoveForNewKeyIsSame!20 lt!470259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1065861 (and (= lt!470253 lt!470256) (= lt!470255 lt!470258))))

(declare-fun +!3142 (ListLongMap!14163 tuple2!16194) ListLongMap!14163)

(assert (=> b!1065861 (= lt!470256 (+!3142 lt!470259 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4055 (array!67871 array!67869 (_ BitVec 32) (_ BitVec 32) V!39059 V!39059 (_ BitVec 32) Int) ListLongMap!14163)

(assert (=> b!1065861 (= lt!470255 (getCurrentListMap!4055 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065861 (= lt!470253 (getCurrentListMap!4055 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711450 () Bool)

(assert (=> start!94248 (=> (not res!711450) (not e!607697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94248 (= res!711450 (validMask!0 mask!1515))))

(assert (=> start!94248 e!607697))

(assert (=> start!94248 true))

(assert (=> start!94248 tp_is_empty!25443))

(declare-fun array_inv!25270 (array!67869) Bool)

(assert (=> start!94248 (and (array_inv!25270 _values!955) e!607700)))

(assert (=> start!94248 tp!76337))

(declare-fun array_inv!25271 (array!67871) Bool)

(assert (=> start!94248 (array_inv!25271 _keys!1163)))

(declare-fun mapNonEmpty!39850 () Bool)

(declare-fun tp!76336 () Bool)

(declare-fun e!607699 () Bool)

(assert (=> mapNonEmpty!39850 (= mapRes!39850 (and tp!76336 e!607699))))

(declare-fun mapKey!39850 () (_ BitVec 32))

(declare-fun mapValue!39850 () ValueCell!12018)

(declare-fun mapRest!39850 () (Array (_ BitVec 32) ValueCell!12018))

(assert (=> mapNonEmpty!39850 (= (arr!32637 _values!955) (store mapRest!39850 mapKey!39850 mapValue!39850))))

(declare-fun b!1065862 () Bool)

(assert (=> b!1065862 (= e!607699 tp_is_empty!25443)))

(assert (= (and start!94248 res!711450) b!1065855))

(assert (= (and b!1065855 res!711447) b!1065858))

(assert (= (and b!1065858 res!711446) b!1065856))

(assert (= (and b!1065856 res!711449) b!1065860))

(assert (= (and b!1065860 (not res!711445)) b!1065861))

(assert (= (and b!1065861 (not res!711448)) b!1065857))

(assert (= (and b!1065859 condMapEmpty!39850) mapIsEmpty!39850))

(assert (= (and b!1065859 (not condMapEmpty!39850)) mapNonEmpty!39850))

(get-info :version)

(assert (= (and mapNonEmpty!39850 ((_ is ValueCellFull!12018) mapValue!39850)) b!1065862))

(assert (= (and b!1065859 ((_ is ValueCellFull!12018) mapDefault!39850)) b!1065854))

(assert (= start!94248 b!1065859))

(declare-fun m!984409 () Bool)

(assert (=> start!94248 m!984409))

(declare-fun m!984411 () Bool)

(assert (=> start!94248 m!984411))

(declare-fun m!984413 () Bool)

(assert (=> start!94248 m!984413))

(declare-fun m!984415 () Bool)

(assert (=> b!1065861 m!984415))

(declare-fun m!984417 () Bool)

(assert (=> b!1065861 m!984417))

(declare-fun m!984419 () Bool)

(assert (=> b!1065861 m!984419))

(declare-fun m!984421 () Bool)

(assert (=> b!1065861 m!984421))

(declare-fun m!984423 () Bool)

(assert (=> b!1065861 m!984423))

(declare-fun m!984425 () Bool)

(assert (=> b!1065861 m!984425))

(declare-fun m!984427 () Bool)

(assert (=> b!1065856 m!984427))

(declare-fun m!984429 () Bool)

(assert (=> mapNonEmpty!39850 m!984429))

(declare-fun m!984431 () Bool)

(assert (=> b!1065860 m!984431))

(declare-fun m!984433 () Bool)

(assert (=> b!1065860 m!984433))

(declare-fun m!984435 () Bool)

(assert (=> b!1065860 m!984435))

(declare-fun m!984437 () Bool)

(assert (=> b!1065858 m!984437))

(check-sat (not b!1065858) (not b!1065861) (not start!94248) (not b!1065860) (not mapNonEmpty!39850) (not b!1065856) (not b_next!21633) b_and!34393 tp_is_empty!25443)
(check-sat b_and!34393 (not b_next!21633))
(get-model)

(declare-fun d!129019 () Bool)

(declare-fun res!711473 () Bool)

(declare-fun e!607733 () Bool)

(assert (=> d!129019 (=> res!711473 e!607733)))

(assert (=> d!129019 (= res!711473 (bvsge #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(assert (=> d!129019 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!607733)))

(declare-fun b!1065898 () Bool)

(declare-fun e!607732 () Bool)

(assert (=> b!1065898 (= e!607733 e!607732)))

(declare-fun c!107390 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1065898 (= c!107390 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065899 () Bool)

(declare-fun e!607731 () Bool)

(declare-fun call!45015 () Bool)

(assert (=> b!1065899 (= e!607731 call!45015)))

(declare-fun b!1065900 () Bool)

(assert (=> b!1065900 (= e!607732 call!45015)))

(declare-fun bm!45012 () Bool)

(assert (=> bm!45012 (= call!45015 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1065901 () Bool)

(assert (=> b!1065901 (= e!607732 e!607731)))

(declare-fun lt!470287 () (_ BitVec 64))

(assert (=> b!1065901 (= lt!470287 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470288 () Unit!34987)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67871 (_ BitVec 64) (_ BitVec 32)) Unit!34987)

(assert (=> b!1065901 (= lt!470288 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!470287 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1065901 (arrayContainsKey!0 _keys!1163 lt!470287 #b00000000000000000000000000000000)))

(declare-fun lt!470289 () Unit!34987)

(assert (=> b!1065901 (= lt!470289 lt!470288)))

(declare-fun res!711474 () Bool)

(declare-datatypes ((SeekEntryResult!9876 0))(
  ( (MissingZero!9876 (index!41875 (_ BitVec 32))) (Found!9876 (index!41876 (_ BitVec 32))) (Intermediate!9876 (undefined!10688 Bool) (index!41877 (_ BitVec 32)) (x!95422 (_ BitVec 32))) (Undefined!9876) (MissingVacant!9876 (index!41878 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67871 (_ BitVec 32)) SeekEntryResult!9876)

(assert (=> b!1065901 (= res!711474 (= (seekEntryOrOpen!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9876 #b00000000000000000000000000000000)))))

(assert (=> b!1065901 (=> (not res!711474) (not e!607731))))

(assert (= (and d!129019 (not res!711473)) b!1065898))

(assert (= (and b!1065898 c!107390) b!1065901))

(assert (= (and b!1065898 (not c!107390)) b!1065900))

(assert (= (and b!1065901 res!711474) b!1065899))

(assert (= (or b!1065899 b!1065900) bm!45012))

(declare-fun m!984469 () Bool)

(assert (=> b!1065898 m!984469))

(assert (=> b!1065898 m!984469))

(declare-fun m!984471 () Bool)

(assert (=> b!1065898 m!984471))

(declare-fun m!984473 () Bool)

(assert (=> bm!45012 m!984473))

(assert (=> b!1065901 m!984469))

(declare-fun m!984475 () Bool)

(assert (=> b!1065901 m!984475))

(declare-fun m!984477 () Bool)

(assert (=> b!1065901 m!984477))

(assert (=> b!1065901 m!984469))

(declare-fun m!984479 () Bool)

(assert (=> b!1065901 m!984479))

(assert (=> b!1065858 d!129019))

(declare-fun d!129021 () Bool)

(assert (=> d!129021 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!94248 d!129021))

(declare-fun d!129023 () Bool)

(assert (=> d!129023 (= (array_inv!25270 _values!955) (bvsge (size!33173 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!94248 d!129023))

(declare-fun d!129025 () Bool)

(assert (=> d!129025 (= (array_inv!25271 _keys!1163) (bvsge (size!33174 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!94248 d!129025))

(declare-fun b!1065912 () Bool)

(declare-fun e!607745 () Bool)

(declare-fun call!45018 () Bool)

(assert (=> b!1065912 (= e!607745 call!45018)))

(declare-fun b!1065913 () Bool)

(declare-fun e!607743 () Bool)

(assert (=> b!1065913 (= e!607743 e!607745)))

(declare-fun c!107393 () Bool)

(assert (=> b!1065913 (= c!107393 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!45015 () Bool)

(assert (=> bm!45015 (= call!45018 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107393 (Cons!22754 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000) Nil!22755) Nil!22755)))))

(declare-fun b!1065914 () Bool)

(declare-fun e!607742 () Bool)

(declare-fun contains!6268 (List!22758 (_ BitVec 64)) Bool)

(assert (=> b!1065914 (= e!607742 (contains!6268 Nil!22755 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!129027 () Bool)

(declare-fun res!711482 () Bool)

(declare-fun e!607744 () Bool)

(assert (=> d!129027 (=> res!711482 e!607744)))

(assert (=> d!129027 (= res!711482 (bvsge #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(assert (=> d!129027 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22755) e!607744)))

(declare-fun b!1065915 () Bool)

(assert (=> b!1065915 (= e!607745 call!45018)))

(declare-fun b!1065916 () Bool)

(assert (=> b!1065916 (= e!607744 e!607743)))

(declare-fun res!711481 () Bool)

(assert (=> b!1065916 (=> (not res!711481) (not e!607743))))

(assert (=> b!1065916 (= res!711481 (not e!607742))))

(declare-fun res!711483 () Bool)

(assert (=> b!1065916 (=> (not res!711483) (not e!607742))))

(assert (=> b!1065916 (= res!711483 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!129027 (not res!711482)) b!1065916))

(assert (= (and b!1065916 res!711483) b!1065914))

(assert (= (and b!1065916 res!711481) b!1065913))

(assert (= (and b!1065913 c!107393) b!1065915))

(assert (= (and b!1065913 (not c!107393)) b!1065912))

(assert (= (or b!1065915 b!1065912) bm!45015))

(assert (=> b!1065913 m!984469))

(assert (=> b!1065913 m!984469))

(assert (=> b!1065913 m!984471))

(assert (=> bm!45015 m!984469))

(declare-fun m!984481 () Bool)

(assert (=> bm!45015 m!984481))

(assert (=> b!1065914 m!984469))

(assert (=> b!1065914 m!984469))

(declare-fun m!984483 () Bool)

(assert (=> b!1065914 m!984483))

(assert (=> b!1065916 m!984469))

(assert (=> b!1065916 m!984469))

(assert (=> b!1065916 m!984471))

(assert (=> b!1065856 d!129027))

(declare-fun d!129029 () Bool)

(assert (=> d!129029 (= (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470292 () Unit!34987)

(declare-fun choose!1730 (array!67871 array!67869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39059 V!39059 V!39059 V!39059 (_ BitVec 32) Int) Unit!34987)

(assert (=> d!129029 (= lt!470292 (choose!1730 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> d!129029 (validMask!0 mask!1515)))

(assert (=> d!129029 (= (lemmaNoChangeToArrayThenSameMapNoExtras!720 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470292)))

(declare-fun bs!31360 () Bool)

(assert (= bs!31360 d!129029))

(assert (=> bs!31360 m!984435))

(assert (=> bs!31360 m!984433))

(declare-fun m!984485 () Bool)

(assert (=> bs!31360 m!984485))

(assert (=> bs!31360 m!984409))

(assert (=> b!1065860 d!129029))

(declare-fun b!1065941 () Bool)

(declare-fun e!607760 () Bool)

(declare-fun e!607761 () Bool)

(assert (=> b!1065941 (= e!607760 e!607761)))

(declare-fun c!107403 () Bool)

(assert (=> b!1065941 (= c!107403 (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun b!1065942 () Bool)

(declare-fun res!711494 () Bool)

(declare-fun e!607764 () Bool)

(assert (=> b!1065942 (=> (not res!711494) (not e!607764))))

(declare-fun lt!470311 () ListLongMap!14163)

(declare-fun contains!6269 (ListLongMap!14163 (_ BitVec 64)) Bool)

(assert (=> b!1065942 (= res!711494 (not (contains!6269 lt!470311 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1065943 () Bool)

(declare-fun e!607763 () ListLongMap!14163)

(declare-fun e!607762 () ListLongMap!14163)

(assert (=> b!1065943 (= e!607763 e!607762)))

(declare-fun c!107402 () Bool)

(assert (=> b!1065943 (= c!107402 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065944 () Bool)

(declare-fun lt!470312 () Unit!34987)

(declare-fun lt!470310 () Unit!34987)

(assert (=> b!1065944 (= lt!470312 lt!470310)))

(declare-fun lt!470308 () (_ BitVec 64))

(declare-fun lt!470309 () V!39059)

(declare-fun lt!470313 () (_ BitVec 64))

(declare-fun lt!470307 () ListLongMap!14163)

(assert (=> b!1065944 (not (contains!6269 (+!3142 lt!470307 (tuple2!16195 lt!470313 lt!470309)) lt!470308))))

(declare-fun addStillNotContains!251 (ListLongMap!14163 (_ BitVec 64) V!39059 (_ BitVec 64)) Unit!34987)

(assert (=> b!1065944 (= lt!470310 (addStillNotContains!251 lt!470307 lt!470313 lt!470309 lt!470308))))

(assert (=> b!1065944 (= lt!470308 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!17029 (ValueCell!12018 V!39059) V!39059)

(declare-fun dynLambda!2030 (Int (_ BitVec 64)) V!39059)

(assert (=> b!1065944 (= lt!470309 (get!17029 (select (arr!32637 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1065944 (= lt!470313 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45021 () ListLongMap!14163)

(assert (=> b!1065944 (= lt!470307 call!45021)))

(assert (=> b!1065944 (= e!607762 (+!3142 call!45021 (tuple2!16195 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000) (get!17029 (select (arr!32637 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1065945 () Bool)

(declare-fun e!607766 () Bool)

(assert (=> b!1065945 (= e!607766 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065945 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1065946 () Bool)

(declare-fun isEmpty!941 (ListLongMap!14163) Bool)

(assert (=> b!1065946 (= e!607761 (isEmpty!941 lt!470311))))

(declare-fun b!1065947 () Bool)

(assert (=> b!1065947 (= e!607763 (ListLongMap!14164 Nil!22756))))

(declare-fun b!1065948 () Bool)

(assert (=> b!1065948 (= e!607762 call!45021)))

(declare-fun d!129031 () Bool)

(assert (=> d!129031 e!607764))

(declare-fun res!711495 () Bool)

(assert (=> d!129031 (=> (not res!711495) (not e!607764))))

(assert (=> d!129031 (= res!711495 (not (contains!6269 lt!470311 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129031 (= lt!470311 e!607763)))

(declare-fun c!107405 () Bool)

(assert (=> d!129031 (= c!107405 (bvsge #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(assert (=> d!129031 (validMask!0 mask!1515)))

(assert (=> d!129031 (= (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470311)))

(declare-fun bm!45018 () Bool)

(assert (=> bm!45018 (= call!45021 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1065949 () Bool)

(declare-fun e!607765 () Bool)

(assert (=> b!1065949 (= e!607760 e!607765)))

(assert (=> b!1065949 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun res!711492 () Bool)

(assert (=> b!1065949 (= res!711492 (contains!6269 lt!470311 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065949 (=> (not res!711492) (not e!607765))))

(declare-fun b!1065950 () Bool)

(assert (=> b!1065950 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(assert (=> b!1065950 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33173 _values!955)))))

(declare-fun apply!923 (ListLongMap!14163 (_ BitVec 64)) V!39059)

(assert (=> b!1065950 (= e!607765 (= (apply!923 lt!470311 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)) (get!17029 (select (arr!32637 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1065951 () Bool)

(assert (=> b!1065951 (= e!607764 e!607760)))

(declare-fun c!107404 () Bool)

(assert (=> b!1065951 (= c!107404 e!607766)))

(declare-fun res!711493 () Bool)

(assert (=> b!1065951 (=> (not res!711493) (not e!607766))))

(assert (=> b!1065951 (= res!711493 (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun b!1065952 () Bool)

(assert (=> b!1065952 (= e!607761 (= lt!470311 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(assert (= (and d!129031 c!107405) b!1065947))

(assert (= (and d!129031 (not c!107405)) b!1065943))

(assert (= (and b!1065943 c!107402) b!1065944))

(assert (= (and b!1065943 (not c!107402)) b!1065948))

(assert (= (or b!1065944 b!1065948) bm!45018))

(assert (= (and d!129031 res!711495) b!1065942))

(assert (= (and b!1065942 res!711494) b!1065951))

(assert (= (and b!1065951 res!711493) b!1065945))

(assert (= (and b!1065951 c!107404) b!1065949))

(assert (= (and b!1065951 (not c!107404)) b!1065941))

(assert (= (and b!1065949 res!711492) b!1065950))

(assert (= (and b!1065941 c!107403) b!1065952))

(assert (= (and b!1065941 (not c!107403)) b!1065946))

(declare-fun b_lambda!16537 () Bool)

(assert (=> (not b_lambda!16537) (not b!1065944)))

(declare-fun t!32080 () Bool)

(declare-fun tb!7141 () Bool)

(assert (=> (and start!94248 (= defaultEntry!963 defaultEntry!963) t!32080) tb!7141))

(declare-fun result!14731 () Bool)

(assert (=> tb!7141 (= result!14731 tp_is_empty!25443)))

(assert (=> b!1065944 t!32080))

(declare-fun b_and!34397 () Bool)

(assert (= b_and!34393 (and (=> t!32080 result!14731) b_and!34397)))

(declare-fun b_lambda!16539 () Bool)

(assert (=> (not b_lambda!16539) (not b!1065950)))

(assert (=> b!1065950 t!32080))

(declare-fun b_and!34399 () Bool)

(assert (= b_and!34397 (and (=> t!32080 result!14731) b_and!34399)))

(declare-fun m!984487 () Bool)

(assert (=> b!1065946 m!984487))

(assert (=> b!1065949 m!984469))

(assert (=> b!1065949 m!984469))

(declare-fun m!984489 () Bool)

(assert (=> b!1065949 m!984489))

(declare-fun m!984491 () Bool)

(assert (=> b!1065950 m!984491))

(declare-fun m!984493 () Bool)

(assert (=> b!1065950 m!984493))

(assert (=> b!1065950 m!984469))

(assert (=> b!1065950 m!984469))

(declare-fun m!984495 () Bool)

(assert (=> b!1065950 m!984495))

(assert (=> b!1065950 m!984493))

(assert (=> b!1065950 m!984491))

(declare-fun m!984497 () Bool)

(assert (=> b!1065950 m!984497))

(declare-fun m!984499 () Bool)

(assert (=> bm!45018 m!984499))

(assert (=> b!1065943 m!984469))

(assert (=> b!1065943 m!984469))

(assert (=> b!1065943 m!984471))

(assert (=> b!1065952 m!984499))

(assert (=> b!1065945 m!984469))

(assert (=> b!1065945 m!984469))

(assert (=> b!1065945 m!984471))

(declare-fun m!984501 () Bool)

(assert (=> b!1065944 m!984501))

(declare-fun m!984503 () Bool)

(assert (=> b!1065944 m!984503))

(assert (=> b!1065944 m!984491))

(assert (=> b!1065944 m!984503))

(declare-fun m!984505 () Bool)

(assert (=> b!1065944 m!984505))

(assert (=> b!1065944 m!984493))

(assert (=> b!1065944 m!984469))

(declare-fun m!984507 () Bool)

(assert (=> b!1065944 m!984507))

(assert (=> b!1065944 m!984493))

(assert (=> b!1065944 m!984491))

(assert (=> b!1065944 m!984497))

(declare-fun m!984509 () Bool)

(assert (=> b!1065942 m!984509))

(declare-fun m!984511 () Bool)

(assert (=> d!129031 m!984511))

(assert (=> d!129031 m!984409))

(assert (=> b!1065860 d!129031))

(declare-fun b!1065955 () Bool)

(declare-fun e!607767 () Bool)

(declare-fun e!607768 () Bool)

(assert (=> b!1065955 (= e!607767 e!607768)))

(declare-fun c!107407 () Bool)

(assert (=> b!1065955 (= c!107407 (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun b!1065956 () Bool)

(declare-fun res!711498 () Bool)

(declare-fun e!607771 () Bool)

(assert (=> b!1065956 (=> (not res!711498) (not e!607771))))

(declare-fun lt!470318 () ListLongMap!14163)

(assert (=> b!1065956 (= res!711498 (not (contains!6269 lt!470318 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1065957 () Bool)

(declare-fun e!607770 () ListLongMap!14163)

(declare-fun e!607769 () ListLongMap!14163)

(assert (=> b!1065957 (= e!607770 e!607769)))

(declare-fun c!107406 () Bool)

(assert (=> b!1065957 (= c!107406 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1065958 () Bool)

(declare-fun lt!470319 () Unit!34987)

(declare-fun lt!470317 () Unit!34987)

(assert (=> b!1065958 (= lt!470319 lt!470317)))

(declare-fun lt!470320 () (_ BitVec 64))

(declare-fun lt!470314 () ListLongMap!14163)

(declare-fun lt!470315 () (_ BitVec 64))

(declare-fun lt!470316 () V!39059)

(assert (=> b!1065958 (not (contains!6269 (+!3142 lt!470314 (tuple2!16195 lt!470320 lt!470316)) lt!470315))))

(assert (=> b!1065958 (= lt!470317 (addStillNotContains!251 lt!470314 lt!470320 lt!470316 lt!470315))))

(assert (=> b!1065958 (= lt!470315 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1065958 (= lt!470316 (get!17029 (select (arr!32637 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1065958 (= lt!470320 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun call!45022 () ListLongMap!14163)

(assert (=> b!1065958 (= lt!470314 call!45022)))

(assert (=> b!1065958 (= e!607769 (+!3142 call!45022 (tuple2!16195 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000) (get!17029 (select (arr!32637 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1065959 () Bool)

(declare-fun e!607773 () Bool)

(assert (=> b!1065959 (= e!607773 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065959 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1065960 () Bool)

(assert (=> b!1065960 (= e!607768 (isEmpty!941 lt!470318))))

(declare-fun b!1065961 () Bool)

(assert (=> b!1065961 (= e!607770 (ListLongMap!14164 Nil!22756))))

(declare-fun b!1065962 () Bool)

(assert (=> b!1065962 (= e!607769 call!45022)))

(declare-fun d!129033 () Bool)

(assert (=> d!129033 e!607771))

(declare-fun res!711499 () Bool)

(assert (=> d!129033 (=> (not res!711499) (not e!607771))))

(assert (=> d!129033 (= res!711499 (not (contains!6269 lt!470318 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129033 (= lt!470318 e!607770)))

(declare-fun c!107409 () Bool)

(assert (=> d!129033 (= c!107409 (bvsge #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(assert (=> d!129033 (validMask!0 mask!1515)))

(assert (=> d!129033 (= (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470318)))

(declare-fun bm!45019 () Bool)

(assert (=> bm!45019 (= call!45022 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963))))

(declare-fun b!1065963 () Bool)

(declare-fun e!607772 () Bool)

(assert (=> b!1065963 (= e!607767 e!607772)))

(assert (=> b!1065963 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun res!711496 () Bool)

(assert (=> b!1065963 (= res!711496 (contains!6269 lt!470318 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1065963 (=> (not res!711496) (not e!607772))))

(declare-fun b!1065964 () Bool)

(assert (=> b!1065964 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(assert (=> b!1065964 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33173 _values!955)))))

(assert (=> b!1065964 (= e!607772 (= (apply!923 lt!470318 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)) (get!17029 (select (arr!32637 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1065965 () Bool)

(assert (=> b!1065965 (= e!607771 e!607767)))

(declare-fun c!107408 () Bool)

(assert (=> b!1065965 (= c!107408 e!607773)))

(declare-fun res!711497 () Bool)

(assert (=> b!1065965 (=> (not res!711497) (not e!607773))))

(assert (=> b!1065965 (= res!711497 (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun b!1065966 () Bool)

(assert (=> b!1065966 (= e!607768 (= lt!470318 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!963)))))

(assert (= (and d!129033 c!107409) b!1065961))

(assert (= (and d!129033 (not c!107409)) b!1065957))

(assert (= (and b!1065957 c!107406) b!1065958))

(assert (= (and b!1065957 (not c!107406)) b!1065962))

(assert (= (or b!1065958 b!1065962) bm!45019))

(assert (= (and d!129033 res!711499) b!1065956))

(assert (= (and b!1065956 res!711498) b!1065965))

(assert (= (and b!1065965 res!711497) b!1065959))

(assert (= (and b!1065965 c!107408) b!1065963))

(assert (= (and b!1065965 (not c!107408)) b!1065955))

(assert (= (and b!1065963 res!711496) b!1065964))

(assert (= (and b!1065955 c!107407) b!1065966))

(assert (= (and b!1065955 (not c!107407)) b!1065960))

(declare-fun b_lambda!16541 () Bool)

(assert (=> (not b_lambda!16541) (not b!1065958)))

(assert (=> b!1065958 t!32080))

(declare-fun b_and!34401 () Bool)

(assert (= b_and!34399 (and (=> t!32080 result!14731) b_and!34401)))

(declare-fun b_lambda!16543 () Bool)

(assert (=> (not b_lambda!16543) (not b!1065964)))

(assert (=> b!1065964 t!32080))

(declare-fun b_and!34403 () Bool)

(assert (= b_and!34401 (and (=> t!32080 result!14731) b_and!34403)))

(declare-fun m!984513 () Bool)

(assert (=> b!1065960 m!984513))

(assert (=> b!1065963 m!984469))

(assert (=> b!1065963 m!984469))

(declare-fun m!984515 () Bool)

(assert (=> b!1065963 m!984515))

(assert (=> b!1065964 m!984491))

(assert (=> b!1065964 m!984493))

(assert (=> b!1065964 m!984469))

(assert (=> b!1065964 m!984469))

(declare-fun m!984517 () Bool)

(assert (=> b!1065964 m!984517))

(assert (=> b!1065964 m!984493))

(assert (=> b!1065964 m!984491))

(assert (=> b!1065964 m!984497))

(declare-fun m!984519 () Bool)

(assert (=> bm!45019 m!984519))

(assert (=> b!1065957 m!984469))

(assert (=> b!1065957 m!984469))

(assert (=> b!1065957 m!984471))

(assert (=> b!1065966 m!984519))

(assert (=> b!1065959 m!984469))

(assert (=> b!1065959 m!984469))

(assert (=> b!1065959 m!984471))

(declare-fun m!984521 () Bool)

(assert (=> b!1065958 m!984521))

(declare-fun m!984523 () Bool)

(assert (=> b!1065958 m!984523))

(assert (=> b!1065958 m!984491))

(assert (=> b!1065958 m!984523))

(declare-fun m!984525 () Bool)

(assert (=> b!1065958 m!984525))

(assert (=> b!1065958 m!984493))

(assert (=> b!1065958 m!984469))

(declare-fun m!984527 () Bool)

(assert (=> b!1065958 m!984527))

(assert (=> b!1065958 m!984493))

(assert (=> b!1065958 m!984491))

(assert (=> b!1065958 m!984497))

(declare-fun m!984529 () Bool)

(assert (=> b!1065956 m!984529))

(declare-fun m!984531 () Bool)

(assert (=> d!129033 m!984531))

(assert (=> d!129033 m!984409))

(assert (=> b!1065860 d!129033))

(declare-fun d!129035 () Bool)

(assert (=> d!129035 (= (-!611 (+!3142 lt!470259 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!470259)))

(declare-fun lt!470323 () Unit!34987)

(declare-fun choose!1731 (ListLongMap!14163 (_ BitVec 64) V!39059) Unit!34987)

(assert (=> d!129035 (= lt!470323 (choose!1731 lt!470259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> d!129035 (not (contains!6269 lt!470259 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129035 (= (addThenRemoveForNewKeyIsSame!20 lt!470259 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) lt!470323)))

(declare-fun bs!31361 () Bool)

(assert (= bs!31361 d!129035))

(assert (=> bs!31361 m!984415))

(assert (=> bs!31361 m!984415))

(declare-fun m!984533 () Bool)

(assert (=> bs!31361 m!984533))

(declare-fun m!984535 () Bool)

(assert (=> bs!31361 m!984535))

(declare-fun m!984537 () Bool)

(assert (=> bs!31361 m!984537))

(assert (=> b!1065861 d!129035))

(declare-fun b!1066009 () Bool)

(declare-fun e!607812 () Bool)

(declare-fun e!607805 () Bool)

(assert (=> b!1066009 (= e!607812 e!607805)))

(declare-fun c!107427 () Bool)

(assert (=> b!1066009 (= c!107427 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1066010 () Bool)

(declare-fun e!607804 () Bool)

(declare-fun lt!470374 () ListLongMap!14163)

(assert (=> b!1066010 (= e!607804 (= (apply!923 lt!470374 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1066011 () Bool)

(declare-fun e!607803 () Unit!34987)

(declare-fun Unit!34989 () Unit!34987)

(assert (=> b!1066011 (= e!607803 Unit!34989)))

(declare-fun b!1066012 () Bool)

(declare-fun lt!470368 () Unit!34987)

(assert (=> b!1066012 (= e!607803 lt!470368)))

(declare-fun lt!470382 () ListLongMap!14163)

(assert (=> b!1066012 (= lt!470382 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470372 () (_ BitVec 64))

(assert (=> b!1066012 (= lt!470372 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470384 () (_ BitVec 64))

(assert (=> b!1066012 (= lt!470384 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470385 () Unit!34987)

(declare-fun addStillContains!639 (ListLongMap!14163 (_ BitVec 64) V!39059 (_ BitVec 64)) Unit!34987)

(assert (=> b!1066012 (= lt!470385 (addStillContains!639 lt!470382 lt!470372 zeroValueAfter!47 lt!470384))))

(assert (=> b!1066012 (contains!6269 (+!3142 lt!470382 (tuple2!16195 lt!470372 zeroValueAfter!47)) lt!470384)))

(declare-fun lt!470373 () Unit!34987)

(assert (=> b!1066012 (= lt!470373 lt!470385)))

(declare-fun lt!470388 () ListLongMap!14163)

(assert (=> b!1066012 (= lt!470388 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470379 () (_ BitVec 64))

(assert (=> b!1066012 (= lt!470379 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470376 () (_ BitVec 64))

(assert (=> b!1066012 (= lt!470376 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470371 () Unit!34987)

(declare-fun addApplyDifferent!499 (ListLongMap!14163 (_ BitVec 64) V!39059 (_ BitVec 64)) Unit!34987)

(assert (=> b!1066012 (= lt!470371 (addApplyDifferent!499 lt!470388 lt!470379 minValue!907 lt!470376))))

(assert (=> b!1066012 (= (apply!923 (+!3142 lt!470388 (tuple2!16195 lt!470379 minValue!907)) lt!470376) (apply!923 lt!470388 lt!470376))))

(declare-fun lt!470386 () Unit!34987)

(assert (=> b!1066012 (= lt!470386 lt!470371)))

(declare-fun lt!470381 () ListLongMap!14163)

(assert (=> b!1066012 (= lt!470381 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470389 () (_ BitVec 64))

(assert (=> b!1066012 (= lt!470389 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470380 () (_ BitVec 64))

(assert (=> b!1066012 (= lt!470380 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470387 () Unit!34987)

(assert (=> b!1066012 (= lt!470387 (addApplyDifferent!499 lt!470381 lt!470389 zeroValueAfter!47 lt!470380))))

(assert (=> b!1066012 (= (apply!923 (+!3142 lt!470381 (tuple2!16195 lt!470389 zeroValueAfter!47)) lt!470380) (apply!923 lt!470381 lt!470380))))

(declare-fun lt!470375 () Unit!34987)

(assert (=> b!1066012 (= lt!470375 lt!470387)))

(declare-fun lt!470377 () ListLongMap!14163)

(assert (=> b!1066012 (= lt!470377 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470369 () (_ BitVec 64))

(assert (=> b!1066012 (= lt!470369 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470383 () (_ BitVec 64))

(assert (=> b!1066012 (= lt!470383 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1066012 (= lt!470368 (addApplyDifferent!499 lt!470377 lt!470369 minValue!907 lt!470383))))

(assert (=> b!1066012 (= (apply!923 (+!3142 lt!470377 (tuple2!16195 lt!470369 minValue!907)) lt!470383) (apply!923 lt!470377 lt!470383))))

(declare-fun b!1066013 () Bool)

(declare-fun res!711524 () Bool)

(assert (=> b!1066013 (=> (not res!711524) (not e!607812))))

(declare-fun e!607811 () Bool)

(assert (=> b!1066013 (= res!711524 e!607811)))

(declare-fun res!711519 () Bool)

(assert (=> b!1066013 (=> res!711519 e!607811)))

(declare-fun e!607809 () Bool)

(assert (=> b!1066013 (= res!711519 (not e!607809))))

(declare-fun res!711523 () Bool)

(assert (=> b!1066013 (=> (not res!711523) (not e!607809))))

(assert (=> b!1066013 (= res!711523 (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun bm!45034 () Bool)

(declare-fun call!45038 () ListLongMap!14163)

(declare-fun call!45043 () ListLongMap!14163)

(assert (=> bm!45034 (= call!45038 call!45043)))

(declare-fun b!1066014 () Bool)

(declare-fun e!607808 () Bool)

(assert (=> b!1066014 (= e!607808 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066015 () Bool)

(declare-fun e!607802 () ListLongMap!14163)

(declare-fun e!607807 () ListLongMap!14163)

(assert (=> b!1066015 (= e!607802 e!607807)))

(declare-fun c!107422 () Bool)

(assert (=> b!1066015 (= c!107422 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45035 () Bool)

(declare-fun call!45037 () ListLongMap!14163)

(assert (=> bm!45035 (= call!45037 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45036 () Bool)

(declare-fun call!45039 () Bool)

(assert (=> bm!45036 (= call!45039 (contains!6269 lt!470374 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1066016 () Bool)

(declare-fun e!607801 () Bool)

(declare-fun e!607800 () Bool)

(assert (=> b!1066016 (= e!607801 e!607800)))

(declare-fun res!711526 () Bool)

(declare-fun call!45042 () Bool)

(assert (=> b!1066016 (= res!711526 call!45042)))

(assert (=> b!1066016 (=> (not res!711526) (not e!607800))))

(declare-fun b!1066017 () Bool)

(declare-fun res!711520 () Bool)

(assert (=> b!1066017 (=> (not res!711520) (not e!607812))))

(assert (=> b!1066017 (= res!711520 e!607801)))

(declare-fun c!107425 () Bool)

(assert (=> b!1066017 (= c!107425 (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45037 () Bool)

(assert (=> bm!45037 (= call!45042 (contains!6269 lt!470374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!129037 () Bool)

(assert (=> d!129037 e!607812))

(declare-fun res!711522 () Bool)

(assert (=> d!129037 (=> (not res!711522) (not e!607812))))

(assert (=> d!129037 (= res!711522 (or (bvsge #b00000000000000000000000000000000 (size!33174 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))))

(declare-fun lt!470370 () ListLongMap!14163)

(assert (=> d!129037 (= lt!470374 lt!470370)))

(declare-fun lt!470378 () Unit!34987)

(assert (=> d!129037 (= lt!470378 e!607803)))

(declare-fun c!107424 () Bool)

(assert (=> d!129037 (= c!107424 e!607808)))

(declare-fun res!711525 () Bool)

(assert (=> d!129037 (=> (not res!711525) (not e!607808))))

(assert (=> d!129037 (= res!711525 (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(assert (=> d!129037 (= lt!470370 e!607802)))

(declare-fun c!107426 () Bool)

(assert (=> d!129037 (= c!107426 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129037 (validMask!0 mask!1515)))

(assert (=> d!129037 (= (getCurrentListMap!4055 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470374)))

(declare-fun b!1066018 () Bool)

(assert (=> b!1066018 (= e!607805 (not call!45039))))

(declare-fun b!1066019 () Bool)

(declare-fun e!607806 () ListLongMap!14163)

(assert (=> b!1066019 (= e!607806 call!45038)))

(declare-fun b!1066020 () Bool)

(assert (=> b!1066020 (= e!607809 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066021 () Bool)

(declare-fun c!107423 () Bool)

(assert (=> b!1066021 (= c!107423 (and (not (= (bvand extraKeysAfter!68 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066021 (= e!607807 e!607806)))

(declare-fun b!1066022 () Bool)

(assert (=> b!1066022 (= e!607800 (= (apply!923 lt!470374 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!47))))

(declare-fun bm!45038 () Bool)

(declare-fun call!45040 () ListLongMap!14163)

(declare-fun call!45041 () ListLongMap!14163)

(assert (=> bm!45038 (= call!45040 call!45041)))

(declare-fun b!1066023 () Bool)

(assert (=> b!1066023 (= e!607806 call!45040)))

(declare-fun b!1066024 () Bool)

(assert (=> b!1066024 (= e!607805 e!607804)))

(declare-fun res!711518 () Bool)

(assert (=> b!1066024 (= res!711518 call!45039)))

(assert (=> b!1066024 (=> (not res!711518) (not e!607804))))

(declare-fun e!607810 () Bool)

(declare-fun b!1066025 () Bool)

(assert (=> b!1066025 (= e!607810 (= (apply!923 lt!470374 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)) (get!17029 (select (arr!32637 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1066025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33173 _values!955)))))

(assert (=> b!1066025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun b!1066026 () Bool)

(assert (=> b!1066026 (= e!607811 e!607810)))

(declare-fun res!711521 () Bool)

(assert (=> b!1066026 (=> (not res!711521) (not e!607810))))

(assert (=> b!1066026 (= res!711521 (contains!6269 lt!470374 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun bm!45039 () Bool)

(assert (=> bm!45039 (= call!45041 call!45037)))

(declare-fun b!1066027 () Bool)

(assert (=> b!1066027 (= e!607801 (not call!45042))))

(declare-fun bm!45040 () Bool)

(assert (=> bm!45040 (= call!45043 (+!3142 (ite c!107426 call!45037 (ite c!107422 call!45041 call!45040)) (ite (or c!107426 c!107422) (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!47) (tuple2!16195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1066028 () Bool)

(assert (=> b!1066028 (= e!607802 (+!3142 call!45043 (tuple2!16195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1066029 () Bool)

(assert (=> b!1066029 (= e!607807 call!45038)))

(assert (= (and d!129037 c!107426) b!1066028))

(assert (= (and d!129037 (not c!107426)) b!1066015))

(assert (= (and b!1066015 c!107422) b!1066029))

(assert (= (and b!1066015 (not c!107422)) b!1066021))

(assert (= (and b!1066021 c!107423) b!1066019))

(assert (= (and b!1066021 (not c!107423)) b!1066023))

(assert (= (or b!1066019 b!1066023) bm!45038))

(assert (= (or b!1066029 bm!45038) bm!45039))

(assert (= (or b!1066029 b!1066019) bm!45034))

(assert (= (or b!1066028 bm!45039) bm!45035))

(assert (= (or b!1066028 bm!45034) bm!45040))

(assert (= (and d!129037 res!711525) b!1066014))

(assert (= (and d!129037 c!107424) b!1066012))

(assert (= (and d!129037 (not c!107424)) b!1066011))

(assert (= (and d!129037 res!711522) b!1066013))

(assert (= (and b!1066013 res!711523) b!1066020))

(assert (= (and b!1066013 (not res!711519)) b!1066026))

(assert (= (and b!1066026 res!711521) b!1066025))

(assert (= (and b!1066013 res!711524) b!1066017))

(assert (= (and b!1066017 c!107425) b!1066016))

(assert (= (and b!1066017 (not c!107425)) b!1066027))

(assert (= (and b!1066016 res!711526) b!1066022))

(assert (= (or b!1066016 b!1066027) bm!45037))

(assert (= (and b!1066017 res!711520) b!1066009))

(assert (= (and b!1066009 c!107427) b!1066024))

(assert (= (and b!1066009 (not c!107427)) b!1066018))

(assert (= (and b!1066024 res!711518) b!1066010))

(assert (= (or b!1066024 b!1066018) bm!45036))

(declare-fun b_lambda!16545 () Bool)

(assert (=> (not b_lambda!16545) (not b!1066025)))

(assert (=> b!1066025 t!32080))

(declare-fun b_and!34405 () Bool)

(assert (= b_and!34403 (and (=> t!32080 result!14731) b_and!34405)))

(assert (=> b!1066014 m!984469))

(assert (=> b!1066014 m!984469))

(assert (=> b!1066014 m!984471))

(declare-fun m!984539 () Bool)

(assert (=> bm!45040 m!984539))

(declare-fun m!984541 () Bool)

(assert (=> b!1066010 m!984541))

(assert (=> d!129037 m!984409))

(assert (=> b!1066020 m!984469))

(assert (=> b!1066020 m!984469))

(assert (=> b!1066020 m!984471))

(declare-fun m!984543 () Bool)

(assert (=> b!1066012 m!984543))

(declare-fun m!984545 () Bool)

(assert (=> b!1066012 m!984545))

(declare-fun m!984547 () Bool)

(assert (=> b!1066012 m!984547))

(declare-fun m!984549 () Bool)

(assert (=> b!1066012 m!984549))

(assert (=> b!1066012 m!984433))

(declare-fun m!984551 () Bool)

(assert (=> b!1066012 m!984551))

(declare-fun m!984553 () Bool)

(assert (=> b!1066012 m!984553))

(declare-fun m!984555 () Bool)

(assert (=> b!1066012 m!984555))

(declare-fun m!984557 () Bool)

(assert (=> b!1066012 m!984557))

(assert (=> b!1066012 m!984469))

(declare-fun m!984559 () Bool)

(assert (=> b!1066012 m!984559))

(declare-fun m!984561 () Bool)

(assert (=> b!1066012 m!984561))

(declare-fun m!984563 () Bool)

(assert (=> b!1066012 m!984563))

(assert (=> b!1066012 m!984543))

(declare-fun m!984565 () Bool)

(assert (=> b!1066012 m!984565))

(assert (=> b!1066012 m!984559))

(assert (=> b!1066012 m!984551))

(declare-fun m!984567 () Bool)

(assert (=> b!1066012 m!984567))

(assert (=> b!1066012 m!984563))

(declare-fun m!984569 () Bool)

(assert (=> b!1066012 m!984569))

(declare-fun m!984571 () Bool)

(assert (=> b!1066012 m!984571))

(declare-fun m!984573 () Bool)

(assert (=> b!1066022 m!984573))

(declare-fun m!984575 () Bool)

(assert (=> bm!45036 m!984575))

(assert (=> b!1066026 m!984469))

(assert (=> b!1066026 m!984469))

(declare-fun m!984577 () Bool)

(assert (=> b!1066026 m!984577))

(declare-fun m!984579 () Bool)

(assert (=> b!1066028 m!984579))

(assert (=> b!1066025 m!984469))

(declare-fun m!984581 () Bool)

(assert (=> b!1066025 m!984581))

(assert (=> b!1066025 m!984493))

(assert (=> b!1066025 m!984491))

(assert (=> b!1066025 m!984497))

(assert (=> b!1066025 m!984493))

(assert (=> b!1066025 m!984491))

(assert (=> b!1066025 m!984469))

(declare-fun m!984583 () Bool)

(assert (=> bm!45037 m!984583))

(assert (=> bm!45035 m!984433))

(assert (=> b!1065861 d!129037))

(declare-fun b!1066030 () Bool)

(declare-fun e!607825 () Bool)

(declare-fun e!607818 () Bool)

(assert (=> b!1066030 (= e!607825 e!607818)))

(declare-fun c!107433 () Bool)

(assert (=> b!1066030 (= c!107433 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1066031 () Bool)

(declare-fun e!607817 () Bool)

(declare-fun lt!470396 () ListLongMap!14163)

(assert (=> b!1066031 (= e!607817 (= (apply!923 lt!470396 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!907))))

(declare-fun b!1066032 () Bool)

(declare-fun e!607816 () Unit!34987)

(declare-fun Unit!34990 () Unit!34987)

(assert (=> b!1066032 (= e!607816 Unit!34990)))

(declare-fun b!1066033 () Bool)

(declare-fun lt!470390 () Unit!34987)

(assert (=> b!1066033 (= e!607816 lt!470390)))

(declare-fun lt!470404 () ListLongMap!14163)

(assert (=> b!1066033 (= lt!470404 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470394 () (_ BitVec 64))

(assert (=> b!1066033 (= lt!470394 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470406 () (_ BitVec 64))

(assert (=> b!1066033 (= lt!470406 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470407 () Unit!34987)

(assert (=> b!1066033 (= lt!470407 (addStillContains!639 lt!470404 lt!470394 zeroValueBefore!47 lt!470406))))

(assert (=> b!1066033 (contains!6269 (+!3142 lt!470404 (tuple2!16195 lt!470394 zeroValueBefore!47)) lt!470406)))

(declare-fun lt!470395 () Unit!34987)

(assert (=> b!1066033 (= lt!470395 lt!470407)))

(declare-fun lt!470410 () ListLongMap!14163)

(assert (=> b!1066033 (= lt!470410 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470401 () (_ BitVec 64))

(assert (=> b!1066033 (= lt!470401 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470398 () (_ BitVec 64))

(assert (=> b!1066033 (= lt!470398 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470393 () Unit!34987)

(assert (=> b!1066033 (= lt!470393 (addApplyDifferent!499 lt!470410 lt!470401 minValue!907 lt!470398))))

(assert (=> b!1066033 (= (apply!923 (+!3142 lt!470410 (tuple2!16195 lt!470401 minValue!907)) lt!470398) (apply!923 lt!470410 lt!470398))))

(declare-fun lt!470408 () Unit!34987)

(assert (=> b!1066033 (= lt!470408 lt!470393)))

(declare-fun lt!470403 () ListLongMap!14163)

(assert (=> b!1066033 (= lt!470403 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470411 () (_ BitVec 64))

(assert (=> b!1066033 (= lt!470411 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470402 () (_ BitVec 64))

(assert (=> b!1066033 (= lt!470402 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(declare-fun lt!470409 () Unit!34987)

(assert (=> b!1066033 (= lt!470409 (addApplyDifferent!499 lt!470403 lt!470411 zeroValueBefore!47 lt!470402))))

(assert (=> b!1066033 (= (apply!923 (+!3142 lt!470403 (tuple2!16195 lt!470411 zeroValueBefore!47)) lt!470402) (apply!923 lt!470403 lt!470402))))

(declare-fun lt!470397 () Unit!34987)

(assert (=> b!1066033 (= lt!470397 lt!470409)))

(declare-fun lt!470399 () ListLongMap!14163)

(assert (=> b!1066033 (= lt!470399 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!470391 () (_ BitVec 64))

(assert (=> b!1066033 (= lt!470391 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!470405 () (_ BitVec 64))

(assert (=> b!1066033 (= lt!470405 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> b!1066033 (= lt!470390 (addApplyDifferent!499 lt!470399 lt!470391 minValue!907 lt!470405))))

(assert (=> b!1066033 (= (apply!923 (+!3142 lt!470399 (tuple2!16195 lt!470391 minValue!907)) lt!470405) (apply!923 lt!470399 lt!470405))))

(declare-fun b!1066034 () Bool)

(declare-fun res!711533 () Bool)

(assert (=> b!1066034 (=> (not res!711533) (not e!607825))))

(declare-fun e!607824 () Bool)

(assert (=> b!1066034 (= res!711533 e!607824)))

(declare-fun res!711528 () Bool)

(assert (=> b!1066034 (=> res!711528 e!607824)))

(declare-fun e!607822 () Bool)

(assert (=> b!1066034 (= res!711528 (not e!607822))))

(declare-fun res!711532 () Bool)

(assert (=> b!1066034 (=> (not res!711532) (not e!607822))))

(assert (=> b!1066034 (= res!711532 (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun bm!45041 () Bool)

(declare-fun call!45045 () ListLongMap!14163)

(declare-fun call!45050 () ListLongMap!14163)

(assert (=> bm!45041 (= call!45045 call!45050)))

(declare-fun b!1066035 () Bool)

(declare-fun e!607821 () Bool)

(assert (=> b!1066035 (= e!607821 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066036 () Bool)

(declare-fun e!607815 () ListLongMap!14163)

(declare-fun e!607820 () ListLongMap!14163)

(assert (=> b!1066036 (= e!607815 e!607820)))

(declare-fun c!107428 () Bool)

(assert (=> b!1066036 (= c!107428 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!45042 () Bool)

(declare-fun call!45044 () ListLongMap!14163)

(assert (=> bm!45042 (= call!45044 (getCurrentListMapNoExtraKeys!3683 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun bm!45043 () Bool)

(declare-fun call!45046 () Bool)

(assert (=> bm!45043 (= call!45046 (contains!6269 lt!470396 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1066037 () Bool)

(declare-fun e!607814 () Bool)

(declare-fun e!607813 () Bool)

(assert (=> b!1066037 (= e!607814 e!607813)))

(declare-fun res!711535 () Bool)

(declare-fun call!45049 () Bool)

(assert (=> b!1066037 (= res!711535 call!45049)))

(assert (=> b!1066037 (=> (not res!711535) (not e!607813))))

(declare-fun b!1066038 () Bool)

(declare-fun res!711529 () Bool)

(assert (=> b!1066038 (=> (not res!711529) (not e!607825))))

(assert (=> b!1066038 (= res!711529 e!607814)))

(declare-fun c!107431 () Bool)

(assert (=> b!1066038 (= c!107431 (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!45044 () Bool)

(assert (=> bm!45044 (= call!45049 (contains!6269 lt!470396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!129039 () Bool)

(assert (=> d!129039 e!607825))

(declare-fun res!711531 () Bool)

(assert (=> d!129039 (=> (not res!711531) (not e!607825))))

(assert (=> d!129039 (= res!711531 (or (bvsge #b00000000000000000000000000000000 (size!33174 _keys!1163)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))))

(declare-fun lt!470392 () ListLongMap!14163)

(assert (=> d!129039 (= lt!470396 lt!470392)))

(declare-fun lt!470400 () Unit!34987)

(assert (=> d!129039 (= lt!470400 e!607816)))

(declare-fun c!107430 () Bool)

(assert (=> d!129039 (= c!107430 e!607821)))

(declare-fun res!711534 () Bool)

(assert (=> d!129039 (=> (not res!711534) (not e!607821))))

(assert (=> d!129039 (= res!711534 (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(assert (=> d!129039 (= lt!470392 e!607815)))

(declare-fun c!107432 () Bool)

(assert (=> d!129039 (= c!107432 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!129039 (validMask!0 mask!1515)))

(assert (=> d!129039 (= (getCurrentListMap!4055 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!470396)))

(declare-fun b!1066039 () Bool)

(assert (=> b!1066039 (= e!607818 (not call!45046))))

(declare-fun b!1066040 () Bool)

(declare-fun e!607819 () ListLongMap!14163)

(assert (=> b!1066040 (= e!607819 call!45045)))

(declare-fun b!1066041 () Bool)

(assert (=> b!1066041 (= e!607822 (validKeyInArray!0 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1066042 () Bool)

(declare-fun c!107429 () Bool)

(assert (=> b!1066042 (= c!107429 (and (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1066042 (= e!607820 e!607819)))

(declare-fun b!1066043 () Bool)

(assert (=> b!1066043 (= e!607813 (= (apply!923 lt!470396 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!47))))

(declare-fun bm!45045 () Bool)

(declare-fun call!45047 () ListLongMap!14163)

(declare-fun call!45048 () ListLongMap!14163)

(assert (=> bm!45045 (= call!45047 call!45048)))

(declare-fun b!1066044 () Bool)

(assert (=> b!1066044 (= e!607819 call!45047)))

(declare-fun b!1066045 () Bool)

(assert (=> b!1066045 (= e!607818 e!607817)))

(declare-fun res!711527 () Bool)

(assert (=> b!1066045 (= res!711527 call!45046)))

(assert (=> b!1066045 (=> (not res!711527) (not e!607817))))

(declare-fun e!607823 () Bool)

(declare-fun b!1066046 () Bool)

(assert (=> b!1066046 (= e!607823 (= (apply!923 lt!470396 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)) (get!17029 (select (arr!32637 _values!955) #b00000000000000000000000000000000) (dynLambda!2030 defaultEntry!963 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1066046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33173 _values!955)))))

(assert (=> b!1066046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun b!1066047 () Bool)

(assert (=> b!1066047 (= e!607824 e!607823)))

(declare-fun res!711530 () Bool)

(assert (=> b!1066047 (=> (not res!711530) (not e!607823))))

(assert (=> b!1066047 (= res!711530 (contains!6269 lt!470396 (select (arr!32638 _keys!1163) #b00000000000000000000000000000000)))))

(assert (=> b!1066047 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!33174 _keys!1163)))))

(declare-fun bm!45046 () Bool)

(assert (=> bm!45046 (= call!45048 call!45044)))

(declare-fun b!1066048 () Bool)

(assert (=> b!1066048 (= e!607814 (not call!45049))))

(declare-fun bm!45047 () Bool)

(assert (=> bm!45047 (= call!45050 (+!3142 (ite c!107432 call!45044 (ite c!107428 call!45048 call!45047)) (ite (or c!107432 c!107428) (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47) (tuple2!16195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))))

(declare-fun b!1066049 () Bool)

(assert (=> b!1066049 (= e!607815 (+!3142 call!45050 (tuple2!16195 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907)))))

(declare-fun b!1066050 () Bool)

(assert (=> b!1066050 (= e!607820 call!45045)))

(assert (= (and d!129039 c!107432) b!1066049))

(assert (= (and d!129039 (not c!107432)) b!1066036))

(assert (= (and b!1066036 c!107428) b!1066050))

(assert (= (and b!1066036 (not c!107428)) b!1066042))

(assert (= (and b!1066042 c!107429) b!1066040))

(assert (= (and b!1066042 (not c!107429)) b!1066044))

(assert (= (or b!1066040 b!1066044) bm!45045))

(assert (= (or b!1066050 bm!45045) bm!45046))

(assert (= (or b!1066050 b!1066040) bm!45041))

(assert (= (or b!1066049 bm!45046) bm!45042))

(assert (= (or b!1066049 bm!45041) bm!45047))

(assert (= (and d!129039 res!711534) b!1066035))

(assert (= (and d!129039 c!107430) b!1066033))

(assert (= (and d!129039 (not c!107430)) b!1066032))

(assert (= (and d!129039 res!711531) b!1066034))

(assert (= (and b!1066034 res!711532) b!1066041))

(assert (= (and b!1066034 (not res!711528)) b!1066047))

(assert (= (and b!1066047 res!711530) b!1066046))

(assert (= (and b!1066034 res!711533) b!1066038))

(assert (= (and b!1066038 c!107431) b!1066037))

(assert (= (and b!1066038 (not c!107431)) b!1066048))

(assert (= (and b!1066037 res!711535) b!1066043))

(assert (= (or b!1066037 b!1066048) bm!45044))

(assert (= (and b!1066038 res!711529) b!1066030))

(assert (= (and b!1066030 c!107433) b!1066045))

(assert (= (and b!1066030 (not c!107433)) b!1066039))

(assert (= (and b!1066045 res!711527) b!1066031))

(assert (= (or b!1066045 b!1066039) bm!45043))

(declare-fun b_lambda!16547 () Bool)

(assert (=> (not b_lambda!16547) (not b!1066046)))

(assert (=> b!1066046 t!32080))

(declare-fun b_and!34407 () Bool)

(assert (= b_and!34405 (and (=> t!32080 result!14731) b_and!34407)))

(assert (=> b!1066035 m!984469))

(assert (=> b!1066035 m!984469))

(assert (=> b!1066035 m!984471))

(declare-fun m!984585 () Bool)

(assert (=> bm!45047 m!984585))

(declare-fun m!984587 () Bool)

(assert (=> b!1066031 m!984587))

(assert (=> d!129039 m!984409))

(assert (=> b!1066041 m!984469))

(assert (=> b!1066041 m!984469))

(assert (=> b!1066041 m!984471))

(declare-fun m!984589 () Bool)

(assert (=> b!1066033 m!984589))

(declare-fun m!984591 () Bool)

(assert (=> b!1066033 m!984591))

(declare-fun m!984593 () Bool)

(assert (=> b!1066033 m!984593))

(declare-fun m!984595 () Bool)

(assert (=> b!1066033 m!984595))

(assert (=> b!1066033 m!984435))

(declare-fun m!984597 () Bool)

(assert (=> b!1066033 m!984597))

(declare-fun m!984599 () Bool)

(assert (=> b!1066033 m!984599))

(declare-fun m!984601 () Bool)

(assert (=> b!1066033 m!984601))

(declare-fun m!984603 () Bool)

(assert (=> b!1066033 m!984603))

(assert (=> b!1066033 m!984469))

(declare-fun m!984605 () Bool)

(assert (=> b!1066033 m!984605))

(declare-fun m!984607 () Bool)

(assert (=> b!1066033 m!984607))

(declare-fun m!984609 () Bool)

(assert (=> b!1066033 m!984609))

(assert (=> b!1066033 m!984589))

(declare-fun m!984611 () Bool)

(assert (=> b!1066033 m!984611))

(assert (=> b!1066033 m!984605))

(assert (=> b!1066033 m!984597))

(declare-fun m!984613 () Bool)

(assert (=> b!1066033 m!984613))

(assert (=> b!1066033 m!984609))

(declare-fun m!984615 () Bool)

(assert (=> b!1066033 m!984615))

(declare-fun m!984617 () Bool)

(assert (=> b!1066033 m!984617))

(declare-fun m!984619 () Bool)

(assert (=> b!1066043 m!984619))

(declare-fun m!984621 () Bool)

(assert (=> bm!45043 m!984621))

(assert (=> b!1066047 m!984469))

(assert (=> b!1066047 m!984469))

(declare-fun m!984623 () Bool)

(assert (=> b!1066047 m!984623))

(declare-fun m!984625 () Bool)

(assert (=> b!1066049 m!984625))

(assert (=> b!1066046 m!984469))

(declare-fun m!984627 () Bool)

(assert (=> b!1066046 m!984627))

(assert (=> b!1066046 m!984493))

(assert (=> b!1066046 m!984491))

(assert (=> b!1066046 m!984497))

(assert (=> b!1066046 m!984493))

(assert (=> b!1066046 m!984491))

(assert (=> b!1066046 m!984469))

(declare-fun m!984629 () Bool)

(assert (=> bm!45044 m!984629))

(assert (=> bm!45042 m!984435))

(assert (=> b!1065861 d!129039))

(declare-fun d!129041 () Bool)

(declare-fun e!607828 () Bool)

(assert (=> d!129041 e!607828))

(declare-fun res!711540 () Bool)

(assert (=> d!129041 (=> (not res!711540) (not e!607828))))

(declare-fun lt!470423 () ListLongMap!14163)

(assert (=> d!129041 (= res!711540 (contains!6269 lt!470423 (_1!8108 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!470422 () List!22759)

(assert (=> d!129041 (= lt!470423 (ListLongMap!14164 lt!470422))))

(declare-fun lt!470420 () Unit!34987)

(declare-fun lt!470421 () Unit!34987)

(assert (=> d!129041 (= lt!470420 lt!470421)))

(declare-datatypes ((Option!650 0))(
  ( (Some!649 (v!15386 V!39059)) (None!648) )
))
(declare-fun getValueByKey!599 (List!22759 (_ BitVec 64)) Option!650)

(assert (=> d!129041 (= (getValueByKey!599 lt!470422 (_1!8108 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!649 (_2!8108 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lemmaContainsTupThenGetReturnValue!282 (List!22759 (_ BitVec 64) V!39059) Unit!34987)

(assert (=> d!129041 (= lt!470421 (lemmaContainsTupThenGetReturnValue!282 lt!470422 (_1!8108 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8108 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun insertStrictlySorted!375 (List!22759 (_ BitVec 64) V!39059) List!22759)

(assert (=> d!129041 (= lt!470422 (insertStrictlySorted!375 (toList!7097 lt!470259) (_1!8108 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) (_2!8108 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(assert (=> d!129041 (= (+!3142 lt!470259 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)) lt!470423)))

(declare-fun b!1066055 () Bool)

(declare-fun res!711541 () Bool)

(assert (=> b!1066055 (=> (not res!711541) (not e!607828))))

(assert (=> b!1066055 (= res!711541 (= (getValueByKey!599 (toList!7097 lt!470423) (_1!8108 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))) (Some!649 (_2!8108 (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))))

(declare-fun b!1066056 () Bool)

(declare-fun contains!6270 (List!22759 tuple2!16194) Bool)

(assert (=> b!1066056 (= e!607828 (contains!6270 (toList!7097 lt!470423) (tuple2!16195 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(assert (= (and d!129041 res!711540) b!1066055))

(assert (= (and b!1066055 res!711541) b!1066056))

(declare-fun m!984631 () Bool)

(assert (=> d!129041 m!984631))

(declare-fun m!984633 () Bool)

(assert (=> d!129041 m!984633))

(declare-fun m!984635 () Bool)

(assert (=> d!129041 m!984635))

(declare-fun m!984637 () Bool)

(assert (=> d!129041 m!984637))

(declare-fun m!984639 () Bool)

(assert (=> b!1066055 m!984639))

(declare-fun m!984641 () Bool)

(assert (=> b!1066056 m!984641))

(assert (=> b!1065861 d!129041))

(declare-fun d!129043 () Bool)

(declare-fun lt!470426 () ListLongMap!14163)

(assert (=> d!129043 (not (contains!6269 lt!470426 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!69 (List!22759 (_ BitVec 64)) List!22759)

(assert (=> d!129043 (= lt!470426 (ListLongMap!14164 (removeStrictlySorted!69 (toList!7097 lt!470256) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129043 (= (-!611 lt!470256 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470426)))

(declare-fun bs!31362 () Bool)

(assert (= bs!31362 d!129043))

(declare-fun m!984643 () Bool)

(assert (=> bs!31362 m!984643))

(declare-fun m!984645 () Bool)

(assert (=> bs!31362 m!984645))

(assert (=> b!1065861 d!129043))

(declare-fun d!129045 () Bool)

(declare-fun lt!470427 () ListLongMap!14163)

(assert (=> d!129045 (not (contains!6269 lt!470427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!129045 (= lt!470427 (ListLongMap!14164 (removeStrictlySorted!69 (toList!7097 lt!470253) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!129045 (= (-!611 lt!470253 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470427)))

(declare-fun bs!31363 () Bool)

(assert (= bs!31363 d!129045))

(declare-fun m!984647 () Bool)

(assert (=> bs!31363 m!984647))

(declare-fun m!984649 () Bool)

(assert (=> bs!31363 m!984649))

(assert (=> b!1065861 d!129045))

(declare-fun condMapEmpty!39856 () Bool)

(declare-fun mapDefault!39856 () ValueCell!12018)

(assert (=> mapNonEmpty!39850 (= condMapEmpty!39856 (= mapRest!39850 ((as const (Array (_ BitVec 32) ValueCell!12018)) mapDefault!39856)))))

(declare-fun e!607833 () Bool)

(declare-fun mapRes!39856 () Bool)

(assert (=> mapNonEmpty!39850 (= tp!76336 (and e!607833 mapRes!39856))))

(declare-fun b!1066063 () Bool)

(declare-fun e!607834 () Bool)

(assert (=> b!1066063 (= e!607834 tp_is_empty!25443)))

(declare-fun mapIsEmpty!39856 () Bool)

(assert (=> mapIsEmpty!39856 mapRes!39856))

(declare-fun b!1066064 () Bool)

(assert (=> b!1066064 (= e!607833 tp_is_empty!25443)))

(declare-fun mapNonEmpty!39856 () Bool)

(declare-fun tp!76346 () Bool)

(assert (=> mapNonEmpty!39856 (= mapRes!39856 (and tp!76346 e!607834))))

(declare-fun mapRest!39856 () (Array (_ BitVec 32) ValueCell!12018))

(declare-fun mapValue!39856 () ValueCell!12018)

(declare-fun mapKey!39856 () (_ BitVec 32))

(assert (=> mapNonEmpty!39856 (= mapRest!39850 (store mapRest!39856 mapKey!39856 mapValue!39856))))

(assert (= (and mapNonEmpty!39850 condMapEmpty!39856) mapIsEmpty!39856))

(assert (= (and mapNonEmpty!39850 (not condMapEmpty!39856)) mapNonEmpty!39856))

(assert (= (and mapNonEmpty!39856 ((_ is ValueCellFull!12018) mapValue!39856)) b!1066063))

(assert (= (and mapNonEmpty!39850 ((_ is ValueCellFull!12018) mapDefault!39856)) b!1066064))

(declare-fun m!984651 () Bool)

(assert (=> mapNonEmpty!39856 m!984651))

(declare-fun b_lambda!16549 () Bool)

(assert (= b_lambda!16539 (or (and start!94248 b_free!21633) b_lambda!16549)))

(declare-fun b_lambda!16551 () Bool)

(assert (= b_lambda!16545 (or (and start!94248 b_free!21633) b_lambda!16551)))

(declare-fun b_lambda!16553 () Bool)

(assert (= b_lambda!16547 (or (and start!94248 b_free!21633) b_lambda!16553)))

(declare-fun b_lambda!16555 () Bool)

(assert (= b_lambda!16543 (or (and start!94248 b_free!21633) b_lambda!16555)))

(declare-fun b_lambda!16557 () Bool)

(assert (= b_lambda!16537 (or (and start!94248 b_free!21633) b_lambda!16557)))

(declare-fun b_lambda!16559 () Bool)

(assert (= b_lambda!16541 (or (and start!94248 b_free!21633) b_lambda!16559)))

(check-sat (not b!1066020) (not b!1065944) (not b!1066047) (not d!129031) (not bm!45040) (not bm!45042) (not d!129037) (not d!129035) (not b!1065945) (not b!1065952) (not d!129029) (not b!1065956) (not b!1066056) (not bm!45012) (not b!1065960) (not b!1066010) (not b!1066012) (not b!1065949) (not b!1065958) (not b!1066049) (not b!1065898) (not b!1065914) (not d!129033) (not b!1066025) (not b_lambda!16551) (not b!1065943) (not b!1066031) (not bm!45047) (not b!1066035) (not b!1065901) b_and!34407 (not b_lambda!16557) (not b!1065942) (not d!129045) (not bm!45044) (not b!1066028) (not d!129043) (not b!1065913) (not mapNonEmpty!39856) (not d!129041) (not bm!45019) (not bm!45018) (not bm!45015) (not b_lambda!16549) (not b_lambda!16559) (not b!1066055) (not b!1066026) (not bm!45035) (not bm!45037) (not b!1065916) (not b!1066041) (not d!129039) (not b!1066022) (not b_next!21633) (not b!1066043) (not b!1066046) (not b!1065959) (not b!1066033) (not b!1065966) (not b_lambda!16553) (not b!1065950) (not bm!45043) (not b!1065946) (not b!1065964) (not b!1066014) tp_is_empty!25443 (not bm!45036) (not b!1065957) (not b!1065963) (not b_lambda!16555))
(check-sat b_and!34407 (not b_next!21633))
