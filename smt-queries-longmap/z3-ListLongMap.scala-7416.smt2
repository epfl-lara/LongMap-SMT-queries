; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94312 () Bool)

(assert start!94312)

(declare-fun b_free!21675 () Bool)

(declare-fun b_next!21675 () Bool)

(assert (=> start!94312 (= b_free!21675 (not b_next!21675))))

(declare-fun tp!76465 () Bool)

(declare-fun b_and!34447 () Bool)

(assert (=> start!94312 (= tp!76465 b_and!34447)))

(declare-fun b!1066537 () Bool)

(declare-fun e!608194 () Bool)

(declare-fun e!608191 () Bool)

(assert (=> b!1066537 (= e!608194 (not e!608191))))

(declare-fun res!711840 () Bool)

(assert (=> b!1066537 (=> res!711840 e!608191)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066537 (= res!711840 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39115 0))(
  ( (V!39116 (val!12793 Int)) )
))
(declare-datatypes ((tuple2!16226 0))(
  ( (tuple2!16227 (_1!8124 (_ BitVec 64)) (_2!8124 V!39115)) )
))
(declare-datatypes ((List!22789 0))(
  ( (Nil!22786) (Cons!22785 (h!23994 tuple2!16226) (t!32110 List!22789)) )
))
(declare-datatypes ((ListLongMap!14195 0))(
  ( (ListLongMap!14196 (toList!7113 List!22789)) )
))
(declare-fun lt!470906 () ListLongMap!14195)

(declare-fun lt!470905 () ListLongMap!14195)

