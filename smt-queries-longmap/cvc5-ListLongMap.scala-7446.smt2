; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94548 () Bool)

(assert start!94548)

(declare-fun b_free!21853 () Bool)

(declare-fun b_next!21853 () Bool)

(assert (=> start!94548 (= b_free!21853 (not b_next!21853))))

(declare-fun tp!77008 () Bool)

(declare-fun b_and!34655 () Bool)

(assert (=> start!94548 (= tp!77008 b_and!34655)))

(declare-fun b!1069173 () Bool)

(declare-fun e!610142 () Bool)

(declare-fun e!610145 () Bool)

(assert (=> b!1069173 (= e!610142 (not e!610145))))

(declare-fun res!713422 () Bool)

(assert (=> b!1069173 (=> res!713422 e!610145)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1069173 (= res!713422 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!39353 0))(
  ( (V!39354 (val!12882 Int)) )
))
(declare-datatypes ((tuple2!16372 0))(
  ( (tuple2!16373 (_1!8197 (_ BitVec 64)) (_2!8197 V!39353)) )
))
(declare-datatypes ((List!22918 0))(
  ( (Nil!22915) (Cons!22914 (h!24123 tuple2!16372) (t!32245 List!22918)) )
))
(declare-datatypes ((ListLongMap!14341 0))(
  ( (ListLongMap!14342 (toList!7186 List!22918)) )
))
(declare-fun lt!472432 () ListLongMap!14341)

(declare-fun lt!472436 () ListLongMap!14341)

(assert (=> b!1069173 (= lt!472432 lt!472436)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39353)

(declare-datatypes ((Unit!35169 0))(
  ( (Unit!35170) )
))
(declare-fun lt!472435 () Unit!35169)

(declare-datatypes ((ValueCell!12128 0))(
  ( (ValueCellFull!12128 (v!15497 V!39353)) (EmptyCell!12128) )
))
(declare-datatypes ((array!68303 0))(
  ( (array!68304 (arr!32850 (Array (_ BitVec 32) ValueCell!12128)) (size!33386 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68303)

(declare-fun minValue!907 () V!39353)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39353)

(declare-datatypes ((array!68305 0))(
  ( (array!68306 (arr!32851 (Array (_ BitVec 32) (_ BitVec 64))) (size!33387 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68305)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!799 (array!68305 array!68303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39353 V!39353 V!39353 V!39353 (_ BitVec 32) Int) Unit!35169)

(assert (=> b!1069173 (= lt!472435 (lemmaNoChangeToArrayThenSameMapNoExtras!799 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3762 (array!68305 array!68303 (_ BitVec 32) (_ BitVec 32) V!39353 V!39353 (_ BitVec 32) Int) ListLongMap!14341)

(assert (=> b!1069173 (= lt!472436 (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1069173 (= lt!472432 (getCurrentListMapNoExtraKeys!3762 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1069174 () Bool)

(declare-fun e!610143 () Bool)

(assert (=> b!1069174 (= e!610143 (bvsle #b00000000000000000000000000000000 (size!33387 _keys!1163)))))

(declare-fun lt!472434 () ListLongMap!14341)

(declare-fun -!665 (ListLongMap!14341 (_ BitVec 64)) ListLongMap!14341)

(assert (=> b!1069174 (= (-!665 lt!472434 #b0000000000000000000000000000000000000000000000000000000000000000) lt!472434)))

(declare-fun lt!472433 () Unit!35169)

(declare-fun removeNotPresentStillSame!75 (ListLongMap!14341 (_ BitVec 64)) Unit!35169)

(assert (=> b!1069174 (= lt!472433 (removeNotPresentStillSame!75 lt!472434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1069175 () Bool)

(declare-fun res!713425 () Bool)

(assert (=> b!1069175 (=> (not res!713425) (not e!610142))))

(assert (=> b!1069175 (= res!713425 (and (= (size!33386 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33387 _keys!1163) (size!33386 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069176 () Bool)

(declare-fun e!610139 () Bool)

(declare-fun tp_is_empty!25663 () Bool)

(assert (=> b!1069176 (= e!610139 tp_is_empty!25663)))

(declare-fun b!1069177 () Bool)

(declare-fun res!713421 () Bool)

(assert (=> b!1069177 (=> (not res!713421) (not e!610142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68305 (_ BitVec 32)) Bool)

(assert (=> b!1069177 (= res!713421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1069178 () Bool)

(declare-fun e!610144 () Bool)

(assert (=> b!1069178 (= e!610144 tp_is_empty!25663)))

(declare-fun mapNonEmpty!40192 () Bool)

(declare-fun mapRes!40192 () Bool)

(declare-fun tp!77009 () Bool)

(assert (=> mapNonEmpty!40192 (= mapRes!40192 (and tp!77009 e!610139))))

(declare-fun mapRest!40192 () (Array (_ BitVec 32) ValueCell!12128))

(declare-fun mapKey!40192 () (_ BitVec 32))

(declare-fun mapValue!40192 () ValueCell!12128)

(assert (=> mapNonEmpty!40192 (= (arr!32850 _values!955) (store mapRest!40192 mapKey!40192 mapValue!40192))))

(declare-fun b!1069180 () Bool)

(declare-fun e!610140 () Bool)

(assert (=> b!1069180 (= e!610140 (and e!610144 mapRes!40192))))

(declare-fun condMapEmpty!40192 () Bool)

(declare-fun mapDefault!40192 () ValueCell!12128)

