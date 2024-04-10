; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94720 () Bool)

(assert start!94720)

(declare-fun b_free!21973 () Bool)

(declare-fun b_next!21973 () Bool)

(assert (=> start!94720 (= b_free!21973 (not b_next!21973))))

(declare-fun tp!77378 () Bool)

(declare-fun b_and!34803 () Bool)

(assert (=> start!94720 (= tp!77378 b_and!34803)))

(declare-fun res!714408 () Bool)

(declare-fun e!611407 () Bool)

(assert (=> start!94720 (=> (not res!714408) (not e!611407))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94720 (= res!714408 (validMask!0 mask!1515))))

(assert (=> start!94720 e!611407))

(assert (=> start!94720 true))

(declare-fun tp_is_empty!25783 () Bool)

(assert (=> start!94720 tp_is_empty!25783))

(declare-datatypes ((V!39513 0))(
  ( (V!39514 (val!12942 Int)) )
))
(declare-datatypes ((ValueCell!12188 0))(
  ( (ValueCellFull!12188 (v!15558 V!39513)) (EmptyCell!12188) )
))
(declare-datatypes ((array!68543 0))(
  ( (array!68544 (arr!32967 (Array (_ BitVec 32) ValueCell!12188)) (size!33503 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68543)

(declare-fun e!611410 () Bool)

(declare-fun array_inv!25496 (array!68543) Bool)

(assert (=> start!94720 (and (array_inv!25496 _values!955) e!611410)))

(assert (=> start!94720 tp!77378))

(declare-datatypes ((array!68545 0))(
  ( (array!68546 (arr!32968 (Array (_ BitVec 32) (_ BitVec 64))) (size!33504 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68545)

(declare-fun array_inv!25497 (array!68545) Bool)

(assert (=> start!94720 (array_inv!25497 _keys!1163)))

(declare-fun b!1070940 () Bool)

(declare-fun e!611409 () Bool)

(assert (=> b!1070940 (= e!611409 tp_is_empty!25783)))

(declare-fun b!1070941 () Bool)

(declare-fun e!611411 () Bool)

(assert (=> b!1070941 (= e!611407 (not e!611411))))

(declare-fun res!714407 () Bool)

(assert (=> b!1070941 (=> res!714407 e!611411)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1070941 (= res!714407 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16464 0))(
  ( (tuple2!16465 (_1!8243 (_ BitVec 64)) (_2!8243 V!39513)) )
))
(declare-datatypes ((List!23006 0))(
  ( (Nil!23003) (Cons!23002 (h!24211 tuple2!16464) (t!32339 List!23006)) )
))
(declare-datatypes ((ListLongMap!14433 0))(
  ( (ListLongMap!14434 (toList!7232 List!23006)) )
))
(declare-fun lt!473390 () ListLongMap!14433)

(declare-fun lt!473387 () ListLongMap!14433)

(assert (=> b!1070941 (= lt!473390 lt!473387)))

(declare-fun zeroValueBefore!47 () V!39513)

(declare-fun minValue!907 () V!39513)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35260 0))(
  ( (Unit!35261) )
))
(declare-fun lt!473393 () Unit!35260)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39513)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!843 (array!68545 array!68543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39513 V!39513 V!39513 V!39513 (_ BitVec 32) Int) Unit!35260)

(assert (=> b!1070941 (= lt!473393 (lemmaNoChangeToArrayThenSameMapNoExtras!843 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3806 (array!68545 array!68543 (_ BitVec 32) (_ BitVec 32) V!39513 V!39513 (_ BitVec 32) Int) ListLongMap!14433)

(assert (=> b!1070941 (= lt!473387 (getCurrentListMapNoExtraKeys!3806 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070941 (= lt!473390 (getCurrentListMapNoExtraKeys!3806 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070942 () Bool)

(declare-fun e!611405 () Bool)

(assert (=> b!1070942 (= e!611405 tp_is_empty!25783)))

(declare-fun mapIsEmpty!40381 () Bool)

(declare-fun mapRes!40381 () Bool)

(assert (=> mapIsEmpty!40381 mapRes!40381))

(declare-fun mapNonEmpty!40381 () Bool)

(declare-fun tp!77377 () Bool)

(assert (=> mapNonEmpty!40381 (= mapRes!40381 (and tp!77377 e!611405))))

(declare-fun mapKey!40381 () (_ BitVec 32))

(declare-fun mapRest!40381 () (Array (_ BitVec 32) ValueCell!12188))

(declare-fun mapValue!40381 () ValueCell!12188)

(assert (=> mapNonEmpty!40381 (= (arr!32967 _values!955) (store mapRest!40381 mapKey!40381 mapValue!40381))))

(declare-fun b!1070943 () Bool)

(assert (=> b!1070943 (= e!611411 true)))

(declare-fun lt!473388 () ListLongMap!14433)

(declare-fun lt!473391 () tuple2!16464)

(declare-fun -!668 (ListLongMap!14433 (_ BitVec 64)) ListLongMap!14433)

(declare-fun +!3167 (ListLongMap!14433 tuple2!16464) ListLongMap!14433)

(assert (=> b!1070943 (= (-!668 (+!3167 lt!473388 lt!473391) #b0000000000000000000000000000000000000000000000000000000000000000) lt!473388)))

(declare-fun lt!473392 () Unit!35260)

(declare-fun addThenRemoveForNewKeyIsSame!38 (ListLongMap!14433 (_ BitVec 64) V!39513) Unit!35260)

(assert (=> b!1070943 (= lt!473392 (addThenRemoveForNewKeyIsSame!38 lt!473388 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473386 () tuple2!16464)

(assert (=> b!1070943 (= lt!473388 (+!3167 lt!473390 lt!473386))))

(declare-fun e!611408 () Bool)

(assert (=> b!1070943 e!611408))

(declare-fun res!714411 () Bool)

(assert (=> b!1070943 (=> (not res!714411) (not e!611408))))

(declare-fun lt!473389 () ListLongMap!14433)

(assert (=> b!1070943 (= res!714411 (= lt!473389 (+!3167 (+!3167 lt!473390 lt!473391) lt!473386)))))

(assert (=> b!1070943 (= lt!473386 (tuple2!16465 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1070943 (= lt!473391 (tuple2!16465 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473385 () ListLongMap!14433)

(declare-fun getCurrentListMap!4134 (array!68545 array!68543 (_ BitVec 32) (_ BitVec 32) V!39513 V!39513 (_ BitVec 32) Int) ListLongMap!14433)

(assert (=> b!1070943 (= lt!473385 (getCurrentListMap!4134 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070943 (= lt!473389 (getCurrentListMap!4134 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070944 () Bool)

(assert (=> b!1070944 (= e!611410 (and e!611409 mapRes!40381))))

(declare-fun condMapEmpty!40381 () Bool)

(declare-fun mapDefault!40381 () ValueCell!12188)

