; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94274 () Bool)

(assert start!94274)

(declare-fun b_free!21637 () Bool)

(declare-fun b_next!21637 () Bool)

(assert (=> start!94274 (= b_free!21637 (not b_next!21637))))

(declare-fun tp!76351 () Bool)

(declare-fun b_and!34409 () Bool)

(assert (=> start!94274 (= tp!76351 b_and!34409)))

(declare-fun b!1066081 () Bool)

(declare-fun e!607848 () Bool)

(declare-fun e!607852 () Bool)

(assert (=> b!1066081 (= e!607848 (not e!607852))))

(declare-fun res!711555 () Bool)

(assert (=> b!1066081 (=> res!711555 e!607852)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066081 (= res!711555 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!39065 0))(
  ( (V!39066 (val!12774 Int)) )
))
(declare-datatypes ((tuple2!16196 0))(
  ( (tuple2!16197 (_1!8109 (_ BitVec 64)) (_2!8109 V!39065)) )
))
(declare-datatypes ((List!22760 0))(
  ( (Nil!22757) (Cons!22756 (h!23965 tuple2!16196) (t!32081 List!22760)) )
))
(declare-datatypes ((ListLongMap!14165 0))(
  ( (ListLongMap!14166 (toList!7098 List!22760)) )
))
(declare-fun lt!470447 () ListLongMap!14165)

(declare-fun lt!470444 () ListLongMap!14165)

(assert (=> b!1066081 (= lt!470447 lt!470444)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39065)

(declare-datatypes ((ValueCell!12020 0))(
  ( (ValueCellFull!12020 (v!15387 V!39065)) (EmptyCell!12020) )
))
(declare-datatypes ((array!67879 0))(
  ( (array!67880 (arr!32641 (Array (_ BitVec 32) ValueCell!12020)) (size!33177 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67879)

(declare-fun minValue!907 () V!39065)

(declare-datatypes ((Unit!34991 0))(
  ( (Unit!34992) )
))
(declare-fun lt!470449 () Unit!34991)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39065)

(declare-datatypes ((array!67881 0))(
  ( (array!67882 (arr!32642 (Array (_ BitVec 32) (_ BitVec 64))) (size!33178 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67881)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!721 (array!67881 array!67879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39065 V!39065 V!39065 V!39065 (_ BitVec 32) Int) Unit!34991)

(assert (=> b!1066081 (= lt!470449 (lemmaNoChangeToArrayThenSameMapNoExtras!721 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3684 (array!67881 array!67879 (_ BitVec 32) (_ BitVec 32) V!39065 V!39065 (_ BitVec 32) Int) ListLongMap!14165)

(assert (=> b!1066081 (= lt!470444 (getCurrentListMapNoExtraKeys!3684 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066081 (= lt!470447 (getCurrentListMapNoExtraKeys!3684 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066082 () Bool)

(declare-fun res!711553 () Bool)

(assert (=> b!1066082 (=> (not res!711553) (not e!607848))))

(declare-datatypes ((List!22761 0))(
  ( (Nil!22758) (Cons!22757 (h!23966 (_ BitVec 64)) (t!32082 List!22761)) )
))
(declare-fun arrayNoDuplicates!0 (array!67881 (_ BitVec 32) List!22761) Bool)

(assert (=> b!1066082 (= res!711553 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22758))))

(declare-fun b!1066083 () Bool)

(declare-fun res!711554 () Bool)

(assert (=> b!1066083 (=> (not res!711554) (not e!607848))))

(assert (=> b!1066083 (= res!711554 (and (= (size!33177 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33178 _keys!1163) (size!33177 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066084 () Bool)

(declare-fun e!607847 () Bool)

(declare-fun e!607849 () Bool)

(declare-fun mapRes!39859 () Bool)

(assert (=> b!1066084 (= e!607847 (and e!607849 mapRes!39859))))

(declare-fun condMapEmpty!39859 () Bool)

(declare-fun mapDefault!39859 () ValueCell!12020)