(assert (=> b!1066537 (= lt!470906 lt!470905)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39115)

(declare-datatypes ((ValueCell!12039 0))(
  ( (ValueCellFull!12039 (v!15406 V!39115)) (EmptyCell!12039) )
))
(declare-datatypes ((array!67955 0))(
  ( (array!67956 (arr!32679 (Array (_ BitVec 32) ValueCell!12039)) (size!33215 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67955)

(declare-fun minValue!907 () V!39115)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39115)

(declare-datatypes ((Unit!35021 0))(
  ( (Unit!35022) )
))
(declare-fun lt!470900 () Unit!35021)

(declare-datatypes ((array!67957 0))(
  ( (array!67958 (arr!32680 (Array (_ BitVec 32) (_ BitVec 64))) (size!33216 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67957)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!735 (array!67957 array!67955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39115 V!39115 V!39115 V!39115 (_ BitVec 32) Int) Unit!35021)

(assert (=> b!1066537 (= lt!470900 (lemmaNoChangeToArrayThenSameMapNoExtras!735 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3698 (array!67957 array!67955 (_ BitVec 32) (_ BitVec 32) V!39115 V!39115 (_ BitVec 32) Int) ListLongMap!14195)

(assert (=> b!1066537 (= lt!470905 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066537 (= lt!470906 (getCurrentListMapNoExtraKeys!3698 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39916 () Bool)

(declare-fun mapRes!39916 () Bool)

(declare-fun tp!76466 () Bool)

(declare-fun e!608192 () Bool)

(assert (=> mapNonEmpty!39916 (= mapRes!39916 (and tp!76466 e!608192))))

(declare-fun mapRest!39916 () (Array (_ BitVec 32) ValueCell!12039))

(declare-fun mapKey!39916 () (_ BitVec 32))

(declare-fun mapValue!39916 () ValueCell!12039)

(assert (=> mapNonEmpty!39916 (= (arr!32679 _values!955) (store mapRest!39916 mapKey!39916 mapValue!39916))))

(declare-fun b!1066538 () Bool)

(declare-fun e!608189 () Bool)

(declare-fun tp_is_empty!25485 () Bool)

(assert (=> b!1066538 (= e!608189 tp_is_empty!25485)))

(declare-fun b!1066539 () Bool)

(declare-fun res!711837 () Bool)

(assert (=> b!1066539 (=> (not res!711837) (not e!608194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67957 (_ BitVec 32)) Bool)

(assert (=> b!1066539 (= res!711837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066540 () Bool)

(assert (=> b!1066540 (= e!608192 tp_is_empty!25485)))

(declare-fun mapIsEmpty!39916 () Bool)

(assert (=> mapIsEmpty!39916 mapRes!39916))

(declare-fun b!1066541 () Bool)

(assert (=> b!1066541 (= e!608191 true)))

(declare-fun lt!470902 () ListLongMap!14195)

(declare-fun lt!470901 () ListLongMap!14195)

(declare-fun -!623 (ListLongMap!14195 (_ BitVec 64)) ListLongMap!14195)

(assert (=> b!1066541 (= lt!470902 (-!623 lt!470901 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470907 () ListLongMap!14195)

(assert (=> b!1066541 (= (-!623 lt!470907 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470906)))

(declare-fun lt!470903 () Unit!35021)

(declare-fun addThenRemoveForNewKeyIsSame!32 (ListLongMap!14195 (_ BitVec 64) V!39115) Unit!35021)

(assert (=> b!1066541 (= lt!470903 (addThenRemoveForNewKeyIsSame!32 lt!470906 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470904 () ListLongMap!14195)

(assert (=> b!1066541 (and (= lt!470901 lt!470907) (= lt!470904 lt!470905))))

(declare-fun +!3154 (ListLongMap!14195 tuple2!16226) ListLongMap!14195)

(assert (=> b!1066541 (= lt!470907 (+!3154 lt!470906 (tuple2!16227 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4067 (array!67957 array!67955 (_ BitVec 32) (_ BitVec 32) V!39115 V!39115 (_ BitVec 32) Int) ListLongMap!14195)

(assert (=> b!1066541 (= lt!470904 (getCurrentListMap!4067 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066541 (= lt!470901 (getCurrentListMap!4067 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711841 () Bool)

(assert (=> start!94312 (=> (not res!711841) (not e!608194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94312 (= res!711841 (validMask!0 mask!1515))))

(assert (=> start!94312 e!608194))

(assert (=> start!94312 true))

(assert (=> start!94312 tp_is_empty!25485))

(declare-fun e!608190 () Bool)

(declare-fun array_inv!25302 (array!67955) Bool)

(assert (=> start!94312 (and (array_inv!25302 _values!955) e!608190)))

(assert (=> start!94312 tp!76465))

(declare-fun array_inv!25303 (array!67957) Bool)

(assert (=> start!94312 (array_inv!25303 _keys!1163)))

(declare-fun b!1066542 () Bool)

(assert (=> b!1066542 (= e!608190 (and e!608189 mapRes!39916))))

(declare-fun condMapEmpty!39916 () Bool)

(declare-fun mapDefault!39916 () ValueCell!12039)

(assert (=> b!1066542 (= condMapEmpty!39916 (= (arr!32679 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12039)) mapDefault!39916)))))

(declare-fun b!1066543 () Bool)

(declare-fun res!711839 () Bool)

(assert (=> b!1066543 (=> (not res!711839) (not e!608194))))

(declare-datatypes ((List!22790 0))(
  ( (Nil!22787) (Cons!22786 (h!23995 (_ BitVec 64)) (t!32111 List!22790)) )
))
(declare-fun arrayNoDuplicates!0 (array!67957 (_ BitVec 32) List!22790) Bool)

(assert (=> b!1066543 (= res!711839 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22787))))

(declare-fun b!1066544 () Bool)

(declare-fun res!711838 () Bool)

(assert (=> b!1066544 (=> (not res!711838) (not e!608194))))

(assert (=> b!1066544 (= res!711838 (and (= (size!33215 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33216 _keys!1163) (size!33215 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94312 res!711841) b!1066544))

(assert (= (and b!1066544 res!711838) b!1066539))

(assert (= (and b!1066539 res!711837) b!1066543))

(assert (= (and b!1066543 res!711839) b!1066537))

(assert (= (and b!1066537 (not res!711840)) b!1066541))

(assert (= (and b!1066542 condMapEmpty!39916) mapIsEmpty!39916))

(assert (= (and b!1066542 (not condMapEmpty!39916)) mapNonEmpty!39916))

(get-info :version)

(assert (= (and mapNonEmpty!39916 ((_ is ValueCellFull!12039) mapValue!39916)) b!1066540))

(assert (= (and b!1066542 ((_ is ValueCellFull!12039) mapDefault!39916)) b!1066538))

(assert (= start!94312 b!1066542))

(declare-fun m!985223 () Bool)

(assert (=> b!1066537 m!985223))

(declare-fun m!985225 () Bool)

(assert (=> b!1066537 m!985225))

(declare-fun m!985227 () Bool)

(assert (=> b!1066537 m!985227))

(declare-fun m!985229 () Bool)

(assert (=> b!1066539 m!985229))

(declare-fun m!985231 () Bool)

(assert (=> b!1066541 m!985231))

(declare-fun m!985233 () Bool)

(assert (=> b!1066541 m!985233))

(declare-fun m!985235 () Bool)

(assert (=> b!1066541 m!985235))

(declare-fun m!985237 () Bool)

(assert (=> b!1066541 m!985237))

(declare-fun m!985239 () Bool)

(assert (=> b!1066541 m!985239))

(declare-fun m!985241 () Bool)

(assert (=> b!1066541 m!985241))

(declare-fun m!985243 () Bool)

(assert (=> mapNonEmpty!39916 m!985243))

(declare-fun m!985245 () Bool)

(assert (=> start!94312 m!985245))

(declare-fun m!985247 () Bool)

(assert (=> start!94312 m!985247))

(declare-fun m!985249 () Bool)

(assert (=> start!94312 m!985249))

(declare-fun m!985251 () Bool)

(assert (=> b!1066543 m!985251))

(check-sat (not b_next!21675) (not b!1066543) (not b!1066541) (not b!1066539) (not mapNonEmpty!39916) tp_is_empty!25485 (not b!1066537) (not start!94312) b_and!34447)
(check-sat b_and!34447 (not b_next!21675))
