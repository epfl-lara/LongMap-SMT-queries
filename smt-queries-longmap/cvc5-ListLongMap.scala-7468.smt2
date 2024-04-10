; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94732 () Bool)

(assert start!94732)

(declare-fun b_free!21985 () Bool)

(declare-fun b_next!21985 () Bool)

(assert (=> start!94732 (= b_free!21985 (not b_next!21985))))

(declare-fun tp!77413 () Bool)

(declare-fun b_and!34815 () Bool)

(assert (=> start!94732 (= tp!77413 b_and!34815)))

(declare-fun mapNonEmpty!40399 () Bool)

(declare-fun mapRes!40399 () Bool)

(declare-fun tp!77414 () Bool)

(declare-fun e!611533 () Bool)

(assert (=> mapNonEmpty!40399 (= mapRes!40399 (and tp!77414 e!611533))))

(declare-datatypes ((V!39529 0))(
  ( (V!39530 (val!12948 Int)) )
))
(declare-datatypes ((ValueCell!12194 0))(
  ( (ValueCellFull!12194 (v!15564 V!39529)) (EmptyCell!12194) )
))
(declare-fun mapRest!40399 () (Array (_ BitVec 32) ValueCell!12194))

(declare-fun mapValue!40399 () ValueCell!12194)

(declare-fun mapKey!40399 () (_ BitVec 32))

(declare-datatypes ((array!68567 0))(
  ( (array!68568 (arr!32979 (Array (_ BitVec 32) ValueCell!12194)) (size!33515 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68567)

(assert (=> mapNonEmpty!40399 (= (arr!32979 _values!955) (store mapRest!40399 mapKey!40399 mapValue!40399))))

(declare-fun b!1071102 () Bool)

(declare-fun res!714515 () Bool)

(declare-fun e!611532 () Bool)

(assert (=> b!1071102 (=> (not res!714515) (not e!611532))))

(declare-datatypes ((array!68569 0))(
  ( (array!68570 (arr!32980 (Array (_ BitVec 32) (_ BitVec 64))) (size!33516 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68569)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68569 (_ BitVec 32)) Bool)

(assert (=> b!1071102 (= res!714515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071103 () Bool)

(declare-fun e!611536 () Bool)

(declare-fun tp_is_empty!25795 () Bool)

(assert (=> b!1071103 (= e!611536 tp_is_empty!25795)))

(declare-fun res!714517 () Bool)

(assert (=> start!94732 (=> (not res!714517) (not e!611532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94732 (= res!714517 (validMask!0 mask!1515))))

(assert (=> start!94732 e!611532))

(assert (=> start!94732 true))

(assert (=> start!94732 tp_is_empty!25795))

(declare-fun e!611531 () Bool)

(declare-fun array_inv!25506 (array!68567) Bool)

(assert (=> start!94732 (and (array_inv!25506 _values!955) e!611531)))

(assert (=> start!94732 tp!77413))

(declare-fun array_inv!25507 (array!68569) Bool)

(assert (=> start!94732 (array_inv!25507 _keys!1163)))

(declare-fun b!1071104 () Bool)

(declare-fun res!714519 () Bool)

(assert (=> b!1071104 (=> (not res!714519) (not e!611532))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071104 (= res!714519 (and (= (size!33515 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33516 _keys!1163) (size!33515 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16476 0))(
  ( (tuple2!16477 (_1!8249 (_ BitVec 64)) (_2!8249 V!39529)) )
))
(declare-datatypes ((List!23017 0))(
  ( (Nil!23014) (Cons!23013 (h!24222 tuple2!16476) (t!32350 List!23017)) )
))
(declare-datatypes ((ListLongMap!14445 0))(
  ( (ListLongMap!14446 (toList!7238 List!23017)) )
))
(declare-fun lt!473601 () ListLongMap!14445)

(declare-fun lt!473597 () tuple2!16476)

(declare-fun lt!473591 () ListLongMap!14445)

(declare-fun e!611535 () Bool)

(declare-fun b!1071105 () Bool)

(declare-fun +!3173 (ListLongMap!14445 tuple2!16476) ListLongMap!14445)

(assert (=> b!1071105 (= e!611535 (= lt!473591 (+!3173 lt!473601 lt!473597)))))

(declare-fun b!1071106 () Bool)

(declare-fun res!714516 () Bool)

(assert (=> b!1071106 (=> (not res!714516) (not e!611532))))

(declare-datatypes ((List!23018 0))(
  ( (Nil!23015) (Cons!23014 (h!24223 (_ BitVec 64)) (t!32351 List!23018)) )
))
(declare-fun arrayNoDuplicates!0 (array!68569 (_ BitVec 32) List!23018) Bool)

(assert (=> b!1071106 (= res!714516 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23015))))

(declare-fun b!1071107 () Bool)

(assert (=> b!1071107 (= e!611533 tp_is_empty!25795)))

(declare-fun b!1071108 () Bool)

(declare-fun e!611537 () Bool)

(assert (=> b!1071108 (= e!611532 (not e!611537))))

(declare-fun res!714518 () Bool)

(assert (=> b!1071108 (=> res!714518 e!611537)))

(assert (=> b!1071108 (= res!714518 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!473593 () ListLongMap!14445)

(assert (=> b!1071108 (= lt!473593 lt!473601)))

(declare-fun zeroValueBefore!47 () V!39529)

(declare-datatypes ((Unit!35272 0))(
  ( (Unit!35273) )
))
(declare-fun lt!473602 () Unit!35272)

(declare-fun minValue!907 () V!39529)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39529)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!847 (array!68569 array!68567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39529 V!39529 V!39529 V!39529 (_ BitVec 32) Int) Unit!35272)

(assert (=> b!1071108 (= lt!473602 (lemmaNoChangeToArrayThenSameMapNoExtras!847 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3810 (array!68569 array!68567 (_ BitVec 32) (_ BitVec 32) V!39529 V!39529 (_ BitVec 32) Int) ListLongMap!14445)

(assert (=> b!1071108 (= lt!473601 (getCurrentListMapNoExtraKeys!3810 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071108 (= lt!473593 (getCurrentListMapNoExtraKeys!3810 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071109 () Bool)

(assert (=> b!1071109 (= e!611531 (and e!611536 mapRes!40399))))

(declare-fun condMapEmpty!40399 () Bool)

(declare-fun mapDefault!40399 () ValueCell!12194)

