; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94088 () Bool)

(assert start!94088)

(declare-fun b_free!21503 () Bool)

(declare-fun b_next!21503 () Bool)

(assert (=> start!94088 (= b_free!21503 (not b_next!21503))))

(declare-fun tp!75940 () Bool)

(declare-fun b_and!34245 () Bool)

(assert (=> start!94088 (= tp!75940 b_and!34245)))

(declare-fun b!1064075 () Bool)

(declare-fun e!606394 () Bool)

(assert (=> b!1064075 (= e!606394 (not true))))

(declare-datatypes ((V!38885 0))(
  ( (V!38886 (val!12707 Int)) )
))
(declare-datatypes ((tuple2!16092 0))(
  ( (tuple2!16093 (_1!8057 (_ BitVec 64)) (_2!8057 V!38885)) )
))
(declare-datatypes ((List!22667 0))(
  ( (Nil!22664) (Cons!22663 (h!23872 tuple2!16092) (t!31982 List!22667)) )
))
(declare-datatypes ((ListLongMap!14061 0))(
  ( (ListLongMap!14062 (toList!7046 List!22667)) )
))
(declare-fun lt!469035 () ListLongMap!14061)

(declare-fun lt!469036 () ListLongMap!14061)

(assert (=> b!1064075 (= lt!469035 lt!469036)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((Unit!34892 0))(
  ( (Unit!34893) )
))
(declare-fun lt!469034 () Unit!34892)

(declare-datatypes ((ValueCell!11953 0))(
  ( (ValueCellFull!11953 (v!15319 V!38885)) (EmptyCell!11953) )
))
(declare-datatypes ((array!67623 0))(
  ( (array!67624 (arr!32516 (Array (_ BitVec 32) ValueCell!11953)) (size!33052 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67623)

(declare-fun minValue!907 () V!38885)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38885)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38885)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67625 0))(
  ( (array!67626 (arr!32517 (Array (_ BitVec 32) (_ BitVec 64))) (size!33053 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67625)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!675 (array!67625 array!67623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38885 V!38885 V!38885 V!38885 (_ BitVec 32) Int) Unit!34892)

(assert (=> b!1064075 (= lt!469034 (lemmaNoChangeToArrayThenSameMapNoExtras!675 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3638 (array!67625 array!67623 (_ BitVec 32) (_ BitVec 32) V!38885 V!38885 (_ BitVec 32) Int) ListLongMap!14061)

(assert (=> b!1064075 (= lt!469036 (getCurrentListMapNoExtraKeys!3638 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064075 (= lt!469035 (getCurrentListMapNoExtraKeys!3638 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39649 () Bool)

(declare-fun mapRes!39649 () Bool)

(assert (=> mapIsEmpty!39649 mapRes!39649))

(declare-fun b!1064076 () Bool)

(declare-fun res!710395 () Bool)

(assert (=> b!1064076 (=> (not res!710395) (not e!606394))))

(assert (=> b!1064076 (= res!710395 (and (= (size!33052 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33053 _keys!1163) (size!33052 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064077 () Bool)

(declare-fun res!710398 () Bool)

(assert (=> b!1064077 (=> (not res!710398) (not e!606394))))

(declare-datatypes ((List!22668 0))(
  ( (Nil!22665) (Cons!22664 (h!23873 (_ BitVec 64)) (t!31983 List!22668)) )
))
(declare-fun arrayNoDuplicates!0 (array!67625 (_ BitVec 32) List!22668) Bool)

(assert (=> b!1064077 (= res!710398 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22665))))

(declare-fun mapNonEmpty!39649 () Bool)

(declare-fun tp!75941 () Bool)

(declare-fun e!606395 () Bool)

(assert (=> mapNonEmpty!39649 (= mapRes!39649 (and tp!75941 e!606395))))

(declare-fun mapKey!39649 () (_ BitVec 32))

(declare-fun mapValue!39649 () ValueCell!11953)

(declare-fun mapRest!39649 () (Array (_ BitVec 32) ValueCell!11953))

(assert (=> mapNonEmpty!39649 (= (arr!32516 _values!955) (store mapRest!39649 mapKey!39649 mapValue!39649))))

(declare-fun b!1064078 () Bool)

(declare-fun e!606392 () Bool)

(declare-fun e!606396 () Bool)

(assert (=> b!1064078 (= e!606392 (and e!606396 mapRes!39649))))

(declare-fun condMapEmpty!39649 () Bool)

(declare-fun mapDefault!39649 () ValueCell!11953)

