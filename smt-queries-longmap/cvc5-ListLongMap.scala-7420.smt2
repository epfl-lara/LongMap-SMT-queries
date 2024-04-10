; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94356 () Bool)

(assert start!94356)

(declare-fun b_free!21697 () Bool)

(declare-fun b_next!21697 () Bool)

(assert (=> start!94356 (= b_free!21697 (not b_next!21697))))

(declare-fun tp!76534 () Bool)

(declare-fun b_and!34481 () Bool)

(assert (=> start!94356 (= tp!76534 b_and!34481)))

(declare-fun b!1066974 () Bool)

(declare-fun res!712076 () Bool)

(declare-fun e!608499 () Bool)

(assert (=> b!1066974 (=> (not res!712076) (not e!608499))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39145 0))(
  ( (V!39146 (val!12804 Int)) )
))
(declare-datatypes ((ValueCell!12050 0))(
  ( (ValueCellFull!12050 (v!15418 V!39145)) (EmptyCell!12050) )
))
(declare-datatypes ((array!67999 0))(
  ( (array!68000 (arr!32700 (Array (_ BitVec 32) ValueCell!12050)) (size!33236 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67999)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68001 0))(
  ( (array!68002 (arr!32701 (Array (_ BitVec 32) (_ BitVec 64))) (size!33237 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68001)

(assert (=> b!1066974 (= res!712076 (and (= (size!33236 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33237 _keys!1163) (size!33236 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066975 () Bool)

(assert (=> b!1066975 (= e!608499 (not true))))

(declare-datatypes ((tuple2!16244 0))(
  ( (tuple2!16245 (_1!8133 (_ BitVec 64)) (_2!8133 V!39145)) )
))
(declare-datatypes ((List!22805 0))(
  ( (Nil!22802) (Cons!22801 (h!24010 tuple2!16244) (t!32128 List!22805)) )
))
(declare-datatypes ((ListLongMap!14213 0))(
  ( (ListLongMap!14214 (toList!7122 List!22805)) )
))
(declare-fun lt!471247 () ListLongMap!14213)

(declare-fun lt!471248 () ListLongMap!14213)

(assert (=> b!1066975 (= lt!471247 lt!471248)))

(declare-fun zeroValueBefore!47 () V!39145)

(declare-datatypes ((Unit!35041 0))(
  ( (Unit!35042) )
))
(declare-fun lt!471249 () Unit!35041)

(declare-fun minValue!907 () V!39145)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39145)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!743 (array!68001 array!67999 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39145 V!39145 V!39145 V!39145 (_ BitVec 32) Int) Unit!35041)

(assert (=> b!1066975 (= lt!471249 (lemmaNoChangeToArrayThenSameMapNoExtras!743 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3706 (array!68001 array!67999 (_ BitVec 32) (_ BitVec 32) V!39145 V!39145 (_ BitVec 32) Int) ListLongMap!14213)

(assert (=> b!1066975 (= lt!471248 (getCurrentListMapNoExtraKeys!3706 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066975 (= lt!471247 (getCurrentListMapNoExtraKeys!3706 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066976 () Bool)

(declare-fun e!608497 () Bool)

(declare-fun e!608498 () Bool)

(declare-fun mapRes!39952 () Bool)

(assert (=> b!1066976 (= e!608497 (and e!608498 mapRes!39952))))

(declare-fun condMapEmpty!39952 () Bool)

(declare-fun mapDefault!39952 () ValueCell!12050)

