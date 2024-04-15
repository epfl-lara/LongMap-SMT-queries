; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94762 () Bool)

(assert start!94762)

(declare-fun b_free!22021 () Bool)

(declare-fun b_next!22021 () Bool)

(assert (=> start!94762 (= b_free!22021 (not b_next!22021))))

(declare-fun tp!77522 () Bool)

(declare-fun b_and!34825 () Bool)

(assert (=> start!94762 (= tp!77522 b_and!34825)))

(declare-fun b!1071435 () Bool)

(declare-fun e!611816 () Bool)

(declare-fun tp_is_empty!25831 () Bool)

(assert (=> b!1071435 (= e!611816 tp_is_empty!25831)))

(declare-fun b!1071436 () Bool)

(declare-fun res!714775 () Bool)

(declare-fun e!611820 () Bool)

(assert (=> b!1071436 (=> (not res!714775) (not e!611820))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39577 0))(
  ( (V!39578 (val!12966 Int)) )
))
(declare-datatypes ((ValueCell!12212 0))(
  ( (ValueCellFull!12212 (v!15581 V!39577)) (EmptyCell!12212) )
))
(declare-datatypes ((array!68572 0))(
  ( (array!68573 (arr!32982 (Array (_ BitVec 32) ValueCell!12212)) (size!33520 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68572)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68574 0))(
  ( (array!68575 (arr!32983 (Array (_ BitVec 32) (_ BitVec 64))) (size!33521 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68574)

(assert (=> b!1071436 (= res!714775 (and (= (size!33520 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33521 _keys!1163) (size!33520 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!714772 () Bool)

(assert (=> start!94762 (=> (not res!714772) (not e!611820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94762 (= res!714772 (validMask!0 mask!1515))))

(assert (=> start!94762 e!611820))

(assert (=> start!94762 true))

(assert (=> start!94762 tp_is_empty!25831))

(declare-fun e!611821 () Bool)

(declare-fun array_inv!25516 (array!68572) Bool)

(assert (=> start!94762 (and (array_inv!25516 _values!955) e!611821)))

(assert (=> start!94762 tp!77522))

(declare-fun array_inv!25517 (array!68574) Bool)

(assert (=> start!94762 (array_inv!25517 _keys!1163)))

(declare-fun b!1071437 () Bool)

(declare-fun res!714771 () Bool)

(assert (=> b!1071437 (=> (not res!714771) (not e!611820))))

(declare-datatypes ((List!23080 0))(
  ( (Nil!23077) (Cons!23076 (h!24285 (_ BitVec 64)) (t!32404 List!23080)) )
))
(declare-fun arrayNoDuplicates!0 (array!68574 (_ BitVec 32) List!23080) Bool)

(assert (=> b!1071437 (= res!714771 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23077))))

(declare-fun b!1071438 () Bool)

(declare-fun res!714773 () Bool)

(assert (=> b!1071438 (=> (not res!714773) (not e!611820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68574 (_ BitVec 32)) Bool)

(assert (=> b!1071438 (= res!714773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40453 () Bool)

(declare-fun mapRes!40453 () Bool)

(assert (=> mapIsEmpty!40453 mapRes!40453))

(declare-fun mapNonEmpty!40453 () Bool)

(declare-fun tp!77521 () Bool)

(declare-fun e!611822 () Bool)

(assert (=> mapNonEmpty!40453 (= mapRes!40453 (and tp!77521 e!611822))))

(declare-fun mapKey!40453 () (_ BitVec 32))

(declare-fun mapRest!40453 () (Array (_ BitVec 32) ValueCell!12212))

(declare-fun mapValue!40453 () ValueCell!12212)

(assert (=> mapNonEmpty!40453 (= (arr!32982 _values!955) (store mapRest!40453 mapKey!40453 mapValue!40453))))

(declare-fun b!1071439 () Bool)

(declare-fun e!611818 () Bool)

(assert (=> b!1071439 (= e!611818 true)))

(declare-datatypes ((tuple2!16554 0))(
  ( (tuple2!16555 (_1!8288 (_ BitVec 64)) (_2!8288 V!39577)) )
))
(declare-datatypes ((List!23081 0))(
  ( (Nil!23078) (Cons!23077 (h!24286 tuple2!16554) (t!32405 List!23081)) )
))
(declare-datatypes ((ListLongMap!14523 0))(
  ( (ListLongMap!14524 (toList!7277 List!23081)) )
))
(declare-fun lt!474096 () ListLongMap!14523)

(declare-fun lt!474098 () ListLongMap!14523)

(declare-fun -!671 (ListLongMap!14523 (_ BitVec 64)) ListLongMap!14523)

(assert (=> b!1071439 (= lt!474096 (-!671 lt!474098 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474095 () ListLongMap!14523)

(declare-fun lt!474102 () ListLongMap!14523)

(assert (=> b!1071439 (= lt!474095 lt!474102)))

(declare-fun zeroValueBefore!47 () V!39577)

(declare-datatypes ((Unit!35133 0))(
  ( (Unit!35134) )
))
(declare-fun lt!474099 () Unit!35133)

(declare-fun lt!474093 () ListLongMap!14523)

(declare-fun minValue!907 () V!39577)

(declare-fun addCommutativeForDiffKeys!729 (ListLongMap!14523 (_ BitVec 64) V!39577 (_ BitVec 64) V!39577) Unit!35133)

(assert (=> b!1071439 (= lt!474099 (addCommutativeForDiffKeys!729 lt!474093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474094 () ListLongMap!14523)

(assert (=> b!1071439 (= (-!671 lt!474102 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474094)))

(declare-fun lt!474105 () tuple2!16554)

(declare-fun +!3211 (ListLongMap!14523 tuple2!16554) ListLongMap!14523)

(assert (=> b!1071439 (= lt!474102 (+!3211 lt!474094 lt!474105))))

(declare-fun lt!474103 () Unit!35133)

(declare-fun addThenRemoveForNewKeyIsSame!52 (ListLongMap!14523 (_ BitVec 64) V!39577) Unit!35133)

(assert (=> b!1071439 (= lt!474103 (addThenRemoveForNewKeyIsSame!52 lt!474094 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474097 () tuple2!16554)

(assert (=> b!1071439 (= lt!474094 (+!3211 lt!474093 lt!474097))))

(declare-fun e!611819 () Bool)

(assert (=> b!1071439 e!611819))

(declare-fun res!714770 () Bool)

(assert (=> b!1071439 (=> (not res!714770) (not e!611819))))

(assert (=> b!1071439 (= res!714770 (= lt!474098 lt!474095))))

(assert (=> b!1071439 (= lt!474095 (+!3211 (+!3211 lt!474093 lt!474105) lt!474097))))

(assert (=> b!1071439 (= lt!474097 (tuple2!16555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071439 (= lt!474105 (tuple2!16555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474101 () ListLongMap!14523)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39577)

(declare-fun getCurrentListMap!4084 (array!68574 array!68572 (_ BitVec 32) (_ BitVec 32) V!39577 V!39577 (_ BitVec 32) Int) ListLongMap!14523)

(assert (=> b!1071439 (= lt!474101 (getCurrentListMap!4084 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071439 (= lt!474098 (getCurrentListMap!4084 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071440 () Bool)

(assert (=> b!1071440 (= e!611821 (and e!611816 mapRes!40453))))

(declare-fun condMapEmpty!40453 () Bool)

(declare-fun mapDefault!40453 () ValueCell!12212)

(assert (=> b!1071440 (= condMapEmpty!40453 (= (arr!32982 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12212)) mapDefault!40453)))))

(declare-fun lt!474104 () ListLongMap!14523)

(declare-fun b!1071441 () Bool)

(assert (=> b!1071441 (= e!611819 (= lt!474101 (+!3211 lt!474104 lt!474097)))))

(declare-fun b!1071442 () Bool)

(assert (=> b!1071442 (= e!611820 (not e!611818))))

(declare-fun res!714774 () Bool)

(assert (=> b!1071442 (=> res!714774 e!611818)))

(assert (=> b!1071442 (= res!714774 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071442 (= lt!474093 lt!474104)))

(declare-fun lt!474100 () Unit!35133)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!855 (array!68574 array!68572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39577 V!39577 V!39577 V!39577 (_ BitVec 32) Int) Unit!35133)

(assert (=> b!1071442 (= lt!474100 (lemmaNoChangeToArrayThenSameMapNoExtras!855 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3861 (array!68574 array!68572 (_ BitVec 32) (_ BitVec 32) V!39577 V!39577 (_ BitVec 32) Int) ListLongMap!14523)

(assert (=> b!1071442 (= lt!474104 (getCurrentListMapNoExtraKeys!3861 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071442 (= lt!474093 (getCurrentListMapNoExtraKeys!3861 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071443 () Bool)

(assert (=> b!1071443 (= e!611822 tp_is_empty!25831)))

(assert (= (and start!94762 res!714772) b!1071436))

(assert (= (and b!1071436 res!714775) b!1071438))

(assert (= (and b!1071438 res!714773) b!1071437))

(assert (= (and b!1071437 res!714771) b!1071442))

(assert (= (and b!1071442 (not res!714774)) b!1071439))

(assert (= (and b!1071439 res!714770) b!1071441))

(assert (= (and b!1071440 condMapEmpty!40453) mapIsEmpty!40453))

(assert (= (and b!1071440 (not condMapEmpty!40453)) mapNonEmpty!40453))

(get-info :version)

(assert (= (and mapNonEmpty!40453 ((_ is ValueCellFull!12212) mapValue!40453)) b!1071443))

(assert (= (and b!1071440 ((_ is ValueCellFull!12212) mapDefault!40453)) b!1071435))

(assert (= start!94762 b!1071440))

(declare-fun m!989543 () Bool)

(assert (=> b!1071442 m!989543))

(declare-fun m!989545 () Bool)

(assert (=> b!1071442 m!989545))

(declare-fun m!989547 () Bool)

(assert (=> b!1071442 m!989547))

(declare-fun m!989549 () Bool)

(assert (=> b!1071437 m!989549))

(declare-fun m!989551 () Bool)

(assert (=> b!1071439 m!989551))

(declare-fun m!989553 () Bool)

(assert (=> b!1071439 m!989553))

(declare-fun m!989555 () Bool)

(assert (=> b!1071439 m!989555))

(declare-fun m!989557 () Bool)

(assert (=> b!1071439 m!989557))

(declare-fun m!989559 () Bool)

(assert (=> b!1071439 m!989559))

(declare-fun m!989561 () Bool)

(assert (=> b!1071439 m!989561))

(declare-fun m!989563 () Bool)

(assert (=> b!1071439 m!989563))

(assert (=> b!1071439 m!989561))

(declare-fun m!989565 () Bool)

(assert (=> b!1071439 m!989565))

(declare-fun m!989567 () Bool)

(assert (=> b!1071439 m!989567))

(declare-fun m!989569 () Bool)

(assert (=> b!1071439 m!989569))

(declare-fun m!989571 () Bool)

(assert (=> mapNonEmpty!40453 m!989571))

(declare-fun m!989573 () Bool)

(assert (=> start!94762 m!989573))

(declare-fun m!989575 () Bool)

(assert (=> start!94762 m!989575))

(declare-fun m!989577 () Bool)

(assert (=> start!94762 m!989577))

(declare-fun m!989579 () Bool)

(assert (=> b!1071441 m!989579))

(declare-fun m!989581 () Bool)

(assert (=> b!1071438 m!989581))

(check-sat tp_is_empty!25831 b_and!34825 (not start!94762) (not b!1071437) (not b!1071442) (not b!1071438) (not b!1071439) (not b!1071441) (not mapNonEmpty!40453) (not b_next!22021))
(check-sat b_and!34825 (not b_next!22021))
