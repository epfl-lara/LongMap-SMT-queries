; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95236 () Bool)

(assert start!95236)

(declare-fun b_free!22237 () Bool)

(declare-fun b_next!22237 () Bool)

(assert (=> start!95236 (= b_free!22237 (not b_next!22237))))

(declare-fun tp!78208 () Bool)

(declare-fun b_and!35215 () Bool)

(assert (=> start!95236 (= tp!78208 b_and!35215)))

(declare-fun mapNonEmpty!40816 () Bool)

(declare-fun mapRes!40816 () Bool)

(declare-fun tp!78209 () Bool)

(declare-fun e!615330 () Bool)

(assert (=> mapNonEmpty!40816 (= mapRes!40816 (and tp!78209 e!615330))))

(declare-fun mapKey!40816 () (_ BitVec 32))

(declare-datatypes ((V!39865 0))(
  ( (V!39866 (val!13074 Int)) )
))
(declare-datatypes ((ValueCell!12320 0))(
  ( (ValueCellFull!12320 (v!15702 V!39865)) (EmptyCell!12320) )
))
(declare-fun mapRest!40816 () (Array (_ BitVec 32) ValueCell!12320))

(declare-fun mapValue!40816 () ValueCell!12320)

(declare-datatypes ((array!69065 0))(
  ( (array!69066 (arr!33215 (Array (_ BitVec 32) ValueCell!12320)) (size!33751 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69065)

(assert (=> mapNonEmpty!40816 (= (arr!33215 _values!955) (store mapRest!40816 mapKey!40816 mapValue!40816))))

(declare-fun b!1076471 () Bool)

(declare-fun e!615334 () Bool)

(declare-fun tp_is_empty!26047 () Bool)

(assert (=> b!1076471 (= e!615334 tp_is_empty!26047)))

(declare-fun b!1076472 () Bool)

(declare-fun e!615332 () Bool)

(declare-fun e!615336 () Bool)

(assert (=> b!1076472 (= e!615332 (not e!615336))))

(declare-fun res!717461 () Bool)

(assert (=> b!1076472 (=> res!717461 e!615336)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076472 (= res!717461 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16658 0))(
  ( (tuple2!16659 (_1!8340 (_ BitVec 64)) (_2!8340 V!39865)) )
))
(declare-datatypes ((List!23192 0))(
  ( (Nil!23189) (Cons!23188 (h!24397 tuple2!16658) (t!32551 List!23192)) )
))
(declare-datatypes ((ListLongMap!14627 0))(
  ( (ListLongMap!14628 (toList!7329 List!23192)) )
))
(declare-fun lt!478175 () ListLongMap!14627)

(declare-fun lt!478178 () ListLongMap!14627)

(assert (=> b!1076472 (= lt!478175 lt!478178)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39865)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39865)

(declare-fun minValue!907 () V!39865)

(declare-datatypes ((Unit!35436 0))(
  ( (Unit!35437) )
))
(declare-fun lt!478173 () Unit!35436)

(declare-datatypes ((array!69067 0))(
  ( (array!69068 (arr!33216 (Array (_ BitVec 32) (_ BitVec 64))) (size!33752 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69067)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!906 (array!69067 array!69065 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39865 V!39865 V!39865 V!39865 (_ BitVec 32) Int) Unit!35436)

(assert (=> b!1076472 (= lt!478173 (lemmaNoChangeToArrayThenSameMapNoExtras!906 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3890 (array!69067 array!69065 (_ BitVec 32) (_ BitVec 32) V!39865 V!39865 (_ BitVec 32) Int) ListLongMap!14627)

(assert (=> b!1076472 (= lt!478178 (getCurrentListMapNoExtraKeys!3890 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076472 (= lt!478175 (getCurrentListMapNoExtraKeys!3890 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076473 () Bool)

(declare-fun res!717460 () Bool)

(assert (=> b!1076473 (=> (not res!717460) (not e!615332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69067 (_ BitVec 32)) Bool)

(assert (=> b!1076473 (= res!717460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1076474 () Bool)

(declare-fun lt!478174 () ListLongMap!14627)

(declare-fun lt!478181 () ListLongMap!14627)

(declare-fun -!717 (ListLongMap!14627 (_ BitVec 64)) ListLongMap!14627)

(assert (=> b!1076474 (= e!615336 (= (-!717 lt!478174 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478181))))

(declare-fun lt!478179 () ListLongMap!14627)

(declare-fun lt!478182 () ListLongMap!14627)

(assert (=> b!1076474 (= lt!478179 lt!478182)))

(declare-fun lt!478184 () Unit!35436)

(declare-fun addCommutativeForDiffKeys!751 (ListLongMap!14627 (_ BitVec 64) V!39865 (_ BitVec 64) V!39865) Unit!35436)

(assert (=> b!1076474 (= lt!478184 (addCommutativeForDiffKeys!751 lt!478175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!478183 () ListLongMap!14627)

(assert (=> b!1076474 (= (-!717 lt!478182 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478183)))

(declare-fun lt!478177 () tuple2!16658)

(declare-fun +!3234 (ListLongMap!14627 tuple2!16658) ListLongMap!14627)

(assert (=> b!1076474 (= lt!478182 (+!3234 lt!478183 lt!478177))))

(declare-fun lt!478180 () Unit!35436)

(declare-fun addThenRemoveForNewKeyIsSame!82 (ListLongMap!14627 (_ BitVec 64) V!39865) Unit!35436)

(assert (=> b!1076474 (= lt!478180 (addThenRemoveForNewKeyIsSame!82 lt!478183 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!478176 () tuple2!16658)

(assert (=> b!1076474 (= lt!478183 (+!3234 lt!478175 lt!478176))))

(declare-fun e!615335 () Bool)

(assert (=> b!1076474 e!615335))

(declare-fun res!717464 () Bool)

(assert (=> b!1076474 (=> (not res!717464) (not e!615335))))

(assert (=> b!1076474 (= res!717464 (= lt!478174 lt!478179))))

(assert (=> b!1076474 (= lt!478179 (+!3234 (+!3234 lt!478175 lt!478177) lt!478176))))

(assert (=> b!1076474 (= lt!478176 (tuple2!16659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1076474 (= lt!478177 (tuple2!16659 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4197 (array!69067 array!69065 (_ BitVec 32) (_ BitVec 32) V!39865 V!39865 (_ BitVec 32) Int) ListLongMap!14627)

(assert (=> b!1076474 (= lt!478181 (getCurrentListMap!4197 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076474 (= lt!478174 (getCurrentListMap!4197 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40816 () Bool)

(assert (=> mapIsEmpty!40816 mapRes!40816))

(declare-fun b!1076475 () Bool)

(assert (=> b!1076475 (= e!615335 (= lt!478181 (+!3234 lt!478178 lt!478176)))))

(declare-fun b!1076476 () Bool)

(declare-fun res!717463 () Bool)

(assert (=> b!1076476 (=> (not res!717463) (not e!615332))))

(declare-datatypes ((List!23193 0))(
  ( (Nil!23190) (Cons!23189 (h!24398 (_ BitVec 64)) (t!32552 List!23193)) )
))
(declare-fun arrayNoDuplicates!0 (array!69067 (_ BitVec 32) List!23193) Bool)

(assert (=> b!1076476 (= res!717463 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23190))))

(declare-fun b!1076477 () Bool)

(assert (=> b!1076477 (= e!615330 tp_is_empty!26047)))

(declare-fun b!1076478 () Bool)

(declare-fun e!615333 () Bool)

(assert (=> b!1076478 (= e!615333 (and e!615334 mapRes!40816))))

(declare-fun condMapEmpty!40816 () Bool)

(declare-fun mapDefault!40816 () ValueCell!12320)

