; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94742 () Bool)

(assert start!94742)

(declare-fun b_free!21995 () Bool)

(declare-fun b_next!21995 () Bool)

(assert (=> start!94742 (= b_free!21995 (not b_next!21995))))

(declare-fun tp!77444 () Bool)

(declare-fun b_and!34825 () Bool)

(assert (=> start!94742 (= tp!77444 b_and!34825)))

(declare-fun b!1071237 () Bool)

(declare-fun e!611641 () Bool)

(declare-fun e!611637 () Bool)

(assert (=> b!1071237 (= e!611641 (not e!611637))))

(declare-fun res!714608 () Bool)

(assert (=> b!1071237 (=> res!714608 e!611637)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071237 (= res!714608 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39541 0))(
  ( (V!39542 (val!12953 Int)) )
))
(declare-datatypes ((tuple2!16486 0))(
  ( (tuple2!16487 (_1!8254 (_ BitVec 64)) (_2!8254 V!39541)) )
))
(declare-datatypes ((List!23027 0))(
  ( (Nil!23024) (Cons!23023 (h!24232 tuple2!16486) (t!32360 List!23027)) )
))
(declare-datatypes ((ListLongMap!14455 0))(
  ( (ListLongMap!14456 (toList!7243 List!23027)) )
))
(declare-fun lt!473792 () ListLongMap!14455)

(declare-fun lt!473794 () ListLongMap!14455)

(assert (=> b!1071237 (= lt!473792 lt!473794)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39541)

(declare-datatypes ((Unit!35282 0))(
  ( (Unit!35283) )
))
(declare-fun lt!473787 () Unit!35282)

(declare-datatypes ((ValueCell!12199 0))(
  ( (ValueCellFull!12199 (v!15569 V!39541)) (EmptyCell!12199) )
))
(declare-datatypes ((array!68587 0))(
  ( (array!68588 (arr!32989 (Array (_ BitVec 32) ValueCell!12199)) (size!33525 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68587)

(declare-fun minValue!907 () V!39541)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39541)

(declare-datatypes ((array!68589 0))(
  ( (array!68590 (arr!32990 (Array (_ BitVec 32) (_ BitVec 64))) (size!33526 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68589)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!851 (array!68589 array!68587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39541 V!39541 V!39541 V!39541 (_ BitVec 32) Int) Unit!35282)

(assert (=> b!1071237 (= lt!473787 (lemmaNoChangeToArrayThenSameMapNoExtras!851 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3814 (array!68589 array!68587 (_ BitVec 32) (_ BitVec 32) V!39541 V!39541 (_ BitVec 32) Int) ListLongMap!14455)

(assert (=> b!1071237 (= lt!473794 (getCurrentListMapNoExtraKeys!3814 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071237 (= lt!473792 (getCurrentListMapNoExtraKeys!3814 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071238 () Bool)

(declare-fun res!714607 () Bool)

(assert (=> b!1071238 (=> (not res!714607) (not e!611641))))

(assert (=> b!1071238 (= res!714607 (and (= (size!33525 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33526 _keys!1163) (size!33525 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071239 () Bool)

(declare-fun res!714606 () Bool)

(assert (=> b!1071239 (=> (not res!714606) (not e!611641))))

(declare-datatypes ((List!23028 0))(
  ( (Nil!23025) (Cons!23024 (h!24233 (_ BitVec 64)) (t!32361 List!23028)) )
))
(declare-fun arrayNoDuplicates!0 (array!68589 (_ BitVec 32) List!23028) Bool)

(assert (=> b!1071239 (= res!714606 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23025))))

(declare-fun b!1071240 () Bool)

(declare-fun lt!473789 () tuple2!16486)

(declare-fun e!611640 () Bool)

(declare-fun lt!473796 () ListLongMap!14455)

(declare-fun +!3178 (ListLongMap!14455 tuple2!16486) ListLongMap!14455)

(assert (=> b!1071240 (= e!611640 (= lt!473796 (+!3178 lt!473794 lt!473789)))))

(declare-fun b!1071241 () Bool)

(declare-fun e!611638 () Bool)

(declare-fun e!611636 () Bool)

(declare-fun mapRes!40414 () Bool)

(assert (=> b!1071241 (= e!611638 (and e!611636 mapRes!40414))))

(declare-fun condMapEmpty!40414 () Bool)

(declare-fun mapDefault!40414 () ValueCell!12199)

