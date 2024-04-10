; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95246 () Bool)

(assert start!95246)

(declare-fun b_free!22247 () Bool)

(declare-fun b_next!22247 () Bool)

(assert (=> start!95246 (= b_free!22247 (not b_next!22247))))

(declare-fun tp!78239 () Bool)

(declare-fun b_and!35225 () Bool)

(assert (=> start!95246 (= tp!78239 b_and!35225)))

(declare-fun res!717554 () Bool)

(declare-fun e!615441 () Bool)

(assert (=> start!95246 (=> (not res!717554) (not e!615441))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95246 (= res!717554 (validMask!0 mask!1515))))

(assert (=> start!95246 e!615441))

(assert (=> start!95246 true))

(declare-fun tp_is_empty!26057 () Bool)

(assert (=> start!95246 tp_is_empty!26057))

(declare-datatypes ((V!39877 0))(
  ( (V!39878 (val!13079 Int)) )
))
(declare-datatypes ((ValueCell!12325 0))(
  ( (ValueCellFull!12325 (v!15707 V!39877)) (EmptyCell!12325) )
))
(declare-datatypes ((array!69085 0))(
  ( (array!69086 (arr!33225 (Array (_ BitVec 32) ValueCell!12325)) (size!33761 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69085)

(declare-fun e!615435 () Bool)

(declare-fun array_inv!25670 (array!69085) Bool)

(assert (=> start!95246 (and (array_inv!25670 _values!955) e!615435)))

(assert (=> start!95246 tp!78239))

(declare-datatypes ((array!69087 0))(
  ( (array!69088 (arr!33226 (Array (_ BitVec 32) (_ BitVec 64))) (size!33762 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69087)

(declare-fun array_inv!25671 (array!69087) Bool)

(assert (=> start!95246 (array_inv!25671 _keys!1163)))

(declare-fun b!1076606 () Bool)

(declare-fun res!717552 () Bool)

(assert (=> b!1076606 (=> (not res!717552) (not e!615441))))

(declare-datatypes ((List!23200 0))(
  ( (Nil!23197) (Cons!23196 (h!24405 (_ BitVec 64)) (t!32559 List!23200)) )
))
(declare-fun arrayNoDuplicates!0 (array!69087 (_ BitVec 32) List!23200) Bool)

(assert (=> b!1076606 (= res!717552 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23197))))

(declare-fun b!1076607 () Bool)

(declare-fun e!615437 () Bool)

(assert (=> b!1076607 (= e!615437 tp_is_empty!26057)))

(declare-fun b!1076608 () Bool)

(declare-fun res!717551 () Bool)

(assert (=> b!1076608 (=> (not res!717551) (not e!615441))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1076608 (= res!717551 (and (= (size!33761 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33762 _keys!1163) (size!33761 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!40831 () Bool)

(declare-fun mapRes!40831 () Bool)

(assert (=> mapIsEmpty!40831 mapRes!40831))

(declare-fun b!1076609 () Bool)

(declare-fun e!615436 () Bool)

(assert (=> b!1076609 (= e!615441 (not e!615436))))

(declare-fun res!717555 () Bool)

(assert (=> b!1076609 (=> res!717555 e!615436)))

(assert (=> b!1076609 (= res!717555 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16668 0))(
  ( (tuple2!16669 (_1!8345 (_ BitVec 64)) (_2!8345 V!39877)) )
))
(declare-datatypes ((List!23201 0))(
  ( (Nil!23198) (Cons!23197 (h!24406 tuple2!16668) (t!32560 List!23201)) )
))
(declare-datatypes ((ListLongMap!14637 0))(
  ( (ListLongMap!14638 (toList!7334 List!23201)) )
))
(declare-fun lt!478367 () ListLongMap!14637)

(declare-fun lt!478372 () ListLongMap!14637)

(assert (=> b!1076609 (= lt!478367 lt!478372)))

(declare-fun zeroValueBefore!47 () V!39877)

(declare-fun minValue!907 () V!39877)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39877)

(declare-datatypes ((Unit!35444 0))(
  ( (Unit!35445) )
))
(declare-fun lt!478370 () Unit!35444)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!910 (array!69087 array!69085 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39877 V!39877 V!39877 V!39877 (_ BitVec 32) Int) Unit!35444)

(assert (=> b!1076609 (= lt!478370 (lemmaNoChangeToArrayThenSameMapNoExtras!910 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3894 (array!69087 array!69085 (_ BitVec 32) (_ BitVec 32) V!39877 V!39877 (_ BitVec 32) Int) ListLongMap!14637)

(assert (=> b!1076609 (= lt!478372 (getCurrentListMapNoExtraKeys!3894 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076609 (= lt!478367 (getCurrentListMapNoExtraKeys!3894 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076610 () Bool)

(assert (=> b!1076610 (= e!615436 true)))

(declare-fun lt!478365 () ListLongMap!14637)

(declare-fun lt!478371 () ListLongMap!14637)

(declare-fun -!720 (ListLongMap!14637 (_ BitVec 64)) ListLongMap!14637)

(assert (=> b!1076610 (= lt!478365 (-!720 lt!478371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!478366 () ListLongMap!14637)

(declare-fun lt!478362 () ListLongMap!14637)

(assert (=> b!1076610 (= lt!478366 lt!478362)))

(declare-fun lt!478373 () Unit!35444)

(declare-fun addCommutativeForDiffKeys!754 (ListLongMap!14637 (_ BitVec 64) V!39877 (_ BitVec 64) V!39877) Unit!35444)

(assert (=> b!1076610 (= lt!478373 (addCommutativeForDiffKeys!754 lt!478367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!478361 () ListLongMap!14637)

(assert (=> b!1076610 (= (-!720 lt!478362 #b0000000000000000000000000000000000000000000000000000000000000000) lt!478361)))

(declare-fun lt!478369 () tuple2!16668)

(declare-fun +!3238 (ListLongMap!14637 tuple2!16668) ListLongMap!14637)

(assert (=> b!1076610 (= lt!478362 (+!3238 lt!478361 lt!478369))))

(declare-fun lt!478364 () Unit!35444)

(declare-fun addThenRemoveForNewKeyIsSame!85 (ListLongMap!14637 (_ BitVec 64) V!39877) Unit!35444)

(assert (=> b!1076610 (= lt!478364 (addThenRemoveForNewKeyIsSame!85 lt!478361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!478363 () tuple2!16668)

(assert (=> b!1076610 (= lt!478361 (+!3238 lt!478367 lt!478363))))

(declare-fun e!615438 () Bool)

(assert (=> b!1076610 e!615438))

(declare-fun res!717553 () Bool)

(assert (=> b!1076610 (=> (not res!717553) (not e!615438))))

(assert (=> b!1076610 (= res!717553 (= lt!478371 lt!478366))))

(assert (=> b!1076610 (= lt!478366 (+!3238 (+!3238 lt!478367 lt!478369) lt!478363))))

(assert (=> b!1076610 (= lt!478363 (tuple2!16669 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1076610 (= lt!478369 (tuple2!16669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!478368 () ListLongMap!14637)

(declare-fun getCurrentListMap!4200 (array!69087 array!69085 (_ BitVec 32) (_ BitVec 32) V!39877 V!39877 (_ BitVec 32) Int) ListLongMap!14637)

(assert (=> b!1076610 (= lt!478368 (getCurrentListMap!4200 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1076610 (= lt!478371 (getCurrentListMap!4200 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1076611 () Bool)

(declare-fun res!717550 () Bool)

(assert (=> b!1076611 (=> (not res!717550) (not e!615441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69087 (_ BitVec 32)) Bool)

(assert (=> b!1076611 (= res!717550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1076612 () Bool)

(assert (=> b!1076612 (= e!615438 (= lt!478368 (+!3238 lt!478372 lt!478363)))))

(declare-fun b!1076613 () Bool)

(declare-fun e!615440 () Bool)

(assert (=> b!1076613 (= e!615440 tp_is_empty!26057)))

(declare-fun mapNonEmpty!40831 () Bool)

(declare-fun tp!78238 () Bool)

(assert (=> mapNonEmpty!40831 (= mapRes!40831 (and tp!78238 e!615440))))

(declare-fun mapRest!40831 () (Array (_ BitVec 32) ValueCell!12325))

(declare-fun mapValue!40831 () ValueCell!12325)

(declare-fun mapKey!40831 () (_ BitVec 32))

(assert (=> mapNonEmpty!40831 (= (arr!33225 _values!955) (store mapRest!40831 mapKey!40831 mapValue!40831))))

(declare-fun b!1076614 () Bool)

(assert (=> b!1076614 (= e!615435 (and e!615437 mapRes!40831))))

(declare-fun condMapEmpty!40831 () Bool)

(declare-fun mapDefault!40831 () ValueCell!12325)

