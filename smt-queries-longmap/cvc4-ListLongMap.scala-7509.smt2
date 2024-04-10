; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95234 () Bool)

(assert start!95234)

(declare-fun b_free!22235 () Bool)

(declare-fun b_next!22235 () Bool)

(assert (=> start!95234 (= b_free!22235 (not b_next!22235))))

(declare-fun tp!78202 () Bool)

(declare-fun b_and!35213 () Bool)

(assert (=> start!95234 (= tp!78202 b_and!35213)))

(declare-fun mapNonEmpty!40813 () Bool)

(declare-fun mapRes!40813 () Bool)

(declare-fun tp!78203 () Bool)

(declare-fun e!615310 () Bool)

(assert (=> mapNonEmpty!40813 (= mapRes!40813 (and tp!78203 e!615310))))

(declare-fun mapKey!40813 () (_ BitVec 32))

(declare-datatypes ((V!39861 0))(
  ( (V!39862 (val!13073 Int)) )
))
(declare-datatypes ((ValueCell!12319 0))(
  ( (ValueCellFull!12319 (v!15701 V!39861)) (EmptyCell!12319) )
))
(declare-datatypes ((array!69061 0))(
  ( (array!69062 (arr!33213 (Array (_ BitVec 32) ValueCell!12319)) (size!33749 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69061)

(declare-fun mapValue!40813 () ValueCell!12319)

(declare-fun mapRest!40813 () (Array (_ BitVec 32) ValueCell!12319))

(assert (=> mapNonEmpty!40813 (= (arr!33213 _values!955) (store mapRest!40813 mapKey!40813 mapValue!40813))))

(declare-fun b!1076444 () Bool)

(declare-fun res!717445 () Bool)

(declare-fun e!615312 () Bool)

(assert (=> b!1076444 (=> (not res!717445) (not e!615312))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!69063 0))(
  ( (array!69064 (arr!33214 (Array (_ BitVec 32) (_ BitVec 64))) (size!33750 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69063)

(assert (=> b!1076444 (= res!717445 (and (= (size!33749 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33750 _keys!1163) (size!33749 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1076445 () Bool)

(declare-fun res!717442 () Bool)

(assert (=> b!1076445 (=> (not res!717442) (not e!615312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69063 (_ BitVec 32)) Bool)

(assert (=> b!1076445 (= res!717442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!717447 () Bool)

(assert (=> start!95234 (=> (not res!717447) (not e!615312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95234 (= res!717447 (validMask!0 mask!1515))))

(assert (=> start!95234 e!615312))

(assert (=> start!95234 true))

(declare-fun tp_is_empty!26045 () Bool)

(assert (=> start!95234 tp_is_empty!26045))

(declare-fun e!615315 () Bool)

(declare-fun array_inv!25662 (array!69061) Bool)

(assert (=> start!95234 (and (array_inv!25662 _values!955) e!615315)))

(assert (=> start!95234 tp!78202))

(declare-fun array_inv!25663 (array!69063) Bool)

(assert (=> start!95234 (array_inv!25663 _keys!1163)))

(declare-datatypes ((tuple2!16656 0))(
  ( (tuple2!16657 (_1!8339 (_ BitVec 64)) (_2!8339 V!39861)) )
))
(declare-fun lt!478145 () tuple2!16656)

(declare-fun e!615313 () Bool)

(declare-datatypes ((List!23190 0))(
  ( (Nil!23187) (Cons!23186 (h!24395 tuple2!16656) (t!32549 List!23190)) )
))
(declare-datatypes ((ListLongMap!14625 0))(
  ( (ListLongMap!14626 (toList!7328 List!23190)) )
))
(declare-fun lt!478144 () ListLongMap!14625)

(declare-fun b!1076446 () Bool)

(declare-fun lt!478143 () ListLongMap!14625)

(declare-fun +!3233 (ListLongMap!14625 tuple2!16656) ListLongMap!14625)

(assert (=> b!1076446 (= e!615313 (= lt!478144 (+!3233 lt!478143 lt!478145)))))

(declare-fun b!1076447 () Bool)

(declare-fun e!615311 () Bool)

(assert (=> b!1076447 (= e!615311 true)))

(declare-fun lt!478147 () ListLongMap!14625)

(declare-fun lt!478146 () tuple2!16656)

(declare-fun -!716 (ListLongMap!14625 (_ BitVec 64)) ListLongMap!14625)

(assert (=> b!1076447 (= (-!716 (+!3233 lt!478147 lt!478146) #b0000000000000000000000000000000000000000000000000000000000000000) lt!478147)))

(declare-datatypes ((Unit!35434 0))(
  ( (Unit!35435) )
))
(declare-fun lt!478148 () Unit!35434)

(declare-fun zeroValueBefore!47 () V!39861)

(declare-fun addThenRemoveForNewKeyIsSame!81 (ListLongMap!14625 (_ BitVec 64) V!39861) Unit!35434)

(assert (=> b!1076447 (= lt!478148 (addThenRemoveForNewKeyIsSame!81 lt!478147 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!478140 () ListLongMap!14625)

(assert (=> b!1076447 (= lt!478147 (+!3233 lt!478140 lt!478145))))

(assert (=> b!1076447 e!615313))

(declare-fun res!717443 () Bool)

(assert (=> b!1076447 (=> (not res!717443) (not e!615313))))

(declare-fun lt!478141 () ListLongMap!14625)

(assert (=> b!1076447 (= res!717443 (= lt!478141 (+!3233 (+!3233 lt!478140 lt!478146) lt!478145)))))

(declare-fun minValue!907 () V!39861)

(assert (=> b!1076447 (= lt!478145 (tuple2!16657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1076447 (= lt!478146 (tuple2!16657 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39861)

(declare-fun getCurrentListMap!4196 (array!69063 array!69061 (_ BitVec 32) (_ BitVec 32) V!39861 V!39861 (_ BitVec 32) Int) ListLongMap!14625)

(assert (=> b!1076447 (= lt!478144 (getCurrentListMap!4196 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076447 (= lt!478141 (getCurrentListMap!4196 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076448 () Bool)

(declare-fun e!615314 () Bool)

(assert (=> b!1076448 (= e!615314 tp_is_empty!26045)))

(declare-fun b!1076449 () Bool)

(declare-fun res!717446 () Bool)

(assert (=> b!1076449 (=> (not res!717446) (not e!615312))))

(declare-datatypes ((List!23191 0))(
  ( (Nil!23188) (Cons!23187 (h!24396 (_ BitVec 64)) (t!32550 List!23191)) )
))
(declare-fun arrayNoDuplicates!0 (array!69063 (_ BitVec 32) List!23191) Bool)

(assert (=> b!1076449 (= res!717446 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23188))))

(declare-fun mapIsEmpty!40813 () Bool)

(assert (=> mapIsEmpty!40813 mapRes!40813))

(declare-fun b!1076450 () Bool)

(assert (=> b!1076450 (= e!615315 (and e!615314 mapRes!40813))))

(declare-fun condMapEmpty!40813 () Bool)

(declare-fun mapDefault!40813 () ValueCell!12319)

